```

```

---

    “Grissom should have never left the show,” mused Laura, nursing her Pinot Grigio.

    Another long day at Initech, and here she was, sipping her wine and watching CSI re-runs on Netflix.
    This had become the “norm” for Laura. Coming home at 7 pm after a horribly dull day at work, she only has her TV and wine to keep her company.
    With a melancholy look on her face, Laura muttered to herself, “There must be more to life than this,” but another pull of her wine washed the thought away.
    It’s not that her life was bad. All things considered, it was actually quite good.
    Her job, while boring, paid well. Money was not an issue.
    The real issue was Laura lacked a sense of pride in her job. And without that pride, she did not feel complete.

"그리솜은 쇼에서 떠나지 말았어야 했어요," 라고 로라가 피노 그리지를 간호하면서 중얼거렸다.

Initech에서의 또 다른 긴 날, 그리고 그녀는 여기 와인을 홀짝홀짝 마시고 CSI가 Netflix에서 재방송되는 것을 보고 있었습니다.
이것은 로라에게 "정상"이 되었습니다. 직장에서 끔찍하게 따분한 하루를 보낸 후 오후 7시에 집에 돌아오면, 그녀는 TV와 와인만 가지고 있을 뿐입니다.
우울한 표정을 지으며 로라는 혼자 중얼거렸지만, 또 한 번 와인을 끌며 생각에 잠겼다.
그녀의 삶이 나빴던 것은 아닙니다. 모든 것을 고려했을 때, 그것은 사실 꽤 괜찮았습니다.
따분하긴 하지만, 그녀의 직업은 보수가 좋았습니다. 돈은 문제가 되지 않았습니다.
진짜 문제는 로라가 자신의 직업에 대한 자부심이 부족했다는 것입니다. 그리고 그 자존심이 없었다면, 그녀는 완벽하지 않았다고 느꼈습니다.

    Following the arsonist attack on the Initech building three years earlier (reportedly over a red Swingline stapler), the company had since rebuilt. And Laura was hired right out of college as a programmer.
    Her job was to update bank software. Find the bugs. Fix them. Commit the code repository. And ship the produc-tion package.

3년 전 이니텍 건물에 대한 방화범의 공격이 있은 후(빨간색 스윙라인 스테이플러에 대해 보고된 것으로 알려짐) 회사는 그 후 재건되었습니다. 그리고 로라는 대학에서 바로 프로그래머로 채용되었습니다.
그녀의 일은 은행 소프트웨어를 업데이트하는 것이었어요. 벌레를 찾아서 고치세요. 코드 저장소를 커밋합니다. 그리고 생산품을 배송해 주세요.

    Rinse. And. Repeat.

    It was the dull monotony of the days that started to wear on Laura at first.
    She quickly realized that no matter how much money she made, no matter how much was sitting in her bank account, it could not compensate for that empty feeling she had in the pit of her stomach every night – she needed a bigger challenge.
    And maybe it was the slight buzz from the wine, or maybe because watching CSI re-runs was becoming just as dull as her job, but Laura decided that tonight she was go-ing to make a change and work on a project of her own.
    Thinking back to college, where she majored in computer science, Laura mused that the projects were her favorite part. It was the act of creating something that excited her.
    One of her final classes as an undergraduate was a special topics course in image processing. She learned the basics of image processing and computer vision. And more importantly, she really enjoyed herself when taking the class.

처음에 로라에게 입히기 시작한 것은 당시의 따분한 단조로움이었어요.
그녀는 그녀가 아무리 많은 돈을 벌어도, 그녀의 통장에 아무리 많이 앉아 있어도, 그것이 그녀가 매일 밤 뱃속에 품고 있던 공허한 느낌을 보상할 수 없다는 것을 재빨리 깨달았습니다. 그녀는 더 큰 도전이 필요했습니다.
와인 때문에 약간 떠들썩했던 것일 수도 있고, CSI의 재방송을 보는 것이 그녀의 일처럼 무뎌지고 있었기 때문일 수도 있습니다.
하지만 로라는 오늘 밤 변화를 만들고 자신의 프로젝트를 진행하기로 결심했습니다.
그녀가 컴퓨터 과학을 전공했던 대학을 돌아보면서, 로라는 그 프로젝트들이 그녀가 가장 좋아하는 부분이라는 것을 곰곰이 생각했습니다.
그것은 그녀를 흥분시키는 무언가를 창조하는 행위입니다.
학부시절의 마지막 수업 중 하나는 이미지 처리에서 특별한 주제 과정이었어요. 그녀는 이미지 처리와 컴퓨터 시각의 기초를 배웠습니다.
그리고 더 중요한 것은, 그녀가 수업을 들을 때 정말 즐거웠다는 것입니다.

Pausing her CSI episode and refilling her wine glass, Laura reached over and grabbed her laptop.
It was time to dust off her image processing skills and build something of her own.

Object tracking in video seemed like a good place to start. Who knows where it might lead? Maybe to a better job. At least, that was Laura’s train of thought,

CSI 에피소드를 잠시 멈추고 와인 잔을 다시 채우면서 로라는 손을 뻗어 노트북을 움켜쥐었습니다.
그녀의 이미지 처리 기술을 없애고 그녀만의 무언가를 만들 때입니다.

영상 속 물체 추적은 시작하기에 좋은 장소처럼 보였습니다. 어디로 갈지 누가 알겠어요? 더 좋은 직장에 갈지도 모르죠. 적어도, 그건 로라의 생각이었어요

as she opened up vim and started coding:

```python
import numpy as np
import argparse
import time
import cv2
# ap = argparse.ArgumentParser() 7 ap.add_argument("-v", "--video",help = "path to the (optional) video file")
# args = vars(ap.parse_args())

blueLower = np.array([100, 67, 0], dtype="uint8")
blueUpper = np.array([255, 128, 50], dtype="uint8")

#camera = cv2.VideoCapture(args["video"])
```

    On Lines 1-4, Laura imports the packages she needs. She’ll make use of NumPy for numerical processing, argparse for parsing command line arguments, and cv2 for her OpenCV bindings. The time package is optional, but is useful if she has a very fast system that is processing the frames of a video too quickly.
    Laura needs only one command line argument, --video, which is the path to her video file on disk. Her command line argument is parsed on Lines 6-9.
    The object that Laura will be tracking in the video is a blue iPhone case. Since the color blue isn’t prevalent in any other location in the video besides the iPhone case, she wants to track shades of blue.
    In order to accomplish this color tracking, she defines the lower and upper limits of the shades of blue in the RGB color space on Lines 11 and 12. Remember, OpenCV repre-sents pixels in the RGB color space, but in reverse order.
    In this case, Laura defines colors as “blue” if they are greater than R = 0, G = 67, B = 100 and less than R =50, G = 128, B = 255.
    Finally, Laura opens the video file and grabs a reference to it using the cv2.VideoCapture function on Line 14. She stores this reference as camera.

1-4호선에서는 로라가 필요한 패키지를 임포트 합니다.
숫자 처리에 NumPy를, 명령줄 인수를 구문 분석하는 데 Argparse를, OpenCV 바인딩에는 cv2를 사용합니다.
시간 패키지는 선택 사항이지만 비디오 프레임을 너무 빨리 처리하는 매우 빠른 시스템을 가지고 있는 경우 유용합니다.

- Laura는 디스크의 비디오 파일에 대한 경로인 --video라는 명령줄 인수가 하나만 필요합니다. 그녀의 명령줄 인수는 6-9 라인에 구문 분석되어 있습니다.

로라가 영상에서 추적할 대상은 파란색 아이폰 케이스입니다.
파란색은 아이폰 케이스 외에 비디오의 다른 위치에 널리 퍼져 있지 않기 때문에, 그녀는 파란색 음영을 추적하고 싶어합니다.

이 색상 추적을 수행하기 위해, 그녀는 라인 11과 12의 RGB 색상 공간에서 파란색 음영의 하한과 상한선을 정의합니다.
OpenCV는 RGB 색 공간에서 픽셀을 다시 보내지만 반대로 보냅니다.

이 경우, 색상이 R = 0, G = 67, B = 100보다 크고 R = 50, G = 128, B = 255보다 작으면 Laura는 "파란"으로 정의합니다.

마지막으로, Laura는 비디오 파일을 열고 cv2를 사용하여 해당 파일을 참조합니다.

14호선의 VideoCapture 기능입니다. 그녀는 이 참조를 카메라로 저장합니다.

    Now that she has a reference to the video, she can start processing the frames.
    Laura starts looping over the frames, one at a time, on Line 16. A call to the read() method of camera grabs the next frame in the video, which returns a tuple with two values. The first, grabbed, is a boolean indicating whether or not the frame was successfully read from the video file. The second, frame, is the frame itself.
    She then checks to see if the frame was successfully read on Line 19. If the frame was not read, then she has reached the end of the video, and she can break from the loop.
    In order to find shades of blue in the frame, Laura must make use of the cv2.inRange function on Line 22. This function takes three parameters. The first is the frame that she wants to check. The second is the lower threshold on RGB pixels, and the third is the upper threshold.

```python
blue = cv2.inRange(frame, blueLower, blueUpper)
blue = cv2.GaussianBlur(blue, (3, 3), 0)
```

이제 그녀는 비디오에 대한 참조가 생겼으니 액자 처리를 시작할 수 있다.
로라는 16호선에서 한 번에 하나씩 액자 위를 반복하기 시작한다.
카메라의 읽기() 방법을 호출하면 비디오의 다음 프레임이 잡히고, 두 값이 있는 튜플이 반환된다.
붙잡힌 첫 번째 부울은 프레임이 비디오 파일에서 성공적으로 읽혔는지를 나타내는 부울이다.
두 번째, 프레임은 프레임 그 자체다.

그리고 나서 그녀는 그 액자가 19호선에서 성공적으로 읽혔는지 확인한다.
만약 액자를 읽지 않았다면, 그녀는 비디오의 끝에 도달했고, 그녀는 루프를 끊을 수 있다.

프레임에서 파란색 음영을 찾으려면 로라는 22호선의 cv2.inRange 기능을 이용해야 한다.
이 기능은 세 가지 파라미터를 사용한다.
첫째는 그녀가 확인하고 싶은 프레임이다. 두 번째는 RGB 픽셀의 하한 임계값이고, 세 번째는 상한 임계값이다.

    The result of calling this function is a thresholded image, with pixels falling within the upper and lower range set to white and pixels that do not fall into this range set as black.
    Finally, the thresholded image is blurred on Line 23 to make finding contours more accurate.
    Pausing to take a pull of her Pinot Grigio, Laura contem-plated the idea of quitting her job and working somewhere else.
    Why spend her life working a job that wasn’t challenging her?

이 함수를 호출한 결과는 화소가 상한 및 하한 범위 내에 있고 이 범위에 속하지 않는 픽셀이 흑색으로 설정된 임계값 영상이다.

마지막으로, 23번 라인에서 임계 영상이 흐려져 더 정확한 윤곽을 찾을 수 있다.

피노 그리기를 잠시 멈추면서 로라는 직장을 그만두고 다른 곳에서 일해야겠다는 생각을 곰곰이 생각해 보았다.
왜 그녀는 도전적이지 않은 직업을 가지고 일생을 보내는가?

    Now that Laura has the thresholded image, she needs to find the largest contour in the image, with the assumption that the largest contour corresponds to the outline of the phone that she wants to track.
    A call to cv2.findContours on Line 25 finds the con-tours in the thresholded image. She makes sure to clone the thresholded image using the copy() method since the cv2.findContour function is destructive to the NumPy ar-ray that she passes in.
    On Line 28 Laura checks to make sure that contours were actually found. If the length of the list of contours is zero, then no regions of blue were found. If the length of the list of contours is greater than zero, then she needs to find the largest contour, which is accomplished on Line 29. Here, the contours are sorted in reverse order (largest first), using the cv2.contourArea function to compute the area of the contour. Contours with larger areas are stored at the front of the list. In this case, Laura grabs the contour with the largest area, again assuming that this contour corresponds to the outline of the iPhone.
    Laura now has the outline of the iPhone, but she needs to draw a bounding box around it.
    Calling cv2.minAreaRect computes the minimum bound-ing box around the contour. Then, cv2.boxPoints re-shapes the bounding box to be a list of points.
    Note: In OpenCV 2.4.X, we would use the cv2. cv. BoxPoints function to compute the rotated bounding box of the contour. However, in OpenCV 3.0+, this function has been moved to cv2.

이제 로라는 한계점 이미지를 갖게 되었으므로, 가장 큰 윤곽선이 추적하려는 전화기의 윤곽에 해당한다는 가정 하에, 이미지에서 가장 큰 윤곽선을 찾아야 한다.

```python
 (cnts, _) = cv2.findContours(blue.copy(), cv2.RETR_EXTERNAL,cv2.CHAIN_APPROX_SIMPLE)
    if len(cnts) > 0:
        cnt = sorted(cnts, key=cv2.contourArea, reverse=True)[0]
        rect = np.int32(cv2.boxPoints(cv2.minAreaRect(cnt)))
        cv2.drawContours(frame, [rect], -1, (0, 255, 0), 2)

    cv2.imshow("Tracking", frame)
    cv2.imshow("Binary", blue)
    time.sleep(0.025)
```

라인 25의 cv2.findContours에 대한 호출은 임계 영상에서 con-tours를 찾는다.
그녀는 cv2.findContour 함수가 자신이 통과하는 NumPy array에 파괴적이기 때문에 copy() 방법을 사용하여 임계값 이미지를 복제하도록 한다.

28호선에서 로라는 윤곽이 실제로 발견되었는지 확인한다.
등고선 목록의 길이가 0이면 파란색 영역이 발견되지 않았다.
만약 등고선 리스트의 길이가 0보다 크면,
그녀는 29호선에서 이루어진 가장 큰 등고선을 찾아야 한다.
여기서 등고선은 cv2.contourArea 함수를 사용하여 등고선의 영역을 계산하는 역순서(가장 큰 것)로 정렬된다.

영역이 큰 등고선은 목록 맨 앞에 저장된다.
이 경우 로라는 이 등고선이 아이폰의 윤곽에 해당한다고 다시 가정해 가장 넓은 면적으로 윤곽선을 잡는다.
로라는 이제 아이폰의 윤곽을 잡았지만, 그 주위에 경계 상자를 그려야 한다.
cv2.minAreaRect를 호출하면 윤곽선 주위의 최소 경계 상자가 계산된다.
그런 다음, cv2.boxPoints는 경계 상자의 모양을 점 목록으로 다시 만든다.
참고: OpenCV 2.4.X에서는 cv2. cv. BoxPoints 함수를 사용하여 윤곽선의 회전된 경계 상자를 계산할 수 있다. 그러나 OpenCV 3.0+에서는 이 기능이 cv2로 이동되었다.

    boxPoints . Both functions perform the same task, just with slightly different namespaces.
    Finally, Laura draws the bounding box on Line 32 using the cv2.drawContours function.
    The frame with the detected iPhone is displayed on Line 34, and the thresholded image (pixels that fall into the low-er/upper range of blue pixels) is displayed on Line 35.
    Laura notes that Line 37 is optional. On many newer model machines, the system may be fast enough to process

boxpoints. 두 기능은 약간 다른 네임스페이스로 동일한 작업을 수행한다.
마지막으로 로라는 cv2.drawContours 기능을 이용하여 32호선의 경계 상자를 그린다.
탐지된 아이폰이 있는 프레임이 34번 라인에 표시되고, 임계 이미지(파란 픽셀의 로우어/상위 범위에 드는 픽셀)가 35번 라인에 표시된다.
로라는 37호선이 선택 사항이라고 말한다. 많은 새로운 모델 기계에서, 시스템은 충분히 빠르게 처리될 수 있다.

    32 frames per second. If this is the case, finding an accept-able sleep time will slow down the processing and bring it down to more normal speeds.
    She then checks to see if the q key is pressed on Lines 39-40. If it is pressed, she breaks from the while loop that is continually grabbing frames from the video.
    Finally, Lines 42 and 43 destroys the reference to the camera and closes any windows that OpenCV has opened.
    To execute her object tracking script, Laura issues the fol-lowing command:

그런 다음 그녀는 q 키가 39-40 라인에 눌러져 있는지 확인한다. 이 버튼을 누르면 비디오에서 프레임을 계속 잡아채는 동안 그녀는 루프를 끊는다.
마지막으로 42호선과 43호선은 카메라에 대한 기준을 파괴하고 OpenCV가 연 모든 창을 닫는다.
객체 추적 스크립트를 실행하기 위해 로라는 다음 명령을 내린다.

    On the left, both figures show an individual frame of the movie with the iPhone successfully found and tracked.
    The right image shows the thresholded image, with pixels falling into the blueLower and blueUpper range displayed as white and pixels not falling into the range as black.

왼쪽의 두 그림 모두 아이폰이 성공적으로 발견되어 추적된 영화의 개별 프레임을 보여준다. 오른쪽 이미지는 픽셀이 있는 임계값 이미지를 표시함
blueLower 및 blueUpper 범위에 들어가는 것은 흰색 및 픽셀이 검정색으로 표시되지 않는다.

    The very next day, Laura walked into Initech and gave her two weeks notice – no more working a job that didn’t challenge her. Laura wanted more out of life.
    And she found it.
    Only a month after leaving Initech, she was approached by their rival, Initrode. They were looking for someone to do eye tracking on their ATM.
    Ecstatic, Laura accepted the job – and received a higher salary than she did at Initech. But at this point, the money didn’t matter. The satisfaction of working a job she enjoyed was all the payment she needed.
    Laura doesn’t need her glass (or two) of Pinot Grigio at night anymore. But she still likes her CSI re-runs. As she dreamily drifts off to the glow of Grissom’s face on TV, she notes that the re-runs are somehow less boring now that she is working a job she actually likes.

바로 다음 날, 로라는 이니텍으로 걸어 들어가 2주간의 통고를 했다. – 더 이상 자신에게 도전하지 않는 일을 하지 않았다. 로라는 인생에서 더 많은 것을 원했다.
그리고 그녀는 그것을 찾았다.
이니텍을 떠난 지 불과 한 달 만에, 그녀는 그들의 라이벌인 인트로이드의 접근을 받았다. 그들은 현금 자동 인출기에서 눈을 추적할 사람을 찾고 있었다.
에코스타틱은 로라가 그 일을 수락했고, 이니텍에서보다 높은 연봉을 받았다. 그러나 이 시점에서 돈은 문제가 되지 않았다. 그녀가 즐겼던 직업의 만족은 그녀가 필요로 하는 모든 지불이었다.
로라는 더 이상 밤에 피노 그리지오 잔을 필요로 하지 않는다. 하지만 그녀는 여전히 CSI 재방송을 좋아한다. 그녀는 TV에 나오는 그리솜의 얼굴 빛으로 꿈벅거리면서, 그녀가 실제로 좋아하는 일을 하고 있기 때문에 재방송이 어쩐지 덜 지루하다고 말한다.
