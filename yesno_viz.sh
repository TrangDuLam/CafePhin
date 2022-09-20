#!/bin/bash

# The directory to store the decode results 
dir="/home/yulanchu/kaldiVizResult"
echo The destination directory = $dir

if [ -d $dir ]; then
	echo "The destination directory exists."
else 
	echo "The destination directory DOES NOT exist!"
fi

echo Try the directory /kaldi/egs/yesno/s5

cd ~/kaldi/egs/yesno/s5/data/lang_test_tg
echo ======Start decoding L.fst======
filename="$dir/f.pdf"
echo $filename
fstdraw --isymbols=phones.txt --osymbols=words.txt L.fst | dot -Tps  |  ps2pdf - $filename
if [ $? -eq 0 ]; then 
	echo Successfully decoded!!!
else
	echo Fail to decode!!!
fi 

echo =====Start decoding G.fst=====
filename="$dir/G.pdf"
fstdraw --isymbols=phones.txt --osymbols=words.txt G.fst | dot -Tps  |  ps2pdf - $filename
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

cd ~/kaldi/egs/yesno/s5/exp/mono0a
echo =====Start visualizaing th decision tree=====
filename="$dir/tree.svg"
draw-tree phones.txt tree | dot -Tsvg > $filename
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi

cd ~/kaldi/egs/yesno/s5/exp/mono0a/graph_tgpr
echo =====Start decoding HCLG.fst=====
filename="$dir/HCLG.pdf"
fstdraw --isymbols=phones.txt --osymbols=words.txt HCLG.fst | dot -Tps  |  ps2pdf - $filename
if [ $? -eq 0 ]; then
        echo Successfully decoded!!!
else
        echo Fail to decode!!!
fi


echo =====End Visualization Tool=====
