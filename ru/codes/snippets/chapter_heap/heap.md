<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# Инициализация минимальной кучи
min_heap, flag = [], 1
# Инициализация максимальной кучи
max_heap, flag = [], -1

# Модуль heapq в Python по умолчанию реализует минимальную кучу
# Можно помещать в кучу отрицательные элементы, чтобы инвертировать отношение порядка и таким образом реализовать максимальную кучу
# В этом примере flag = 1 соответствует минимальной куче, а flag = -1 — максимальной куче

# Добавление элемента в кучу
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# Получение элемента с вершины кучи
peek: int = flag * max_heap[0]  # 5

# Извлечение элемента с вершины кучи
# Извлеченные элементы образуют последовательность по убыванию
val = flag * heapq.heappop(max_heap)  # 5
val = flag * heapq.heappop(max_heap)  # 4
val = flag * heapq.heappop(max_heap)  # 3
val = flag * heapq.heappop(max_heap)  # 2
val = flag * heapq.heappop(max_heap)  # 1

# Получение размера кучи
size: int = len(max_heap)

# Проверка, пуста ли куча
is_empty: bool = not max_heap

# Создать кучу по входному списку
# Временная сложность равна O(n), а не O(nlogn)
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* Инициализация кучи */
// Инициализировать минимальную кучу
priority_queue<int, vector<int>, greater<int>> minHeap;
// Инициализировать максимальную кучу
priority_queue<int, vector<int>, less<int>> maxHeap;

/* Добавление элемента в кучу */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* Получение элемента с вершины кучи */
int peek = maxHeap.top(); // 5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
maxHeap.pop(); // 5
maxHeap.pop(); // 4
maxHeap.pop(); // 3
maxHeap.pop(); // 2
maxHeap.pop(); // 1

/* Получение размера кучи */
int size = maxHeap.size();

/* Проверка, пуста ли куча */
bool isEmpty = maxHeap.empty();

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* Инициализация кучи */
// Инициализация минимальной кучи
Queue<Integer> minHeap = new PriorityQueue<>();
// Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* Добавление элемента в кучу */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* Получение элемента с вершины кучи */
int peek = maxHeap.peek(); // 5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
peek = maxHeap.poll(); // 5
peek = maxHeap.poll(); // 4
peek = maxHeap.poll(); // 3
peek = maxHeap.poll(); // 2
peek = maxHeap.poll(); // 1

/* Получение размера кучи */
int size = maxHeap.size();

/* Проверка, пуста ли куча */
boolean isEmpty = maxHeap.isEmpty();

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* Инициализация кучи */
// Инициализация минимальной кучи
PriorityQueue<int, int> minHeap = new();
// Инициализировать максимальную кучу (достаточно изменить Comparer с помощью lambda-выражения)
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* Добавление элемента в кучу */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* Получение элемента с вершины кучи */
int peek = maxHeap.Peek(); // 5

/* Извлечение элемента с вершины кучи */
// Элементы, извлеченные из кучи, образуют последовательность от большего к меньшему
peek = maxHeap.Dequeue(); // 5
peek = maxHeap.Dequeue(); // 4
peek = maxHeap.Dequeue(); // 3
peek = maxHeap.Dequeue(); // 2
peek = maxHeap.Dequeue(); // 1

/* Получение размера кучи */
int size = maxHeap.Count;

/* Проверка, пуста ли куча */
bool isEmpty = maxHeap.Count == 0;

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// В Go можно построить максимальную кучу для целых чисел, реализовав heap.Interface
// Для реализации heap.Interface одновременно требуется реализовать sort.Interface
type intHeap []any

// Функция Push интерфейса heap.Interface, реализующая добавление элемента в кучу
func (h *intHeap) Push(x any) {
    // Push и Pop используют pointer receiver в качестве параметра
    // Потому что они не только изменяют содержимое среза, но и меняют его длину.
    *h = append(*h, x.(int))
}

// Функция Pop интерфейса heap.Interface, реализующая извлечение элемента с вершины кучи
func (h *intHeap) Pop() any {
    // Элемент, который нужно удалить из кучи, хранится в конце
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Функция Len интерфейса sort.Interface
func (h *intHeap) Len() int {
    return len(*h)
}

// Функция Less интерфейса sort.Interface
func (h *intHeap) Less(i, j int) bool {
    // При реализации минимальной кучи нужно изменить знак сравнения на «меньше»
    return (*h)[i].(int) > (*h)[j].(int)
}

// Функция Swap интерфейса sort.Interface
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top: получить элемент на вершине кучи
func (h *intHeap) Top() any {
    return (*h)[0]
}

func TestHeap(t *testing.T) {
    /* Инициализация кучи */
    // Инициализация максимальной кучи
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* Добавление элемента в кучу */
    // Вызвать функции heap.Interface для добавления элемента
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 5)
    heap.Push(maxHeap, 4)
    PrintHeap(*maxHeap)

    /* Получение элемента с вершины кучи */
    top := maxHeap.Top()
    fmt.Printf("Элемент на вершине кучи = %d\n", top)

    /* Извлечение элемента с вершины кучи */
    // Вызвать функции heap.Interface для удаления элемента
    fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 5
    fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 4
    fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 3
    fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 2
    fmt.Printf("Извлеченный элемент = %d\n", heap.Pop(maxHeap)) // 1

    /* Получение размера кучи */
    size := len(*maxHeap)
    fmt.Printf("Количество элементов в куче = %d\n", size)

    /* Проверка, пуста ли куча */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("Пуста ли куча: %t\n", isEmpty)
}
```

```swift title="heap.swift"
import HeapModule

/* Инициализация кучи */
// Тип Heap в Swift одновременно поддерживает максимальную и минимальную кучу; требуется пакет swift-collections
var heap = Heap<Int>()

/* Добавление элемента в кучу */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* Получение элемента с вершины кучи */
var peek = heap.max()

/* Извлечение элемента с вершины кучи */
peek = heap.removeMax() // 5
peek = heap.removeMax() // 4
peek = heap.removeMax() // 3
peek = heap.removeMax() // 2
peek = heap.removeMax() // 1

/* Получение размера кучи */
let size = heap.count

/* Проверка, пуста ли куча */
let isEmpty = heap.isEmpty

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
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

/* Инициализация кучи */
// Инициализация минимальной кучи
// BinaryHeap в Rust является максимальной кучей; для минимальной кучи элементы нужно оборачивать в Reverse
#[allow(unused_assignments)]
let mut min_heap = BinaryHeap::new();
// Инициализировать максимальную кучу
let mut max_heap = BinaryHeap::new();

/* Добавление элемента в кучу */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* Получение элемента с вершины кучи */
let peek = max_heap.peek().unwrap(); // 5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
let peek = max_heap.pop().unwrap(); // 5
let peek = max_heap.pop().unwrap(); // 4
let peek = max_heap.pop().unwrap(); // 3
let peek = max_heap.pop().unwrap(); // 2
let peek = max_heap.pop().unwrap(); // 1

/* Получение размера кучи */
let size = max_heap.len();

/* Проверка, пуста ли куча */
let is_empty = max_heap.is_empty();

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// В C нет встроенного класса Heap
```

```kotlin title="heap.kt"
/* Инициализация кучи */
// Инициализация минимальной кучи
var minHeap = PriorityQueue<Int>()
// Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* Добавление элемента в кучу */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* Получение элемента с вершины кучи */
var peek = maxHeap.peek() // 5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
peek = maxHeap.poll() // 5
peek = maxHeap.poll() // 4
peek = maxHeap.poll() // 3
peek = maxHeap.poll() // 2
peek = maxHeap.poll() // 1

/* Получение размера кучи */
val size = maxHeap.size

/* Проверка, пуста ли куча */
val isEmpty = maxHeap.isEmpty()

/* Построить кучу по входному списку */
// Временная сложность равна O(n), а не O(nlogn)
minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# В Ruby нет встроенного класса Heap
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9C%D0%BE%D0%B4%D1%83%D0%BB%D1%8C%20heapq%20%D0%B2%20Python%20%D0%BF%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D1%82%D1%80%D0%B8%D1%86%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D1%82%D0%BD%D0%BE%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B0%20%D0%B8%20%D1%82%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D1%8B%D0%BC%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%92%20%D1%8D%D1%82%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20flag%20%3D%201%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D0%B5%2C%20%D0%B0%20flag%20%3D%20-1%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20max-%D0%BA%D1%83%D1%87%D0%B5%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%83%D1%8E%D1%82%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B3%D0%BE%20%D0%BA%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%BC%D1%83%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BA%D1%83%D1%87%D0%B0%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%85%D0%BE%D0%B4%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D0%B8%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20%23%20%D0%92%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D0%B0%D1%8F%20%D1%81%D0%BB%D0%BE%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D1%80%D0%B0%D0%B2%D0%BD%D0%B0%20O%28n%29%2C%20%D0%B0%20%D0%BD%D0%B5%20O%28nlogn%29%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
