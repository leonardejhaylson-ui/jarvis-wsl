#!/bin/bash

# Limpa a tela antes de começar
clear

echo "========================================="
echo "       INICIALIZANDO SISTEMA...          "
echo "========================================="
sleep 1 # Faz o terminal pausar por 1 segundo para dar efeito

# Pergunta o nome do usuário
echo -n "Olá! Eu sou o terminal do Ubuntu. Qual é o seu nome? "
read NOME

# Interage usando o nome digitado
echo ""
echo "Muito prazer, $NOME! É uma honra processar seus comandos."
sleep 1

# Faz uma pergunta de sim ou não
echo -n "Você está gostando de aprender Linux? (sim/nao): "
read RESPOSTA

echo ""
# Transforma a resposta em letras minúsculas para evitar erros
RESPOSTA=$(echo "$RESPOSTA" | tr '[:upper:]' '[:lower:]')

if [ "$RESPOSTA" == "sim" ]; then
    echo "Que ótimo, $NOME! O ecossistema Linux é gigantesco e cheio de possibilidades."
    echo "Continue praticando!"
elif [ "$RESPOSTA" == "nao" ]; then
    echo "Entendo, $NOME. O começo na linha de comando pode parecer intimidador,"
    echo "mas com o tempo você vai ver o poder que tem em mãos!"
else
    echo "Não entendi muito bem a sua resposta, mas o importante é continuar explorando!"
fi

echo "========================================="
