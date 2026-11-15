<!-- [snippet]{queue_operations} -->
```python title="queue.py"
[file]{queue}-[region]{import_deque}

[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```cpp title="queue.cpp"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```java title="queue.java"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```csharp title="queue.cs"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```go title="queue_test.go"
[file]{queue_test}-[region]{init_queue}

[file]{queue_test}-[region]{push}

[file]{queue_test}-[region]{peek}

[file]{queue_test}-[region]{pop}

[file]{queue_test}-[region]{size}

[file]{queue_test}-[region]{is_empty}
```

```swift title="queue.swift"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```javascript title="queue.js"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```typescript title="queue.ts"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```dart title="queue.dart"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```rust title="queue.rs"
/* 両端キューを初期化 */
// Rust では両端キューを通常のキューとして使う
let mut deque: VecDeque<u32> = VecDeque::new();

/* 要素をエンキュー */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* 先頭要素にアクセス */
if let Some(front) = deque.front() {
}

/* 要素をデキュー */
if let Some(pop) = deque.pop_front() {
}

/* キューの長さを取得 */
let size = deque.len();

/* キューが空かどうかを判定 */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C には組み込みのキューがない
```

```kotlin title="queue.kt"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```ruby title="queue.rb"
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%A7%E3%81%AF%E9%80%9A%E5%B8%B8%E3%80%81%E4%B8%A1%E7%AB%AF%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%AF%E3%83%A9%E3%82%B9%20deque%20%E3%82%92%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%86%0A%20%20%20%20%23%20queue.Queue()%20%E3%81%AF%E6%9C%AC%E6%9D%A5%E3%81%AE%E3%82%AD%E3%83%A5%E3%83%BC%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%A0%E3%81%8C%E3%80%81%E4%BD%BF%E3%81%84%E3%81%AB%E3%81%8F%E3%81%84%0A%20%20%20%20que%20%3D%20deque()%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A8%E3%83%B3%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20que.append(1)%0A%20%20%20%20que.append(3)%0A%20%20%20%20que.append(2)%0A%20%20%20%20que.append(5)%0A%20%20%20%20que.append(4)%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%20que%20%3D%22%2C%20que)%0A%0A%20%20%20%20%23%20%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print(%22%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20front%20%3D%22%2C%20front)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%87%E3%82%AD%E3%83%A5%E3%83%BC%0A%20%20%20%20pop%20%3D%20que.popleft()%0A%20%20%20%20print(%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20que%20%3D%22%2C%20que)%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(que)%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(que)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%AD%E3%83%A5%E3%83%BC%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
