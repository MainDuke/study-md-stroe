~~~
~~~
Generator 사용 하는 이유?

1. 추상화된 Itrable 제공
2. Callback-hell 탈출 하기 위한 또다른 제어 흐름 기법 제공

#1 Reason1 추상화된 Iterable 제공
이전 글에서 Iterable, Iterator를 설명 했다.

객체를 반복, 순회 가능하게 만드는데 Generator가 사용된다.

특징
1. Generator method는 *<myGenerator> syntax를 객체 내에 가지며,
   Generator Function는 function *myGenerator(){} syntax를 가집니다.

2. myGenerator() 는 generator 객체를 반환하며 이것은 Iterator 프로토콜 규칙을 가져 이것을 가지고 우리는 for of 나 spread 연산자 (...)로 순회 할 수 있습니다.

3. Generator는 yield을 통해 데이터를 반환할 수 있습니다.
4. yield는 이전 호출을 부분을 기억하며, 중단된 부분 이후로 계속 진행합니다.
5. loop내에서 yield 를 사용하면 next() 메서드를 호출 할 때마다 한번씩 실행하게 됩니다.

~~~javascript
// iterable (순회 가능) 한 객체를 리턴
var collIter = coll => {
  var len = coll.length;
  var iter = valuesIter(coll);
  return {
    [Symbol.iterator]: function () { return this; },
    next: () => iter.next(),
  }
}
// 객체를 순회하기 위해 generator 사용 
var valuesIter = function* (coll) {
  for (var key in coll) yield coll[key]
}
// 이제 모든 데이터는 for of , spread 연산자 (...) 이 가능해졌습니다.
for (const val of collIter(obj)) {
  console.log(val); // 1,2,3
}
console.log(...collIter(obj)); // 1,2,3
~~~

추상화된 itrable을 제공하는 이유
- 위 코드에서 객체를 순회 하는데 key를 보고싶은 needs가 있을 수있습니다.
- 현재 코드에서는 객체에 값만 가져올 뿐 Key를 가져올 수 엇습니다. 그럼 여기서 key를 가져오기 위해서는 어떻게 해야할 까요?


~~~javascript
var obj = {
  a: 1,
  b: 2,
  c: 3
};
var hasIter = coll => (!!coll && coll[Symbol.iterator]);
// iterable (순회 가능) 한 객체를 리턴
var collIter = coll => hasIter(coll) ?
  coll[Symbol.iterator]() :
  valuesIter(coll);
// 여러 generator를 제공하기 위해 내부를 감싸줍니다.
var gen = (g) => {
  return function (coll) {
    const iter = g(coll); // Iterator 프로토콜 규칙을 가진 객체 반환
  
    // 이전 Iterable 글에서 확인!! Iterable (순회 가능)규칙에 맞춰준다.
    return {
      [Symbol.iterator]: function () { return this; },
      next: () => iter.next(),
    }
  }
}
// 값만 반환하는 generator
var valuesIter = gen(function* (coll) {
  for (var key in coll) yield coll[key];
});
// key 값을 반환하는 generator
var entriesIter = gen(function* (coll) {
  for (var key in coll) yield [key, coll[key]];
});
// 이제 모든 데이터는 for of , spread 연산자 (...) 이 가능해졌습니다.
for (const val of collIter(obj)) {
  console.log(val); // 1,2,3
}
// 구조 분해 const [key,value] = val을 이용하면 key value를 사용할수 있습니다.
for (const val of collIter(entriesIter(obj))) {
  console.log(val); // [ 'a', 1 ], [ 'b', 2 ],[ 'c', 3 ]
}
console.log(...collIter(obj));// 1,2,3
console.log(...entriesIter(obj));//[ 'a', 1 ], [ 'b', 2 ],[ 'c', 3 ]
~~~

특징 : key를 뺼 수 있도록 하였고, 내부를 추상화 시킴으로써 객체에 일반값도 뺼 수 있고,key값도 뺼 수 있는 다형성 함수를 만들었습니다.