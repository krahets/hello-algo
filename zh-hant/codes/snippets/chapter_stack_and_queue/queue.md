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
/* 初始化雙向佇列 */
// 在 Rust 中使用雙向佇列作為普通佇列來使用
let mut deque: VecDeque<u32> = VecDeque::new();

/* 元素入列 */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* 訪問佇列首元素 */
if let Some(front) = deque.front() {
}

/* 元素出列 */
if let Some(pop) = deque.pop_front() {
}

/* 獲取佇列的長度 */
let size = deque.len();

/* 判斷佇列是否為空 */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C 未提供內建佇列
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BD%87%E5%88%97%0A%20%20%20%20%23%20%E5%9C%A8%20Python%20%E4%B8%AD%EF%BC%8C%E6%88%91%E5%80%91%E4%B8%80%E8%88%AC%E5%B0%87%E9%9B%99%E5%90%91%E4%BD%87%E5%88%97%E9%A1%9E%E5%88%A5%20deque%20%E7%9C%8B%E4%BD%9C%E4%BD%87%E5%88%97%E4%BD%BF%E7%94%A8%0A%20%20%20%20%23%20%E9%9B%96%E7%84%B6%20queue.Queue%28%29%20%E6%98%AF%E7%B4%94%E6%AD%A3%E7%9A%84%E4%BD%87%E5%88%97%E9%A1%9E%E5%88%A5%EF%BC%8C%E4%BD%86%E4%B8%8D%E5%A4%AA%E5%A5%BD%E7%94%A8%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%88%97%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%A6%96%E5%85%83%E7%B4%A0%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E5%88%97%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%88%97%E5%85%83%E7%B4%A0%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E5%88%97%E5%BE%8C%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E4%BD%87%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E9%95%B7%E5%BA%A6%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E4%BD%87%E5%88%97%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
