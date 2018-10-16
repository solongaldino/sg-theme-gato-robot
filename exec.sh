#!/bin/bash

echo '[ START - Theme Gato Robot ]'

project_name=''
echo -e 'insira o nome do diretorio do projeto\n'
read project_name

#path do diretorio atual
path_project=$(pwd -P)'/'$project_name'/'

base_link=''
echo -e '\nInsira o BASE_LINK, EX: https://me-site.com/preview/index.html \ncopie apenas https://me-site.com/preview/ \ndeixando de fora index.html\nOBS: deve conter barra "/" no final\n'
read base_link

function Execute() {
  #remove base_link
  path_file=${link#*$base_link}

  #remove nome do arquivo
  path_file_dir=${path_file%/*}

  #resolve problema quando o arquio esta na raiz
  if [ $path_file = $path_file_dir ]
  then
    path_file_dir=''
  else
    path_file_dir=$path_file_dir'/'
  fi

  if [ -f $path_project$path_file ]
  then
    echo 'Arquivo ja existente'
  else
    echo -e 'Arquivo não encontrado\nIniciando download...'
    wget -P $path_project$path_file_dir $link
  fi
}

while true
do
  echo -e '\nInsira o modo de operação
          \n  1- MANUAL: inserir link um a um para download
          \n  2- LISTA: fornece um lista com todos os links para download\n'
  read mode

  if [ $mode = 1 ]
  then
    while true
    do
      link=''
      echo 'Digite o link ou exit para finalizar'
      read link
      if [ $link = 'exit' ]; then
        break
      fi
      Execute
    done
    break
  elif [ $mode = 2 ]
  then
    list=($(cat $(pwd -P)'/list.txt'))
    for val in "${list[@]}"
    do
      link=$val
      echo -e '\nLINK: '$val
      Execute
    done
    break
  else
    echo -e '\nOpção não encontrada'
    continue
  fi

done

echo -e '\n[ END - Theme Gato Robot ]'
