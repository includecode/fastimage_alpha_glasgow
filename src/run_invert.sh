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
dir="data_runs_invert"
mkdir -p $dir $dir"/logs"

#
cp "plot_inv_all.gp" $dir

#Compiler optimizations
for opt in O1 O2 O3 Ofast
do
    #
    echo "Running with flag: "$opt
    
    #
    mkdir -p $dir"/"$opt
    mkdir -p $dir"/"$opt"/data"

    #
    cp "plot_inv.gp" $dir"/"$opt
    
    #Going through invert code variants
    for variant in inv_baseline 
    do
	#
	echo -e "\tVariant: "$variant
	
	#Compile variant
	make $variant O=$opt >> $dir"/logs/compile.log" 2>> $dir"/logs/compile_err.log"
	
	#Run & select run number & cycles 
	./invert in/input.raw iout/output.raw | cut -d';' -f1,3 > $dir"/"$opt"/data/"$variant
	
	#Convert raw file into mp4 video
	./cvt_vid.sh r2v "iout/output.raw" "iout/output_"$variant".mp4" >> $dir"/logs/cvt.log" 2>> $dir"/logs/cvt_err.log"
    done

    #
    cd $dir"/"$opt

    #Generate the plot
    gnuplot -c "plot_inv.gp" > "plot_"$opt".png"

    cd ../..
done

#
cd $dir

gnuplot -c "plot_inv_all.gp" > "plot_all.png" 

cd ..

#
make clean

#
echo -e "\n[DONE]"
