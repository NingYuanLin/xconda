function xconda() {
  # bash中，设置为1；zsh中，设置为0.这源于bash中的数组下标是从0开始的，zsh是从1开始的
  # in bash,set it to 1;in zsh,set it to 0.It comes from the array subscript begins with 0 in bash and ZSH begins with 1
  array_len_delta=1

  function echo_red() {
      str=$1
      new_line=$2
      if [[ $new_line == 1 ]]
      then
        echo -e -n "\033[31m${str}\033[0m"  # 不换行
      else
        echo -e "\033[31m${str}\033[0m"
      fi
  }
  lines=$(conda env list)

  now_line=0
  env_name_array=()
  while read -r line;
  do
    env_name=$(echo "${line}" | cut -d " " -f1)
    if [[ $env_name == 'base' ]]
    then
      now_line=1
    fi
    if [[ $now_line -gt 0 ]]
    then
      echo_red "$now_line => " 1
      echo "$line"
      now_line=$((now_line + 1))
      array_len=${#env_name_array[@]}
      array_index=$(( array_len+1-array_len_delta ))
      env_name_array[${array_index}]=$env_name
    fi
  done < <(echo "$lines")

  echo_red "Please select the interpreter you want:" 1
  read -r line_user_want
  line_user_want=$(( line_user_want-array_len_delta ))
  env_name_user_want=${env_name_array[${line_user_want}]}
  cmd="conda activate $env_name_user_want"
  eval "${cmd}"
}

