#!/bin/bash

dirname=/home/yulanchu/thcsh30_viz_dir
if [ -d $dirname ]; then
	echo "The destination folder exists!"
else 
	echo "The destination folder does not found! To create the folder!"
	mkdir $dirname 
	echo "Folder created!"
fi

echo ======== To visualize the information of THCHS30 ======== 	
echo "                                                                                            "

echo ========         Starting to decode the information of tri-phone models              ========
echo "                                                                          "
echo ========              Processing tri1 - HMM			 ========
cd /home/yulanchu/kaldi/egs/thchs30/s5/exp/tri1
/home/yulanchu/kaldi/src/gmmbin/gmm-copy --binary=false final.mdl tri1_txt.mdl && \ 
	mv tri1_txt.mdl "$dirname/tri1_txt.mdl"
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

echo ------   Start to decode the information of the tree   ----------
draw-tree phones.txt tree | dot -Tsvg > tri1_tree.svg && \
	mv tri1_tree.svg "$dirname/tri1_tree.svg"
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

echo ========          End decoding the GMM             ========

echo "									                         "
echo ========   	  Processing tri4b - DNN			========
cd /home/yulanchu/kaldi/egs/thchs30/s5/exp/tri4b_dnn
/home/yulanchu/kaldi/src/nnetbin/nnet-info final.nnet > nnet_info.txt && \
	mv nnet_info.txt "$dirname/nnet_info.txt"
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

echo ------   Start to decode the information of the tree   ----------
draw-tree phones.txt tree | dot -Tsvg > tree.svg && \
        mv tree.svg "$dirname/dnn_tree.svg"
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

echo "                                                                                           "
echo ========                            End decoding of THCHS30                          ======== 
