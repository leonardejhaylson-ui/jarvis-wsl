import cv2
import sys

xml_file = r"C:\Users\Public\haarcascade_frontalface_default.xml"
face_cascade = cv2.CascadeClassifier(xml_file)

# Inicializa a câmera usando o motor padrão validado no seu teste
video_capture = cv2.VideoCapture(0, cv2.CAP_ANY)

if not video_capture.isOpened():
    print("[SISTEMA]: Erro crítico. Não foi possível abrir a webcam.")
    sys.exit()

while True:
    ret, frame = video_capture.read()
    if not ret:
        break

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    for (x, y, w, h) in faces:
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
        cv2.putText(frame, "Morpheus Detectado", (x, y-10), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

    cv2.imshow('Protocolo de Reconhecimento Jarvis', frame)

    # Mantém o fluxo atualizando a 1ms. Pressione 'q' para fechar
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

video_capture.release()
cv2.destroyAllWindows()
