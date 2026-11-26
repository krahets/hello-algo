<!-- [snippet]{queue_operations} -->
```python title="queue.py"
from collections import deque

# Инициализировать очередь
# В Python в качестве очереди обычно используют класс двусторонней очереди deque
# Хотя queue.Queue() создаёт обычную очередь, с ней неудобно работать, поэтому использовать её не рекомендуется
que: deque[int] = deque()

# Добавить элементы в очередь
que.append(1)
que.append(3)
que.append(2)
que.append(5)
que.append(4)

# Посмотреть первый элемент очереди
front: int = que[0]

# Извлечь элемент из очереди
pop: int = que.popleft()

# Получить длину очереди
size: int = len(que)

# Проверить, пуста ли очередь
is_empty: bool = len(que) == 0
```

```cpp title="queue.cpp"
/* Инициализировать очередь */
queue<int> queue;

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Посмотреть первый элемент очереди */
int front = queue.front();

/* Извлечь элемент из очереди */
queue.pop();

/* Получить длину очереди */
int size = queue.size();

/* Проверить, пуста ли очередь */
bool empty = queue.empty();
```

```java title="queue.java"
/* Инициализировать очередь */
Queue<Integer> queue = new LinkedList<>();

/* Добавить элементы в очередь */
queue.offer(1);
queue.offer(3);
queue.offer(2);
queue.offer(5);
queue.offer(4);

/* Посмотреть первый элемент очереди */
int peek = queue.peek();

/* Извлечь элемент из очереди */
int pop = queue.poll();

/* Получить длину очереди */
int size = queue.size();

/* Проверить, пуста ли очередь */
boolean isEmpty = queue.isEmpty();
```

```csharp title="queue.cs"
/* Инициализировать очередь */
Queue<int> queue = new();

/* Добавить элементы в очередь */
queue.Enqueue(1);
queue.Enqueue(3);
queue.Enqueue(2);
queue.Enqueue(5);
queue.Enqueue(4);

/* Посмотреть первый элемент очереди */
int peek = queue.Peek();

/* Извлечь элемент из очереди */
int pop = queue.Dequeue();

/* Получить длину очереди */
int size = queue.Count;

/* Проверить, пуста ли очередь */
bool isEmpty = queue.Count == 0;
```

```go title="queue_test.go"
/* Инициализировать очередь */
// В Go в качестве очереди используется список из пакета list
queue := list.New()

/* Добавить элементы в очередь */
queue.PushBack(1)
queue.PushBack(3)
queue.PushBack(2)
queue.PushBack(5)
queue.PushBack(4)

/* Посмотреть первый элемент очереди */
peek := queue.Front()

/* Извлечь элемент из очереди */
pop := queue.Front()
queue.Remove(pop)

/* Получить длину очереди */
size := queue.Len()

/* Проверить, пуста ли очередь */
isEmpty := queue.Len() == 0
```

```swift title="queue.swift"
/* Инициализировать очередь */
// В Swift нет встроенного класса очереди, поэтому в качестве очереди можно использовать Array
var queue: [Int] = []

/* Добавить элементы в очередь */
queue.append(1)
queue.append(3)
queue.append(2)
queue.append(5)
queue.append(4)

/* Посмотреть первый элемент очереди */
let peek = queue.first!

/* Извлечь элемент из очереди */
// При реализации на основе Array сложность removeFirst составляет O(n)
let pop = queue.removeFirst()

/* Получить длину очереди */
let size = queue.count

/* Проверить, пуста ли очередь */
let isEmpty = queue.isEmpty
```

```javascript title="queue.js"
/* Инициализировать очередь */
// В JavaScript нет встроенной очереди, поэтому в качестве очереди можно использовать Array
const queue = [];

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Посмотреть первый элемент очереди */
const peek = queue[0];

/* Извлечь элемент из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() составляет O(n)
const pop = queue.shift();

/* Получить длину очереди */
const size = queue.length;

/* Проверить, пуста ли очередь */
const isEmpty = queue.length === 0;
```

```typescript title="queue.ts"
/* Инициализировать очередь */
// В TypeScript нет встроенной очереди, поэтому в качестве очереди можно использовать Array
const queue: number[] = [];

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* Посмотреть первый элемент очереди */
const peek = queue[0];

/* Извлечь элемент из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() составляет O(n)
const pop = queue.shift();

/* Получить длину очереди */
const size = queue.length;

/* Проверить, пуста ли очередь */
const isEmpty = queue.length === 0;
```

```dart title="queue.dart"
/* Инициализировать очередь */
// В Dart в качестве очереди обычно используют класс двусторонней очереди Queue
final Queue<int> queue = Queue();

/* Добавить элементы в очередь */
queue.add(1);
queue.add(3);
queue.add(2);
queue.add(5);
queue.add(4);

/* Посмотреть первый элемент очереди */
final int peek = queue.first;

/* Извлечь элемент из очереди */
final int pop = queue.removeFirst();

/* Получить длину очереди */
final int size = queue.length;

/* Проверить, пуста ли очередь */
final bool isEmpty = queue.isEmpty;
```

```rust title="queue.rs"
// Инициализировать очередь
// В Rust в качестве очереди обычно используют двустороннюю очередь VecDeque
let mut queue: VecDeque<i32> = VecDeque::new();

// Добавить элементы в очередь
queue.push_back(1);
queue.push_back(3);
queue.push_back(2);
queue.push_back(5);
queue.push_back(4);

// Посмотреть первый элемент очереди
let peek = queue.front().unwrap();

// Извлечь элемент из очереди
let pop = queue.pop_front().unwrap();

// Получить длину очереди
let size = queue.len();

// Проверить, пуста ли очередь
let is_empty = queue.is_empty();
```

```c title="queue.c"
// В C нет встроенной очереди
```

```kotlin title="queue.kt"
/* Инициализировать очередь */
val queue = LinkedList<Int>()

/* Добавить элементы в очередь */
queue.offer(1)
queue.offer(3)
queue.offer(2)
queue.offer(5)
queue.offer(4)

/* Посмотреть первый элемент очереди */
val peek = queue.peek()

/* Извлечь элемент из очереди */
val pop = queue.poll()

/* Получить длину очереди */
val size = queue.size

/* Проверить, пуста ли очередь */
val isEmpty = queue.isEmpty()
```

```ruby title="queue.rb"
# Инициализировать очередь
# У встроенной очереди Ruby (Thread::Queue) нет методов для просмотра первого элемента и обхода очереди, поэтому в качестве очереди можно использовать Array
queue = []

# Добавить элементы в очередь
queue.push(1)
queue.push(3)
queue.push(2)
queue.push(5)
queue.push(4)

# Посмотреть первый элемент очереди
peek = queue.first

# Извлечь элемент из очереди
# Поскольку Array — массив, временная сложность метода Array#shift составляет O(n)
pop = queue.shift

# Получить длину очереди
size = queue.length

# Проверить, пуста ли очередь
is_empty = queue.empty?
```

<!-- [tutor]{queue_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%0A%20%20%20%20%23%20%D0%94%D0%BB%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B5%D0%B9%20%D0%B5%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%20queue.Queue%28%29,%20%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BC%D0%B5%D0%BD%D0%B5%D0%B5%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%91%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
