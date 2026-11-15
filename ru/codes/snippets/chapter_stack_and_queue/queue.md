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
/* Инициализация двусторонней очереди */
// В Rust двусторонняя очередь может использоваться как обычная очередь
let mut deque: VecDeque<u32> = VecDeque::new();

/* Поместить элементы в очередь */
deque.push_back(1);
deque.push_back(3);
deque.push_back(2);
deque.push_back(5);
deque.push_back(4);

/* Просмотреть элемент в голове очереди */
if let Some(front) = deque.front() {
}

/* Извлечь элемент из очереди */
if let Some(pop) = deque.pop_front() {
}

/* Получить длину очереди */
let size = deque.len();

/* Проверить, пуста ли очередь */
let is_empty = deque.is_empty();
```

```c title="queue.c"
// В C нет встроенной очереди
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%BA%D0%B0%D0%BA%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%A5%D0%BE%D1%82%D1%8F%20queue.Queue%28%29%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%D1%81%D1%82%D0%BE%D1%8F%D1%89%D0%B8%D0%BC%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BE%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BD%D0%B5%20%D1%81%D0%BB%D0%B8%D1%88%D0%BA%D0%BE%D0%BC%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22que%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
