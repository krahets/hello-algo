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
// В JavaScript нет встроенного класса Heap
```

```typescript title="heap.ts"
// В TypeScript нет встроенного класса Heap
```

```dart title="heap.dart"
// В Dart нет встроенного класса Heap
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
// В C нет встроенного класса Heap
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
# В Ruby нет встроенного класса Heap
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9C%D0%BE%D0%B4%D1%83%D0%BB%D1%8C%20heapq%20%D0%B2%20Python%20%D0%BF%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D1%82%D1%80%D0%B8%D1%86%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D1%82%D0%BD%D0%BE%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B0%20%D0%B8%20%D1%82%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D1%8B%D0%BC%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%92%20%D1%8D%D1%82%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20flag%20%3D%201%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D0%B5%2C%20%D0%B0%20flag%20%3D%20-1%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20max-%D0%BA%D1%83%D1%87%D0%B5%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%83%D1%8E%D1%82%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B3%D0%BE%20%D0%BA%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%BC%D1%83%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BA%D1%83%D1%87%D0%B0%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%85%D0%BE%D0%B4%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D0%B8%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
