#!/bin/bash

# erro1: Syntax error: "(" unexpected => bash xx.sh 或者直接运行 ，sh 与 bash 有些地方不兼容
# erro2: erro write style: if [3 -eq 2]  => right style: if [ 3 -eq 2 ]
# 需要被重命名的关键字
# '_' specific cahr use add '\'
strList=("[0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]\-"
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
         "-"
         "_")

function loop_str_rename(){
    #curr_obj_num=1
    #local curr_obj_name=1
    #local count_find=0
    #local num_of_match=0
    #local num_of_not_match=0
    
    for find_str in  ${strList[*]}
    do

        for curr_obj in `ls $(pwd)`
        do

            #echo "$curr_obj_num=> Dealing: $curr_obj"
            #find_result=$(echo $curr_obj | grep "${find_str}")
            if [ -f $curr_obj -a $curr_obj == *$find_str* ]
            then

                #while [[ $curr_obj =~ $find_str ]]
                #do
                rename 's/'$find_str'//' $curr_obj
                #done
                # if [ $? -eq 0 ]
                # then
                #     echo -e "\033[37m    rename success. \033[0m"
                # else
                #     echo -e "\033[37m    rename failed, please check file. \033[0m"

                # fi
                #echo "$Dealing file: $file"
                #find_spefile_str $file
                #let curr_file_num+=1
            #elif [ -d $curr_obj ]
            # then
            #     echo "$curr_obj"
            #     #echo "$curr_dir_num=> Dealing dir: $file"
            #     echo -e "\033[31m    it's a directory: $file, do nothing. \033[0m"
                #let curr_dir_num+=1
            # else
            #     echo -e "\033[31m    not match char: $file, do nothing. \033[0m"
            fi

            #let curr_obj_num+=1
            
        done

        #let cur_obj_num+=1
        #echo "    $i)=> fnding str: $find_str"
        #echo "$curr_file $find_str"

        #find_result=$(echo $curr_file | grep "${find_str}")
        #find_result=$(echo $curr_file | grep -F ${find_str})
        # if [[ $curr_file == *$find_str*  ]]
        # then
        #     echo "      include $find_str"
        #     rename 's/'$find_str'//' $curr_file || echo "Rename failed, please check file."
        #     # 这里引用的变量是更改之前的文件名 所以有多个遍历时会存在找不到文件名的问题 => 改写
        #     echo "      changed: $1"
        #     let num_of_match+=1
        # #else
        #     # nothing match work not defind, baceause is right now.  
        #     #echo "nothing to do"
        #     #let num_of_not_match+=1
        #     #echo -e "\033[31m      not include str $find_str \033[0m"
        # fi
    done

        
    # if [ $num_of_match -eq 0 ]
    # then
    #     echo -e "\033[37m     nothing to do. \033[0m"
    # else
    #     echo -e "\033[32m     renamed done. \033[0m"
    # fi 
}

# function loop_rename_file(){
#     local find_str=$1
#     #local curr_file_num=1
#     #local curr_dir_num=1
    
#     for curr_obj in `ls $1`
#     do  
#         if [[ test -f $curr_obj ]] && [[ $curr_obj == *$find_str*  ]]
#         then
#             rename 's/'$find_str'//' $curr_obj || echo "Rename failed, please check file."
#             #echo "$curr_file_num=> Dealing file: $file"
#             #find_spefile_str $file
#             #let curr_file_num+=1
#         else
#             #echo "$curr_dir_num=> Dealing dir: $file"
#             echo -e "\033[31m    It's Directory or not match char: $file, do nothing. \033[0m"
#             #let curr_dir_num+=1
#         fi
#     done
# }

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
tmp_path=/Users/jdrqs/Documents/技经评审/待整理/造价文件补表/APP/配网批量创建模板
loop_str_rename
get_all_name $work_path
echo "-----Start fill excel-----------"
mv $work_path/*.xl* $excel_path/
cd $app_path  && ./配网补表
mv $excel_path/*.xl* $work_path/
cd $work_path
echo "-----Start get temple-----------"
cp -r $tmp_path/批次附件 $work_path
par_dir_name=`pwd | awk -F "/" '{print $NF}'`
echo "$par_dir_name ---ok"
if [[  $par_dir_name == *估算* ]]
then
    rm -f $work_path/批次附件/评审明细表.xlsx
elif [[ $par_dir_name == *估算* ]]
then
    rm -f $work_path/批次附件/可行性研究明细表.xlsx
else
    echo "dir name is erro, please check."
fi


