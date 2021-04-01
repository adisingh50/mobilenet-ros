import cv2
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_objectron = mp.solutions.objectron
 
cap = cv2.VideoCapture('/dev/video2')
 
with mp_objectron.Objectron(static_image_mode=False,
                            max_num_objects=5,
                            min_detection_confidence=0.5,
                            min_tracking_confidence=0.99,
                            model_name='Shoe') as objectron:
    while cap.isOpened():
        success, image_bgr = cap.read()
 
        if not success:
            continue
 
        #convert bgr image to rgb
        image_rgb = cv2.cvtColor(image_bgr, cv2.COLOR_BGR2RGB)
        image_rgb.flags.writeable = False #optional for performance sake
        results = objectron.process(image_rgb)
        image_rgb.flags.writeable = True
 
        #draw bounding boxes on image
        image = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2BGR)
        if results.detected_objects:
            for detected_object in results.detected_objects:
                mp_drawing.draw_landmarks(image, detected_object.landmarks_2d, mp_objectron.BOX_CONNECTIONS)
                mp_drawing.draw_axis(image, detected_object.rotation, detected_object.translation)
        
        cv2.imshow('MediaPipe Objectron', image)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
 
cap.release()

