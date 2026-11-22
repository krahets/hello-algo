<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# Инициализировать очередь
# В Python мы обычно рассматриваем двустороннюю очередь deque как очередь
# Хотя queue.Queue() — это «настоящий» класс очереди, им не очень удобно пользоваться, поэтому ее не рекомендуют
que: deque[int] = deque()

# Добавление элемента в очередь
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# Доступ к элементу в начале очереди
front: int = que[0]

# Извлечение элемента из очереди
pop: int = que.popleft()

# Получение длины очереди
size: int = len(que)

# Проверка, пуста ли очередь
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* Инициализация очереди */
queue<int> queue;

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Доступ к элементу в начале очереди */
int front = queue.front();

/* Извлечение элемента из очереди */
queue.pop();

/* Получение длины очереди */
int size = queue.size();

/* Проверка, пуста ли очередь */
bool empty = queue.empty();
```

```java title="queue.java"
/* Инициализация очереди */
Queue<Integer> queue = new LinkedList<>();

/* Добавление элемента в очередь */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* Доступ к элементу в начале очереди */
int peek = queue.peek();

/* Извлечение элемента из очереди */
int pop = queue.poll();

/* Получение длины очереди */
int size = queue.size();

/* Проверка, пуста ли очередь */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* Инициализация очереди */
Queue<int> queue = new();

/* Добавление элемента в очередь */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* Доступ к элементу в начале очереди */
int peek = queue.Peek();

/* Извлечение элемента из очереди */
int pop = queue.Dequeue();

/* Получение длины очереди */
int size = queue.Count;

/* Проверка, пуста ли очередь */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* Инициализация очереди */
// В Go list используется как очередь
queue := list.New()

/* Добавление элемента в очередь */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* Доступ к элементу в начале очереди */
peek := queue.Front()

/* Извлечение элемента из очереди */
pop := queue.Front()
queue.Remove(pop)

/* Получение длины очереди */
size := queue.Len()

/* Проверка, пуста ли очередь */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* Инициализация очереди */
// В Swift нет встроенного класса очереди, поэтому Array можно использовать как очередь
var queue: [Int] = []

/* Добавление элемента в очередь */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* Доступ к элементу в начале очереди */
let peek = queue.first!

/* Извлечение элемента из очереди */
// При использовании Array для имитации removeFirst имеет сложность O(n)
let pop = queue.removeFirst()

/* Получение длины очереди */
let size = queue.count

/* Проверка, пуста ли очередь */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* Инициализация очереди */
// В JavaScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue = [];

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Доступ к элементу в начале очереди */
const peek = queue[0];

/* Извлечение элемента из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();

/* Получение длины очереди */
const size = queue.length;

/* Проверка, пуста ли очередь */
const isEmpty = queue.length === 0;
```

```typescript title="queue.ts"
/* Инициализация очереди */
// В TypeScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue: number[] = [];

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Доступ к элементу в начале очереди */
const peek = queue[0];

/* Извлечение элемента из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();

/* Получение длины очереди */
const size = queue.length;

/* Проверка, пуста ли очередь */
const isEmpty = queue.length === 0;
```

```dart title="queue.dart"
/* Инициализация очереди */
// В Dart двусторонняя очередь Queue обычно рассматривается как обычная очередь
final Queue<int> queue = Queue();

/* Добавление элемента в очередь */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* Доступ к элементу в начале очереди */
final int peek = queue.first;

/* Извлечение элемента из очереди */
final int pop = queue.removeFirst();

/* Получить длину очереди */
final int size = queue.length;

/* Проверка, пуста ли очередь */
final bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
// Инициализация очереди
// В Rust двусторонняя очередь VecDeque обычно используется как очередь
let mut queue: VecDeque<i32> = VecDeque::new();

// Добавление элемента в очередь
queue.push_back(1);
queue.push_back(3);
queue.push_back(2);
queue.push_back(5);
queue.push_back(4);

// Доступ к элементу в начале очереди
let peek = queue.front().unwrap();

// Извлечение элемента из очереди
let pop = queue.pop_front().unwrap();

// Получение длины очереди
let size = queue.len();

// Проверка, пуста ли очередь
let is_empty = queue.is_empty();
```

```c title="queue.c"
// В C нет встроенной очереди
```

```kotlin title="queue.kt"
/* Инициализация очереди */
val queue = LinkedList<Int>()

/* Добавление элемента в очередь */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* Доступ к элементу в начале очереди */
val peek = queue.peek()

/* Извлечение элемента из очереди */
val pop = queue.poll()

/* Получение длины очереди */
val size = queue.size

/* Проверка, пуста ли очередь */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# Инициализировать очередь
# Во встроенной очереди Ruby (Thread::Queue) нет методов peek и обхода, поэтому Array можно использовать как очередь
queue = []

# Добавление элемента в очередь
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# Обратиться к элементу очереди
peek = queue.first

# Элемент извлекается из очереди
# Обратите внимание: поскольку используется массив, временная сложность метода Array#shift равна O(n)
pop = queue.shift

# Получение длины очереди
size = queue.length

# Проверка, пуста ли очередь
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%BA%D0%B0%D0%BA%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%A5%D0%BE%D1%82%D1%8F%20queue.Queue%28%29%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%D1%81%D1%82%D0%BE%D1%8F%D1%89%D0%B8%D0%BC%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BE%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BD%D0%B5%20%D1%81%D0%BB%D0%B8%D1%88%D0%BA%D0%BE%D0%BC%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22que%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
