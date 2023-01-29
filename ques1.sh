#!/bin/bash
declare -A frequency

while true; do
  roll=$(( ( RANDOM % 6 )  + 1 ))
  frequency[$roll]=$((frequency[$roll] + 1))

  for num in ${!frequency[@]}; do
    if [[ ${frequency[$num]} -ge 10 ]]; then
      max_num=$num
      echo "The number $max_num has come up at least 10 times"
      max=0
      min=10
      for num in ${!frequency[@]}; do
        if [[ ${frequency[$num]} -gt $max ]]; then
          max=${frequency[$num]}
          max_num=$num
        fi
        if [[ ${frequency[$num]} -lt $min ]]; then
          min=${frequency[$num]}
          min_num=$num
        fi
      done
      echo "The number $max_num was rolled the most, with $max rolls."
      echo "The number $min_num was rolled the least, with $min rolls."
      exit 0
    fi
  done
done