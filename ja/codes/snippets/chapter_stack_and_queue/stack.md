<!-- [snippet]{stack_operations} -->
```python title="stack.py"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```cpp title="stack.cpp"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```java title="stack.java"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```csharp title="stack.cs"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```go title="stack_test.go"
[file]{stack_test}-[region]{init_stack}

[file]{stack_test}-[region]{push}

[file]{stack_test}-[region]{peek}

[file]{stack_test}-[region]{pop}

[file]{stack_test}-[region]{size}

[file]{stack_test}-[region]{is_empty}
```

```swift title="stack.swift"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```javascript title="stack.js"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```typescript title="stack.ts"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```dart title="stack.dart"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```rust title="stack.rs"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```c title="stack.c"
// C には組み込みのスタックがない
```

```kotlin title="stack.kt"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

```ruby title="stack.rb"
[file]{stack}-[region]{init_stack}

[file]{stack}-[region]{push}

[file]{stack}-[region]{peek}

[file]{stack}-[region]{pop}

[file]{stack}-[region]{size}

[file]{stack}-[region]{is_empty}
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20%23%20Python%20%E3%81%AB%E3%81%AF%E7%B5%84%E3%81%BF%E8%BE%BC%E3%81%BF%E3%81%AE%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%8C%E3%81%AA%E3%81%84%E3%81%9F%E3%82%81%E3%80%81list%20%E3%82%92%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%A8%E3%81%97%E3%81%A6%E4%BD%BF%E3%81%88%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%0A%20%20%20%20stack.append(1)%0A%20%20%20%20stack.append(3)%0A%20%20%20%20stack.append(2)%0A%20%20%20%20stack.append(5)%0A%20%20%20%20stack.append(4)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%E3%81%AB%E3%82%A2%E3%82%AF%E3%82%BB%E3%82%B9%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E5%85%88%E9%A0%AD%E8%A6%81%E7%B4%A0%20peek%20%3D%22%2C%20peek)%0A%0A%20%20%20%20%23%20%E8%A6%81%E7%B4%A0%E3%82%92%E3%83%9D%E3%83%83%E3%83%97%0A%20%20%20%20pop%20%3D%20stack.pop()%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E8%A6%81%E7%B4%A0%20pop%20%3D%22%2C%20pop)%0A%20%20%20%20print(%22%E3%83%9D%E3%83%83%E3%83%97%E3%81%97%E3%81%9F%E5%BE%8C%E3%81%AE%20stack%20%3D%22%2C%20stack)%0A%0A%20%20%20%20%23%20%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20size%20%3D%20len(stack)%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AE%E9%95%B7%E3%81%95%20size%20%3D%22%2C%20size)%0A%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%8B%E3%81%A9%E3%81%86%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%0A%20%20%20%20is_empty%20%3D%20len(stack)%20%3D%3D%200%0A%20%20%20%20print(%22%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%81%AF%E7%A9%BA%E3%81%8B%20%3D%22%2C%20is_empty)&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
