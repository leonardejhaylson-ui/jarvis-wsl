import pyttsx3
import sys

# Captura o texto que o Jarvis enviou do terminal
if len(sys.argv) < 2:
    sys.exit()

texto_para_falar = sys.argv[1]

# Inicializa o motor de voz nativo do computador
engine = pyttsx3.init()

# Localiza as vozes em Português instaladas no seu Windows
voices = engine.getProperty('voices')
for voice in voices:
    if "PT" in voice.id or "brazil" in voice.name.lower():
        engine.setProperty('voice', voice.id)
        break

# Ajusta a velocidade da fala (200 é o padrão, 230 deixa o Jarvis mais dinâmico)
engine.setProperty('rate', 220)

# Executa o áudio direto nos alto-falantes do Windows
engine.say(texto_para_falar)
engine.runAndWait()
