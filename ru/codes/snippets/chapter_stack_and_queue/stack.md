<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# Инициализировать стек
# В Python нет встроенного класса стека, поэтому в качестве стека можно использовать list
stack: list[int] = []

# Поместить элементы в стек
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# Посмотреть элемент на вершине стека
peek: int = stack[-1]

# Снять элемент со стека
pop: int = stack.pop()

# Получить размер стека
size: int = len(stack)

# Проверить, пуст ли стек
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* Инициализировать стек */
stack<int> stack;

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Посмотреть элемент на вершине стека */
int top = stack.top();

/* Снять элемент со стека */
stack.pop(); // Метод не возвращает значения

/* Получить размер стека */
int size = stack.size();

/* Проверить, пуст ли стек */
bool empty = stack.empty();
```

```java title="stack.java"
/* Инициализировать стек */
Stack<Integer> stack = new Stack<>();

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Посмотреть элемент на вершине стека */
int peek = stack.peek();

/* Снять элемент со стека */
int pop = stack.pop();

/* Получить размер стека */
int size = stack.size();

/* Проверить, пуст ли стек */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* Инициализировать стек */
Stack<int> stack = new();

/* Поместить элементы в стек */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* Посмотреть элемент на вершине стека */
int peek = stack.Peek();

/* Снять элемент со стека */
int pop = stack.Pop();

/* Получить размер стека */
int size = stack.Count;

/* Проверить, пуст ли стек */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* Инициализировать стек */
// В Go для реализации стека рекомендуется использовать срез
var stack []int

/* Поместить элементы в стек */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* Посмотреть элемент на вершине стека */
peek := stack[len(stack)-1]

/* Снять элемент со стека */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* Получить размер стека */
size := len(stack)

/* Проверить, пуст ли стек */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* Инициализировать стек */
// В Swift нет встроенного класса стека, поэтому в качестве стека можно использовать Array
var stack: [Int] = []

/* Поместить элементы в стек */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* Посмотреть элемент на вершине стека */
let peek = stack.last!

/* Снять элемент со стека */
let pop = stack.removeLast()

/* Получить размер стека */
let size = stack.count

/* Проверить, пуст ли стек */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* Инициализировать стек */
// В JavaScript нет встроенного класса стека, поэтому в качестве стека можно использовать Array
const stack = [];

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Посмотреть элемент на вершине стека */
const peek = stack[stack.length - 1];

/* Снять элемент со стека */
const pop = stack.pop();

/* Получить размер стека */
const size = stack.length;

/* Проверить, пуст ли стек */
const isEmpty = stack.length === 0;
```

```typescript title="stack.ts"
/* Инициализировать стек */
// В TypeScript нет встроенного класса стека, поэтому в качестве стека можно использовать Array
const stack: number[] = [];

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Посмотреть элемент на вершине стека */
const peek = stack[stack.length - 1];

/* Снять элемент со стека */
const pop = stack.pop();

/* Получить размер стека */
const size = stack.length;

/* Проверить, пуст ли стек */
const isEmpty = stack.length === 0;
```

```dart title="stack.dart"
/* Инициализировать стек */
// В Dart нет встроенного класса стека, поэтому в качестве стека можно использовать List
final List<int> stack = [];

/* Поместить элементы в стек */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* Посмотреть элемент на вершине стека */
final int peek = stack.last;

/* Снять элемент со стека */
final int pop = stack.removeLast();

/* Получить размер стека */
final int size = stack.length;

/* Проверить, пуст ли стек */
final bool isEmpty = stack.isEmpty;
```

```rust title="stack.rs"
// Инициализировать стек
// В Rust для реализации стека рекомендуется использовать Vec
let mut stack: Vec<i32> = Vec::new();

// Поместить элементы в стек
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

// Посмотреть элемент на вершине стека
let peek = stack.last().unwrap();

// Снять элемент со стека
let pop = stack.pop().unwrap();

// Получить размер стека
let size = stack.len();

// Проверить, пуст ли стек
let is_empty = stack.is_empty();
```

```c title="stack.c"
// В C нет встроенного стека
```

```kotlin title="stack.kt"
/* Инициализировать стек */
val stack = Stack<Int>()

/* Поместить элементы в стек */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* Посмотреть элемент на вершине стека */
val peek = stack.peek()

/* Снять элемент со стека */
val pop = stack.pop()

/* Получить размер стека */
val size = stack.size

/* Проверить, пуст ли стек */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# Инициализировать стек
# В Ruby нет встроенного класса стека, поэтому в качестве стека можно использовать Array
stack = []

# Поместить элементы в стек
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# Посмотреть элемент на вершине стека
peek = stack.last

# Снять элемент со стека
pop = stack.pop

# Получить размер стека
size = stack.length

# Проверить, пуст ли стек
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%BD%D0%B5%D1%82%20%D0%B2%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0,%20%D0%BD%D0%BE%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20list%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%D0%A1%D1%82%D0%B5%D0%BA%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D0%BD%D0%B5%20peek%20%3D%22,%20peek%29%0A%0A%20%20%20%20%23%20%D0%A1%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D0%BE%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%A1%D0%BD%D1%8F%D1%82%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%81%D0%BD%D1%8F%D1%82%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20stack%20%3D%22,%20stack%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%D0%A0%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%A1%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%20%3D%22,%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
