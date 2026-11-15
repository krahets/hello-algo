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
/* Инициализация стека */
// Используем Vec как стек
let mut stack: Vec<i32> = Vec::new();

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Просмотреть верхний элемент */
let top = stack.last().unwrap();

/* Извлечь элемент */
let pop = stack.pop().unwrap();

/* Получить длину стека */
let size = stack.len();

/* Проверить, пуст ли стек */
let is_empty = stack.is_empty();
```

```c title="stack.c"
// В C нет встроенного стека
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
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%BD%D0%B5%D1%82%20%D0%B2%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%2C%20%D0%BF%D0%BE%D1%8D%D1%82%D0%BE%D0%BC%D1%83%20list%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%BA%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%D1%81%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
