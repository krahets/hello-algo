<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# Инициализировать стек
# В Python нет встроенного класса стека, поэтому list можно использовать как стек
stack: list[int] = []

# Помещение элемента в стек
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# Доступ к верхнему элементу стека
peek: int = stack[-1]

# Извлечение элемента из стека
pop: int = stack.pop()

# Получение длины стека
size: int = len(stack)

# Проверка на пустоту
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* Инициализация стека */
stack<int> stack;

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Доступ к верхнему элементу стека */
int top = stack.top();

/* Извлечение элемента из стека */
stack.pop(); // Без возвращаемого значения

/* Получение длины стека */
int size = stack.size();

/* Проверка на пустоту */
bool empty = stack.empty();
```

```java title="stack.java"
/* Инициализация стека */
Stack<Integer> stack = new Stack<>();

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Доступ к верхнему элементу стека */
int peek = stack.peek();

/* Извлечение элемента из стека */
int pop = stack.pop();

/* Получение длины стека */
int size = stack.size();

/* Проверка на пустоту */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* Инициализация стека */
Stack<int> stack = new();

/* Помещение элемента в стек */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* Доступ к верхнему элементу стека */
int peek = stack.Peek();

/* Извлечение элемента из стека */
int pop = stack.Pop();

/* Получение длины стека */
int size = stack.Count;

/* Проверка на пустоту */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* Инициализация стека */
// В Go рекомендуется использовать Slice как стек
var stack []int

/* Помещение элемента в стек */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* Доступ к верхнему элементу стека */
peek := stack[len(stack)-1]

/* Извлечение элемента из стека */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* Получение длины стека */
size := len(stack)

/* Проверка на пустоту */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* Инициализация стека */
// В Swift нет встроенного класса стека, поэтому Array можно использовать как стек
var stack: [Int] = []

/* Помещение элемента в стек */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* Доступ к верхнему элементу стека */
let peek = stack.last!

/* Извлечение элемента из стека */
let pop = stack.removeLast()

/* Получение длины стека */
let size = stack.count

/* Проверка на пустоту */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* Инициализация стека */
// В JavaScript нет встроенного класса стека, поэтому Array можно использовать как стек
const stack = [];

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Доступ к верхнему элементу стека */
const peek = stack[stack.length - 1];

/* Извлечение элемента из стека */
const pop = stack.pop();

/* Получение длины стека */
const size = stack.length;

/* Проверка на пустоту */
const isEmpty = stack.length === 0;
```

```typescript title="stack.ts"
/* Инициализация стека */
// В TypeScript нет встроенного класса стека, поэтому Array можно использовать как стек
const stack: number[] = [];

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Доступ к верхнему элементу стека */
const peek = stack[stack.length - 1];

/* Извлечение элемента из стека */
const pop = stack.pop();

/* Получение длины стека */
const size = stack.length;

/* Проверка на пустоту */
const isEmpty = stack.length === 0;
```

```dart title="stack.dart"
/* Инициализация стека */
// В Dart нет встроенного класса стека, поэтому List можно использовать как стек
final List<int> stack = [];

/* Помещение элемента в стек */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* Доступ к верхнему элементу стека */
final int peek = stack.last;

/* Извлечение элемента из стека */
final int pop = stack.removeLast();

/* Получение длины стека */
final int size = stack.length;

/* Проверка на пустоту */
final bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
// Инициализировать стек
// В Rust рекомендуется использовать Vec как стек
let mut stack: Vec<i32> = Vec::new();

// Помещение элемента в стек
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

// Доступ к верхнему элементу стека
let peek = stack.last().unwrap();

// Извлечение элемента из стека
let pop = stack.pop().unwrap();

// Получение длины стека
let size = stack.len();

// Проверка, пуст ли стек
let is_empty = stack.is_empty();
```

```c title="stack.c"
// В C нет встроенного стека
```

```kotlin title="stack.kt"
/* Инициализация стека */
val stack = Stack<Int>()

/* Помещение элемента в стек */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* Доступ к верхнему элементу стека */
val peek = stack.peek()

/* Извлечение элемента из стека */
val pop = stack.pop()

/* Получение длины стека */
val size = stack.size

/* Проверка на пустоту */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# Инициализировать стек
# В Ruby нет встроенного класса стека, поэтому Array можно использовать как стек
stack = []

# Помещение элемента в стек
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# Доступ к верхнему элементу стека
peek = stack.last

# Извлечение элемента из стека
pop = stack.pop

# Получение длины стека
size = stack.length

# Проверка на пустоту
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%BD%D0%B5%D1%82%20%D0%B2%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%2C%20%D0%BF%D0%BE%D1%8D%D1%82%D0%BE%D0%BC%D1%83%20list%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%BA%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%D1%81%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
