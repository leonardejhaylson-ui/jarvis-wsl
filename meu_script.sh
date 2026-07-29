#!/bin/bash

echo "=== INICIANDO A MANUTENÇÃO DO SISTEMA ==="

# 1. Atualiza a lista de pacotes
sudo apt update -y

# 2. Limpa os arquivos temporários e pacotes antigos desnecessários
sudo apt autoremove -y
sudo apt clean

echo "=== MANUTENÇÃO CONCLUÍDA COM SUCESSO! ==="

# 3. Exibe uma mensagem divertida usando as ferramentas que instalamos
if command -v cowsay &> /dev/null; then
    cowsay "Parabéns Morpheus! Seu script funcionou!"
else
    echo "Parabéns Morpheus! Seu primeiro script funcionou!"
fi
