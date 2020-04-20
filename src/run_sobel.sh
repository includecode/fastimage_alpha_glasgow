#!/bin/bash

#
echo -e "[BEGIN]\n"

if [ -f "in/input.raw" ]
then
    #If input file exists nothing to be done
    echo "Input file exists"
    echo
else    
    #Convert mp4 to raw format
    echo "Converting video to raw format"
    echo
    
    ./cvt_vid.sh v2r "in/input.mp4" "in/input.raw" >> /dev/null 2>> /dev/null
fi

#
dir="data_runs_sobel"
mkdir -p $dir $dir"/logs"

#
cp "plot_sob_all.gp" $dir

#Compiler optimizations
for opt in O1 O2 O3 Ofast
do
    #
    echo "Running with flag: "$opt
    
    #
    mkdir -p $dir"/"$opt
    mkdir -p $dir"/"$opt"/data"

    #
    cp "plot_sob.gp" $dir"/"$opt
    
    #Going through invert code variants
    for variant in sob_baseline sobel_new_load_each sob_load_all sob_load_all_omp sob_load_all_unrolled sob_load_all_loop_split
    do
	#
	echo -e "\tVariant: "$variant
	
	#Compile variant
	make CC=gcc $variant O=$opt >> $dir"/logs/compile.log" 2>> $dir"/logs/compile_err.log"
	
	#Run & select run number & cycles 
	./sobel in/input.raw iout/output_sob.raw | cut -d';' -f1,3 > $dir"/"$opt"/data/"$variant
	#maqao oneview --create-report=one binary=sobel run-command="<binary> /home/pavel/Documents/COURS/IATIC_4/AOB/fastimage_alpha_glasgow/src/in/input.raw output.raw" dataset=in pinning_command="taskset -c 0"
	#Convert raw file into mp4 video
	./cvt_vid.sh r2v "iout/output_sob.raw" "iout/output_"$variant".mp4" >> $dir"/logs/cvt.log" 2>> $dir"/logs/cvt_err.log"
    done

    #
    cd $dir"/"$opt

    #Generate the plot
    gnuplot -c "plot_sob.gp" > "plot_"$opt".png"
    for new_variant in sobel_new_load_each sob_load_all sob_load_all_omp sob_load_all_unrolled sob_load_all_loop_split
do
    #generate the plot for new versions (create .gp file first)
    
    echo -e "set term png size 1900,1000\n" > "plot_"$new_variant".gp"
    echo -e "set grid\n" >> "plot_"$new_variant".gp"
    echo -e 'set ylabel "Latency in cycles"' >> "plot_"$new_variant".gp"
    echo -e 'set xlabel "Frame number"\n' >> "plot_"$new_variant".gp"
    echo -e "set yrange [0:2e8]\n" >> "plot_"$new_variant".gp"
    echo -e 'set title "Comparison between different implementaions of teh Sobel filter"\n' >> "plot_"$new_variant".gp"
    echo -e "plot \"data/$new_variant\" w lp\n" >> "plot_"$new_variant".gp"
    #plot
    gnuplot -c "plot_"$new_variant".gp" > $new_variant"_"$opt".png"
done
    cd ../..
done

#
cd $dir

#plot_all_new versions

    for new_variant in sobel_new_load_each sob_load_all sob_load_all_omp sob_load_all_unrolled sob_load_all_loop_split
    do
    echo -e "set term png size 1900,1000\n" > "plot_"$new_variant"_all.gp"
        echo -e "set grid\n" >> "plot_"$new_variant"_all.gp"
        echo -e 'set ylabel "Latency in cycles"' >> "plot_"$new_variant"_all.gp"
        echo -e 'set xlabel "Frame number"\n' >> "plot_"$new_variant"_all.gp"
        echo -e "set yrange [0:2e8]\n" >> "plot_"$new_variant"_all.gp"
        echo -e "set multiplot layout 2,2 rowsfirst\n" >> "plot_"$new_variant"_all.gp"
        echo -e 'set title "O1 compiler optimization"\n' >> "plot_"$new_variant"_all.gp"
        echo -e "plot \"O1/data/$new_variant\" w lp t \"$new_variant\"\n" >> "plot_"$new_variant"_all.gp"
        echo -e 'set title "O2 compiler optimization"\n' >> "plot_"$new_variant"_all.gp"
        echo -e "plot \"O2/data/$new_variant\" w lp t \"$new_variant\"\n" >> "plot_"$new_variant"_all.gp"
        echo -e 'set title "O3 compiler optimization"\n' >> "plot_"$new_variant"_all.gp"
        echo -e "plot \"O3/data/$new_variant\" w lp t \"$new_variant\"\n" >> "plot_"$new_variant"_all.gp"
        echo -e 'set title "Ofast compiler optimization"\n' >> "plot_"$new_variant"_all.gp"
        echo -e "plot \"Ofast/data/$new_variant\" w lp t \"$new_variant\"\n" >> "plot_"$new_variant"_all.gp"
        echo -e "unset multiplot\n" >> "plot_"$new_variant"_all.gp"
        gnuplot -c "plot_"$new_variant"_all.gp" > "plot_"$new_variant"_all.png" 
    done
#
gnuplot -c "plot_sob_all.gp" > "plot_all.png" 

cd ..

#
make clean

#
echo -e "\n[DONE]"
