#!/bin/bash

# Função corrigida: o próprio Windows agora limpa o texto antes de falar
falar() {
    TEXTO="$1"
    
    # Exibe o texto na tela de forma rápida e fluida
    echo -e "$TEXTO" | pv -qL 80
    
    # O PowerShell limpa barras, códigos e colchetes de forma perfeita antes do áudio
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -Command "
        \$textoBruto = '$TEXTO';
        \$textoLimpo = \$textoBruto -replace '\x1b\[[0-9;]*m', '' -replace '\\\\[a-zA-Z]', ' ' -replace '[\[\]\(\)\-\r\n]', ' ';
        \$textoLimpo = \$textoLimpo -replace '^[0-9]+\\)', '';
        
        \$voice = New-Object -ComObject SAPI.SpVoice;
        foreach (\$v in \$voice.GetVoices()) {
            if (\$v.GetDescription() -like '*PT*' -or \$v.GetDescription() -like '*Brazil*') {
                \$voice.Voice = \$v;
                break;
            }
        }
        \$voice.Rate = 2;
        \$voice.Speak(\$textoLimpo);
    " > /dev/null 2>&1
}

clear
falar "\033[1;34m[JARVIS]: Filtros de áudio recalibrados no núcleo do sistema.\033[0m"
falar "\033[1;34m[JARVIS]: Todos os sistemas operacionais prontos, Senhor Morpheus.\033[0m"
echo ""

while true; do
    echo "--------------------------------------------------"
    echo "1) Status do sistema"
    echo "2) Previsão do tempo"
    echo "3) Executar Backup"
    echo "4) Abrir o GitHub"
    echo "5) Abrir o YouTube"
    echo "6) Abrir o Spotify Web"
    echo "7) Abrir o VS Code"
    echo "8) Modo Codar (Terminal Interno)"
    echo "9) Ativar Reconhecimento Facial (Webcam)"
    echo "10) Desconectar"
    echo "--------------------------------------------------"
    echo -n "Diretriz: "
    read OPCAO

    case $OPCAO in
        1)
            echo ""
            HORA=$(date +"%H:%M")
            falar "[JARVIS]: Agora são $HORA."
            MEMORIA=$(free -m | awk '/Mem:/ {print $3}')
            falar "[JARVIS]: Memória operacional em $MEMORIA megabytes."
            echo ""
            ;;
        2)
            echo ""
            falar "[JARVIS]: Conectando aos satélites de clima."
            curl -s "wttr.in?format=3" || echo "[JARVIS]: Erro de rede."
            echo ""
            ;;
        3)
            echo ""
            falar "[JARVIS]: Iniciando salvaguarda de ficheiros."
            if [ -f "./fazer_backup.sh" ]; then
                ./fazer_backup.sh
            else
                mkdir -p $HOME/Jarvis_Archive
                cp -r $HOME/meus_projetos/. $HOME/Jarvis_Archive/ 2>/dev/null
                falar "[JARVIS]: Arquivos salvos."
            fi
            ;;
        4)
            echo ""
            falar "[JARVIS]: Acessando o GitHub."
            /mnt/c/Windows/System32/cmd.exe /c "start https://github.com"
            echo ""
            ;;
        5)
            echo ""
            falar "[JARVIS]: Inicializando a plataforma do YouTube."
            /mnt/c/Windows/System32/cmd.exe /c "start https://youtube.com"
            echo ""
            ;;
        6)
            echo ""
            falar "[JARVIS]: Sincronizando suas playlists no Spotify Web."
            /mnt/c/Windows/System32/cmd.exe /c "start https://spotify.com"
            echo ""
            ;;
        7)
            echo ""
            falar "[JARVIS]: Inicializando o ambiente do Visual Studio Code."
            /mnt/c/Windows/System32/cmd.exe /c "code ." 2>/dev/null &
            echo ""
            ;;
        8)
            echo ""
            falar "[JARVIS]: Entrando no Modo Codar. Digite 'sair' para retornar."
            echo ""
            while true; do
                echo -n -e "\033[1;36m[JARVIS-SANDBOX]:\033[0m "
                read COMANDO
                if [ "$COMANDO" == "sair" ]; then break; fi
                eval "$COMANDO"
                echo ""
            done
            echo ""
            ;;
        9)
    echo ""
    falar "[JARVIS]: Inicializando sensores ópticos em tempo real."
    cp reconhecimento.py /mnt/c/Users/Public/reconhecimento.py 2>/dev/null
    cp haarcascade_frontalface_default.xml /mnt/c/Users/Public/haarcascade_frontalface_default.xml 2>/dev/null
    # Comando corrigido e simplificado (sem aspas conflitantes)
    /mnt/c/Windows/System32/cmd.exe /c "start python C:\Users\Public\reconhecimento.py"
    echo ""
    ;;

        10)
            echo ""
            falar "[JARVIS]: Sistemas offline. Até logo, Senhor."
            exit 0
            ;;
        *)
           echo ""
            falar "[JARVIS]: Comando inválido."
            echo ""
            ;;
    esac
done
