<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# Инициализировать мин-кучу
min_heap, flag = [], 1
# Инициализировать макс-кучу
max_heap, flag = [], -1

# Модуль heapq в Python по умолчанию реализует мин-кучу
# Смена знака элементов перед вставкой обращает порядок сравнения и позволяет реализовать макс-кучу
# В этом примере flag = 1 задаёт мин-кучу, а flag = -1 — макс-кучу

# Вставить элемент в кучу
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# Получить элемент в корне
peek: int = flag * max_heap[0]  # 5

# Извлечь элемент из корня
# При извлечении элементы образуют последовательность в порядке убывания
val = flag * heapq.heappop(max_heap)  # 5
val = flag * heapq.heappop(max_heap)  # 4
val = flag * heapq.heappop(max_heap)  # 3
val = flag * heapq.heappop(max_heap)  # 2
val = flag * heapq.heappop(max_heap)  # 1

# Размер кучи
size: int = len(max_heap)

# Проверить, пуста ли куча
is_empty: bool = not max_heap

# Построить кучу по входному списку
# Временная сложность — O(n), а не O(nlogn)
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* Инициализировать кучу */
// Инициализировать мин-кучу
priority_queue<int, vector<int>, greater<int>> minHeap;
// Инициализировать макс-кучу
priority_queue<int, vector<int>, less<int>> maxHeap;

/* Вставить элемент в кучу */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* Получить элемент в корне */
int peek = maxHeap.top(); // 5

/* Извлечь элемент из корня */
// При извлечении элементы образуют последовательность в порядке убывания
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* Размер кучи */
int size = maxHeap.size();

/* Проверить, пуста ли куча */
bool isEmpty = maxHeap.empty();

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* Инициализировать кучу */
// Инициализировать мин-кучу
Queue<Integer> minHeap = new PriorityQueue<>();
// Инициализировать макс-кучу, задав Comparator лямбда-выражением
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* Вставить элемент в кучу */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* Получить элемент в корне */
int peek = maxHeap.peek(); // 5

/* Извлечь элемент из корня */
// При извлечении элементы образуют последовательность в порядке убывания
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* Размер кучи */
int size = maxHeap.size();

/* Проверить, пуста ли куча */
boolean isEmpty = maxHeap.isEmpty();

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* Инициализировать кучу */
// Инициализировать мин-кучу
PriorityQueue<int, int> minHeap = new();
// Инициализировать макс-кучу, задав Comparer лямбда-выражением
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* Вставить элемент в кучу */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* Получить элемент в корне */
int peek = maxHeap.Peek(); // 5

/* Извлечь элемент из корня */
// При извлечении элементы образуют последовательность в порядке убывания
peek = maxHeap.Dequeue(); // 5
peek = maxHeap.Dequeue(); // 4
peek = maxHeap.Dequeue(); // 3
peek = maxHeap.Dequeue(); // 2
peek = maxHeap.Dequeue(); // 1

/* Размер кучи */
int size = maxHeap.Count;

/* Проверить, пуста ли куча */
bool isEmpty = maxHeap.Count == 0;

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// В Go макс-кучу целых чисел можно построить, реализовав heap.Interface
// Для реализации heap.Interface требуется также реализовать sort.Interface
type intHeap []any

// Метод Push интерфейса heap.Interface добавляет элемент в кучу
func (h *intHeap) Push(x any) {
    // Методы Push и Pop используют указатель в качестве получателя,
    // поскольку изменяют как содержимое среза, так и его длину.
    *h = append(*h, x.(int))
}

// Метод Pop интерфейса heap.Interface извлекает последний элемент среза (heap.Pop уже переместил туда корень)
func (h *intHeap) Pop() any {
    // Извлекаемый элемент находится в конце
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Метод Len интерфейса sort.Interface
func (h *intHeap) Len() int {
    return len(*h)
}

// Метод Less интерфейса sort.Interface
func (h *intHeap) Less(i, j int) bool {
    // Для мин-кучи нужно использовать знак «меньше»
    return (*h)[i].(int) > (*h)[j].(int)
}

// Метод Swap интерфейса sort.Interface
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Метод Top возвращает элемент в корне
func (h *intHeap) Top() any {
    return (*h)[0]
}

func TestHeap(t *testing.T) {
    /* Инициализировать кучу */
    // Инициализировать макс-кучу
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* Вставить элемент в кучу */
    // Вызвать метод heap.Interface для добавления элемента
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 5)
    heap.Push(maxHeap, 4)

    /* Получить элемент в корне */
    top := maxHeap.Top()
    fmt.Printf("Элемент в корне: %d\n", top)

    /* Извлечь элемент из корня */
    // Вызвать метод heap.Interface для удаления элемента
    fmt.Printf("Извлечённый элемент: %d\n", heap.Pop(maxHeap)) // 5
    fmt.Printf("Извлечённый элемент: %d\n", heap.Pop(maxHeap)) // 4
    fmt.Printf("Извлечённый элемент: %d\n", heap.Pop(maxHeap)) // 3
    fmt.Printf("Извлечённый элемент: %d\n", heap.Pop(maxHeap)) // 2
    fmt.Printf("Извлечённый элемент: %d\n", heap.Pop(maxHeap)) // 1

    /* Размер кучи */
    size := len(*maxHeap)
    fmt.Printf("Число элементов в куче: %d\n", size)

    /* Проверить, пуста ли куча */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("Пуста ли куча: %t\n", isEmpty)
}
```

```swift title="heap.swift"
import HeapModule

/* Инициализировать кучу */
// Тип Heap в Swift поддерживает макс-кучу и мин-кучу. Требуется пакет swift-collections
var heap = Heap<Int>()

/* Вставить элемент в кучу */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* Получить элемент в корне */
var peek = heap.max()

/* Извлечь элемент из корня */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* Размер кучи */
let size = heap.count

/* Проверить, пуста ли куча */
let isEmpty = heap.isEmpty

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
let heap2 = Heap([1, 3, 2, 5, 4])
```

```javascript title="heap.js"
// В JavaScript нет встроенного класса Heap
```

```typescript title="heap.ts"
// В TypeScript нет встроенного класса Heap
```

```dart title="heap.dart"
// В Dart нет встроенного класса Heap
```

```rust title="heap.rs"
use std::{cmp::Reverse, collections::BinaryHeap};

/* Инициализировать кучу */
// Инициализировать мин-кучу
// BinaryHeap в Rust — макс-куча. Для мин-кучи элементы нужно обернуть в Reverse
#[allow(unused_assignments)]
let mut min_heap = BinaryHeap::new();
// Инициализировать макс-кучу
let mut max_heap = BinaryHeap::new();

/* Вставить элемент в кучу */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* Получить элемент в корне */
let peek = max_heap.peek().unwrap(); // 5

/* Извлечь элемент из корня */
// При извлечении элементы образуют последовательность в порядке убывания
let peek = max_heap.pop().unwrap(); // 5
let peek = max_heap.pop().unwrap(); // 4
let peek = max_heap.pop().unwrap(); // 3
let peek = max_heap.pop().unwrap(); // 2
let peek = max_heap.pop().unwrap(); // 1

/* Размер кучи */
let size = max_heap.len();

/* Проверить, пуста ли куча */
let is_empty = max_heap.is_empty();

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// В C нет встроенного класса Heap
```

```kotlin title="heap.kt"
/* Инициализировать кучу */
// Инициализировать мин-кучу
var minHeap = PriorityQueue<Int>()
// Инициализировать макс-кучу, задав Comparator лямбда-выражением
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* Вставить элемент в кучу */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* Получить элемент в корне */
var peek = maxHeap.peek() // 5

/* Извлечь элемент из корня */
// При извлечении элементы образуют последовательность в порядке убывания
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* Размер кучи */
val size = maxHeap.size

/* Проверить, пуста ли куча */
val isEmpty = maxHeap.isEmpty()

/* Построить кучу по входному списку */
// Временная сложность — O(n), а не O(nlogn)
minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# В Ruby нет встроенного класса Heap
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BC%D0%B8%D0%BD-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20min_heap,%20flag%20%3D%20%5B%5D,%201%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BC%D0%B0%D0%BA%D1%81-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20max_heap,%20flag%20%3D%20%5B%5D,%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E%20%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D1%8C%20heapq%20%D0%B2%20Python%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D1%83%D0%B5%D1%82%20%D0%BC%D0%B8%D0%BD-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%20%D0%B2%D1%81%D1%82%D0%B0%D0%B2%D0%BA%D0%BE%D0%B9%20%D0%BC%D0%B5%D0%BD%D1%8F%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D0%BA%20%D0%BA%D0%B0%D0%B6%D0%B4%D0%BE%D0%B3%D0%BE%20%D1%87%D0%B8%D1%81%D0%BB%D0%B0,%20%D0%B8%D1%85%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BE%D0%BA%20%D0%BC%D0%B5%D0%BD%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9%20%D0%B8%20%D0%BF%D0%BE%D0%BB%D1%83%D1%87%D0%B0%D0%B5%D1%82%D1%81%D1%8F%20%D0%BC%D0%B0%D0%BA%D1%81-%D0%BA%D1%83%D1%87%D0%B0%0A%20%20%20%20%23%20%D0%97%D0%B4%D0%B5%D1%81%D1%8C%20flag%20%3D%201%20%D0%B7%D0%B0%D0%B4%D0%B0%D1%91%D1%82%20%D0%BC%D0%B8%D0%BD-%D0%BA%D1%83%D1%87%D1%83,%20%D0%B0%20flag%20%3D%20-1%20%E2%80%94%20%D0%BC%D0%B0%D0%BA%D1%81-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap,%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20%20%20%20%23%20%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D1%8E%D1%82%D1%81%D1%8F%20%D0%B2%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B5%20%D1%83%D0%B1%D1%8B%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BA%D1%83%D1%87%D0%B0%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%A1%D1%82%D1%80%D0%BE%D0%B8%D0%BC%20%D0%BA%D1%83%D1%87%D1%83%20%D0%B8%D0%B7%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%0A%20%20%20%20%23%20%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B7%D0%B0%D0%BD%D0%B8%D0%BC%D0%B0%D0%B5%D1%82%20O%28n%29%20%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%B8,%20%D0%B0%20%D0%BD%D0%B5%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1,%203,%202,%205,%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
