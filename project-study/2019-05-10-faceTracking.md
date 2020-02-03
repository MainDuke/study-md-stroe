```

```

#얼굴 인식 소스코드

1. 스트림을 캡쳐해서 OpenCV 로 이미지 처리를 한다.
2. 변경된 프레임을 화면에 출력한다.

```python
# python {filename}.py --face cascades/haarcascade_frontalface_default.xml

# import the necessary packages
from pyimagesearch.facedetector import FaceDetector
from pyimagesearch import imutils
import argparse
import cv2
import cv2
import numpy as np


# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-f", "--face", required = True,
	help = "path to where the face cascade resides")
ap.add_argument("-v", "--video",
	help = "path to the (optional) video file")
args = vars(ap.parse_args())

# construct the face detector
fd = FaceDetector(args["face"])

teststream = cv2.VideoCapture("http://121.160.17.78:8000/stream.mjpg")

while True:
    ret, frame = teststream.read()
    #print (frame)

    frame = imutils.resize(frame, width=480, height=640)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faceRects = fd.detect(gray, scaleFactor=1.08, minNeighbors=5,
                          minSize=(35, 35))
    frameClone = frame.copy()

    # loop over the face bounding boxes and draw them
    for (fX, fY, fW, fH) in faceRects:
        cv2.rectangle(frameClone, (fX, fY), (fX + fW, fY + fH), (0, 255, 0), 2)

    cv2.imshow('Video', frameClone)

    if cv2.waitKey(1) == 27:
        exit(0)

```
