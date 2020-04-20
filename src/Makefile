
CFLAGS= -g3 -fopt-info -mavx -march=native

OFLAGS=-mavx -march=native

inv_baseline:
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) invert.c common.c -o invert -lm

inv_load_all:
	$(CC) -DLOADDALL=1 $(CFLAGS) -$(O) invert_load_all.c common.c -o invert -lm

inv_unrolled:
	$(CC) -DUNROLLED=1 $(CFLAGS) -$(O) invert_unrolled.c common.c -o invert -lm
inv_unrolled_omp:
	$(CC) -DUNROLLEDOMP=1 $(CFLAGS) -$(O) -fopenmp invert_unrolled_omp.c common.c -o invert -lm

sob_baseline:
	$(CC) -DBASELINE=1 $(CFLAGS) -$(O) sobel.c common.c -o sobel -lm
sob_load_all:
	$(CC) -DLOADALL=1 $(CFLAGS) -$(O) sobel_load_all.c common.c -o sobel -lm
sobel_new_load_each:
	$(CC) -DLOADEACH=1 $(CFLAGS) -$(O) sobel_new_load_each.c common.c -o sobel -lm
sob_load_all_omp:
	$(CC) -DLOADALLOMP=1 $(CFLAGS) -$(O) -fopenmp sobel_load_all_omp.c common.c -o sobel -lm
sob_load_all_unrolled:
	$(CC) -DUNROLLED=1 $(CFLAGS) -$(O) sobel_load_all_unrolled.c common.c -o sobel -lm
sob_load_all_loop_split:
	$(CC) -DLOOPSPLIT=1 $(CFLAGS) -$(O) -fopenmp sobel_load_all_loop_split.c common.c -o sobel -lm

clean:
	rm -Rf *~ invert sobel
