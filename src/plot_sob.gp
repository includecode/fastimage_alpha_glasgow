set term png size 1900,1000

set grid
 
set ylabel "Latency in cycles"
set xlabel "Frame number"

set yrange [0:2e8]

set title "Comparison between different implementaions of te Sobel filter"

plot "data/sob_baseline" w lp
