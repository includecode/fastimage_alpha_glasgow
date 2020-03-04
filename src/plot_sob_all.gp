set term png size 1900,1000

set grid
 
set ylabel "Latency in cycles"
set xlabel "Frame number"

set yrange [0:2e8]

set multiplot layout 2,2 rowsfirst 

set title "O1 compiler optimization"
plot "O1/data/sob_baseline" w lp t "Baseline"

set title "O2 compiler optimization"
plot "O2/data/sob_baseline" w lp t "Baseline"

set title "O3 compiler optimization"
plot "O3/data/sob_baseline" w lp t "Baseline"

set title "Ofast compiler optimization"
plot "Ofast/data/sob_baseline" w lp t "Baseline"

unset multiplot