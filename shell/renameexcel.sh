#!/bin/zsh

strList=("[0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-"
         "[0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_"
         "[0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
         "\-造价文件估算书\-"
         "\（估算\）总览"
         "\（预算\）总览"
         "\（估算书\）"
         "\（预算书\）"
         "\（预算\）"
         "\（估算\）"
         "预算"
         "估算"
         "总览"
         "\-"
         "\_"
        )


function find_spefile_str(){
    local curr_file=$1
    local count_find=0
    
    for find_str in  ${strList[*]}
    do
        #echo "    $i)=> fnding str: $find_str"
        #echo "$curr_file $find_str"

        #find_result=$(echo $curr_file | grep "${find_str}")
        #find_result=$(echo $curr_file | grep -F ${find_str})
        if [[ $curr_file == *$find_str*  ]]
        then
            #echo "      include $find_str"
            rename 's/'$find_str'//' $curr_file || echo "Rename failed, please check file."
            #let count_find +=1
        #else
            #echo "nothing to do"
            #let count_not_find+=1
            #echo -e "\033[31m      not include str $find_str \033[0m"
        fi
    done
}

function get_files_dir(){
    local curr_file_num=1
    local curr_dir_num=1
    
    for file in `ls $1`
    do  
        if test -f $file
        then
            echo "$curr_file_num=> Dealing file: $file"
            find_spefile_str $file
            let curr_file_num+=1
        elif test -d $file
        then
            echo "$curr_dir_num=> Dealing dir: $file"
            echo "\033[31m    It's Directory: ../$file/, do nothing. \033[0m"
            let curr_dir_num+=1
        fi
    done
}

function get_all_name(){
    files=$(ls $1)
    for filename in $files
    do
        no_exten_name="${filename%.*}"
        echo $no_exten_name >> name.txt
        cat name.txt | pbcopy
    done
}

work_path=$(pwd)
excel_path=/Users/jdrqs/Documents/技经评审/待整理/造价文件补表/造价文件
app_path=/Users/jdrqs/Documents/技经评审/待整理/造价文件补表/APP
get_files_dir $work_path
get_all_name $work_path
mv $work_path/*.xl* $excel_path/
cd $app_path 
./配网补表
mv $excel_path/*.xl* $work_path/
cd $work_path

