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
[file]{queue}-[region]{init_queue}

[file]{queue}-[region]{push}

[file]{queue}-[region]{peek}

[file]{queue}-[region]{pop}

[file]{queue}-[region]{size}

[file]{queue}-[region]{is_empty}
```

```c title="queue.c"
// C는 내장 큐를 제공하지 않는다
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
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%ED%81%90%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EC%84%9C%EB%8A%94%20%EB%B3%B4%ED%86%B5%20%EB%8D%B1%20%ED%81%B4%EB%9E%98%EC%8A%A4%20deque%EB%A5%BC%20%ED%81%90%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20queue.Queue%28%29%EB%8A%94%20%EC%A0%84%EC%9A%A9%20%ED%81%90%20%ED%81%B4%EB%9E%98%EC%8A%A4%EC%9D%B4%EC%A7%80%EB%A7%8C%20%EC%82%AC%EC%9A%A9%EC%9D%B4%20%EB%B6%88%ED%8E%B8%ED%95%98%EB%8B%A4%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%ED%81%90%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%9D%98%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%ED%81%90%EC%9D%98%20%EB%A7%A8%20%EC%95%9E%20%EC%9B%90%EC%86%8C%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%ED%81%90%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%ED%81%90%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%ED%81%90%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%ED%81%90%EA%B0%80%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%ED%81%90%EA%B0%80%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
