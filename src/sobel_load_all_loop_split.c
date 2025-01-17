/*
  This code performs edge detection using a Sobel filter on a video stream meant as input to a neural network
*/
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <emmintrin.h>
#include <unistd.h>
//
#include "rdtsc.h"

//
#include "common.h"
#define ALL_FRAMES_SIZE 995328000
#define ONE_FRAMES_SIZE 2764800

//Convert an image to its grayscale equivalent - better color precision
void grayscale_weighted(u8 *frame)
{
    f32 gray;

    for (u64 i = 0; i < ALL_FRAMES_SIZE; i += 3)
    {
        //Convert RGB color values into grayscale for each pixel using color weights
        //Other possible weights: 0.59, 0.30, 0.11
        //Principle: mix different quantities of R, G, B to create a variant of gray
        gray = ((float)frame[i] * 0.299) + ((float)frame[i + 1] * 0.587) + ((float)frame[i + 2] * 0.114);

        frame[i] = gray;
        frame[i + 1] = gray;
        frame[i + 2] = gray;
    }
}

//Convert an image to its grayscale equivalent - bad color precision
void grayscale_sampled(u8 *frame)
{
    for (u64 i = 0; i < H * W * 3; i += 3)
    {
        //R: light gray
        //G: medium gray
        //B: dark gray
        u8 gray = frame[i];

        frame[i] = gray;
        frame[i + 1] = gray;
        frame[i + 2] = gray;
    }
}

//
i32 convolve_baseline(u8 *m, i32 *f, u64 fh, u64 fw)
{
    i32 r = 0;

    for (u64 i = 0; i < fh; i++)
        for (u64 j = 0; j < fw; j++)
            r += m[INDEX(i, j, fw)] * f[INDEX(i, j, fw)];

    return r;
}

//
void sobel_load_all_unrolled(u8 *cframe, u8 *oframe, f32 threshold)
{
    i32 gx, gy;
    f32 mag = 0.0;
    /*
  i32 f1[9] = {-1, 0, 1,
               -2, 0, 2,
               -1, 0, 1}; //3x3 matrix

  i32 f2[9] = {-1, -2, -1,
               0, 0, 0,
               1, 2, 1}; //3x3 matrix
               */

    //
    u64 end1 = 691200; //one Frame size / 4
    u64 end2 = 1382400;
    u64 end3 = 2073600;
    u64 end4 = ONE_FRAMES_SIZE;
    for (u32 j = 0; j < end1; j++)
    { /*
      gx = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f1, 3, 3);
      gy = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f2, 3, 3);*/
        /*for (u32 k = 0; k < 9; k++){
          gx += cframe[j + k] * f1[k];
          gy += cframe[j + k] * f2[k];
      }*/
        //UNROLL 1
        //-------------------------------------------
        gx += cframe[j + 0] * -1; //f1[0]
        gy += cframe[j + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j + 1] * -2; //f2[1]
        gx += cframe[j + 2] * 1;  //f1[2]
        gy += cframe[j + 2] * -1; //f2[2]
        gx += cframe[j + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j + 6] * -1; //f1[6]
        gy += cframe[j + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j + 7] * 2; //f2[7]
        gx += cframe[j + 8] * 1; //f1[8]
        gy += cframe[j + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;
/*

        //UNROLL 2
        //-------------------------------------------
        gx += cframe[j+1 + 0] * -1; //f1[0]
        gy += cframe[j+1 + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j+1 + 1] * -2; //f2[1]
        gx += cframe[j+1 + 2] * 1;  //f1[2]
        gy += cframe[j+1 + 2] * -1; //f2[2]
        gx += cframe[j+1 + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j+1 + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j+1 + 6] * -1; //f1[6]
        gy += cframe[j+1 + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j+1 + 7] * 2; //f2[7]
        gx += cframe[j+1 + 8] * 1; //f1[8]
        gy += cframe[j+1 + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j+1] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;


         //UNROLL 3
        //-------------------------------------------
        gx += cframe[j+2 + 0] * -1; //f1[0]
        gy += cframe[j+2 + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j+2 + 1] * -2; //f2[1]
        gx += cframe[j+2 + 2] * 1;  //f1[2]
        gy += cframe[j+2 + 2] * -1; //f2[2]
        gx += cframe[j+2 + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j+2 + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j+2 + 6] * -1; //f1[6]
        gy += cframe[j+2 + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j+2 + 7] * 2; //f2[7]
        gx += cframe[j+2 + 8] * 1; //f1[8]
        gy += cframe[j+2 + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j+2] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;

        //UNROLL 4
        //-------------------------------------------
        gx += cframe[j+3 + 0] * -1; //f1[0]
        gy += cframe[j+3 + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j+3 + 1] * -2; //f2[1]
        gx += cframe[j+3 + 2] * 1;  //f1[2]
        gy += cframe[j+3 + 2] * -1; //f2[2]
        gx += cframe[j+3 + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j+3 + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j+3 + 6] * -1; //f1[6]
        gy += cframe[j+3 + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j+3 + 7] * 2; //f2[7]
        gx += cframe[j+3 + 8] * 1; //f1[8]
        gy += cframe[j+3 + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j+3] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;*/
    }
    for (u32 j = end1; j < end2; j++)
    { /*
      gx = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f1, 3, 3);
      gy = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f2, 3, 3);*/
        /*for (u32 k = 0; k < 9; k++){
          gx += cframe[j + k] * f1[k];
          gy += cframe[j + k] * f2[k];
      }*/
        //UNROLL 1
        //-------------------------------------------
        gx += cframe[j + 0] * -1; //f1[0]
        gy += cframe[j + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j + 1] * -2; //f2[1]
        gx += cframe[j + 2] * 1;  //f1[2]
        gy += cframe[j + 2] * -1; //f2[2]
        gx += cframe[j + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j + 6] * -1; //f1[6]
        gy += cframe[j + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j + 7] * 2; //f2[7]
        gx += cframe[j + 8] * 1; //f1[8]
        gy += cframe[j + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;
    }
    for (u32 j = end2; j < end3; j++)
    { /*
      gx = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f1, 3, 3);
      gy = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f2, 3, 3);*/
        /*for (u32 k = 0; k < 9; k++){
          gx += cframe[j + k] * f1[k];
          gy += cframe[j + k] * f2[k];
      }*/
        //UNROLL 1
        //-------------------------------------------
        gx += cframe[j + 0] * -1; //f1[0]
        gy += cframe[j + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j + 1] * -2; //f2[1]
        gx += cframe[j + 2] * 1;  //f1[2]
        gy += cframe[j + 2] * -1; //f2[2]
        gx += cframe[j + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j + 6] * -1; //f1[6]
        gy += cframe[j + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j + 7] * 2; //f2[7]
        gx += cframe[j + 8] * 1; //f1[8]
        gy += cframe[j + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;
    }
    for (u32 j = end3; j < end4; j++)
    { /*
      gx = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f1, 3, 3);
      gy = convolve_baseline(&cframe[INDEX(i, j, W * 3)], f2, 3, 3);*/
        /*for (u32 k = 0; k < 9; k++){
          gx += cframe[j + k] * f1[k];
          gy += cframe[j + k] * f2[k];
      }*/
        //UNROLL 1
        //-------------------------------------------
        gx += cframe[j + 0] * -1; //f1[0]
        gy += cframe[j + 0] * -1; //f2[0]
        //gx += cframe[j + 1] *  0; //f1[1] //Useless
        gy += cframe[j + 1] * -2; //f2[1]
        gx += cframe[j + 2] * 1;  //f1[2]
        gy += cframe[j + 2] * -1; //f2[2]
        gx += cframe[j + 3] * -2; //f1[3]
        //gy += cframe[j + 3] *  0; //f2[3] //Useless
        //gx += cframe[j + 4] *  0; //f1[4] //Useless
        //gy += cframe[j + 4] *  0; //f2[4] //Useless
        gx += cframe[j + 5] * 2; //f1[5]
        //gy += cframe[j + 5] *  0; //f2[5] //Useless
        gx += cframe[j + 6] * -1; //f1[6]
        gy += cframe[j + 6] * 1;  //f2[6]
        //gx += cframe[j + 7] *  0; //f1[7] //Useless
        gy += cframe[j + 7] * 2; //f2[7]
        gx += cframe[j + 8] * 1; //f1[8]
        gy += cframe[j + 8] * 1; //f2[8]
        //-------------------------------------------
        mag = sqrt((gx * gx) + (gy * gy));

        oframe[j] = (mag > threshold) ? 255 : mag;
        gx = 0;
        gy = 0;
    }
}

//
int main(int argc, char **argv)
{
    //
    if (argc < 3)
        return printf("Usage: %s [raw input file] [raw output file]\n", argv[0]), 1;

    //
    u64 size = ALL_FRAMES_SIZE;
    u64 cycles[MAX_SAMPLES], cycles_a, cycles_b;
    u64 nb_bytes = 1, frame_count = 0, samples_count = 0;

    //
    u8 *cframe = _mm_malloc(size, 32);
    u8 *oframe = _mm_malloc(size, 32);

    //
    FILE *fpi = fopen(argv[1], "rb");
    FILE *fpo = fopen(argv[2], "wb");

    //
    if (!fpi)
        return printf("Error: cannot open file '%s'\n", argv[1]), 2;

    //
    if (!fpo)
        return printf("Error: cannot open file '%s'\n", argv[2]), 2;


    //Read & process video frames
    nb_bytes = fread(cframe, sizeof(u8), ALL_FRAMES_SIZE, fpi);
    
        //
        grayscale_weighted(cframe);
        //
    //Start
    for (int i = 0; i < ALL_FRAMES_SIZE; i+=ONE_FRAMES_SIZE)
    {
    cycles_b = rdtsc();

    //Put other versions here

#if LOOPSPLIT
    sobel_load_all_unrolled(&cframe[i], oframe, 100.0);
#endif

    //Stop
    cycles_a = rdtsc();

    //
    u64 elapsed = (cycles_a - cycles_b);

    //
    if (samples_count < MAX_SAMPLES)
        cycles[samples_count++] = elapsed;
        nb_bytes = ONE_FRAMES_SIZE;
    //frame number; size in Bytes; elapsed cycles; bytes per cycle
    fprintf(stdout, "%20llu; %20llu; %20llu; %15.3lf\n", frame_count, nb_bytes, elapsed, (f64)(nb_bytes) / (f64)elapsed);
    
    // Write this frame to the output pipe
    fwrite(oframe, sizeof(u8), ONE_FRAMES_SIZE, fpo);

    frame_count++;
    }
        

    //
    sort(cycles, samples_count);

    //
    f64 min, max, avg, mea, dev, bpc;

    //
    mea = mean(cycles, samples_count);

    //
    dev = stddev(cycles, samples_count);

    //
    min = cycles[0];
    max = cycles[samples_count - 1];
    avg = (min + max) / 2.0;

    //Color frame, gray frame, output frame
    bpc = (size << 1) / mea;

    //
    fprintf(stderr, "\n%20llu; %15.3lf; %15.3lf; %15.3lf; %15.3lf; %15.3lf; %15.3lf %%;\n",
            (sizeof(u8) * H * W * 3),
            min,
            max,
            avg,
            mea,
            bpc,
            (dev * 100.0 / mea));

    //
    _mm_free(cframe);
    _mm_free(oframe);

    //
    fclose(fpi);
    fclose(fpo);

    return 0;
}