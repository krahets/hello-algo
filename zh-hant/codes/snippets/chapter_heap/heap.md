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
// JavaScript 未提供內建 Heap 類別
```

```typescript title="heap.ts"
// TypeScript 未提供內建 Heap 類別
```

```dart title="heap.dart"
// Dart 未提供內建 Heap 類別
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
// C 未提供內建 Heap 類別
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
# Ruby 未提供內建 Heap 類別
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E7%9A%84%20heapq%20%E6%A8%A1%E7%B5%84%E9%A0%90%E8%A8%AD%E5%AF%A6%E7%8F%BE%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E8%80%83%E6%85%AE%E5%B0%87%E2%80%9C%E5%85%83%E7%B4%A0%E5%8F%96%E8%B2%A0%E2%80%9D%E5%BE%8C%E5%86%8D%E5%85%A5%E5%A0%86%E7%A9%8D%EF%BC%8C%E9%80%99%E6%A8%A3%E5%B0%B1%E5%8F%AF%E4%BB%A5%E5%B0%87%E5%A4%A7%E5%B0%8F%E9%97%9C%E4%BF%82%E9%A1%9B%E5%80%92%EF%BC%8C%E5%BE%9E%E8%80%8C%E5%AF%A6%E7%8F%BE%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%9C%A8%E6%9C%AC%E7%A4%BA%E4%BE%8B%E4%B8%AD%EF%BC%8Cflag%20%3D%201%20%E6%99%82%E5%B0%8D%E6%87%89%E5%B0%8F%E9%A0%82%E5%A0%86%E7%A9%8D%EF%BC%8Cflag%20%3D%20-1%20%E6%99%82%E5%B0%8D%E6%87%89%E5%A4%A7%E9%A0%82%E5%A0%86%E7%A9%8D%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E5%A0%86%E7%A9%8D%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E5%A0%86%E7%A9%8D%E9%A0%82%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%A0%86%E7%A9%8D%E9%A0%82%E5%85%83%E7%B4%A0%E5%87%BA%E5%A0%86%E7%A9%8D%0A%20%20%20%20%23%20%E5%87%BA%E5%A0%86%E7%A9%8D%E5%85%83%E7%B4%A0%E6%9C%83%E5%BD%A2%E6%88%90%E4%B8%80%E5%80%8B%E5%BE%9E%E5%A4%A7%E5%88%B0%E5%B0%8F%E7%9A%84%E5%BA%8F%E5%88%97%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E5%A0%86%E7%A9%8D%E5%A4%A7%E5%B0%8F%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%E5%88%A4%E6%96%B7%E5%A0%86%E7%A9%8D%E6%98%AF%E5%90%A6%E7%82%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%BC%B8%E5%85%A5%E4%B8%B2%E5%88%97%E4%B8%A6%E5%BB%BA%E5%A0%86%E7%A9%8D%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
