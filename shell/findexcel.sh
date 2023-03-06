alias findexcel='find ./ -name "*.xls" -type f -exec cp  {} ./ \; &&
                      find ./ -type d | xargs rm -rf  &&
                      find ./ -type f | grep 典型造价应用情况统计 | xargs rm -f  &&
                      find ./ -type f | grep ctpdbnprj | xargs rm -f'

