```

```

1. ubuntu GCC 설치
2. vi <파일명>.cpp

```c++
#include <iostream>

int main(){
    std::cout << "hello world!\n";
    return 0;
}

```

3. g++ -c 파일명.cpp #파일명.o 생성
   이렇게 하면 파일명.o 파일이 자동으로 생성된다. main.o는 앞서 말한 오브젝트 파일 : 바이너리다. 바이너리 파일은 바로 실행할 수 없다. 메인 함수가 물론 포함되어 있지만 그래도 곧바로 실행할 수는 없고, 리눅스가 실행할 수 있는 형식의 파일로 만들어야 한다.

4) g++ -o test 파일명.o #main 파일 생성
   파일명.o 파일이 바이너리 파일이고, 확장자가 없는 test 파일이 실행파일이다.

5) ./test # 실행

---

## 여러개의 파일을 컴파일 해야할 경우

1. 파일 생성

```c++
int myfunc(int val);
```

```c++
#include "my,h"
int myfunc(int val){
    return val +1;
}
```

```c++
#main.cpp
#include <iostream>
#include "my.h"

int main(){
    std::cout << "calling up myfunc:" <<myfunc(3) <<std::endl;
    return 0;
}

```

2. 명령어

```
g++ -c main.cpp
```

#컴파일러는 main.cpp파일을 들여다보고 my.h 파일을 현재 디렉토리에서 찾아낸다. my.h에는 #myfunc에 대한 정의가 있으므로 컴파일에는 문제가 없다. main.o 파일이 생성된다.

```
 g++ -c my.cpp
```

#myfunc의 구현이 컴파일되어 my.o 에 담긴다. 이제 main.o와 my.o를 묶어서 test라는 실행 #프로그램을 만들면 된다.

    ```
    g++ -o test main.o my.o
    ```

#이 실행의 결과로 test파일이 생성된다. 오브젝트 파일이 더 많을 경우에는 줄줄이 다 갖다 #붙이면 된다. #여러 개의 바이너리 파일 중 main함수는 단 한개만 있어야 한다. 두 개 있거나 없으면 #실행파일이 안 만들어진다.
