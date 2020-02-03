```

```

오케스트레이션 을 구축하기 위해서

컨테이너 기반의 관리가 필요하다고 판단

도커 -스웜 을 이용한 오케스트레이션을 구축해보자.

CI 도~

라즈베리에 도커 설치부터 해보자~

설치

```
sudo curl -fsSL https://get.docker.com/ | sudo sh
```

출처: https://jiyino.tistory.com/entry/설치-Raspberry-Pi-Hassbian-에-Docker-설치하기 [도서관]

권한

```
sudo usermod -aG docker pi
```

[출처] 라즈베리파이 활용 - Docker 사용 (1. 기본개념/설치)|작성자 만세돌이

1. 베이스 이미지를 사용하자 : raspbian/stretch
2. 내가 지금 만든 라즈비안을 이미지로 만들자.

https://www.michaelmiklis.de/creating-a-raspbian-docker-base-image/

https://iotbyhvm.ooo/docker-container-raspberry-pi/

CPU 확인
cat /proc/cpuinfo | grep model

OS 확인
cat /etc/os-release

노드레드 도커
https://nodered.org/docs/getting-started/docker

-- 결론

도커를 이용해서 오케스트레이션을 구축을 한다는건 무리.
기존 OS 위에 도커를 띄워서 ... 하므로... ㅠㅠ

모든 서버에 SSH 을 날리는 형태로 쉘 스크립트를 짜는게 현실적일듯.!!!
