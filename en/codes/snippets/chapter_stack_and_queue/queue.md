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
/* Initialize a deque */
// In Rust, use a deque as an ordinary queue
let mut deque: VecDeque<u32> = VecDeque::new();

/* Enqueue elements */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* Access the front element */
if let Some(front) = deque.front() {
}

/* Dequeue an element */
if let Some(pop) = deque.pop_front() {
}

/* Get the queue size */
let size = deque.len();

/* Check whether the queue is empty */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// C provides no built-in queue
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20a%20queue%0A%20%20%20%20%23%20In%20Python%2C%20we%20usually%20use%20the%20deque%20class%20as%20a%20queue%0A%20%20%20%20%23%20Although%20queue.Queue%28%29%20is%20a%20dedicated%20queue%20class%2C%20it%20is%20less%20convenient%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20Enqueue%20elements%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22Queue%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Access%20the%20front%20element%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22Front%20element%3A%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20Dequeue%20an%20element%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22Dequeued%20element%3A%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22After%20dequeuing%3A%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20Get%20the%20queue%20size%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22Queue%20size%3A%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20Check%20whether%20the%20queue%20is%20empty%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22Is%20the%20queue%20empty%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
