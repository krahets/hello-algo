<!-- [snippet]{deque_operations} -->
```python title="deque.py"
[file]{deque}-[region]{import_deque}

[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```cpp title="deque.cpp"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```java title="deque.java"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```csharp title="deque.cs"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```go title="deque_test.go"
[file]{deque_test}-[region]{init_deque}

[file]{deque_test}-[region]{push}

[file]{deque_test}-[region]{peek_first}
[file]{deque_test}-[region]{peek_last}

[file]{deque_test}-[region]{pop_first}
[file]{deque_test}-[region]{pop_last}

[file]{deque_test}-[region]{size}

[file]{deque_test}-[region]{is_empty}
```

```swift title="deque.swift"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```javascript title="deque.js"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```typescript title="deque.ts"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```dart title="deque.dart"
/* 덱 초기화 */
// Dart의 Queue는 덱으로 정의되어 있다
Queue<int> deque = Queue<int>();

/* 덱에 원소 삽입 */
deque.addLast(2);  // 맨 뒤에 추가
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 맨 앞에 추가
deque.addFirst(1);

/* 원소 접근 */
int peekFirst = deque.first; // 맨 앞 원소
int peekLast = deque.last;   // 맨 뒤 원소

/* 덱에서 원소 꺼내기 */
int popFirst = deque.removeFirst(); // 맨 앞 원소 꺼내기
int popLast = deque.removeLast();   // 맨 뒤 원소 꺼내기

/* 덱 길이 구하기 */
int size = deque.length;

/* 덱이 비어 있는지 확인 */
bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```c title="deque.c"
// C는 내장 덱을 제공하지 않는다
```

```kotlin title="deque.kt"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

```ruby title="deque.rb"
[file]{deque}-[region]{init_deque}

[file]{deque}-[region]{push}

[file]{deque}-[region]{peek_first}
[file]{deque}-[region]{peek_last}

[file]{deque}-[region]{pop_first}
[file]{deque}-[region]{pop_last}

[file]{deque}-[region]{size}

[file]{deque}-[region]{is_empty}
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EB%8D%B1%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20deq.append%282%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%EC%97%90%20%EC%B6%94%EA%B0%80%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%EB%8D%B1%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EC%95%9E%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%EB%A7%A8%20%EB%92%A4%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22%EB%A7%A8%20%EB%92%A4%EC%97%90%EC%84%9C%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%EB%8D%B1%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EB%8D%B1%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
