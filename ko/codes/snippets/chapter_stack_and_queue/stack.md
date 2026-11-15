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
/* 스택 초기화 */
// Vec를 스택으로 사용
let mut stack: Vec<i32> = Vec::new();

/* 스택에 원소 삽입 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* 스택 맨 위 원소에 접근 */
let top = stack.last().unwrap();

/* 스택에서 원소 꺼내기 */
let pop = stack.pop().unwrap();

/* 스택 길이 구하기 */
let size = stack.len();

/* 비어 있는지 확인 */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// C는 내장 스택을 제공하지 않는다
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
https://pythontutor.com/render.html#code=%22%22%22%EC%8B%A4%ED%96%89%20%EC%BD%94%EB%93%9C%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EC%B4%88%EA%B8%B0%ED%99%94%0A%20%20%20%20%23%20Python%EC%97%90%EB%8A%94%20%EB%82%B4%EC%9E%A5%20%EC%8A%A4%ED%83%9D%20%ED%81%B4%EB%9E%98%EC%8A%A4%EA%B0%80%20%EC%97%86%EC%9C%BC%EB%AF%80%EB%A1%9C%20list%EB%A5%BC%20%EC%8A%A4%ED%83%9D%EC%9C%BC%EB%A1%9C%20%EC%82%AC%EC%9A%A9%ED%95%A0%20%EC%88%98%20%EC%9E%88%EB%8B%A4%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%20%EC%9B%90%EC%86%8C%20%EC%82%BD%EC%9E%85%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%EC%97%90%20%EC%A0%91%EA%B7%BC%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EB%A7%A8%20%EC%9C%84%20%EC%9B%90%EC%86%8C%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%EC%97%90%EC%84%9C%20%EC%9B%90%EC%86%8C%20%EA%BA%BC%EB%82%B4%EA%B8%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%EA%BA%BC%EB%82%B8%20%EC%9B%90%EC%86%8C%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%EC%9B%90%EC%86%8C%EB%A5%BC%20%EA%BA%BC%EB%82%B8%20%EB%92%A4%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20%EA%B5%AC%ED%95%98%EA%B8%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%20%EA%B8%B8%EC%9D%B4%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%EC%8A%A4%ED%83%9D%EC%9D%B4%20%EB%B9%84%EC%96%B4%20%EC%9E%88%EB%8A%94%EA%B0%80%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
