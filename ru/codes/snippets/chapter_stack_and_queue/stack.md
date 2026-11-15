<!-- [snippet]{stack_operations} -->
```python title="stack.py"
# Инициализация стека
# В Python нет встроенного класса стека, поэтому можно использовать list как стек
stack: list[int] = []

# Поместить элементы в стек
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

# Просмотреть верхний элемент
peek: int = stack[-1]

# Извлечь элемент
pop: int = stack.pop()

# Получить длину стека
size: int = len(stack)

# Проверить, пуст ли стек
is_empty: bool = len(stack) == 0
```

```cpp title="stack.cpp"
/* Инициализация стека */
stack<int> stack;

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Просмотреть верхний элемент */
int top = stack.top();

/* Извлечь элемент */
stack.pop(); // Без возвращаемого значения

/* Получить длину стека */
int size = stack.size();

/* Проверить, пуст ли стек */
bool empty = stack.empty();
```

```java title="stack.java"
/* Инициализация стека */
Stack<Integer> stack = new Stack<>();

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Просмотреть верхний элемент */
int peek = stack.peek();

/* Извлечь элемент */
int pop = stack.pop();

/* Получить длину стека */
int size = stack.size();

/* Проверить, пуст ли стек */
boolean isEmpty = stack.isEmpty();
```

```csharp title="stack.cs"
/* Инициализация стека */
Stack<int> stack = new();

/* Поместить элементы в стек */
stack.Push(1);
stack.Push(3);
stack.Push(2);
stack.Push(5);
stack.Push(4);

/* Просмотреть верхний элемент */
int peek = stack.Peek();

/* Извлечь элемент */
int pop = stack.Pop();

/* Получить длину стека */
int size = stack.Count;

/* Проверить, пуст ли стек */
bool isEmpty = stack.Count == 0;
```

```go title="stack_test.go"
/* Инициализация стека */
// В Go рекомендуется использовать Slice как стек
var stack []int

/* Поместить элементы в стек */
stack = append(stack, 1)
stack = append(stack, 3)
stack = append(stack, 2)
stack = append(stack, 5)
stack = append(stack, 4)

/* Просмотреть верхний элемент */
peek := stack[len(stack)-1]

/* Извлечь элемент */
pop := stack[len(stack)-1]
stack = stack[:len(stack)-1]

/* Получить длину стека */
size := len(stack)

/* Проверить, пуст ли стек */
isEmpty := len(stack) == 0
```

```swift title="stack.swift"
/* Инициализация стека */
// В Swift нет встроенного класса стека, поэтому можно использовать Array как стек
var stack: [Int] = []

/* Поместить элементы в стек */
stack.append(1)
stack.append(3)
stack.append(2)
stack.append(5)
stack.append(4)

/* Просмотреть верхний элемент */
let peek = stack.last!

/* Извлечь элемент */
let pop = stack.removeLast()

/* Получить длину стека */
let size = stack.count

/* Проверить, пуст ли стек */
let isEmpty = stack.isEmpty
```

```javascript title="stack.js"
/* Инициализация стека */
// В JavaScript нет встроенного класса стека, поэтому можно использовать Array как стек
const stack = [];

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Просмотреть верхний элемент */
const peek = stack[stack.length-1];

/* Извлечь элемент */
const pop = stack.pop();

/* Получить длину стека */
const size = stack.length;

/* Проверить, пуст ли стек */
const is_empty = stack.length === 0;
```

```typescript title="stack.ts"
/* Инициализация стека */
// В TypeScript нет встроенного класса стека, поэтому можно использовать Array как стек
const stack: number[] = [];

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);

/* Просмотреть верхний элемент */
const peek = stack[stack.length - 1];

/* Извлечь элемент */
const pop = stack.pop();

/* Получить длину стека */
const size = stack.length;

/* Проверить, пуст ли стек */
const is_empty = stack.length === 0;
```

```dart title="stack.dart"
/* Инициализация стека */
// В Dart нет встроенного класса стека, поэтому можно использовать List как стек
List<int> stack = [];

/* Поместить элементы в стек */
stack.add(1);
stack.add(3);
stack.add(2);
stack.add(5);
stack.add(4);

/* Просмотреть верхний элемент */
int peek = stack.last;

/* Извлечь элемент */
int pop = stack.removeLast();

/* Получить длину стека */
int size = stack.length;

/* Проверить, пуст ли стек */
bool isEmpty = stack.isEmpty;
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
/* Инициализация стека */
val stack = Stack<Int>()

/* Поместить элементы в стек */
stack.push(1)
stack.push(3)
stack.push(2)
stack.push(5)
stack.push(4)

/* Просмотреть верхний элемент */
val peek = stack.peek()

/* Извлечь элемент */
val pop = stack.pop()

/* Получить длину стека */
val size = stack.size

/* Проверить, пуст ли стек */
val isEmpty = stack.isEmpty()
```

```ruby title="stack.rb"
# Инициализация стека
# В Ruby нет встроенного класса стека, поэтому можно использовать Array как стек
stack = []

# Поместить элементы в стек
stack << 1
stack << 3
stack << 2
stack << 5
stack << 4

# Просмотреть верхний элемент
peek = stack.last

# Извлечь элемент
pop = stack.pop

# Получить длину стека
size = stack.length

# Проверить, пуст ли стек
is_empty = stack.empty?
```

<!-- [tutor]{stack_operations_tutor} -->
https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%BD%D0%B5%D1%82%20%D0%B2%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%2C%20%D0%BF%D0%BE%D1%8D%D1%82%D0%BE%D0%BC%D1%83%20list%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%BA%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%D1%81%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
