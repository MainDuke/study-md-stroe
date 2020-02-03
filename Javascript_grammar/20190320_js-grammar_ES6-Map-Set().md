~~~
~~~

자바스크립트의 자료구죠

ES6 에 도입된 문법이다.

참조 문서 : Mozilla 웹 기술 블로그

1. Map()
- Map()은 자바스크립트의 Key-Value 페어(pair)로 이루어진 컬렉션
- Key 를 사용해서 Value를 get, set 할 수 있음
- Key 들은 중복 될 수 없음 : 하나의 Key 에는 하나의 Value 만
- Key 로 사용할 수 있는 데이터형 : String , symbol(ES6), object, function >> number는 사용할 수 없음에 주의;

~~~javascript
// 새로운 map 을 만들고 map 에 key, value 엔트리를 추가
let me = new Map();
me.set('name', 'kevin');
me.set('age', 28);
console.log(me.get('age'); // 28
// 대괄호를 사용해서 map 을 선언하는 방법
const roomTypeMap = new Map(
  [
    ["01", "원룸(오픈형)"],
    ["02", "원룸(분리형)"],
    ["03", "원룸(복층형)"],
    ["04", "투룸"],
    ["05", "쓰리룸"]
  ]
);
// 새로운 map 을 만들고 그 데이터를 기존의 [key, value] 페어컬렉션으로 채움
let you = new Map().set('name', 'paul').set('age', 34);
console.log(you.get('name')); // 'paul'
// has(): 주어진 key 가 존재하는지 확인
console.log(me.has('name')); // true
// size: map 에 담겨진 엔트리의 개수를 조회
console.log(you.size); // 2
// delete(): 엔트리를 삭제
me.delete('age');
console.log(me.has('age')); // false
// clear(): 모든 엔트리를 삭제
you.clear();
console.log(you.size); // 0
~~~

--참고 : Object 의 key는 String과 symbol(ES6)만 가능하지만, map은 어떤값도 가능
Object 에서는 크기를 추적해서 알 수 있지만, map은 손쉽게 얻을 수 있음.(size)

2. Set()
- Set() 은 value 들로 이루어진 컬렉션("집합"이라는 표현이 적절)
- Array와는 다르게 Set은 같은 VAlue를 2번 포함할 수 없음.
- 따라서 Set에 이미 존재하는 값을 추가하려고 하면 아무 일도 없음.

~~~javascript
// 비어있는 새로운 set 을 만듬
let setA = new Set();
// 새로운 set 을 만들고 인자로 전달된 iterable 로 인자를 채움
let setB = new Set().add('a').add('b');
setB.add('c');
console.log(setB.size); // 3
// has(): 주어진 값이 set 안에 존재할 경우, true 를 반환
// indexOf() 보다 빠름. 단, index 가 없음
console.log(setB.has('b')); // true
// set 에서 주어진 값을 제거
setB.delete('b');
console.log(setB.has('b')); // false
// set 안의 모든 데이터를 제거
setB.clear();
console.log(setB.size); // 0

~~~

- <TODO> has() 는 indexOf() 보다 빠르다. 다만, index이 존재하지 않기 떄문에 index로 value로 접근할 수 없다.


3. iterable object