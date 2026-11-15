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
// JavaScript には組み込みの Heap クラスがない
```

```typescript title="heap.ts"
// TypeScript には組み込みの Heap クラスがない
```

```dart title="heap.dart"
// Dart には組み込みの Heap クラスがない
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
// C には組み込みの Heap クラスがない
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
# Ruby には組み込みの Heap クラスがない
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20Python%20%E3%81%AE%20heapq%20%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%AF%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88%E3%81%A7%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E8%A3%85%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%81%AE%E7%AC%A6%E5%8F%B7%E3%82%92%E5%8F%8D%E8%BB%A2%E3%81%97%E3%81%A6%E3%81%8B%E3%82%89%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%E3%81%A8%E3%80%81%E5%A4%A7%E5%B0%8F%E9%96%A2%E4%BF%82%E3%81%8C%E9%80%86%E8%BB%A2%E3%81%97%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E5%AE%9F%E7%8F%BE%E3%81%A7%E3%81%8D%E3%82%8B%0A%20%20%20%20%23%20%E3%81%93%E3%81%AE%E4%BE%8B%E3%81%A7%E3%81%AF%20flag%20%3D%201%20%E3%81%8C%E6%9C%80%E5%B0%8F%E3%83%92%E3%83%BC%E3%83%97%E3%80%81flag%20%3D%20-1%20%E3%81%8C%E6%9C%80%E5%A4%A7%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%0A%20%20%20%20%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%92%E3%83%BC%E3%83%97%E3%81%AB%E6%8C%BF%E5%85%A5%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%201)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%203)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%202)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%205)%0A%20%20%20%20heapq.heappush(max_heap%2C%20flag%20*%204)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20peek%20%3D%20flag%20*%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%82%92%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20%23%20%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%E3%81%AF%E9%99%8D%E9%A0%86%E3%81%AE%E5%88%97%E3%81%AB%E3%81%AA%E3%82%8B%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%205%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%204%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%203%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%202%0A%20%20%20%20val%20%3D%20flag%20*%20heapq.heappop(max_heap)%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%AE%E8%A6%81%E7%B4%A0%E6%95%B0%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(max_heap)%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%92%E3%83%BC%E3%83%97%E3%81%8C%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%A6%E3%83%92%E3%83%BC%E3%83%97%E3%82%92%E6%A7%8B%E7%AF%89%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify(min_heap)&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
