Dinamic Programing
DP
동적 계획법

등등... 다양한 이름.

재귀적 해법은, 부분문제(subproblem) 에 대한 해법을 통해 완성된다.

<접근법>
1. 상향식 접근법 : 가장 간단한 문제부터 단위해결하면서  이전에 풀었던 내용을 확장시켜가면서 풀어나간다.
2. 하향식 접근법 : 문제에 대해서, 어떻게 하면 단위로 쪼개어서 구분할 수 있는지 고민한다. 나뉜 부분 문제들이 겹치지 않아야한다.
3. 반반 접근법 : 데이터를 반으로 나눠서 처리하는방법. 병합정렬이나 이진트리가 예로 들수 있다.

<해법>
1. 재귀적 해법 (Recursive) : 공간효율성이 나빠질수 있다. N개의 층을 마다 O(N)만큼 메모리를 사용하게 된다.
2. 순환적 해법 (Iterative): 모든 재귀함수는 순환함수로 구현될수 있지만, 떄론 그게 아주 복잡할 수도 있다.

<그래서 동적 계획법이 뭐냐?>
거의 대부분 재귀적 알고리즘과 반복적으로 호출되는 부분 문제를 찾아내는 것이 핵심.
이를 찾은 뒤에 나중을 위해 현재 결과를 캐쉬에 저장해 놓는 과정이 필요.

메모이제이션 - 하향식 동적 프로그래밍, 상향식 접근법만 동적으로 말하는 사람도 있다. 둘다 동적프로그래밍이라고 할 수있다.

* 팁 : 재귀 호출을 트리로 그려보는건, 재귀알고리즘의 수행시간을 알아내는대 효과적이다.

