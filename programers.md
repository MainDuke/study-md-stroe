```javascript
//스택 : 나중에 들어온 높이 값부터 처리해야함.
//처리 내용 : answer 배열에 매칭 인덱스 값을 넣어서 반환한다.
//기준 값과 비교해서 현재 값이 더 클 경우, 배열인덱스를 반환한다.
//pivot : 이놈은 현재 비교해야하는 값이다.
//pivot index : 이 값은 반복해야하는 범위를 줄여준다.
//now : 현재 피봇과 비교되는 값이다.
//now index : 비교되서 삽입되거나, 반복 종료의 판단 기준.
function solution(heights) {
  var answer = [];
  var tempStack = [];

  //스택을 만든다.
  for (var i = heights.length; i > 0; i--) {
    tempStack[heights.length - i] = [heights[i - 1], i, 0];
  }

  //크기 비교한다.
  for (let i = 0; i < tempStack.length; i++) {
    for (let j = i + 1; j < tempStack.length; j++) {
      if (tempStack[j][0] > tempStack[i][0]) {
        tempStack[i][2] = tempStack[j][1];
        break;
      }
    }
  }

  for (let i = tempStack.length; i > 0; i--) {
    answer.push(tempStack[i - 1][2]);
  }
  return answer;
}

var test = solution([3, 9, 9, 3, 5, 7, 2]);
```

더 간결하게

```javascript
function solution(heights) {
  var answer = [];

  //크기 비교한다.
  for (let i = heights.length - 1; i >= 0; i--) {
    for (let j = i - 1; j >= 0; j--) {
      if (heights[i] < heights[j]) {
        answer.unshift(j + 1);
        break;
      }
      if (j == 0) {
        answer.unshift(0);
      }
    }
  }

  return [0].concat(answer);
}
```
