#!/bin/bash

. ./path.sh
recipe_dir=$aishell1_root

# To extract how many test data files
test_num=$(wc -l <  $recipe_dir/data/test/text)
echo "There are $test_num files in the recipe $recipe_dir"

# To pick a random number
line=$(( ( RANDOM % $test_num )  + 1 ))
sample_line=$(head -n $line $recipe_dir/data/test/text | tail -1 | perl -CS -p -e 's/[^\s\p{Han}]//g')
target_id=$(head -n $line $recipe_dir/data/test/text | tail -1 | cut -c 1-16)
echo The target selected is  $target_id
echo =======   The Ground Truth  =======
echo $sample_line

echo " "
echo ======    The mono Decoded   =======
monoDecode=$(grep $target_id $recipe_dir/exp/mono/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $monoDecode

echo " "
echo ======    The tri1 Decoded   =======
tri1Decode=$(grep $target_id $recipe_dir/exp/tri1/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri1Decode

echo " "
echo ======    The tri2 Decoded   =======
tri2Decode=$(grep $target_id $recipe_dir/exp/tri2/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri2Decode

echo " "
echo ======    The tri3 Decoded   =======
tri3aDecode=$(grep $target_id $recipe_dir/exp/tri3a/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri3aDecode

echo " "
echo ======    The tri4 Decoded   =======
tri4aDecode=$(grep $target_id $recipe_dir/exp/tri4a/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri4aDecode

echo " "
echo ======    The tri5 Decoded   =======
tri5aDecode=$(grep $target_id $recipe_dir/exp/tri5a/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri5aDecode

echo " "
echo ======    The NNET3 Decoded   =======
NNET3Decode=$(grep $target_id $recipe_dir/exp/nnet3/tdnn_sp/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g') 
echo $NNET3Decode

echo " "
echo ======    The Chain Model Decoded   =======
TDNNDecode=$(grep $target_id $recipe_dir/exp/chain/tdnn_1a_sp/decode_test/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $TDNNDecode
