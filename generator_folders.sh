#!/bin/bash
echo "Você deseja criar pastas?"
read -p "Pressione 'Enter'..."

read -p "Quantas pastas você deseja criar? " num_folders
if ! [[ "$num_folders" =~ ^[1-50]+$ ]] then
    echo "Insira o número de pastas (máximo 50)"
    exit 1
fi

while true; do
  read -p "Digite sua senha:" key
  if [[ $key == "ks" ]]; then
    echo -e "\nSenha correta! Criando as 20 pastas..."
    for ((i=0; i<num_folders; i++)); do
    mkdir "new_ks_folder_$(printf "%02d" $i)"
    done
    echo "Pastas criadas com sucesso!"
    break
  else
      echo -e "\nSenha incorreta. Deseja tentar novamente? (s/n)"
      read -r try_again
      echo # move to a new line
      if [[ $try_again != "s" ]]; then
        echo "Cancelando operação."
        exit 1
      fi
    fi
done
