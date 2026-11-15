<!-- [snippet]{heap_operations} -->
```python title="heap.py"
# Инициализация минимальной кучи
min_heap, flag = [], 1
# Инициализация максимальной кучи
max_heap, flag = [], -1

# Модуль heapq в Python по умолчанию реализует минимальную кучу
# Если инвертировать знак элемента перед добавлением, то отношение порядка перевернется и так реализуется максимальная куча
# В этом примере flag = 1 соответствует минимальной куче, а flag = -1 - максимальной

# Добавление элементов в кучу
heapq.heappush(max_heap, flag * 1)
heapq.heappush(max_heap, flag * 3)
heapq.heappush(max_heap, flag * 2)
heapq.heappush(max_heap, flag * 5)
heapq.heappush(max_heap, flag * 4)

# Получение элемента на вершине кучи
peek: int = flag * max_heap[0] # 5

# Извлечение элемента с вершины кучи
# Извлеченные элементы образуют последовательность по убыванию
val = flag * heapq.heappop(max_heap) # 5
val = flag * heapq.heappop(max_heap) # 4
val = flag * heapq.heappop(max_heap) # 3
val = flag * heapq.heappop(max_heap) # 2
val = flag * heapq.heappop(max_heap) # 1

# Получение размера кучи
size: int = len(max_heap)

# Проверка, пуста ли куча
is_empty: bool = not max_heap

# Построение кучи из входного списка
min_heap: list[int] = [1, 3, 2, 5, 4]
heapq.heapify(min_heap)
```

```cpp title="heap.cpp"
/* Инициализация кучи */
// Инициализация минимальной кучи
priority_queue<int, vector<int>, greater<int>> minHeap;
// Инициализация максимальной кучи
priority_queue<int, vector<int>, less<int>> maxHeap;

/* Добавление элементов в кучу */
maxHeap.push(1);
maxHeap.push(3);
maxHeap.push(2);
maxHeap.push(5);
maxHeap.push(4);

/* Получение элемента на вершине кучи */
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

/* Построение кучи из входного списка */
vector<int> input{1, 3, 2, 5, 4};
minHeap = priority_queue<int, vector<int>, greater<int>>(input.begin(), input.end());
```

```java title="heap.java"
/* Инициализация кучи */
// Инициализация минимальной кучи
Queue<Integer> minHeap = new PriorityQueue<>();
// Инициализация максимальной кучи (достаточно изменить Comparator через lambda)
Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

/* Добавление элементов в кучу */
maxHeap.offer(1);
maxHeap.offer(3);
maxHeap.offer(2);
maxHeap.offer(5);
maxHeap.offer(4);

/* Получение элемента на вершине кучи */
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

/* Построение кучи из входного списка */
minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
```

```csharp title="heap.cs"
/* Инициализация кучи */
// Инициализация минимальной кучи
PriorityQueue<int, int> minHeap = new();
// Инициализация максимальной кучи (достаточно изменить Comparer через lambda)
PriorityQueue<int, int> maxHeap = new(Comparer<int>.Create((x, y) => y.CompareTo(x)));

/* Добавление элементов в кучу */
maxHeap.Enqueue(1, 1);
maxHeap.Enqueue(3, 3);
maxHeap.Enqueue(2, 2);
maxHeap.Enqueue(5, 5);
maxHeap.Enqueue(4, 4);

/* Получение элемента на вершине кучи */
int peek = maxHeap.Peek();//5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
peek = maxHeap.Dequeue();  // 5
peek = maxHeap.Dequeue();  // 4
peek = maxHeap.Dequeue();  // 3
peek = maxHeap.Dequeue();  // 2
peek = maxHeap.Dequeue();  // 1

/* Получение размера кучи */
int size = maxHeap.Count;

/* Проверка, пуста ли куча */
bool isEmpty = maxHeap.Count == 0;

/* Построение кучи из входного списка */
minHeap = new PriorityQueue<int, int>([(1, 1), (3, 3), (2, 2), (5, 5), (4, 4)]);
```

```go title="heap.go"
// В Go можно построить целочисленную максимальную кучу, реализовав heap.Interface
// Для реализации heap.Interface также нужно реализовать sort.Interface
type intHeap []any

// Метод Push из heap.Interface, реализует добавление элемента в кучу
func (h *intHeap) Push(x any) {
    // Push и Pop используют pointer receiver
    // Потому что они не только изменяют содержимое среза, но и его длину
    *h = append(*h, x.(int))
}

// Метод Pop из heap.Interface, реализует извлечение элемента с вершины кучи
func (h *intHeap) Pop() any {
    // Извлекаемый элемент хранится в конце
    last := (*h)[len(*h)-1]
    *h = (*h)[:len(*h)-1]
    return last
}

// Метод Len из sort.Interface
func (h *intHeap) Len() int {
    return len(*h)
}

// Метод Less из sort.Interface
func (h *intHeap) Less(i, j int) bool {
    // Для минимальной кучи здесь нужно заменить сравнение на <
    return (*h)[i].(int) > (*h)[j].(int)
}

// Метод Swap из sort.Interface
func (h *intHeap) Swap(i, j int) {
    (*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

// Top получает элемент на вершине кучи
func (h *intHeap) Top() any {
    return (*h)[0]
}

/* Driver Code */
func TestHeap(t *testing.T) {
    /* Инициализация кучи */
    // Инициализация максимальной кучи
    maxHeap := &intHeap{}
    heap.Init(maxHeap)
    /* Добавление элементов в кучу */
    // Вызываем методы heap.Interface для добавления элементов
    heap.Push(maxHeap, 1)
    heap.Push(maxHeap, 3)
    heap.Push(maxHeap, 2)
    heap.Push(maxHeap, 4)
    heap.Push(maxHeap, 5)

    /* Получение элемента на вершине кучи */
    top := maxHeap.Top()
    fmt.Printf("Элемент на вершине кучи: %d\n", top)

    /* Извлечение элемента с вершины кучи */
    // Вызываем методы heap.Interface для удаления элементов
    heap.Pop(maxHeap) // 5
    heap.Pop(maxHeap) // 4
    heap.Pop(maxHeap) // 3
    heap.Pop(maxHeap) // 2
    heap.Pop(maxHeap) // 1

    /* Получение размера кучи */
    size := len(*maxHeap)
    fmt.Printf("Число элементов в куче: %d\n", size)

    /* Проверка, пуста ли куча */
    isEmpty := len(*maxHeap) == 0
    fmt.Printf("Пуста ли куча: %t\n", isEmpty)
}
```

```swift title="heap.swift"
/* Инициализация кучи */
// Тип Heap в Swift поддерживает и max-heap, и min-heap, но требует swift-collections
var heap = Heap<Int>()

/* Добавление элементов в кучу */
heap.insert(1)
heap.insert(3)
heap.insert(2)
heap.insert(5)
heap.insert(4)

/* Получение элемента на вершине кучи */
var peek = heap.max()!

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

/* Построение кучи из входного списка */
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
use std::collections::BinaryHeap;
use std::cmp::Reverse;

/* Инициализация кучи */
// Инициализация минимальной кучи
let mut min_heap = BinaryHeap::<Reverse<i32>>::new();
// Инициализация максимальной кучи
let mut max_heap = BinaryHeap::new();

/* Добавление элементов в кучу */
max_heap.push(1);
max_heap.push(3);
max_heap.push(2);
max_heap.push(5);
max_heap.push(4);

/* Получение элемента на вершине кучи */
let peek = max_heap.peek().unwrap();  // 5

/* Извлечение элемента с вершины кучи */
// Извлеченные элементы образуют последовательность по убыванию
let peek = max_heap.pop().unwrap();   // 5
let peek = max_heap.pop().unwrap();   // 4
let peek = max_heap.pop().unwrap();   // 3
let peek = max_heap.pop().unwrap();   // 2
let peek = max_heap.pop().unwrap();   // 1

/* Получение размера кучи */
let size = max_heap.len();

/* Проверка, пуста ли куча */
let is_empty = max_heap.is_empty();

/* Построение кучи из входного списка */
let min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
```

```c title="heap.c"
// В C нет встроенного класса Heap
```

```kotlin title="heap.kt"
/* Инициализация кучи */
// Инициализация минимальной кучи
var minHeap = PriorityQueue<Int>()
// Инициализация максимальной кучи (достаточно изменить Comparator через lambda)
val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

/* Добавление элементов в кучу */
maxHeap.offer(1)
maxHeap.offer(3)
maxHeap.offer(2)
maxHeap.offer(5)
maxHeap.offer(4)

/* Получение элемента на вершине кучи */
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

/* Построение кучи из входного списка */
minHeap = PriorityQueue(mutableListOf(1, 3, 2, 5, 4))
```

```ruby title="heap.rb"
# В Ruby нет встроенного класса Heap
```

<!-- [tutor]{heap_operations_tutor} -->
https://pythontutor.com/render.html#code=import%20heapq%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20min_heap%2C%20flag%20%3D%20%5B%5D%2C%201%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20max_heap%2C%20flag%20%3D%20%5B%5D%2C%20-1%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9C%D0%BE%D0%B4%D1%83%D0%BB%D1%8C%20heapq%20%D0%B2%20Python%20%D0%BF%D0%BE%20%D1%83%D0%BC%D0%BE%D0%BB%D1%87%D0%B0%D0%BD%D0%B8%D1%8E%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%95%D1%81%D0%BB%D0%B8%20%D0%BF%D0%B5%D1%80%D0%B5%D0%B4%20%D0%BF%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%D0%BC%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%20%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D0%BE%D1%82%D1%80%D0%B8%D1%86%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%2C%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D0%B8%D1%82%D1%8C%20%D0%BE%D1%82%D0%BD%D0%BE%D1%88%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BF%D0%BE%D1%80%D1%8F%D0%B4%D0%BA%D0%B0%20%D0%B8%20%D1%82%D0%B5%D0%BC%20%D1%81%D0%B0%D0%BC%D1%8B%D0%BC%20%D1%80%D0%B5%D0%B0%D0%BB%D0%B8%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20max-%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20%23%20%D0%92%20%D1%8D%D1%82%D0%BE%D0%BC%20%D0%BF%D1%80%D0%B8%D0%BC%D0%B5%D1%80%D0%B5%20flag%20%3D%201%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20min-%D0%BA%D1%83%D1%87%D0%B5%2C%20%D0%B0%20flag%20%3D%20-1%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D1%83%D0%B5%D1%82%20max-%D0%BA%D1%83%D1%87%D0%B5%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BA%D1%83%D1%87%D1%83%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%201%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%203%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%202%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%205%29%0A%20%20%20%20heapq.heappush%28max_heap%2C%20flag%20%2A%204%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20peek%20%3D%20flag%20%2A%20max_heap%5B0%5D%20%23%205%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B5%20%D0%B8%D0%B7%20%D0%BA%D1%83%D1%87%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%BE%D0%B1%D1%80%D0%B0%D0%B7%D1%83%D1%8E%D1%82%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BE%D0%B2%D0%B0%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%20%D0%B1%D0%BE%D0%BB%D1%8C%D1%88%D0%B5%D0%B3%D0%BE%20%D0%BA%20%D0%BC%D0%B5%D0%BD%D1%8C%D1%88%D0%B5%D0%BC%D1%83%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%205%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%204%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%203%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%202%0A%20%20%20%20val%20%3D%20flag%20%2A%20heapq.heappop%28max_heap%29%20%23%201%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%80%D0%B0%D0%B7%D0%BC%D0%B5%D1%80%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20size%20%3D%20len%28max_heap%29%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BA%D1%83%D1%87%D0%B0%0A%20%20%20%20is_empty%20%3D%20not%20max_heap%0A%20%20%20%20%0A%20%20%20%20%23%20%D0%92%D1%85%D0%BE%D0%B4%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%D0%B8%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%BA%D1%83%D1%87%D0%B8%0A%20%20%20%20min_heap%20%3D%20%5B1%2C%203%2C%202%2C%205%2C%204%5D%0A%20%20%20%20heapq.heapify%28min_heap%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false
