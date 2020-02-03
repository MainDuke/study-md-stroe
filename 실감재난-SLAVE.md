```

```

가제 : Environment Sensor S-01 - 제작

1. 라즈비안 설치 및 배포

2. 무선 WiFi 설정

   ````
        웨이버스 기술 연구소 무선 공유기 주소 : http://121.160.17.110:3389

        라즈베리파이 와이파이 설정법

        1. 무선장치에서 포트포워드 설정 해준다.

        2. 라즈베리 파이에서 sudo vi /etc/dhcpcd.conf 에서 고정아이피를 잡아준다.

        ```
            interface wlan0
            static ip_address = 192.168.0.200
            static routers=192.168.0.1
            static domain_name_servers=1.1.1.1 8.8.8.8
        ```

        설명
        static ip_address = 내가 공유기로 부터 할당 받고 싶은 IP
        static routers = 게이트웨이 주소 , 기기가 바라보고 있는 네트워크 장치의 주소
        static domain_name_servers = DNS 주소, 일정한 값을 입력하면 된다. 무관

        1. sudo nano /etc/wpa_supplicant/wpa_supplicant.conf 에서

        ```
            ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev

            update_config=1

            country=US

            network={
                    ssid="wrnd"
                    scan_ssid=1
                    psk="패스워드"
            }
        ```

        ssid="AP포인트 이름"
        scan_ssid=1 이부분은 AP포인트가 숨겨져있을떄 적어준다.

        1) 무선랜 포트포워드 설정

        121.160.17.110:41922 : 라즈비안 SSH (192.168.0.200:22)
        121.160.17.110:41980 : 라즈비안 Node-red (192.168.0.200:1880)
   ````

3. 센서 설정
4.

5) 12
6) 12
7)

라즈베리 설정 팁

1. SFTP 권한 설정
   CLION 의 DEPLAYMENT 의 OPRION 에서 PERMISSION 을 제어해 줄수 있다.

<nRF24L01 설정법 라즈베리파이>

1. http://www.airspayce.com/mikem/bcm2835/ 설치
2. http://iotdk.intel.com/docs/master/mraa/index.html

./configure --driver=SPIDEV
sudo make install -B

2. 시간설정
   sudo apt-get install ntpdate
   sudo ntpdate -u 0.kr.pool.ntp.org

3. node-red 설정

참조 : https://nodered.org/docs/security

주제 : node-red 보안요소

경로 : 라즈베리파이
home/pi/.node-red/setting.js

해당 경로에 있는 세팅 파일에서
필요한 부분을 만들어주면 됩니다.

```javascript
adminAuth: {
type: "credentials",
users: [{
username: "admin",
password: "$2a$08$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN.",
permissions: "*"
}]
}
```

이 users속성은 사용자 개체의 배열입니다. 이렇게하면 각각 다른 권한을 가질 수있는 여러 사용자를 정의 할 수 있습니다.

```javascript
users: [
  {
    username: "admin",
    password: "$2a$08$zZWtXTja0fB1pzD4sHCMyOCMYz2Z6dNbM6tl8sJogENOMcxWV9DN.",
    permissions: "*"
  }
];
```

```
permissions: "*" --> 모든 권한
password. 암호는 bcrypt 알고리즘을 사용하여 안전하게 해시됩니다.
```

---

nRF24L01 모듈 세팅

1. http://www.airspayce.com/mikem/bcm2835/ 세팅 bcm2835

2. http://tmrh20.github.io/RF24/RPi.html // 라즈베리파이 세팅

```
sudo apt-get update && sudo apt-get upgrade -y

wget http://www.airspayce.com/mikem/bcm2835/bcm2835-1.60.tar.gz
sudo tar zxvf bcm2835-1.60.tar.gz
cd bcm2835-1.60
./configure
make
sudo make check
sudo make install

wget http://tmrh20.github.io/RF24Installer/RPi/install.sh 

```

3.
