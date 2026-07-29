#!/bin/bash

# 1. Define as pastas de origem e destino usando variáveis
ORIGEM="$HOME/meus_projetos"
DESTINO="$HOME/backup_sistema"

# 2. Captura a data e hora atual do sistema para diferenciar os backups
DATA_ATUAL=$(date +%Y-%m-%d_%H-%M)

# 3. Define o caminho final com a pasta datada
PASTA_FINAL="$DESTINO/backup_$DATA_ATUAL"

echo "========================================="
echo "       INICIANDO BACKUP AUTOMÁTICO       "
echo "========================================="
echo "Origem: $ORIGEM"

# 4. Verifica se a pasta de origem realmente existe antes de continuar
if [ ! -d "$ORIGEM" ]; then
    echo "Erro: A pasta de origem não existe!"
    exit 1
fi

# 5. Cria as pastas de destino se elas não existirem no sistema
mkdir -p "$PASTA_FINAL"

echo "Copiando arquivos para: $PASTA_FINAL..."
sleep 1

# 6. Executa a cópia de todos os arquivos e pastas de forma recursiva
cp -r "$ORIGEM/." "$PASTA_FINAL/"

echo "========================================="
echo "    BACKUP CONCLUÍDO COM SUCESSO!        "
echo "========================================="
