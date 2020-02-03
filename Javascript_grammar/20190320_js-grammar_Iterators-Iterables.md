```

```

Iterators and Iterables in javascript

대부분 애플리케이션에서 우리는 끊임없이 데이터 목록을 불러오고 다루고 있고, 브라우저 또는 모바일에서 데이터를 보여줘야합니다. 일반적으로 데이터를 저장하고, 추출하고, 변형하기 위해 메서드를 만들기도 합니다.

우리는 이미 For-or lop 와 spread Operator(....)을 기존 Array, String표준 객체에서 데이터를 추출합니다.

하지만 현재 Object 에서는 사용할 수 없죠.

```javascript
var obj= {
  a:10,
  b:20,
  c:30,
}
for (var v of obj){
  console.log(v);
}
------------------
for(var v of obj){
             ^
TypeError: obj is not iterable
```

우리는 Object를 대체하기 위해 새롭게 만들지 않고, 기존에 있는 방식을 사용하는게 좋지 않을까요? 이것을 하기위해서는 모든 개발자가 따라할 수있는 규칙이 있어야하며, 모든 객체에도 적용할 수 있어야합니다.

우리는 아래 규칙에 따라 순회할 수 있는 객체를 만들고 이것을 "iterable" 이라고 부르자.

1. 순회할 수 있는 데이터를 가지고 있어야한다.
2. 전역 "well-known" symbol인 sybolb.iterator 을 메서드로 가지고 있어햐 한다.
   또한 이 메서드는 #3,#6에 따라 구현되어야한다.
3. symbol.iteratior 메서드는 "iterator"객체를 반황해야 합니다.
4. "iterator"객체는 반드시 next라고 하는 메서드를 가져야합니다.
5. next에는 #1에 저장되어있는 데이터에 접근할 수 있어야 합니다.
6. "iterator"객체인 iteratorObj.next()하면 {value:<stored data>, done:false} #1데이터가 추출되며 전부다 순회했을 경우 {done:false} 가 반환되도록한다.

위 규칙을 모두 따르고 있으면 "iterable" 이라고 부르며 반환된 객체를 "iterator"라고 부릅니다.

표준 web api와 generator, array, string 다 위 규칙을 따르고 있습니다.

아래 코드를 보면서 이해해 봅시다.

```javascript
var obj = {
  a: 1,
  b: 2,
  c: 3
};

// iterable (순회 가능) 한 객체를 리턴
var collIter = coll => {
  var len = coll.length;
  var iter = valuesIter(coll);
  return {
    [Symbol.iterator]: function() {
      return this;
    },
    next: () => iter.next()
  };
};
// 객체를 순회하기 위해 generator 사용
//( generator 다음 글에서 하도록 하겠습니다. )
var valuesIter = function*(coll) {
  for (var key in coll) yield coll[key];
};
// 이제 모든 데이터는 for of , spread 연산자 (...) 이 가능해졌습니다.
for (const val of collIter(obj)) {
  console.log(val); // 1,2,3
}
console.log(...collIter(obj)); // 1,2,3
```

앞서 언급했듯이 표준 web api와 generator, array, string 다 위 규칙을 따르고 있으며, 우리는 자바스크립트에서 제공하는 Iterable한 방식을 따라야합니다.

또한 위 같이 원문과는 다른 예제코드를 제공한 이유는
앞으로 우리는 함수로 값으로 감싸고, 또 함수도 값으로 사용할 일이 많아 질 것입니다. 특정 값이 아니라 코드로 평가를 대기하며, 값이 넘어 올 경우 평가를 하는 Lazy한 (게으른 방식) 을 사용하게 될 것입니다. 아직 이러한 예는 앞글에는 등장 하지 않았지만 이러한 사고 방식을 가지는게 굉장히 중요합니다.

또 위와 같이 작성한 이유는 generator를 사용하기 위함인데, "generator"는 추상화된 "iterable"객체를 만들수 있습니다.

?...
