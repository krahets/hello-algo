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
/* 初始化双向队列 */
// 在 Dart 中，Queue 被定义为双向队列
Queue<int> deque = Queue<int>();

/* 元素入队 */
deque.addLast(2);  // 添加至队尾
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // 添加至队首
deque.addFirst(1);

/* 访问元素 */
int peekFirst = deque.first; // 队首元素
int peekLast = deque.last;   // 队尾元素

/* 元素出队 */
int popFirst = deque.removeFirst(); // 队首元素出队
int popLast = deque.removeLast();   // 队尾元素出队

/* 获取双向队列的长度 */
int size = deque.length;

/* 判断双向队列是否为空 */
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
// C 未提供内置双向队列
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E9%98%9F%0A%20%20%20%20deq.append%282%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E5%B0%BE%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%E6%B7%BB%E5%8A%A0%E8%87%B3%E9%98%9F%E9%A6%96%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%E9%98%9F%E9%A6%96%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%E9%98%9F%E9%A6%96%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%E9%98%9F%E5%B0%BE%E5%85%83%E7%B4%A0%E5%87%BA%E9%98%9F%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%85%83%E7%B4%A0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%E9%98%9F%E5%B0%BE%E5%87%BA%E9%98%9F%E5%90%8E%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E5%8F%8C%E5%90%91%E9%98%9F%E5%88%97%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
