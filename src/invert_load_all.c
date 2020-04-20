/*
  This code performs color invertion to compute a mask of a video stream meant as input to a neural network
*/
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <emmintrin.h>
//#include <unistd.h>
//
#include "rdtsc.h"
#define ALL_FRAMES_SIZE 995328000
#define ONE_FRAMES_SIZE 2764800
//
#include "common.h"

//
void process_baseline(u8 *frame)
{
  for (unsigned y = 0; y < H; ++y)
    for (unsigned x = 0; x < W * 3; x += 3)
    {
      //Invert each colour component of every pixel
      frame[INDEX(y, x, W * 3) + 0] = 255 - frame[INDEX(y, x, W * 3) + 0]; //Red
      frame[INDEX(y, x, W * 3) + 1] = 255 - frame[INDEX(y, x, W * 3) + 1]; //Green
      frame[INDEX(y, x, W * 3) + 2] = 255 - frame[INDEX(y, x, W * 3) + 2]; //Blue
    }
}

//unrolled + one loop version
void process_load_all(u8 *frame)
{
  int index = 0;
  int end = ONE_FRAMES_SIZE;
    for (unsigned x = 0; x < end; x += 32)
    {
      //Invert each colour component of every pixel
      frame[x ]       = ~frame[x ];     //Red
      frame[x  + 1]   = ~frame[x  + 1]; //Green
      frame[x  + 2]   = ~frame[x  + 2]; //Blue
      frame[x  + 3]   = ~frame[x  + 3]; //Red
      frame[x  + 4]   = ~frame[x  + 4]; //Green
      frame[x  + 5]   = ~frame[x  + 5]; //Blue
      frame[x  + 6]   = ~frame[x  + 6]; //Red
      frame[x  + 7]   = ~frame[x  + 7]; //Green
      frame[x  + 8]   = ~frame[x  + 8]; //Blue
      frame[x  + 9]   = ~frame[x  + 9]; //Red
      frame[x  + 10]  = ~frame[x  + 10]; //Green
      frame[x  + 11]  = ~frame[x  + 11]; //Blue
      frame[x  + 12]  = ~frame[x  + 12]; //Red
      frame[x  + 13]  = ~frame[x  + 13]; //Green
      frame[x  + 14]  = ~frame[x  + 14]; //Blue
      frame[x  + 15]  = ~frame[x  + 15]; //Red
      frame[x  + 16]  = ~frame[x  + 16]; //Green
      frame[x  + 17]  = ~frame[x  + 17]; //Blue
      frame[x  + 18]  = ~frame[x  + 18]; //Red
      frame[x  + 19]  = ~frame[x  + 19]; //Green
      frame[x  + 20]  = ~frame[x  + 20]; //Blue
      frame[x  + 21]  = ~frame[x  + 21]; //Red
      frame[x  + 22]  = ~frame[x  + 22]; //Green
      frame[x  + 23]  = ~frame[x  + 23]; //Blue
      frame[x  + 24]  = ~frame[x  + 24]; //Red
      frame[x  + 25]  = ~frame[x  + 25]; //Green
      frame[x  + 26]  = ~frame[x  + 26]; //Blue
      frame[x  + 27]  = ~frame[x  + 27]; //Red
      frame[x  + 28]  = ~frame[x  + 28]; //Green
      frame[x  + 29]  = ~frame[x  + 29]; //Blue
      frame[x  + 30]  = ~frame[x  + 30]; //Red
      frame[x  + 31]  = ~frame[x  + 31]; //Green
    }
}
//
int main(int argc, char **argv)
{
  //
  if (argc < 3)
    return printf("Usage: %s [raw input file] [raw output file]\n", argv[0]), 1;

  //
  u64 cycles[MAX_SAMPLES], cycles_a, cycles_b;
  u64 nb_bytes = 1, frame_count = 0, samples_count = 0, size = ALL_FRAMES_SIZE;

  //
  u8 *frame = _mm_malloc(size, 32);
  u8 frame_static[sizeof(u8) * H * W * 3];
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
      nb_bytes = fread(frame, sizeof(u8), ALL_FRAMES_SIZE, fpi);
      for (int i = 0; i < ALL_FRAMES_SIZE; i+=ONE_FRAMES_SIZE)
    {
//Start
    cycles_b = rdtsc();

    //Put other versions here

#if LOADDALL
    process_load_all(&frame[i]);
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
    fwrite(&frame[i], sizeof(u8), ONE_FRAMES_SIZE, fpo);

    //
    frame_count++;
    }
  /*
   //Read & process video frames
  while ((nb_bytes = fread(frame_static, sizeof(u8), H * W * 3, fpi)))
  {
    //Start
    cycles_b = rdtsc();

    //Put other versions here

#if BASELINE
    process_baseline(frame_static);
#endif
#if VERSION1
    process_v1(frame_static);
#endif

    //Stop
    cycles_a = rdtsc();

    //
    u64 elapsed = (cycles_a - cycles_b);

    //
    if (samples_count < MAX_SAMPLES)
      cycles[samples_count++] = elapsed;

    //frame number; size in Bytes; elapsed cycles; bytes per cycle
    fprintf(stdout, "%20llu; %20llu; %20llu; %15.3lf\n", frame_count, nb_bytes, elapsed, (f64)(nb_bytes) / (f64)elapsed);


    // Write this frame to the output pipe
    fwrite(frame_static, sizeof(u8), H * W * 3, fpo);

    //
    frame_count++;
  }
*/
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

  //
  bpc = size / mea;

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
  _mm_free(frame);

  //
  fclose(fpi);
  fclose(fpo);

  return 0;
}
