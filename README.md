# Jarvis Assistant - WSL

Um assistente virtual interativo inspirado no JARVIS, operando de forma híbrida e integrada entre o ecossistema Linux (Ubuntu via WSL2) e o Windows.

O projeto utiliza automação em Shell Script no Linux para controle e lógica operacional, acionando recursos de mídia, programas locais e inteligência artificial de visão computacional diretamente no hardware do Windows.

---

## Funcionalidades Principais

*   **Sistema de Voz**: Comunicação por áudio nativo em português do Brasil integrada ao Windows, sem leitura de códigos do sistema.
*   **Visão Computacional**: Rastreamento facial dinâmico em tempo real utilizando Python 3 e a biblioteca OpenCV com modelos Haar Cascade.
*   **Modo Codar**: Um terminal secundário encapsulado integrado dentro do próprio Jarvis para testes rápidos de comandos Linux.
*   **Automação Web**: Abertura instantânea de plataformas de desenvolvimento e entretenimento (GitHub, YouTube, Spotify Web) através de comandos diretos de hardware.
*   **Protocolo de Backup**: Rotina inteligente de cópia de segurança de diretórios estruturada por carimbo de data e hora (ano, mês, dia, hora e minuto).

---

## Requisitos de Instalação

### No ambiente Windows
1. Certifique-se de possuir o Python 3 instalado e configurado nas variáveis de ambiente.
2. Instale a biblioteca do OpenCV para os sensores ópticos rodando no CMD clássico:
   ```cmd
   pip install opencv-python
   ```

### No ambiente Linux (Ubuntu / WSL)
Instale o gerenciador de velocidade de exibição de texto do terminal:
```bash
sudo apt update && sudo apt install -y pv
```

---

## Como Executar

Dê a permissão de segurança para o script e inicie o protocolo operacional:
```bash
chmod +x jarvis.sh
./jarvis.sh
```

---

## Estrutura de Arquivos

*   `jarvis.sh`: O núcleo central de versão, lógica do menu e comandos de automação (Shell Script).
*   `reconhecimento.py`: O módulo gráfico em Python responsável por gerenciar a webcam e realizar a detecção facial.
*   `fazer_backup.sh`: Rotina de cópia recursiva de segurança de diretórios.
*   `haarcascade_frontalface_default.xml`: O banco de dados matemático da inteligência artificial para detecção de estruturas faciais humanas.
