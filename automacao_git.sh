#!/bin/bash

# Mensagem estética padrão do Jarvis
echo -e "\e[1;34m[JARVIS]\e[0m Iniciando Protocolo Atualizar (Git Automation)..."

# Verifica se o diretório atual é um repositório Git
if [ ! -d ".git" ]; then
    echo -e "\e[1;31m[ERRO]\e[0m Este diretório não é um repositório Git válido."
    exit 1
fi

# Adiciona todas as modificações
git add .

# Solicita a mensagem do commit
echo -e "\e[1;32m[JARVIS]\e[0m Insira a mensagem do Commit (ou pressione Enter para 'Update automático'):"
read -r commit_msg

if [ -z "$commit_msg" ]; then
    # Mensagem padrão baseada na data atual caso o usuário não digite nada
    commit_msg="Auto-update: $(date +'%d/%m/%Y %H:%M')"
fi

# Executa o commit
git commit -m "$commit_msg"

# Captura o nome da branch atual de forma dinâmica
branch_atual=$(git branch --show-current)

# Executa o envio para o repositório remoto
echo -e "\e[1;34m[JARVIS]\e[0m Enviando alterações para a branch '\e[1;33m$branch_atual\e[0m'..."
git push origin "$branch_atual"

if [ $? -eq 0 ]; then
    echo -e "\e[1;32m[SUCESSO]\e[0m Repositório atualizado na nuvem com êxito!"
else
    echo -e "\e[1;31m[ERRO]\e[0m Falha ao executar o envio. Verifique suas credenciais ou conexão."
fi
