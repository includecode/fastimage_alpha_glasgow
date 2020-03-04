set term png size 1900,1000

set grid
 
set ylabel "Latency in cycles"
set xlabel "Frame number"

set yrange [0:1e7]

set title "Comparison between different implementaions of color inversion"

plot "data/inv_baseline" w lp
