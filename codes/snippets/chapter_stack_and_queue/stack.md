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
// C 未提供内置栈
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%88%0A%20%20%20%20%23%20Python%20%E6%B2%A1%E6%9C%89%E5%86%85%E7%BD%AE%E7%9A%84%E6%A0%88%E7%B1%BB%EF%BC%8C%E5%8F%AF%E4%BB%A5%E6%8A%8A%20list%20%E5%BD%93%E4%BD%9C%E6%A0%88%E6%9D%A5%E4%BD%BF%E7%94%A8%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%85%A5%E6%A0%88%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%E6%A0%88%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%E6%A0%88%E9%A1%B6%E5%85%83%E7%B4%A0%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%E5%85%83%E7%B4%A0%E5%87%BA%E6%A0%88%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%85%83%E7%B4%A0%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%E5%87%BA%E6%A0%88%E5%90%8E%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%E6%A0%88%E7%9A%84%E9%95%BF%E5%BA%A6%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%E5%88%A4%E6%96%AD%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%E6%A0%88%E6%98%AF%E5%90%A6%E4%B8%BA%E7%A9%BA%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
