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
/* 両端キューを初期化 */
// Dart では Queue は両端キューとして定義されている
Queue<int> deque = Queue<int>();

/* 要素をエンキュー */
deque.addLast(2);  // 末尾に追加
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 先頭に追加
deque.addFirst(1);

/* 要素にアクセス */
int peekFirst = deque.first; // 先頭要素
int peekLast = deque.last;   // 末尾要素

/* 要素をデキュー */
int popFirst = deque.removeFirst(); // 先頭要素を取り出す
int popLast = deque.removeLast();   // 末尾要素を取り出す

/* 両端キューの長さを取得 */
int size = deque.length;

/* 両端キューが空かどうかを判定 */
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
// C には組み込みの両端キューがない
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20deq%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20deq.append(2)%20%20%23%20%E6%9C%AB%E5%B0%BE%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.append(5)%0A%20%20%20%20deq.append(4)%0A%20%20%20%20deq.appendleft(3)%20%20%23%20%E5%85%88%E9%A0%AD%E3%81%AB%E8%BF%BD%E5%8A%A0%0A%20%20%20%20deq.appendleft(1)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%20rear%20%3D%22%2C%20rear)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop_front%20%3D%20deq.popleft()%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_front%20%3D%22%2C%20pop_front)%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%20%20%20%20pop_rear%20%3D%20deq.pop()%20%20%23%20%E6%9C%AB%E5%B0%BE%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20%20pop_rear%20%3D%22%2C%20pop_rear)%0A%20%20%20%20print(%22%E6%9C%AB%E5%B0%BE%E3%81%8B%E3%82%89%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20deque%20%3D%22%2C%20deq)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(deq)%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(deq)%20%3D%3D%200%0A%20%20%20%20print(%22%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
