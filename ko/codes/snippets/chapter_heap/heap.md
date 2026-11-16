<!-- [snippet]{heap_operations} -->
```python title="heap.py"
[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```cpp title="heap.cpp"
[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```java title="heap.java"
[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```csharp title="heap.cs"
[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```go title="heap.go"
[file]{heap}-[region]{int_heap}

[file]{heap_test}-[region]{test_heap}
```

```swift title="heap.swift"
[file]{heap}-[region]{import}

[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```javascript title="heap.js"
// JavaScript는 내장 Heap 클래스를 제공하지 않는다
```

```typescript title="heap.ts"
// TypeScript는 내장 Heap 클래스를 제공하지 않는다
```

```dart title="heap.dart"
// Dart는 내장 Heap 클래스를 제공하지 않는다
```

```rust title="heap.rs"
[file]{heap}-[region]{import}

[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```c title="heap.c"
// C는 내장 Heap 클래스를 제공하지 않는다
```

```kotlin title="heap.kt"
[file]{heap}-[region]{init}

[file]{heap}-[region]{push}

[file]{heap}-[region]{peek}

[file]{heap}-[region]{pop_1}
[file]{heap}-[region]{pop_2}
[file]{heap}-[region]{pop_3}
[file]{heap}-[region]{pop_4}
[file]{heap}-[region]{pop_5}

[file]{heap}-[region]{size}

[file]{heap}-[region]{is_empty}

[file]{heap}-[region]{heapify}
```

```ruby title="heap.rb"
# Ruby는 내장 Heap 클래스를 제공하지 않는다
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%EC%9D%98%20heapq%20%EB%AA%A8%EB%93%88%EC%9D%80%20%EA%B8%B0%EB%B3%B8%EC%A0%81%EC%9C%BC%EB%A1%9C%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%9C%EB%8B%A4%0A%20%20%20%20%23%20%EC%9B%90%EC%86%8C%EC%9D%98%20%EB%B6%80%ED%98%B8%EB%A5%BC%20%EB%B0%94%EA%BE%BC%20%EB%92%A4%20%EC%82%BD%EC%9E%85%ED%95%98%EB%A9%B4%20%EB%8C%80%EC%86%8C%20%EA%B4%80%EA%B3%84%EA%B0%80%20%EB%92%A4%EC%A7%91%ED%9E%88%EB%AF%80%EB%A1%9C%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%9D%84%20%EA%B5%AC%ED%98%84%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20%23%20%EC%9D%B4%20%EC%98%88%EC%A0%9C%EC%97%90%EC%84%9C%20flag%20%3D%201%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EC%86%8C%20%ED%9E%99%2C%20flag%20%3D%20-1%EC%9D%B4%EB%A9%B4%20%EC%B5%9C%EB%8C%80%20%ED%9E%99%EC%97%90%20%ED%95%B4%EB%8B%B9%ED%95%9C%EB%8B%A4%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%EB%A3%A8%ED%8A%B8%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20%23%20%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%EB%93%A4%EC%9D%80%20%ED%81%B0%20%EA%B0%92%EB%B6%80%ED%84%B0%20%EC%9E%91%EC%9D%80%20%EA%B0%92%20%EC%88%9C%EC%84%9C%EB%A1%9C%20%EB%82%98%EC%97%B4%EB%90%9C%EB%8B%A4%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%98%20%ED%81%AC%EA%B8%B0%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%ED%9E%99%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%EB%A6%AC%EC%8A%A4%ED%8A%B8%EB%A5%BC%20%EC%9E%85%EB%A0%A5%EB%B0%9B%EC%95%84%20%ED%9E%99%20%EA%B5%AC%EC%84%B1%0A%20%20%20%20%23%20%EC%8B%9C%EA%B0%84%20%EB%B3%B5%EC%9E%A1%EB%8F%84%EB%8A%94%20O%28n%29%EC%9D%B4%EB%A9%B0%20O%28nlogn%29%EC%9D%B4%20%EC%95%84%EB%8B%88%EB%8B%A4%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
