# JARVIS WSL

Projeto experimental de automação que integra Ubuntu/WSL2 e Windows usando Shell Script e Python.

A proposta é explorar como um assistente local pode coordenar comandos do sistema, voz, aplicações Windows e visão computacional a partir de uma interface de terminal.

## O que existe hoje

- menu interativo em Shell Script;
- síntese de voz pelo SAPI do Windows via PowerShell;
- consulta de status do sistema;
- consulta de clima via `wttr.in`;
- abertura de GitHub, YouTube, Spotify e VS Code;
- terminal interno para experimentação de comandos;
- detecção facial por webcam com Python, OpenCV e Haar Cascade;
- integração entre processos Linux/WSL e executáveis do Windows;
- suporte opcional a scripts auxiliares de backup e automação Git quando presentes no ambiente.

## Arquitetura atual

```text
Terminal no WSL
    ↓
jarvis.sh
    ├── comandos Linux
    ├── PowerShell / SAPI (voz)
    ├── cmd.exe / aplicações Windows
    └── Python + OpenCV (detecção facial)
```

## Tecnologias

- Bash / Shell Script
- Python
- OpenCV
- PowerShell
- WSL2
- Haar Cascade

## Executando

O projeto foi pensado para um ambiente Windows com WSL2. No Ubuntu/WSL:

```bash
sudo apt update
sudo apt install -y pv
chmod +x jarvis.sh
./jarvis.sh
```

Para o módulo de visão, o Python do Windows precisa ter OpenCV disponível:

```bash
pip install opencv-python
```

## Limites atuais

Este é um **protótipo experimental**, não um assistente multimodal completo. O módulo de câmera atual realiza **detecção de faces**, e não identificação biométrica de uma pessoa. Algumas ações também dependem de caminhos e recursos específicos do Windows/WSL.

## Próximos passos possíveis

- remover caminhos fixos e transformar configurações em parâmetros;
- separar comandos em módulos;
- substituir o terminal baseado em `eval` por uma interface de comandos restrita;
- adicionar testes para rotinas que não dependem de hardware;
- evoluir a detecção visual de forma modular.

## Por que mantenho este projeto

O JARVIS funciona como laboratório pessoal para automação, integração entre sistemas operacionais, Shell Script, Python e visão computacional. Ele registra uma etapa da minha evolução e continuará sendo refinado conforme avanço nesses temas.
