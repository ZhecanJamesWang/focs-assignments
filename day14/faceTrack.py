import cv2
import numpy as np

cap = cv2.VideoCapture(0)
#Initial read of the frame size
ret,frame = cap.read()
height,width,channel = frame.shape

print("printing height and width:",height,width)

print("Stand and Press C")

tf = True
while(tf):
face_cascade = cv2.CascadeClassifier('/home/jong/Desktop/softdes/SoftwareDesignFall15/toolbox/image_processing/haarcascade_frontalface_alt.xml')
ret, frame = cap.read()
#faces = [[x,y,w,d]], (x,y) is the top left corner
faces = face_cascade.detectMultiScale(frame, scaleFactor=1.2, minSize=(20,20))
#Need something to buffer x,y,w,d since sometimes it does not detect face
for (x,y,w,d) in faces:
cv2.rectangle(frame,(x,y),(x+w,y+d),(0,0,255))
#point on the center of the frame
center = (x+int(w/2),y+int(d/2))
cv2.circle(frame,center,5,(0,0,255),-1)
cv2.imshow('frame',frame)
k = cv2.waitKey(1)
if k == ord('c'):
print faces[0]
print (x,y,w,d)
tf = False