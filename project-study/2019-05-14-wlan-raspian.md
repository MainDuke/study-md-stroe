```

```

웨이버스 기술 연구소 무선 공유기 주소 : http://121.160.17.110:3389

라즈베리파이 와이파이 설정법

-- 라즈베리파이 설정을 바꾼다.

0. 무선장치에서 포트포워드 설정 해준다.

1. 라즈베리 파이에서 sudo vi /etc/dhcpcd.conf 에서 고정아이피를 잡아준다.

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

2) 무선랜 포트포워드 설정

   121.160.17.110:41922 : 라즈비안 SSH (192.168.0.200:22)
   121.160.17.110:41980 : 라즈비안 Node-red (192.168.0.200:1880)
   121.160.17.110:41954 : 라즈비안 postgresql DB (192.168.0.200:5432)

---

---

이제 노드레드를 설정한다.
