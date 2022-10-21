#!/bin/bash

. ./path.sh
recipe_dir=$thchs30_root

# To extract how many test data files
test_num=$(wc -l <  $recipe_dir/data/test/text)
echo "There are $test_num files in the recipe $recipe_dir"

# To pick a random number
line=$(( ( RANDOM % $test_num )  + 1 ))
sample_line=$(head -n $line $recipe_dir/data/test/text | tail -1 | perl -CS -p -e 's/[^\s\p{Han}]//g')
target_id=$(head -n $line $recipe_dir/data/test/text | tail -1 | cut -c 1-7)
echo The target selected is  $target_id
echo =======   The Ground Truth  =======
echo $sample_line

echo " "
echo ======    The tri1 Decoded   =======
tri1Decode=$(grep $target_id $recipe_dir/exp/tri1/decode_test_word/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri1Decode

echo " "
echo ======    The tri2 Decoded   =======
tri2Decode=$(grep $target_id $recipe_dir/exp/tri2b/decode_test_word/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri2Decode

echo " "
echo ======    The tri3 Decoded   =======
tri3bDecode=$(grep $target_id $recipe_dir/exp/tri3b/decode_test_word.si/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri3bDecode

echo " "
echo ======    The tri4 Decoded   =======
tri4bDecode=$(grep $target_id $recipe_dir/exp/tri4b/decode_test_word.si/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri4bDecode

echo " "
echo ======    The tri4 DNN Decoded   =======
tri4DNNDecode=$(grep $target_id $recipe_dir/exp/tri4b_dnn/decode_test_word/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g') 
echo $tri4DNNDecode

echo " "
echo ======    The tri4 DNN with MPE Decoded   =======
tri4DNNMPEDecode=$(grep $target_id $recipe_dir/exp/tri4b_dnn_mpe/decode_test_word_it3/log/decode.*.log | perl -CS -p -e 's/[^\s\p{Han}]//g')
echo $tri4DNNMPEDecode
