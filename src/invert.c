/*
  This code performs color invertion to compute a mask of a video stream meant as input to a neural network
*/
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <emmintrin.h>

//
#include "rdtsc.h"

//
#include "common.h"

//
void process_baseline(u8 *frame)
{
  for (unsigned y = 0 ; y < H ; ++y)
    for (unsigned x = 0 ; x < W * 3 ; x += 3)
      {
	//Invert each colour component of every pixel
	frame[INDEX(y, x, W * 3) + 0] = 255 - frame[INDEX(y, x, W * 3) + 0]; //Red
	frame[INDEX(y, x, W * 3) + 1] = 255 - frame[INDEX(y, x, W * 3) + 1]; //Green
	frame[INDEX(y, x, W * 3) + 2] = 255 - frame[INDEX(y, x, W * 3) + 2]; //Blue
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
  u64 nb_bytes = 1, frame_count = 0, samples_count = 0, size = sizeof(u8) * H * W * 3;

  //
  u8 *frame = _mm_malloc(size, 32);

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
  while ((nb_bytes = fread(frame, sizeof(u8), H * W * 3, fpi)))
    {
      //Start 
      cycles_b = rdtsc();

      //Put other versions here
      
#if BASELINE
      process_baseline(frame);
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
      fwrite(frame, sizeof(u8), H * W * 3, fpo);

      //
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

  return  0;
}
