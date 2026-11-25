<!-- [snippet]{deque_operations} -->
```python title="deque.py"
from collections import deque

# Инициализировать дек
deq: deque[int] = deque()

# Добавить элементы в дек
deq.append(2)  # Добавить в конец дека
deq.append(5)
deq.append(4)
deq.appendleft(3)  # Добавить в начало дека
deq.appendleft(1)

# Посмотреть первый и последний элементы
front: int = deq[0]  # Первый элемент дека
rear: int = deq[-1]  # Последний элемент дека

# Извлечь элементы из дека
pop_front: int = deq.popleft()  # Извлечь элемент из начала дека
pop_rear: int = deq.pop()  # Извлечь элемент из конца дека

# Получить длину дека
size: int = len(deq)

# Проверить, пуст ли дек
is_empty: bool = len(deq) == 0
```

```cpp title="deque.cpp"
/* Инициализировать дек */
deque<int> deque;

/* Добавить элементы в дек */
deque.push_back(2); // Добавить в конец дека
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Добавить в начало дека
deque.push_front(1);

/* Посмотреть первый и последний элементы */
int front = deque.front(); // Первый элемент дека
int back = deque.back(); // Последний элемент дека

/* Извлечь элементы из дека */
deque.pop_front(); // Извлечь элемент из начала дека
deque.pop_back(); // Извлечь элемент из конца дека

/* Получить длину дека */
int size = deque.size();

/* Проверить, пуст ли дек */
bool empty = deque.empty();
```

```java title="deque.java"
/* Инициализировать дек */
Deque<Integer> deque = new LinkedList<>();

/* Добавить элементы в дек */
deque.offerLast(2); // Добавить в конец дека
deque.offerLast(5);
deque.offerLast(4);
deque.offerFirst(3); // Добавить в начало дека
deque.offerFirst(1);

/* Посмотреть первый и последний элементы */
int peekFirst = deque.peekFirst(); // Первый элемент дека
int peekLast = deque.peekLast(); // Последний элемент дека

/* Извлечь элементы из дека */
int popFirst = deque.pollFirst(); // Извлечь элемент из начала дека
int popLast = deque.pollLast(); // Извлечь элемент из конца дека

/* Получить длину дека */
int size = deque.size();

/* Проверить, пуст ли дек */
boolean isEmpty = deque.isEmpty();
```

```csharp title="deque.cs"
/* Инициализировать дек */
// В C# в качестве дека используется связный список LinkedList
LinkedList<int> deque = new();

/* Добавить элементы в дек */
deque.AddLast(2);   // Добавить в конец дека
deque.AddLast(5);
deque.AddLast(4);
deque.AddFirst(3);  // Добавить в начало дека
deque.AddFirst(1);

/* Посмотреть первый и последний элементы */
int? peekFirst = deque.First?.Value;  // Первый элемент дека
int? peekLast = deque.Last?.Value;    // Последний элемент дека

/* Извлечь элементы из дека */
deque.RemoveFirst();  // Извлечь элемент из начала дека
deque.RemoveLast();   // Извлечь элемент из конца дека

/* Получить длину дека */
int size = deque.Count;

/* Проверить, пуст ли дек */
bool isEmpty = deque.Count == 0;
```

```go title="deque_test.go"
/* Инициализировать дек */
// В Go в качестве дека используется список из пакета list
deque := list.New()

/* Добавить элементы в дек */
deque.PushBack(2) // Добавить в конец дека
deque.PushBack(5)
deque.PushBack(4)
deque.PushFront(3) // Добавить в начало дека
deque.PushFront(1)

/* Посмотреть первый и последний элементы */
front := deque.Front() // Первый элемент дека
rear := deque.Back() // Последний элемент дека

/* Извлечь элементы из дека */
deque.Remove(front) // Извлечь элемент из начала дека
deque.Remove(rear) // Извлечь элемент из конца дека

/* Получить длину дека */
size := deque.Len()

/* Проверить, пуст ли дек */
isEmpty := deque.Len() == 0
```

```swift title="deque.swift"
/* Инициализировать дек */
// В Swift нет встроенного класса дека, поэтому в качестве дека можно использовать Array
var deque: [Int] = []

/* Добавить элементы в дек */
deque.append(2) // Добавить в конец дека
deque.append(5)
deque.append(4)
deque.insert(3, at: 0) // Добавить в начало дека
deque.insert(1, at: 0)

/* Посмотреть первый и последний элементы */
let peekFirst = deque.first! // Первый элемент дека
let peekLast = deque.last! // Последний элемент дека

/* Извлечь элементы из дека */
// При реализации на основе Array сложность removeFirst составляет O(n)
let popFirst = deque.removeFirst() // Извлечь элемент из начала дека
let popLast = deque.removeLast() // Извлечь элемент из конца дека

/* Получить длину дека */
let size = deque.count

/* Проверить, пуст ли дек */
let isEmpty = deque.isEmpty
```

```javascript title="deque.js"
/* Инициализировать дек */
// В JavaScript нет встроенного дека, поэтому его приходится реализовывать с помощью Array
const deque = [];

/* Добавить элементы в дек */
deque.push(2);
deque.push(5);
deque.push(4);
// Поскольку используется массив, временная сложность метода unshift() составляет O(n)
deque.unshift(3);
deque.unshift(1);

/* Посмотреть первый и последний элементы */
const peekFirst = deque[0];
const peekLast = deque[deque.length - 1];

/* Извлечь элементы из дека */
// Поскольку используется массив, временная сложность метода shift() составляет O(n)
const popFront = deque.shift();
const popBack = deque.pop();

/* Получить длину дека */
const size = deque.length;

/* Проверить, пуст ли дек */
const isEmpty = size === 0;
```

```typescript title="deque.ts"
/* Инициализировать дек */
// В TypeScript нет встроенного дека, поэтому его приходится реализовывать с помощью Array
const deque: number[] = [];

/* Добавить элементы в дек */
deque.push(2);
deque.push(5);
deque.push(4);
// Поскольку используется массив, временная сложность метода unshift() составляет O(n)
deque.unshift(3);
deque.unshift(1);

/* Посмотреть первый и последний элементы */
const peekFirst: number = deque[0];
const peekLast: number = deque[deque.length - 1];

/* Извлечь элементы из дека */
// Поскольку используется массив, временная сложность метода shift() составляет O(n)
const popFront: number = deque.shift() as number;
const popBack: number = deque.pop() as number;

/* Получить длину дека */
const size: number = deque.length;

/* Проверить, пуст ли дек */
const isEmpty: boolean = size === 0;
```

```dart title="deque.dart"
/* Инициализировать дек */
// В Dart класс Queue представляет собой двустороннюю очередь
final Queue<int> deque = Queue();

/* Добавить элементы в дек */
deque.addLast(2); // Добавить в конец дека
deque.addLast(5);
deque.addLast(4);
deque.addFirst(3); // Добавить в начало дека
deque.addFirst(1);

/* Посмотреть первый и последний элементы */
final int peekFirst = deque.first; // Первый элемент дека
final int peekLast = deque.last; // Последний элемент дека

/* Извлечь элементы из дека */
final int popFirst = deque.removeFirst(); // Извлечь элемент из начала дека
final int popLast = deque.removeLast(); // Извлечь элемент из конца дека

/* Получить длину дека */
final int size = deque.length;

/* Проверить, пуст ли дек */
final bool isEmpty = deque.isEmpty;
```

```rust title="deque.rs"
// Инициализировать дек
let mut deque: VecDeque<i32> = VecDeque::new();

/* Добавить элементы в дек */
deque.push_back(2); // Добавить в конец дека
deque.push_back(5);
deque.push_back(4);
deque.push_front(3); // Добавить в начало дека
deque.push_front(1);

// Посмотреть первый и последний элементы
let peek_first = deque.front().unwrap(); // Первый элемент дека
let peek_last = deque.back().unwrap(); // Последний элемент дека

// Извлечь элементы из дека
let pop_first = deque.pop_front().unwrap(); // Извлечь элемент из начала дека
let pop_last = deque.pop_back().unwrap(); // Извлечь элемент из конца дека

// Получить длину дека
let size = deque.len();

// Проверить, пуст ли дек
let is_empty = deque.is_empty();
```

```c title="deque.c"
// В C нет встроенного дека
```

```kotlin title="deque.kt"
/* Инициализировать дек */
val deque = LinkedList<Int>()

/* Добавить элементы в дек */
deque.offerLast(2) // Добавить в конец дека
deque.offerLast(5)
deque.offerLast(4)
deque.offerFirst(3) // Добавить в начало дека
deque.offerFirst(1)

/* Посмотреть первый и последний элементы */
val peekFirst = deque.peekFirst() // Первый элемент дека
val peekLast = deque.peekLast() // Последний элемент дека

/* Извлечь элементы из дека */
val popFirst = deque.pollFirst() // Извлечь элемент из начала дека
val popLast = deque.pollLast() // Извлечь элемент из конца дека

/* Получить длину дека */
val size = deque.size

/* Проверить, пуст ли дек */
val isEmpty = deque.isEmpty()
```

```ruby title="deque.rb"
# Инициализировать дек
# В Ruby нет встроенного дека, поэтому его приходится реализовывать с помощью Array
deque = []

# Добавить элементы в дек
deque << 2
deque << 5
deque << 4
# Поскольку Array — массив, временная сложность метода Array#unshift составляет O(n)
deque.unshift(3)
deque.unshift(1)

# Посмотреть первый и последний элементы
peek_first = deque.first
peek_last = deque.last

# Извлечь элементы из дека
# Поскольку Array — массив, временная сложность метода Array#shift составляет O(n)
pop_front = deque.shift
pop_back = deque.pop

# Получить длину дека
size = deque.length

# Проверить, пуст ли дек
is_empty = size.zero?
```

<!-- [tutor]{deque_operations_tutor} -->
https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%B4%D0%B5%D0%BA%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%B4%D0%B5%D0%BA%0A%20%20%20%20deq.append%282%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%BE%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%D0%94%D0%B5%D0%BA%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%91%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%91%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B5%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%B4%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%B4%D0%B5%D0%BA%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D0%B4%D0%B5%D0%BA%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%94%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%20%3D%22,%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
