```

```

참고

1. https://m.blog.naver.com/PostView.nhn?blogId=samsjang&logNo=220498694383&targetKeyword=&targetRecommendationCode=1
2. https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_setup/py_table_of_contents_setup/py_table_of_contents_setup.html#py-table-of-content-setup

OpenCV 는 컴퓨터 비전 , 머신러닝 과 관련된 다양한 알고리즘을 지원하고 있는 오픈소스 프로젝트다.

OpenCV-Python 은 API 모임이다. C++ API 를 파이썬 언어로 래핑한 것이라 할 수 있다.

파이썬은 귀도 반 로섬 (Ruido van rossum) 이라는 네덜란드 프로그래머에 의해 개발된 범용 프로그래밍 언어 입니다. 파이썬은 간결한 프로그래밍이 가능하고 가독성 높은 코드를 작성할 수 있다는 이유로 단기간에 아주 인기 있는 언어가 되었습니다.

파이썬이라는 언어는 프로그래머가 생각한 아이디를 가독성을 떨어트리지 않고 몇 줄 안 되는 코딩으로 프로토타이핑이 가능하다.

파이썬은 스크립트 언어이므로 C/C++ 와 같은 컴파일 언어에 비해 속도가 느립니다. 하지만 성능 이슈가 있는 곳은 C/C++ 로 구현한 후에 파이썬으로 래퍼를 생성한다.

즉, 파이썬 코드가 C/C++ 구현코드에 비해서 성능이 뒤떨어지지 않게함.
파이썬으로 로직을 짜기 때문에 구현이 쉽다.

<UBUNTU -- OPENCV-PYTHON>
참고: https://docs.opencv.org/3.4.1/d2/de6/tutorial_py_setup_in_ubuntu.html

설치 : \$ sudo apt-get install python-opencv

확인

```
$python
>>> import cv2 as cv
>>> print(cv.__version__)
```

sudo apt-get install cmake
sudo pip install numpy

Cmake 참조 : https://docs.opencv.org/master/d7/d9f/tutorial_linux_install.html

<python windows 설치>

1. python 사이트에서 파이썬을 다운 받아서 설치한다.
2. 폴더 경로에서 쉘을 열고 : curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
   '

<라즈베리파이 설치>

1. 라즈비안 os 다운로드
2. 이치 다운로드해서 sd 카드 포맷후 세팅
3. sd카드 삽입
4. 실행후 ip 설정
5. sudo apt-get vim update
6. sudo /etc/dhcpcd.conf 에서 값 설정

```
interface eth0
static ip_address=121.160.17.78/24
static routers=121.160.17.126
static domain_name-servers=206.255.241.4 8.8.8.8
```

sudo rm python-opencv.\*
pi@raspberrypi:/var/lib/dpkg/info $ sudo dpkg --configure -a
python-opencv (2.4.9.1+dfsg1-2) 설정하는 중입니다 ...
pi@raspberrypi:/var/lib/dpkg/info $ sudo apt-get install -f

<크로스컴파일 설치중>

?. 이클립스 remote system install
https://download.eclipse.org/tm/updates/4.5.0/repository/

참조 : https://blog.xcoda.net/85

SFTP : 정리
VAC
WEBCAM -

---

OpenCV에서 사용시에는 다음처럼 0대신에 -1을 open함수의 아규먼트로 사용해야 합니다.

0을 사용하게되면 카메라가 오픈되기를 무한히 대기하게 됩니다.

C++ 코드의 경우
VideoCapture cap;
cap.open(-1);

Python 코드의 경우
cap = cv2.VideoCapture(-1)

---

<라즈베리 파이 카메라세팅>

1. 참고
   https://webnautes.tistory.com/916

<NODE-RED 업데이트>

1. https://nodered.org/docs/hardware/raspberrypi

<의존성 문제>

1. sudo dpkg --purge --ignore-depends=node-gyp node-gyp
   sudo dpkg --purge --ignore-depends=gyp gyp
   sudo dpkg --purge --ignore-depends=gyp gyp

2. 바이너리 설치
   참고 : http://www.hardcopyworld.com/ngine/aduino/index.php/archives/3043

주소 :
https://github.com/nodesource/distributions#debinstall

방법 : sudo su , root 에서 설치함.

## Run `sudo apt-get install -y nodejs` to install Node.js 11.x and npm

## You may also need development tools to build native addons:

     sudo apt-get install gcc g++ make

## To install the Yarn package manager, run:

     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn

\*\*새로운 시도
https://www.instructables.com/id/Install-Nodejs-and-Npm-on-Raspberry-Pi/

wget https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-armv7l.tar.xz

tar -xzf node-v10.15.3-linux-armv7l.tar.xz
node-v10.15.3-linux-armv7l.tar.xz

https://noviceany.tistory.com/47

긴...긴 싸움이었다.
NPM 설정이 안 잡혀서, 해당 폴더에 가서 찾아서 PATH 추가함.

<노드 레드 설치>

1. 참조 : https://nodered.org/docs/hardware/raspberrypi
2. bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)

This can take 20-30 minutes on the slower Pi versions - please wait.

Stop Node-RED ✔
Remove old version of Node-RED ✔
Using N to manage Node.js +
Update Node.js LTS ✔ Node v10.15.3 Npm 6.4.1
Clean npm cache ✔
Install Node-RED core ✔ 0.20.5
Move global nodes to local -
Install extra Pi nodes ✔
Npm rebuild existing nodes -
Add shortcut commands ✔
Update systemd script ✔

Any errors will be logged to /var/log/nodered-install.log

All done.
You can now start Node-RED with the command node-red-start
or using the icon under Menu / Programming / Node-RED
Then point your browser to localhost:1880 or http://{your_pi_ip-address}:1880

Started 2019. 04. 18. (목) 17:44:06 KST - Finished 2019. 04. 18. (목) 17:50:08 KST

<설치완료>

---

요약

1. node, nodejs, npm 을 지운다.
2. 잔여물들도 지운다. dpkg 에러가 나면 다 지우고, dpkg 다시 잡아준다.
3. node.js 와 npm 을 설치한다. 보통 같이 설치되나, npm 을 인식 못할 수도 있다. 이때, npm/bin 을 찾아서 path 에 등록해주자. 그러면 된다.
4. 대망의 node-red 설치다. 홈페이지에 있는 bash 쉘 스크립트를 입력하면 된다.

- 패키지 의존성 에러가 생겨서 잔여물을 지우는데 시간이 더 오래걸렸다.

<노드레드 - 온습도 설치>

1. 팔레트에서 dht 검색 후 설치시도 - > 에러
2. http://www.airspayce.com/mikem/bcm2835/ 에서 bcm 을 깐다.

<노드레드- opencv 설치>

1. https://www.npmjs.com/package/node-red-contrib-opencv

<노드레드 PMS7003 설치>

https://blog.naver.com/elepartsblog/221345203230

https://blog.naver.com/elepartsblog/221345203230

https://www.circuits.dk/setup-raspberry-pi-3-gpio-uart/

https://www.raspberrypi.org/forums/viewtopic.php?t=152201

<실패사례>

1. RX - > TX , TX - > RX 가 되게 핀을 꽂아야 인식이 된다. 같은 것끼리 끼면 통신 안되더라...

2. 팔레트 : node-red-contrib-easybotics-air-quality 는 여러개의 센서를 사용하기 위해 만들어놓은 팔레트다.

자동으로 설정이 된 값을 특정 서버에 전송하여, 대쉬보드를 사용할 수 있게 만들어놓았음.

내부에 원본 소스를 찾아냄.

제조사 : plantower 에서 만든 PMS 센서를 지원한다. (PMS7003) 은 plantower 에서 만든 제품...
참조 : https://github.com/perfectworks/node-plantower#supported-device-models
라이센스 : ISC , ISC 라이선스는 Internet Systems Consortium(ISC)에 허용된 free Software license 로, ISC에서 개발한 OpenBSD베이스로 개발된 소프트웨어 릴리즈를 위해서 사용되는 라이선스이다.

3. node-red-contrib-easybotics-air-quality 에서 제공하는 노드를 사용하면, msg 를 바로 받아낼수 있음. 하지만, sensor manager 를 설정해줘야하고, 이 노드를 만들어서 설정하면

<node-red 에서 node를 만들기>
Nodes get created when a flow is deployed, they may send and receive some messages whilst the flow is running and they get deleted when the next flow is deployed.

They typically consist of a pair of files; a JavaScript file that defines what the node does, and an html file that defines the node’s properties, edit dialog and help text.

A package.json file is used to package it all together as an npm module.

Creating a simple node
package.json
lower-case.js
lower-case.html
Testing your node in Node-RED
Creating a simple node
This example will show how to create a node that converts message payloads to all lower-case characters.

Ensure you have the recommended LTS version of Node.js installed on your system. As of this writing this is version LTS 8.x which includes npm version 5.x.

Create a directory where you will develop your code. Within that directory, create the following files:

<모듈 별 핀 정보에 대해서 정리>
1. HW 시그널, 프로토콜 , 모듈별 (온습도, PM , 열화상)
2. 열화상 이미지의 포맷 형태, 데이터 형태 
3. Pm: node-red <> 파이썬 값 차이 확인
4. 