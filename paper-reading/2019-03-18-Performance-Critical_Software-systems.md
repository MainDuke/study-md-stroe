~~~
layout: post
title: "The <strong>Building Successful Performance-Critical Software Systems</strong>"
subtitle: "why Critical-performance System need?"
section: paper reading
~~~
  

성능-중시 시스템은 수년에 걸쳐 만들어져왔다. 그러나 모든 성공적인 시스템에는 2~3개 정도의 성공적이지 않은 시스템이 있다.
지금의 프로세서의 속도, 메모리의 사이즈 통신 대역폭이 수년전에는 꿈꿀수 없는 수준이었다.
우리가 그러한 것들을 마스터하고자 할떄, 성능 중시의 시스템은 주요한 도전을 제공한다.

정의해야하는 여러가지의 질문이 존재한다.
1. 성능-중시 시스템이 무엇을 의미하는가?
2. 왜 성능-중시 시스템을 설계하고 구축하는것이 어려운가?
3. 우리가 어떻게 성능-중시 시스템의 성능을 예측 할 수 있을까?
4. 성능 중시의 시스템을 설계할 때 어떤 함정들이 흔하게 있고, 어떻게 그것들을 다룰 수 있는가?
5. 그러한 시스템들의 구조적인 함의에서 어떻 성능 요구사항들을 도출 할 수 있는가?

~~~
1. What do you mean by "performance-critical" systems?
~~~
성능-중시 시스템은 하나 혹은 그 이상의 성능-속성이 만족되어야하는 성공적인 상태의 시스템이다.
예제
1. 중요한 메세지를 100 마이크로 세컨트안에 반응해야한다. 평균적으로, 최악의 경우 응단속도가 500마이크로세컨드여야한다.
2. 1000개의 트랙의 위치를 매초 업데이트 하기, 누락없이.
3. 하드웨어의 결함을 20밀리세컨드 안에 찾아내고, 네트워크 재설정을 한다. 20밀리 세컨드 안에 , 결함에 대해서.
4. 전원을 켜고 모든 동작을 300밀리 세컨드 안에 끝내야한다.

위 리스트는 성능 요구사항에 대한 샘플이다. 

첫째로, 위와 같은 성능요구사항들중에 어떤것도 최우선 요구사항이 아니다. 이것들은 차선 혹은 파생 요구사항이다. 이것은 시스템 아키텍처와 설계가 시작되었을 때 그것들이 명확하게 표현되지 않았을 수도 있지만, 시스템이 부분적으로 완성되었을 때에만 노출되었을 수도 있다는 것을 의미한다.

둘째 , 이것은 hard req 가 아니다. hard 한 요구사항은 항상 결함이 발생하지 않는 시스템이다. soft req는 때떄로 실수 할수도 있고, 실패를 고려하지 않은 소규모의 시스템이다.

셋째 , 이 모든 요구조건들은 불완전하다. 왜냐하면, 구현과 테스팅 과정에서 일어날 수 있는 일상적인 문제들이기 때문이다. 예외 사항이 많다.

~~~
2. Why are performance-critical systems difficult to design and build?
~~~
왜 성능중시 시스템이 설계및 구현의 어려운가에 대해서 앞단 에서 미해결된 질문에서 힌트가 있었다.

첫번째 문제는 요구정의다. 대부분의 시스템 요구사항은 성능을 무시한다. 또는 오직 하이레벨 퍼포먼스를 반영한다. 앞쪽 예제를 참고하면, 각 예제들을 아주 상세하게 표현해야한다. 정량적인 수치 혹은 상세한 시퀸스를 정의해야한다. 성능 요소들은 빈번하게 개발자의 상상 속에 남아있고 최종테스트와 배포 순간까지 불확신하게 남아있다.

각각의 성능 요구사항은 세심하게 정의된다. 그것은 우리가 직접 만나기 전에는 솔루션을 설계하기 힘들다. 대부분의 시스템과 소프트웨어 전문가들은 요율-단일화 스케줄링과 같은 기술을 알고 있다.
그러나 성능에 중요한 시스템에 대한 그들의 능력과 한계를 완전히 이해하는 사람은 거의 없다.

또 다른 어려움은 소프트웨어 개발 방법론이 성능중심의 시스템을 개발하기 위해 설계된 것이 아니기 때문이다. 

~~~
3. how can we predict the performance of performance-critical systems?
~~~
시스템 성능의 예측은 아주 어려운 문제이다. 특히나 설계 특성에 주로 영향 받는 솔루션일 경우에



결론:
성능 중시 시스템의 설계를 어렵다.
성능 요구사항을 정의하는 것이 어렵기 때문이다.
이러한 어려움을 극복하기 위한 몇가지 방안을 소개했다.

끝.

