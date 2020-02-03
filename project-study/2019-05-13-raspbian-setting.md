```

```

라즈비안 세팅!

1. Etcher 와 라즈비안 이미지를 준비한다.
2. 이미지를 SD 카드에 굽는다.
3. 네트워크 설정을 한다.
4. 실행후 ip 설정
5. sudo apt-get vim update
6. sudo /etc/dhcpcd.conf 에서 값 설정

```
interface eth0
static ip_address=121.160.17.78/24
static routers=121.160.17.126
static domain_name-servers=206.255.241.4 8.8.8.8
```

7. opencv 설정
   https://docs.opencv.org/4.1.0/d2/de6/tutorial_py_setup_in_ubuntu.html

8. node-red 설정
   https://nodered.org/docs/hardware/raspberrypi

bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)

9. 이미지 굽기
