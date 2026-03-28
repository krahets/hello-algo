---
comments: true
---

# 5.3 &nbsp; Двусторонняя очередь

В очереди мы можем удалять элементы только из головы или добавлять их только в хвост. Как показано на рисунке 5-7, <u>двусторонняя очередь (double-ended queue)</u> обеспечивает более высокую гибкость и позволяет выполнять добавление и удаление элементов как с головы, так и с хвоста.

![Операции двусторонней очереди](deque.assets/deque_operations.png){ class="animation-figure" }

<p align="center"> Рисунок 5-7 &nbsp; Операции двусторонней очереди </p>

## 5.3.1 &nbsp; Основные операции с двусторонней очередью

Распространенные операции двусторонней очереди приведены в таблице 5-3. Конкретные названия методов зависят от используемого языка программирования.

<p align="center"> Таблица 5-3 &nbsp; Эффективность операций двусторонней очереди </p>

<div class="center-table" markdown>

| Имя метода   | Описание                         | Временная сложность |
| ------------ | -------------------------------- | ------------------- |
| `push_first()` | Добавить элемент в голову очереди | $O(1)$     |
| `push_last()`  | Добавить элемент в хвост очереди  | $O(1)$     |
| `pop_first()`  | Удалить элемент из головы очереди | $O(1)$     |
| `pop_last()`   | Удалить элемент из хвоста очереди | $O(1)$     |
| `peek_first()` | Просмотреть элемент в голове очереди | $O(1)$  |
| `peek_last()`  | Просмотреть элемент в хвосте очереди | $O(1)$  |

</div>

Точно так же мы можем напрямую использовать уже реализованные в языках программирования классы двусторонней очереди:

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # Инициализация двусторонней очереди
    deq: deque[int] = deque()

    # Поместить элементы в очередь
    deq.append(2)      # Добавить в хвост
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавить в голову
    deq.appendleft(1)

    # Просмотреть элементы
    front: int = deq[0]  # Элемент в голове
    rear: int = deq[-1]  # Элемент в хвосте

    # Извлечь элементы из очереди
    pop_front: int = deq.popleft()  # Извлечь элемент из головы
    pop_rear: int = deq.pop()       # Извлечь элемент из хвоста

    # Получить длину двусторонней очереди
    size: int = len(deq)

    # Проверить, пуста ли двусторонняя очередь
    is_empty: bool = len(deq) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* Инициализация двусторонней очереди */
    deque<int> deque;

    /* Поместить элементы в очередь */
    deque.push_back(2);   // Добавить в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // Добавить в голову
    deque.push_front(1);

    /* Просмотреть элементы */
    int front = deque.front(); // Элемент в голове
    int back = deque.back();   // Элемент в хвосте

    /* Извлечь элементы из очереди */
    deque.pop_front();  // Извлечь элемент из головы
    deque.pop_back();   // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    int size = deque.size();

    /* Проверить, пуста ли двусторонняя очередь */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* Инициализация двусторонней очереди */
    Deque<Integer> deque = new LinkedList<>();

    /* Поместить элементы в очередь */
    deque.offerLast(2);   // Добавить в хвост
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // Добавить в голову
    deque.offerFirst(1);

    /* Просмотреть элементы */
    int peekFirst = deque.peekFirst();  // Элемент в голове
    int peekLast = deque.peekLast();    // Элемент в хвосте

    /* Извлечь элементы из очереди */
    int popFirst = deque.pollFirst();  // Извлечь элемент из головы
    int popLast = deque.pollLast();    // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    int size = deque.size();

    /* Проверить, пуста ли двусторонняя очередь */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* Инициализация двусторонней очереди */
    // В C# двустороннюю очередь обычно моделируют через связный список LinkedList
    LinkedList<int> deque = new();

    /* Поместить элементы в очередь */
    deque.AddLast(2);   // Добавить в хвост
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // Добавить в голову
    deque.AddFirst(1);

    /* Просмотреть элементы */
    int peekFirst = deque.First.Value;  // Элемент в голове
    int peekLast = deque.Last.Value;    // Элемент в хвосте

    /* Извлечь элементы из очереди */
    deque.RemoveFirst();  // Извлечь элемент из головы
    deque.RemoveLast();   // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    int size = deque.Count;

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* Инициализация двусторонней очереди */
    // В Go list обычно используется как двусторонняя очередь
    deque := list.New()

    /* Поместить элементы в очередь */
    deque.PushBack(2)      // Добавить в хвост
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // Добавить в голову
    deque.PushFront(1)

    /* Просмотреть элементы */
    front := deque.Front() // Элемент в голове
    rear := deque.Back()   // Элемент в хвосте

    /* Извлечь элементы из очереди */
    deque.Remove(front)    // Извлечь элемент из головы
    deque.Remove(rear)     // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    size := deque.Len()

    /* Проверить, пуста ли двусторонняя очередь */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* Инициализация двусторонней очереди */
    // В Swift нет встроенного класса двусторонней очереди, поэтому можно использовать Array как двустороннюю очередь
    var deque: [Int] = []

    /* Поместить элементы в очередь */
    deque.append(2) // Добавить в хвост
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // Добавить в голову
    deque.insert(1, at: 0)

    /* Просмотреть элементы */
    let peekFirst = deque.first! // Элемент в голове
    let peekLast = deque.last! // Элемент в хвосте

    /* Извлечь элементы из очереди */
    // При моделировании через Array сложность popFirst равна O(n)
    let popFirst = deque.removeFirst() // Извлечь элемент из головы
    let popLast = deque.removeLast() // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    let size = deque.count

    /* Проверить, пуста ли двусторонняя очередь */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* Инициализация двусторонней очереди */
    // В JavaScript нет встроенной двусторонней очереди, поэтому можно использовать Array как двустороннюю очередь
    const deque = [];

    /* Поместить элементы в очередь */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Обрати внимание: поскольку это массив, метод unshift() имеет сложность O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* Просмотреть элементы */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* Извлечь элементы из очереди */
    // Обрати внимание: поскольку это массив, метод shift() имеет сложность O(n)
    const popFront = deque.shift();
    const popBack = deque.pop();

    /* Получить длину двусторонней очереди */
    const size = deque.length;

    /* Проверить, пуста ли двусторонняя очередь */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* Инициализация двусторонней очереди */
    // В TypeScript нет встроенной двусторонней очереди, поэтому можно использовать Array как двустороннюю очередь
    const deque: number[] = [];

    /* Поместить элементы в очередь */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Обрати внимание: поскольку это массив, метод unshift() имеет сложность O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* Просмотреть элементы */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* Извлечь элементы из очереди */
    // Обрати внимание: поскольку это массив, метод shift() имеет сложность O(n)
    const popFront: number = deque.shift() as number;
    const popBack: number = deque.pop() as number;

    /* Получить длину двусторонней очереди */
    const size: number = deque.length;

    /* Проверить, пуста ли двусторонняя очередь */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* Инициализация двусторонней очереди */
    // В Dart Queue определена как двусторонняя очередь
    Queue<int> deque = Queue<int>();

    /* Поместить элементы в очередь */
    deque.addLast(2);  // Добавить в хвост
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // Добавить в голову
    deque.addFirst(1);

    /* Просмотреть элементы */
    int peekFirst = deque.first; // Элемент в голове
    int peekLast = deque.last;   // Элемент в хвосте

    /* Извлечь элементы из очереди */
    int popFirst = deque.removeFirst(); // Извлечь элемент из головы
    int popLast = deque.removeLast();   // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    int size = deque.length;

    /* Проверить, пуста ли двусторонняя очередь */
    bool isEmpty = deque.isEmpty;
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* Инициализация двусторонней очереди */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Поместить элементы в очередь */
    deque.push_back(2);  // Добавить в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Добавить в голову
    deque.push_front(1);

    /* Просмотреть элементы */
    if let Some(front) = deque.front() { // Элемент в голове
    }
    if let Some(rear) = deque.back() {   // Элемент в хвосте
    }

    /* Извлечь элементы из очереди */
    if let Some(pop_front) = deque.pop_front() { // Извлечь элемент из головы
    }
    if let Some(pop_rear) = deque.pop_back() {   // Извлечь элемент из хвоста
    }

    /* Получить длину двусторонней очереди */
    let size = deque.len();

    /* Проверить, пуста ли двусторонняя очередь */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="deque.c"
    // В C нет встроенной двусторонней очереди
    ```

=== "Kotlin"

    ```kotlin title="deque.kt"
    /* Инициализация двусторонней очереди */
    val deque = LinkedList<Int>()

    /* Поместить элементы в очередь */
    deque.offerLast(2)  // Добавить в хвост
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // Добавить в голову
    deque.offerFirst(1)

    /* Просмотреть элементы */
    val peekFirst = deque.peekFirst() // Элемент в голове
    val peekLast = deque.peekLast()   // Элемент в хвосте

    /* Извлечь элементы из очереди */
    val popFirst = deque.pollFirst() // Извлечь элемент из головы
    val popLast = deque.pollLast()   // Извлечь элемент из хвоста

    /* Получить длину двусторонней очереди */
    val size = deque.size

    /* Проверить, пуста ли двусторонняя очередь */
    val isEmpty = deque.isEmpty()
    ```

=== "Ruby"

    ```ruby title="deque.rb"
    # Инициализация двусторонней очереди
    # В Ruby нет встроенной двусторонней очереди, поэтому можно использовать Array как двустороннюю очередь
    deque = []

    # Поместить элементы в очередь
    deque << 2
    deque << 5
    deque << 4
    # Обрати внимание: поскольку это массив, метод Array#unshift имеет сложность O(n)
    deque.unshift(3)
    deque.unshift(1)

    # Просмотреть элементы
    peek_first = deque.first
    peek_last = deque.last

    # Извлечь элементы из очереди
    # Обрати внимание: поскольку это массив, метод Array#shift имеет сложность O(n)
    pop_front = deque.shift
    pop_back = deque.pop

    # Получить длину двусторонней очереди
    size = deque.length

    # Проверить, пуста ли двусторонняя очередь
    is_empty = size.zero?
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20deq.append%282%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%3D%22%2C%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20rear%20%3D%22%2C%20rear%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20pop_front%20%3D%22%2C%20pop_front%29%0A%20%20%20%20print%28%22deque%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20%3D%22%2C%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%2C%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20pop_rear%20%3D%22%2C%20pop_rear%29%0A%20%20%20%20print%28%22deque%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%3D%22%2C%20deq%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 5.3.2 &nbsp; Реализация двусторонней очереди *

Реализация двусторонней очереди похожа на реализацию обычной очереди: в качестве базовой структуры данных можно выбрать связный список или массив.

### 1. &nbsp; Реализация на основе двусвязного списка

Вспомним предыдущий раздел: там мы использовали обычный односвязный список для реализации очереди, потому что он позволяет удобно удалять головной узел (это соответствует операции dequeue) и добавлять новый узел после хвостового узла (это соответствует операции enqueue).

Для двусторонней очереди и голова, и хвост допускают операции добавления и удаления элементов. Иначе говоря, двусторонняя очередь требует реализации еще одного симметричного направления операций. Поэтому в качестве базовой структуры данных двусторонней очереди мы используем "двусвязный список".

Как показано на рисунках ниже, мы рассматриваем головной и хвостовой узлы двусвязного списка как голову и хвост двусторонней очереди и одновременно реализуем функции добавления и удаления узлов с обеих сторон.

=== "LinkedListDeque"
    ![Операции enqueue и dequeue для двусторонней очереди на связном списке](deque.assets/linkedlist_deque_step1.png){ class="animation-figure" }

=== "push_last()"
    ![linkedlist_deque_push_last](deque.assets/linkedlist_deque_step2_push_last.png){ class="animation-figure" }

=== "push_first()"
    ![linkedlist_deque_push_first](deque.assets/linkedlist_deque_step3_push_first.png){ class="animation-figure" }

=== "pop_last()"
    ![linkedlist_deque_pop_last](deque.assets/linkedlist_deque_step4_pop_last.png){ class="animation-figure" }

=== "pop_first()"
    ![linkedlist_deque_pop_first](deque.assets/linkedlist_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> Рисунок 5-8 &nbsp; Операции enqueue и dequeue для двусторонней очереди на связном списке </p>

Код реализации приведен ниже:

=== "Python"

    ```python title="linkedlist_deque.py"
    class ListNode:
        """Узел двусвязного списка"""

        def __init__(self, val: int):
            """Конструктор"""
            self.val: int = val
            self.next: ListNode | None = None  # Ссылка на узел-преемник
            self.prev: ListNode | None = None  # Ссылка на узел-предшественник

    class LinkedListDeque:
        """Двусторонняя очередь на основе двусвязного списка"""

        def __init__(self):
            """Конструктор"""
            self._front: ListNode | None = None  # Головной узел front
            self._rear: ListNode | None = None  # Хвостовой узел rear
            self._size: int = 0  # Длина двусторонней очереди

        def size(self) -> int:
            """Получение длины двусторонней очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверка, пуста ли двусторонняя очередь"""
            return self._size == 0

        def push(self, num: int, is_front: bool):
            """Операция добавления в очередь"""
            node = ListNode(num)
            # Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if self.is_empty():
                self._front = self._rear = node
            # Операция добавления в голову очереди
            elif is_front:
                # Добавить node в голову списка
                self._front.prev = node
                node.next = self._front
                self._front = node  # Обновить головной узел
            # Операция добавления в хвост очереди
            else:
                # Добавить node в хвост списка
                self._rear.next = node
                node.prev = self._rear
                self._rear = node  # Обновить хвостовой узел
            self._size += 1  # Обновить длину очереди

        def push_first(self, num: int):
            """Добавление в голову очереди"""
            self.push(num, True)

        def push_last(self, num: int):
            """Добавление в хвост очереди"""
            self.push(num, False)

        def pop(self, is_front: bool) -> int:
            """Операция извлечения из очереди"""
            if self.is_empty():
                raise IndexError("двусторонняя очередь пуста")
            # Операция извлечения из головы очереди
            if is_front:
                val: int = self._front.val  # Временно сохранить значение головного узла
                # Удалить головной узел
                fnext: ListNode | None = self._front.next
                if fnext is not None:
                    fnext.prev = None
                    self._front.next = None
                self._front = fnext  # Обновить головной узел
            # Операция извлечения из хвоста очереди
            else:
                val: int = self._rear.val  # Временно сохранить значение хвостового узла
                # Удалить хвостовой узел
                rprev: ListNode | None = self._rear.prev
                if rprev is not None:
                    rprev.next = None
                    self._rear.prev = None
                self._rear = rprev  # Обновить хвостовой узел
            self._size -= 1  # Обновить длину очереди
            return val

        def pop_first(self) -> int:
            """Извлечение из головы очереди"""
            return self.pop(True)

        def pop_last(self) -> int:
            """Извлечение из хвоста очереди"""
            return self.pop(False)

        def peek_first(self) -> int:
            """Доступ к элементу в начале очереди"""
            if self.is_empty():
                raise IndexError("двусторонняя очередь пуста")
            return self._front.val

        def peek_last(self) -> int:
            """Доступ к элементу в конце очереди"""
            if self.is_empty():
                raise IndexError("двусторонняя очередь пуста")
            return self._rear.val

        def to_array(self) -> list[int]:
            """Вернуть массив для вывода"""
            node = self._front
            res = [0] * self.size()
            for i in range(self.size()):
                res[i] = node.val
                node = node.next
            return res
    ```

=== "C++"

    ```cpp title="linkedlist_deque.cpp"
    /* Узел двусвязного списка */
    struct DoublyListNode {
        int val;              // Значение узла
        DoublyListNode *next; // Указатель на узел-преемник
        DoublyListNode *prev; // Указатель на узел-предшественник
        DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
        }
    };

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
      private:
        DoublyListNode *front, *rear; // Головной узел front, хвостовой узел rear
        int queSize = 0;              // Длина двусторонней очереди

      public:
        /* Конструктор */
        LinkedListDeque() : front(nullptr), rear(nullptr) {
        }

        /* Метод-деструктор */
        ~LinkedListDeque() {
            // Обходить связный список, удалять узлы и освобождать память
            DoublyListNode *pre, *cur = front;
            while (cur != nullptr) {
                pre = cur;
                cur = cur->next;
                delete pre;
            }
        }

        /* Получение длины двусторонней очереди */
        int size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        bool isEmpty() {
            return size() == 0;
        }

        /* Операция добавления в очередь */
        void push(int num, bool isFront) {
            DoublyListNode *node = new DoublyListNode(num);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (isEmpty())
                front = rear = node;
            // Операция добавления в голову очереди
            else if (isFront) {
                // Добавить node в голову списка
                front->prev = node;
                node->next = front;
                front = node; // Обновить головной узел
            // Операция добавления в хвост очереди
            } else {
                // Добавить node в хвост списка
                rear->next = node;
                node->prev = rear;
                rear = node; // Обновить хвостовой узел
            }
            queSize++; // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        void pushFirst(int num) {
            push(num, true);
        }

        /* Добавление в хвост очереди */
        void pushLast(int num) {
            push(num, false);
        }

        /* Операция извлечения из очереди */
        int pop(bool isFront) {
            if (isEmpty())
                throw out_of_range("очередь пуста");
            int val;
            // Операция извлечения из головы очереди
            if (isFront) {
                val = front->val; // Временно сохранить значение головного узла
                // Удалить головной узел
                DoublyListNode *fNext = front->next;
                if (fNext != nullptr) {
                    fNext->prev = nullptr;
                    front->next = nullptr;
                }
                delete front;
                front = fNext; // Обновить головной узел
            // Операция извлечения из хвоста очереди
            } else {
                val = rear->val; // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                DoublyListNode *rPrev = rear->prev;
                if (rPrev != nullptr) {
                    rPrev->next = nullptr;
                    rear->prev = nullptr;
                }
                delete rear;
                rear = rPrev; // Обновить хвостовой узел
            }
            queSize--; // Обновить длину очереди
            return val;
        }

        /* Извлечение из головы очереди */
        int popFirst() {
            return pop(true);
        }

        /* Извлечение из хвоста очереди */
        int popLast() {
            return pop(false);
        }

        /* Доступ к элементу в начале очереди */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("двусторонняя очередь пуста");
            return front->val;
        }

        /* Доступ к элементу в конце очереди */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("двусторонняя очередь пуста");
            return rear->val;
        }

        /* Вернуть массив для вывода */
        vector<int> toVector() {
            DoublyListNode *node = front;
            vector<int> res(size());
            for (int i = 0; i < res.size(); i++) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_deque.java"
    /* Узел двусвязного списка */
    class ListNode {
        int val; // Значение узла
        ListNode next; // Ссылка на узел-преемник
        ListNode prev; // Ссылка на узел-предшественник

        ListNode(int val) {
            this.val = val;
            prev = next = null;
        }
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        private ListNode front, rear; // Головной узел front, хвостовой узел rear
        private int queSize = 0; // Длина двусторонней очереди

        public LinkedListDeque() {
            front = rear = null;
        }

        /* Получение длины двусторонней очереди */
        public int size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Операция добавления в очередь */
        private void push(int num, boolean isFront) {
            ListNode node = new ListNode(num);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (isEmpty())
                front = rear = node;
            // Операция добавления в голову очереди
            else if (isFront) {
                // Добавить node в голову списка
                front.prev = node;
                node.next = front;
                front = node; // Обновить головной узел
            // Операция добавления в хвост очереди
            } else {
                // Добавить node в хвост списка
                rear.next = node;
                node.prev = rear;
                rear = node; // Обновить хвостовой узел
            }
            queSize++; // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        public void pushFirst(int num) {
            push(num, true);
        }

        /* Добавление в хвост очереди */
        public void pushLast(int num) {
            push(num, false);
        }

        /* Операция извлечения из очереди */
        private int pop(boolean isFront) {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            int val;
            // Операция извлечения из головы очереди
            if (isFront) {
                val = front.val; // Временно сохранить значение головного узла
                // Удалить головной узел
                ListNode fNext = front.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front.next = null;
                }
                front = fNext; // Обновить головной узел
            // Операция извлечения из хвоста очереди
            } else {
                val = rear.val; // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                ListNode rPrev = rear.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear.prev = null;
                }
                rear = rPrev; // Обновить хвостовой узел
            }
            queSize--; // Обновить длину очереди
            return val;
        }

        /* Извлечение из головы очереди */
        public int popFirst() {
            return pop(true);
        }

        /* Извлечение из хвоста очереди */
        public int popLast() {
            return pop(false);
        }

        /* Доступ к элементу в начале очереди */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* Доступ к элементу в конце очереди */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return rear.val;
        }

        /* Вернуть массив для вывода */
        public int[] toArray() {
            ListNode node = front;
            int[] res = new int[size()];
            for (int i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_deque.cs"
    /* Узел двусвязного списка */
    class ListNode(int val) {
        public int val = val;       // Значение узла
        public ListNode? next = null; // Ссылка на узел-преемник
        public ListNode? prev = null; // Ссылка на узел-предшественник
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        ListNode? front, rear; // Головной узел front, хвостовой узел rear
        int queSize = 0;      // Длина двусторонней очереди

        public LinkedListDeque() {
            front = null;
            rear = null;
        }

        /* Получение длины двусторонней очереди */
        public int Size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Операция добавления в очередь */
        void Push(int num, bool isFront) {
            ListNode node = new(num);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (IsEmpty()) {
                front = node;
                rear = node;
            }
            // Операция добавления в голову очереди
            else if (isFront) {
                // Добавить node в голову списка
                front!.prev = node;
                node.next = front;
                front = node; // Обновить головной узел
            }
            // Операция добавления в хвост очереди
            else {
                // Добавить node в хвост списка
                rear!.next = node;
                node.prev = rear;
                rear = node;  // Обновить хвостовой узел
            }

            queSize++; // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        public void PushFirst(int num) {
            Push(num, true);
        }

        /* Добавление в хвост очереди */
        public void PushLast(int num) {
            Push(num, false);
        }

        /* Операция извлечения из очереди */
        int? Pop(bool isFront) {
            if (IsEmpty())
                throw new Exception();
            int? val;
            // Операция извлечения из головы очереди
            if (isFront) {
                val = front?.val; // Временно сохранить значение головного узла
                // Удалить головной узел
                ListNode? fNext = front?.next;
                if (fNext != null) {
                    fNext.prev = null;
                    front!.next = null;
                }
                front = fNext;   // Обновить головной узел
            }
            // Операция извлечения из хвоста очереди
            else {
                val = rear?.val;  // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                ListNode? rPrev = rear?.prev;
                if (rPrev != null) {
                    rPrev.next = null;
                    rear!.prev = null;
                }
                rear = rPrev;    // Обновить хвостовой узел
            }

            queSize--; // Обновить длину очереди
            return val;
        }

        /* Извлечение из головы очереди */
        public int? PopFirst() {
            return Pop(true);
        }

        /* Извлечение из хвоста очереди */
        public int? PopLast() {
            return Pop(false);
        }

        /* Доступ к элементу в начале очереди */
        public int? PeekFirst() {
            if (IsEmpty())
                throw new Exception();
            return front?.val;
        }

        /* Доступ к элементу в конце очереди */
        public int? PeekLast() {
            if (IsEmpty())
                throw new Exception();
            return rear?.val;
        }

        /* Вернуть массив для вывода */
        public int?[] ToArray() {
            ListNode? node = front;
            int?[] res = new int?[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node?.val;
                node = node?.next;
            }

            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_deque.go"
    /* Двусторонняя очередь на основе двусвязного списка */
    type linkedListDeque struct {
        // Использовать встроенный пакет list
        data *list.List
    }

    /* Инициализировать двустороннюю очередь */
    func newLinkedListDeque() *linkedListDeque {
        return &linkedListDeque{
            data: list.New(),
        }
    }

    /* Поместить элемент в голову очереди */
    func (s *linkedListDeque) pushFirst(value any) {
        s.data.PushFront(value)
    }

    /* Поместить элемент в хвост очереди */
    func (s *linkedListDeque) pushLast(value any) {
        s.data.PushBack(value)
    }

    /* Извлечь элемент из головы очереди */
    func (s *linkedListDeque) popFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* Извлечь элемент из хвоста очереди */
    func (s *linkedListDeque) popLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* Доступ к элементу в начале очереди */
    func (s *linkedListDeque) peekFirst() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* Доступ к элементу в конце очереди */
    func (s *linkedListDeque) peekLast() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* Получение длины очереди */
    func (s *linkedListDeque) size() int {
        return s.data.Len()
    }

    /* Проверка, пуста ли очередь */
    func (s *linkedListDeque) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Получить List для вывода */
    func (s *linkedListDeque) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_deque.swift"
    /* Узел двусвязного списка */
    class ListNode {
        var val: Int // Значение узла
        var next: ListNode? // Ссылка на узел-преемник
        weak var prev: ListNode? // Ссылка на узел-предшественник

        init(val: Int) {
            self.val = val
        }
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        private var front: ListNode? // Головной узел front
        private var rear: ListNode? // Хвостовой узел rear
        private var _size: Int // Длина двусторонней очереди

        init() {
            _size = 0
        }

        /* Получение длины двусторонней очереди */
        func size() -> Int {
            _size
        }

        /* Проверка, пуста ли двусторонняя очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Операция добавления в очередь */
        private func push(num: Int, isFront: Bool) {
            let node = ListNode(val: num)
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if isEmpty() {
                front = node
                rear = node
            }
            // Операция добавления в голову очереди
            else if isFront {
                // Добавить node в голову списка
                front?.prev = node
                node.next = front
                front = node // Обновить головной узел
            }
            // Операция добавления в хвост очереди
            else {
                // Добавить node в хвост списка
                rear?.next = node
                node.prev = rear
                rear = node // Обновить хвостовой узел
            }
            _size += 1 // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        func pushFirst(num: Int) {
            push(num: num, isFront: true)
        }

        /* Добавление в хвост очереди */
        func pushLast(num: Int) {
            push(num: num, isFront: false)
        }

        /* Операция извлечения из очереди */
        private func pop(isFront: Bool) -> Int {
            if isEmpty() {
                fatalError("двусторонняя очередь пуста")
            }
            let val: Int
            // Операция извлечения из головы очереди
            if isFront {
                val = front!.val // Временно сохранить значение головного узла
                // Удалить головной узел
                let fNext = front?.next
                if fNext != nil {
                    fNext?.prev = nil
                    front?.next = nil
                }
                front = fNext // Обновить головной узел
            }
            // Операция извлечения из хвоста очереди
            else {
                val = rear!.val // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                let rPrev = rear?.prev
                if rPrev != nil {
                    rPrev?.next = nil
                    rear?.prev = nil
                }
                rear = rPrev // Обновить хвостовой узел
            }
            _size -= 1 // Обновить длину очереди
            return val
        }

        /* Извлечение из головы очереди */
        func popFirst() -> Int {
            pop(isFront: true)
        }

        /* Извлечение из хвоста очереди */
        func popLast() -> Int {
            pop(isFront: false)
        }

        /* Доступ к элементу в начале очереди */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("двусторонняя очередь пуста")
            }
            return front!.val
        }

        /* Доступ к элементу в конце очереди */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("двусторонняя очередь пуста")
            }
            return rear!.val
        }

        /* Вернуть массив для вывода */
        func toArray() -> [Int] {
            var node = front
            var res = Array(repeating: 0, count: size())
            for i in res.indices {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_deque.js"
    /* Узел двусвязного списка */
    class ListNode {
        prev; // Ссылка на узел-предшественник (указатель)
        next; // Ссылка на узел-преемник (указатель)
        val; // Значение узла

        constructor(val) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        #front; // Головной узел front
        #rear; // Хвостовой узел rear
        #queSize; // Длина двусторонней очереди

        constructor() {
            this.#front = null;
            this.#rear = null;
            this.#queSize = 0;
        }

        /* Операция добавления в хвост очереди */
        pushLast(val) {
            const node = new ListNode(val);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // Добавить node в хвост списка
                this.#rear.next = node;
                node.prev = this.#rear;
                this.#rear = node; // Обновить хвостовой узел
            }
            this.#queSize++;
        }

        /* Операция добавления в голову очереди */
        pushFirst(val) {
            const node = new ListNode(val);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (this.#queSize === 0) {
                this.#front = node;
                this.#rear = node;
            } else {
                // Добавить node в голову списка
                this.#front.prev = node;
                node.next = this.#front;
                this.#front = node; // Обновить головной узел
            }
            this.#queSize++;
        }

        /* Операция извлечения из хвоста очереди */
        popLast() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#rear.val; // Сохранить значение хвостового узла
            // Удалить хвостовой узел
            let temp = this.#rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.#rear.prev = null;
            }
            this.#rear = temp; // Обновить хвостовой узел
            this.#queSize--;
            return value;
        }

        /* Операция извлечения из головы очереди */
        popFirst() {
            if (this.#queSize === 0) {
                return null;
            }
            const value = this.#front.val; // Сохранить значение хвостового узла
            // Удалить головной узел
            let temp = this.#front.next;
            if (temp !== null) {
                temp.prev = null;
                this.#front.next = null;
            }
            this.#front = temp; // Обновить головной узел
            this.#queSize--;
            return value;
        }

        /* Доступ к элементу в конце очереди */
        peekLast() {
            return this.#queSize === 0 ? null : this.#rear.val;
        }

        /* Доступ к элементу в начале очереди */
        peekFirst() {
            return this.#queSize === 0 ? null : this.#front.val;
        }

        /* Получение длины двусторонней очереди */
        size() {
            return this.#queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* Вывести двустороннюю очередь */
        print() {
            const arr = [];
            let temp = this.#front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_deque.ts"
    /* Узел двусвязного списка */
    class ListNode {
        prev: ListNode; // Ссылка на узел-предшественник (указатель)
        next: ListNode; // Ссылка на узел-преемник (указатель)
        val: number; // Значение узла

        constructor(val: number) {
            this.val = val;
            this.next = null;
            this.prev = null;
        }
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        private front: ListNode; // Головной узел front
        private rear: ListNode; // Хвостовой узел rear
        private queSize: number; // Длина двусторонней очереди

        constructor() {
            this.front = null;
            this.rear = null;
            this.queSize = 0;
        }

        /* Операция добавления в хвост очереди */
        pushLast(val: number): void {
            const node: ListNode = new ListNode(val);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // Добавить node в хвост списка
                this.rear.next = node;
                node.prev = this.rear;
                this.rear = node; // Обновить хвостовой узел
            }
            this.queSize++;
        }

        /* Операция добавления в голову очереди */
        pushFirst(val: number): void {
            const node: ListNode = new ListNode(val);
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (this.queSize === 0) {
                this.front = node;
                this.rear = node;
            } else {
                // Добавить node в голову списка
                this.front.prev = node;
                node.next = this.front;
                this.front = node; // Обновить головной узел
            }
            this.queSize++;
        }

        /* Операция извлечения из хвоста очереди */
        popLast(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.rear.val; // Сохранить значение хвостового узла
            // Удалить хвостовой узел
            let temp: ListNode = this.rear.prev;
            if (temp !== null) {
                temp.next = null;
                this.rear.prev = null;
            }
            this.rear = temp; // Обновить хвостовой узел
            this.queSize--;
            return value;
        }

        /* Операция извлечения из головы очереди */
        popFirst(): number {
            if (this.queSize === 0) {
                return null;
            }
            const value: number = this.front.val; // Сохранить значение хвостового узла
            // Удалить головной узел
            let temp: ListNode = this.front.next;
            if (temp !== null) {
                temp.prev = null;
                this.front.next = null;
            }
            this.front = temp; // Обновить головной узел
            this.queSize--;
            return value;
        }

        /* Доступ к элементу в конце очереди */
        peekLast(): number {
            return this.queSize === 0 ? null : this.rear.val;
        }

        /* Доступ к элементу в начале очереди */
        peekFirst(): number {
            return this.queSize === 0 ? null : this.front.val;
        }

        /* Получение длины двусторонней очереди */
        size(): number {
            return this.queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* Вывести двустороннюю очередь */
        print(): void {
            const arr: number[] = [];
            let temp: ListNode = this.front;
            while (temp !== null) {
                arr.push(temp.val);
                temp = temp.next;
            }
            console.log('[' + arr.join(', ') + ']');
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_deque.dart"
    /* Узел двусвязного списка */
    class ListNode {
      int val; // Значение узла
      ListNode? next; // Ссылка на узел-преемник
      ListNode? prev; // Ссылка на узел-предшественник

      ListNode(this.val, {this.next, this.prev});
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
      late ListNode? _front; // Головной узел _front
      late ListNode? _rear; // Хвостовой узел _rear
      int _queSize = 0; // Длина двусторонней очереди

      LinkedListDeque() {
        this._front = null;
        this._rear = null;
      }

      /* Получить длину двусторонней очереди */
      int size() {
        return this._queSize;
      }

      /* Проверка, пуста ли двусторонняя очередь */
      bool isEmpty() {
        return size() == 0;
      }

      /* Операция добавления в очередь */
      void push(int _num, bool isFront) {
        final ListNode node = ListNode(_num);
        if (isEmpty()) {
          // Если связный список пуст, пусть _front и _rear оба указывают на node
          _front = _rear = node;
        } else if (isFront) {
          // Операция добавления в голову очереди
          // Добавить node в начало связного списка
          _front!.prev = node;
          node.next = _front;
          _front = node; // Обновить головной узел
        } else {
          // Операция добавления в хвост очереди
          // Добавить node в конец связного списка
          _rear!.next = node;
          node.prev = _rear;
          _rear = node; // Обновить хвостовой узел
        }
        _queSize++; // Обновить длину очереди
      }

      /* Добавление в голову очереди */
      void pushFirst(int _num) {
        push(_num, true);
      }

      /* Добавление в хвост очереди */
      void pushLast(int _num) {
        push(_num, false);
      }

      /* Операция извлечения из очереди */
      int? pop(bool isFront) {
        // Если очередь пуста, сразу вернуть null
        if (isEmpty()) {
          return null;
        }
        final int val;
        if (isFront) {
          // Операция извлечения из головы очереди
          val = _front!.val; // Временно сохранить значение головного узла
          // Удалить головной узел
          ListNode? fNext = _front!.next;
          if (fNext != null) {
            fNext.prev = null;
            _front!.next = null;
          }
          _front = fNext; // Обновить головной узел
        } else {
          // Операция извлечения из хвоста очереди
          val = _rear!.val; // Временно сохранить значение хвостового узла
          // Удалить хвостовой узел
          ListNode? rPrev = _rear!.prev;
          if (rPrev != null) {
            rPrev.next = null;
            _rear!.prev = null;
          }
          _rear = rPrev; // Обновить хвостовой узел
        }
        _queSize--; // Обновить длину очереди
        return val;
      }

      /* Извлечение из головы очереди */
      int? popFirst() {
        return pop(true);
      }

      /* Извлечение из хвоста очереди */
      int? popLast() {
        return pop(false);
      }

      /* Доступ к элементу в начале очереди */
      int? peekFirst() {
        return _front?.val;
      }

      /* Доступ к элементу в конце очереди */
      int? peekLast() {
        return _rear?.val;
      }

      /* Вернуть массив для вывода */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> res = [];
        for (int i = 0; i < _queSize; i++) {
          res.add(node!.val);
          node = node.next;
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_deque.rs"
    /* Узел двусвязного списка */
    pub struct ListNode<T> {
        pub val: T,                                 // Значение узла
        pub next: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на узел-преемник
        pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на узел-предшественник
    }

    impl<T> ListNode<T> {
        pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
            Rc::new(RefCell::new(ListNode {
                val,
                next: None,
                prev: None,
            }))
        }
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    #[allow(dead_code)]
    pub struct LinkedListDeque<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>, // Головной узел front
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // Хвостовой узел rear
        que_size: usize,                         // Длина двусторонней очереди
    }

    impl<T: Copy> LinkedListDeque<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0,
            }
        }

        /* Получение длины двусторонней очереди */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* Операция добавления в очередь */
        fn push(&mut self, num: T, is_front: bool) {
            let node = ListNode::new(num);
            // Операция добавления в голову очереди
            if is_front {
                match self.front.take() {
                    // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
                    None => {
                        self.rear = Some(node.clone());
                        self.front = Some(node);
                    }
                    // Добавить node в голову списка
                    Some(old_front) => {
                        old_front.borrow_mut().prev = Some(node.clone());
                        node.borrow_mut().next = Some(old_front);
                        self.front = Some(node); // Обновить головной узел
                    }
                }
            }
            // Операция добавления в хвост очереди
            else {
                match self.rear.take() {
                    // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
                    None => {
                        self.front = Some(node.clone());
                        self.rear = Some(node);
                    }
                    // Добавить node в хвост списка
                    Some(old_rear) => {
                        old_rear.borrow_mut().next = Some(node.clone());
                        node.borrow_mut().prev = Some(old_rear);
                        self.rear = Some(node); // Обновить хвостовой узел
                    }
                }
            }
            self.que_size += 1; // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        pub fn push_first(&mut self, num: T) {
            self.push(num, true);
        }

        /* Добавление в хвост очереди */
        pub fn push_last(&mut self, num: T) {
            self.push(num, false);
        }

        /* Операция извлечения из очереди */
        fn pop(&mut self, is_front: bool) -> Option<T> {
            // Если очередь пуста, сразу вернуть None
            if self.is_empty() {
                return None;
            };
            // Операция извлечения из головы очереди
            if is_front {
                self.front.take().map(|old_front| {
                    match old_front.borrow_mut().next.take() {
                        Some(new_front) => {
                            new_front.borrow_mut().prev.take();
                            self.front = Some(new_front); // Обновить головной узел
                        }
                        None => {
                            self.rear.take();
                        }
                    }
                    self.que_size -= 1; // Обновить длину очереди
                    old_front.borrow().val
                })
            }
            // Операция извлечения из хвоста очереди
            else {
                self.rear.take().map(|old_rear| {
                    match old_rear.borrow_mut().prev.take() {
                        Some(new_rear) => {
                            new_rear.borrow_mut().next.take();
                            self.rear = Some(new_rear); // Обновить хвостовой узел
                        }
                        None => {
                            self.front.take();
                        }
                    }
                    self.que_size -= 1; // Обновить длину очереди
                    old_rear.borrow().val
                })
            }
        }

        /* Извлечение из головы очереди */
        pub fn pop_first(&mut self) -> Option<T> {
            return self.pop(true);
        }

        /* Извлечение из хвоста очереди */
        pub fn pop_last(&mut self) -> Option<T> {
            return self.pop(false);
        }

        /* Доступ к элементу в начале очереди */
        pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* Доступ к элементу в конце очереди */
        pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.rear.as_ref()
        }

        /* Вернуть массив для вывода */
        pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            let mut res: Vec<T> = Vec::new();
            fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
                if let Some(cur) = cur {
                    res.push(cur.borrow().val);
                    recur(cur.borrow().next.as_ref(), res);
                }
            }

            recur(head, &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="linkedlist_deque.c"
    /* Узел двусвязного списка */
    typedef struct DoublyListNode {
        int val;                     // Значение узла
        struct DoublyListNode *next; // Узел-преемник
        struct DoublyListNode *prev; // Узел-предшественник
    } DoublyListNode;

    /* Конструктор */
    DoublyListNode *newDoublyListNode(int num) {
        DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
        new->val = num;
        new->next = NULL;
        new->prev = NULL;
        return new;
    }

    /* Деструктор */
    void delDoublyListNode(DoublyListNode *node) {
        free(node);
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    typedef struct {
        DoublyListNode *front, *rear; // Головной узел front, хвостовой узел rear
        int queSize;                  // Длина двусторонней очереди
    } LinkedListDeque;

    /* Конструктор */
    LinkedListDeque *newLinkedListDeque() {
        LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
        deque->front = NULL;
        deque->rear = NULL;
        deque->queSize = 0;
        return deque;
    }

    /* Деструктор */
    void delLinkedListdeque(LinkedListDeque *deque) {
        // Освободить все узлы
        for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
            DoublyListNode *tmp = deque->front;
            deque->front = deque->front->next;
            free(tmp);
        }
        // Освободить структуру deque
        free(deque);
    }

    /* Получение длины очереди */
    int size(LinkedListDeque *deque) {
        return deque->queSize;
    }

    /* Проверка, пуста ли очередь */
    bool empty(LinkedListDeque *deque) {
        return (size(deque) == 0);
    }

    /* Поместить в очередь */
    void push(LinkedListDeque *deque, int num, bool isFront) {
        DoublyListNode *node = newDoublyListNode(num);
        // Если связный список пуст, пусть front и rear оба указывают на node
        if (empty(deque)) {
            deque->front = deque->rear = node;
        }
        // Операция добавления в голову очереди
        else if (isFront) {
            // Добавить node в голову списка
            deque->front->prev = node;
            node->next = deque->front;
            deque->front = node; // Обновить головной узел
        }
        // Операция добавления в хвост очереди
        else {
            // Добавить node в хвост списка
            deque->rear->next = node;
            node->prev = deque->rear;
            deque->rear = node;
        }
        deque->queSize++; // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    void pushFirst(LinkedListDeque *deque, int num) {
        push(deque, num, true);
    }

    /* Добавление в хвост очереди */
    void pushLast(LinkedListDeque *deque, int num) {
        push(deque, num, false);
    }

    /* Доступ к элементу в начале очереди */
    int peekFirst(LinkedListDeque *deque) {
        assert(size(deque) && deque->front);
        return deque->front->val;
    }

    /* Доступ к элементу в конце очереди */
    int peekLast(LinkedListDeque *deque) {
        assert(size(deque) && deque->rear);
        return deque->rear->val;
    }

    /* Извлечь из очереди */
    int pop(LinkedListDeque *deque, bool isFront) {
        if (empty(deque))
            return -1;
        int val;
        // Операция извлечения из головы очереди
        if (isFront) {
            val = peekFirst(deque); // Временно сохранить значение головного узла
            DoublyListNode *fNext = deque->front->next;
            if (fNext) {
                fNext->prev = NULL;
                deque->front->next = NULL;
            }
            delDoublyListNode(deque->front);
            deque->front = fNext; // Обновить головной узел
        }
        // Операция извлечения из хвоста очереди
        else {
            val = peekLast(deque); // Временно сохранить значение хвостового узла
            DoublyListNode *rPrev = deque->rear->prev;
            if (rPrev) {
                rPrev->next = NULL;
                deque->rear->prev = NULL;
            }
            delDoublyListNode(deque->rear);
            deque->rear = rPrev; // Обновить хвостовой узел
        }
        deque->queSize--; // Обновить длину очереди
        return val;
    }

    /* Извлечение из головы очереди */
    int popFirst(LinkedListDeque *deque) {
        return pop(deque, true);
    }

    /* Извлечение из хвоста очереди */
    int popLast(LinkedListDeque *deque) {
        return pop(deque, false);
    }

    /* Вывести очередь */
    void printLinkedListDeque(LinkedListDeque *deque) {
        int *arr = malloc(sizeof(int) * deque->queSize);
        // Скопировать данные связного списка в массив
        int i;
        DoublyListNode *node;
        for (i = 0, node = deque->front; i < deque->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, deque->queSize);
        free(arr);
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_deque.kt"
    /* Узел двусвязного списка */
    class ListNode(var _val: Int) {
        // Значение узла
        var next: ListNode? = null // Ссылка на узел-преемник
        var prev: ListNode? = null // Ссылка на узел-предшественник
    }

    /* Двусторонняя очередь на основе двусвязного списка */
    class LinkedListDeque {
        private var front: ListNode? = null // Головной узел front
        private var rear: ListNode? = null // Хвостовой узел rear
        private var queSize: Int = 0 // Длина двусторонней очереди

        /* Получение длины двусторонней очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверка, пуста ли двусторонняя очередь */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Операция добавления в очередь */
        fun push(num: Int, isFront: Boolean) {
            val node = ListNode(num)
            // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
            if (isEmpty()) {
                rear = node
                front = rear
                // Операция добавления в голову очереди
            } else if (isFront) {
                // Добавить node в голову списка
                front?.prev = node
                node.next = front
                front = node // Обновить головной узел
                // Операция добавления в хвост очереди
            } else {
                // Добавить node в хвост списка
                rear?.next = node
                node.prev = rear
                rear = node // Обновить хвостовой узел
            }
            queSize++ // Обновить длину очереди
        }

        /* Добавление в голову очереди */
        fun pushFirst(num: Int) {
            push(num, true)
        }

        /* Добавление в хвост очереди */
        fun pushLast(num: Int) {
            push(num, false)
        }

        /* Операция извлечения из очереди */
        fun pop(isFront: Boolean): Int {
            if (isEmpty()) 
                throw IndexOutOfBoundsException()
            val _val: Int
            // Операция извлечения из головы очереди
            if (isFront) {
                _val = front!!._val // Временно сохранить значение головного узла
                // Удалить головной узел
                val fNext = front!!.next
                if (fNext != null) {
                    fNext.prev = null
                    front!!.next = null
                }
                front = fNext // Обновить головной узел
                // Операция извлечения из хвоста очереди
            } else {
                _val = rear!!._val // Временно сохранить значение хвостового узла
                // Удалить хвостовой узел
                val rPrev = rear!!.prev
                if (rPrev != null) {
                    rPrev.next = null
                    rear!!.prev = null
                }
                rear = rPrev // Обновить хвостовой узел
            }
            queSize-- // Обновить длину очереди
            return _val
        }

        /* Извлечение из головы очереди */
        fun popFirst(): Int {
            return pop(true)
        }

        /* Извлечение из хвоста очереди */
        fun popLast(): Int {
            return pop(false)
        }

        /* Доступ к элементу в начале очереди */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* Доступ к элементу в конце очереди */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return rear!!._val
        }

        /* Вернуть массив для вывода */
        fun toArray(): IntArray {
            var node = front
            val res = IntArray(size())
            for (i in res.indices) {
                res[i] = node!!._val
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_deque.rb"
    =begin
    File: linkedlist_deque.rb
    Created Time: 2024-04-06
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    ### Узел двусвязного списка
    class ListNode
      attr_accessor :val
      attr_accessor :next # Ссылка на узел-преемник
      attr_accessor :prev # Ссылка на узел-предшественник

      ### Конструктор ###
      def initialize(val)
        @val = val
      end
    end

    ### Двусторонняя очередь на основе двусвязного списка ###
    class LinkedListDeque
      ### Получение длины двусторонней очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize
        @front = nil  # Головной узел front
        @rear = nil   # Хвостовой узел rear
        @size = 0     # Длина двусторонней очереди
      end

      ### Проверка, пуста ли двусторонняя очередь ###
      def is_empty?
        size.zero?
      end

      ### Операция добавления в очередь ###
      def push(num, is_front)
        node = ListNode.new(num)
        # Если связный список пуст, пусть front и rear оба указывают на node
        if is_empty?
          @front = @rear = node
        # Операция добавления в голову очереди
        elsif is_front
          # Добавить node в голову списка
          @front.prev = node
          node.next = @front
          @front = node # Обновить головной узел
        # Операция добавления в хвост очереди
        else
          # Добавить node в хвост списка
          @rear.next = node
          node.prev = @rear
          @rear = node # Обновить хвостовой узел
        end
        @size += 1 # Обновить длину очереди
      end

      ### Добавление в голову очереди ###
      def push_first(num)
        push(num, true)
      end

      ### Добавление в хвост очереди ###
      def push_last(num)
        push(num, false)
      end

      ### Операция извлечения из очереди ###
      def pop(is_front)
        raise IndexError, 'двусторонняя очередь пуста' if is_empty?

        # Операция извлечения из головы очереди
        if is_front
          val = @front.val # Временно сохранить значение головного узла
          # Удалить головной узел
          fnext = @front.next
          unless fnext.nil?
            fnext.prev = nil
            @front.next = nil
          end
          @front = fnext # Обновить головной узел
        # Операция извлечения из хвоста очереди
        else
          val = @rear.val # Временно сохранить значение хвостового узла
          # Удалить хвостовой узел
          rprev = @rear.prev
          unless rprev.nil?
            rprev.next = nil
            @rear.prev = nil
          end
          @rear = rprev # Обновить хвостовой узел
        end
        @size -= 1 # Обновить длину очереди

        val
      end

      ### Извлечение из головы очереди ###
      def pop_first
        pop(true)
      end

      ### Извлечение из головы очереди ###
      def pop_last
        pop(false)
      end

      ### Доступ к элементу в начале очереди ###
      def peek_first
        raise IndexError, 'двусторонняя очередь пуста' if is_empty?

        @front.val
      end

      ### Доступ к элементу в хвосте очереди ###
      def peek_last
        raise IndexError, 'двусторонняя очередь пуста' if is_empty?

        @rear.val
      end

      ### Вернуть массив для вывода ###
      def to_array
        node = @front
        res = Array.new(size, 0)
        for i in 0...size
          res[i] = node.val
          node = node.next
        end
        res
      end
    end
    ```

### 2. &nbsp; Реализация на основе массива

Как показано на рисунках ниже, аналогично реализации очереди на массиве мы также можем использовать кольцевой массив для реализации двусторонней очереди.

=== "ArrayDeque"
    ![Операции enqueue и dequeue для двусторонней очереди на массиве](deque.assets/array_deque_step1.png){ class="animation-figure" }

=== "push_last()"
    ![array_deque_push_last](deque.assets/array_deque_step2_push_last.png){ class="animation-figure" }

=== "push_first()"
    ![array_deque_push_first](deque.assets/array_deque_step3_push_first.png){ class="animation-figure" }

=== "pop_last()"
    ![array_deque_pop_last](deque.assets/array_deque_step4_pop_last.png){ class="animation-figure" }

=== "pop_first()"
    ![array_deque_pop_first](deque.assets/array_deque_step5_pop_first.png){ class="animation-figure" }

<p align="center"> Рисунок 5-9 &nbsp; Операции enqueue и dequeue для двусторонней очереди на массиве </p>

На основе реализации обычной очереди нужно лишь добавить методы "enqueue в голову" и "dequeue из хвоста":

=== "Python"

    ```python title="array_deque.py"
    class ArrayDeque:
        """Двусторонняя очередь на основе кольцевого массива"""

        def __init__(self, capacity: int):
            """Конструктор"""
            self._nums: list[int] = [0] * capacity
            self._front: int = 0
            self._size: int = 0

        def capacity(self) -> int:
            """Получить вместимость двусторонней очереди"""
            return len(self._nums)

        def size(self) -> int:
            """Получение длины двусторонней очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверка, пуста ли двусторонняя очередь"""
            return self._size == 0

        def index(self, i: int) -> int:
            """Вычислить индекс в кольцевом массиве"""
            # С помощью операции взятия по модулю соединить начало и конец массива
            # Когда i выходит за конец массива, он возвращается в начало
            # Когда i выходит за начало массива, он возвращается в конец
            return (i + self.capacity()) % self.capacity()

        def push_first(self, num: int):
            """Добавление в голову очереди"""
            if self._size == self.capacity():
                print("Двусторонняя очередь заполнена")
                return
            # Указатель головы сдвигается на одну позицию влево
            # С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            self._front = self.index(self._front - 1)
            # Добавить num в голову очереди
            self._nums[self._front] = num
            self._size += 1

        def push_last(self, num: int):
            """Добавление в хвост очереди"""
            if self._size == self.capacity():
                print("Двусторонняя очередь заполнена")
                return
            # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            rear = self.index(self._front + self._size)
            # Добавить num в хвост очереди
            self._nums[rear] = num
            self._size += 1

        def pop_first(self) -> int:
            """Извлечение из головы очереди"""
            num = self.peek_first()
            # Указатель головы сдвигается на одну позицию назад
            self._front = self.index(self._front + 1)
            self._size -= 1
            return num

        def pop_last(self) -> int:
            """Извлечение из хвоста очереди"""
            num = self.peek_last()
            self._size -= 1
            return num

        def peek_first(self) -> int:
            """Доступ к элементу в начале очереди"""
            if self.is_empty():
                raise IndexError("двусторонняя очередь пуста")
            return self._nums[self._front]

        def peek_last(self) -> int:
            """Доступ к элементу в конце очереди"""
            if self.is_empty():
                raise IndexError("двусторонняя очередь пуста")
            # Вычислить индекс хвостового элемента
            last = self.index(self._front + self._size - 1)
            return self._nums[last]

        def to_array(self) -> list[int]:
            """Вернуть массив для вывода"""
            # Преобразовывать только элементы списка в пределах фактической длины
            res = []
            for i in range(self._size):
                res.append(self._nums[self.index(self._front + i)])
            return res
    ```

=== "C++"

    ```cpp title="array_deque.cpp"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
      private:
        vector<int> nums; // Массив для хранения элементов двусторонней очереди
        int front;        // Указатель head, указывающий на первый элемент очереди
        int queSize;      // Длина двусторонней очереди

      public:
        /* Конструктор */
        ArrayDeque(int capacity) {
            nums.resize(capacity);
            front = queSize = 0;
        }

        /* Получить вместимость двусторонней очереди */
        int capacity() {
            return nums.size();
        }

        /* Получение длины двусторонней очереди */
        int size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        bool isEmpty() {
            return queSize == 0;
        }

        /* Вычислить индекс в кольцевом массиве */
        int index(int i) {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + capacity()) % capacity();
        }

        /* Добавление в голову очереди */
        void pushFirst(int num) {
            if (queSize == capacity()) {
                cout << "Двусторонняя очередь заполнена" << endl;
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            front = index(front - 1);
            // Добавить num в голову очереди
            nums[front] = num;
            queSize++;
        }

        /* Добавление в хвост очереди */
        void pushLast(int num) {
            if (queSize == capacity()) {
                cout << "Двусторонняя очередь заполнена" << endl;
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            int rear = index(front + queSize);
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечение из головы очереди */
        int popFirst() {
            int num = peekFirst();
            // Указатель головы сдвигается на одну позицию назад
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* Извлечение из хвоста очереди */
        int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        int peekFirst() {
            if (isEmpty())
                throw out_of_range("двусторонняя очередь пуста");
            return nums[front];
        }

        /* Доступ к элементу в конце очереди */
        int peekLast() {
            if (isEmpty())
                throw out_of_range("двусторонняя очередь пуста");
            // Вычислить индекс хвостового элемента
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* Вернуть массив для вывода */
        vector<int> toVector() {
            // Преобразовывать только элементы списка в пределах фактической длины
            vector<int> res(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="array_deque.java"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
        private int[] nums; // Массив для хранения элементов двусторонней очереди
        private int front; // Указатель head, указывающий на первый элемент очереди
        private int queSize; // Длина двусторонней очереди

        /* Конструктор */
        public ArrayDeque(int capacity) {
            this.nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить вместимость двусторонней очереди */
        public int capacity() {
            return nums.length;
        }

        /* Получение длины двусторонней очереди */
        public int size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* Вычислить индекс в кольцевом массиве */
        private int index(int i) {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + capacity()) % capacity();
        }

        /* Добавление в голову очереди */
        public void pushFirst(int num) {
            if (queSize == capacity()) {
                System.out.println("Двусторонняя очередь заполнена");
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            front = index(front - 1);
            // Добавить num в голову очереди
            nums[front] = num;
            queSize++;
        }

        /* Добавление в хвост очереди */
        public void pushLast(int num) {
            if (queSize == capacity()) {
                System.out.println("Двусторонняя очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            int rear = index(front + queSize);
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечение из головы очереди */
        public int popFirst() {
            int num = peekFirst();
            // Указатель головы сдвигается на одну позицию назад
            front = index(front + 1);
            queSize--;
            return num;
        }

        /* Извлечение из хвоста очереди */
        public int popLast() {
            int num = peekLast();
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int peekFirst() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* Доступ к элементу в конце очереди */
        public int peekLast() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            // Вычислить индекс хвостового элемента
            int last = index(front + queSize - 1);
            return nums[last];
        }

        /* Вернуть массив для вывода */
        public int[] toArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[index(j)];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_deque.cs"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
        int[] nums;  // Массив для хранения элементов двусторонней очереди
        int front;   // Указатель head, указывающий на первый элемент очереди
        int queSize; // Длина двусторонней очереди

        /* Конструктор */
        public ArrayDeque(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить вместимость двусторонней очереди */
        int Capacity() {
            return nums.Length;
        }

        /* Получение длины двусторонней очереди */
        public int Size() {
            return queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* Вычислить индекс в кольцевом массиве */
        int Index(int i) {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + Capacity()) % Capacity();
        }

        /* Добавление в голову очереди */
        public void PushFirst(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("Двусторонняя очередь заполнена");
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            front = Index(front - 1);
            // Добавить num в голову очереди
            nums[front] = num;
            queSize++;
        }

        /* Добавление в хвост очереди */
        public void PushLast(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("Двусторонняя очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            int rear = Index(front + queSize);
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечение из головы очереди */
        public int PopFirst() {
            int num = PeekFirst();
            // Указатель головы сдвигается на одну позицию назад
            front = Index(front + 1);
            queSize--;
            return num;
        }

        /* Извлечение из хвоста очереди */
        public int PopLast() {
            int num = PeekLast();
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int PeekFirst() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            return nums[front];
        }

        /* Доступ к элементу в конце очереди */
        public int PeekLast() {
            if (IsEmpty()) {
                throw new InvalidOperationException();
            }
            // Вычислить индекс хвостового элемента
            int last = Index(front + queSize - 1);
            return nums[last];
        }

        /* Вернуть массив для вывода */
        public int[] ToArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[Index(j)];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_deque.go"
    /* Двусторонняя очередь на основе кольцевого массива */
    type arrayDeque struct {
        nums        []int // Массив для хранения элементов двусторонней очереди
        front       int   // Указатель head, указывающий на первый элемент очереди
        queSize     int   // Длина двусторонней очереди
        queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
    }

    /* Инициализация очереди */
    func newArrayDeque(queCapacity int) *arrayDeque {
        return &arrayDeque{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* Получение длины двусторонней очереди */
    func (q *arrayDeque) size() int {
        return q.queSize
    }

    /* Проверка, пуста ли двусторонняя очередь */
    func (q *arrayDeque) isEmpty() bool {
        return q.queSize == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    func (q *arrayDeque) index(i int) int {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + q.queCapacity) % q.queCapacity
    }

    /* Добавление в голову очереди */
    func (q *arrayDeque) pushFirst(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("Двусторонняя очередь заполнена")
            return
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        q.front = q.index(q.front - 1)
        // Добавить num в голову очереди
        q.nums[q.front] = num
        q.queSize++
    }

    /* Добавление в хвост очереди */
    func (q *arrayDeque) pushLast(num int) {
        if q.queSize == q.queCapacity {
            fmt.Println("Двусторонняя очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        rear := q.index(q.front + q.queSize)
        // Добавить num в хвост очереди
        q.nums[rear] = num
        q.queSize++
    }

    /* Извлечение из головы очереди */
    func (q *arrayDeque) popFirst() any {
        num := q.peekFirst()
        if num == nil {
            return nil
        }
        // Указатель головы сдвигается на одну позицию назад
        q.front = q.index(q.front + 1)
        q.queSize--
        return num
    }

    /* Извлечение из хвоста очереди */
    func (q *arrayDeque) popLast() any {
        num := q.peekLast()
        if num == nil {
            return nil
        }
        q.queSize--
        return num
    }

    /* Доступ к элементу в начале очереди */
    func (q *arrayDeque) peekFirst() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* Доступ к элементу в конце очереди */
    func (q *arrayDeque) peekLast() any {
        if q.isEmpty() {
            return nil
        }
        // Вычислить индекс хвостового элемента
        last := q.index(q.front + q.queSize - 1)
        return q.nums[last]
    }

    /* Получить Slice для вывода */
    func (q *arrayDeque) toSlice() []int {
        // Преобразовывать только элементы списка в пределах фактической длины
        res := make([]int, q.queSize)
        for i, j := 0, q.front; i < q.queSize; i++ {
            res[i] = q.nums[q.index(j)]
            j++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="array_deque.swift"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
        private var nums: [Int] // Массив для хранения элементов двусторонней очереди
        private var front: Int // Указатель head, указывающий на первый элемент очереди
        private var _size: Int // Длина двусторонней очереди

        /* Конструктор */
        init(capacity: Int) {
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* Получить вместимость двусторонней очереди */
        func capacity() -> Int {
            nums.count
        }

        /* Получение длины двусторонней очереди */
        func size() -> Int {
            _size
        }

        /* Проверка, пуста ли двусторонняя очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Вычислить индекс в кольцевом массиве */
        private func index(i: Int) -> Int {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            (i + capacity()) % capacity()
        }

        /* Добавление в голову очереди */
        func pushFirst(num: Int) {
            if size() == capacity() {
                print("Двусторонняя очередь заполнена")
                return
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            front = index(i: front - 1)
            // Добавить num в голову очереди
            nums[front] = num
            _size += 1
        }

        /* Добавление в хвост очереди */
        func pushLast(num: Int) {
            if size() == capacity() {
                print("Двусторонняя очередь заполнена")
                return
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            let rear = index(i: front + size())
            // Добавить num в хвост очереди
            nums[rear] = num
            _size += 1
        }

        /* Извлечение из головы очереди */
        func popFirst() -> Int {
            let num = peekFirst()
            // Указатель головы сдвигается на одну позицию назад
            front = index(i: front + 1)
            _size -= 1
            return num
        }

        /* Извлечение из хвоста очереди */
        func popLast() -> Int {
            let num = peekLast()
            _size -= 1
            return num
        }

        /* Доступ к элементу в начале очереди */
        func peekFirst() -> Int {
            if isEmpty() {
                fatalError("двусторонняя очередь пуста")
            }
            return nums[front]
        }

        /* Доступ к элементу в конце очереди */
        func peekLast() -> Int {
            if isEmpty() {
                fatalError("двусторонняя очередь пуста")
            }
            // Вычислить индекс хвостового элемента
            let last = index(i: front + size() - 1)
            return nums[last]
        }

        /* Вернуть массив для вывода */
        func toArray() -> [Int] {
            // Преобразовывать только элементы списка в пределах фактической длины
            (front ..< front + size()).map { nums[index(i: $0)] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_deque.js"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
        #nums; // Массив для хранения элементов двусторонней очереди
        #front; // Указатель head, указывающий на первый элемент очереди
        #queSize; // Длина двусторонней очереди

        /* Конструктор */
        constructor(capacity) {
            this.#nums = new Array(capacity);
            this.#front = 0;
            this.#queSize = 0;
        }

        /* Получить вместимость двусторонней очереди */
        capacity() {
            return this.#nums.length;
        }

        /* Получение длины двусторонней очереди */
        size() {
            return this.#queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* Вычислить индекс в кольцевом массиве */
        index(i) {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + this.capacity()) % this.capacity();
        }

        /* Добавление в голову очереди */
        pushFirst(num) {
            if (this.#queSize === this.capacity()) {
                console.log('Двусторонняя очередь заполнена');
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            this.#front = this.index(this.#front - 1);
            // Добавить num в голову очереди
            this.#nums[this.#front] = num;
            this.#queSize++;
        }

        /* Добавление в хвост очереди */
        pushLast(num) {
            if (this.#queSize === this.capacity()) {
                console.log('Двусторонняя очередь заполнена');
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            const rear = this.index(this.#front + this.#queSize);
            // Добавить num в хвост очереди
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* Извлечение из головы очереди */
        popFirst() {
            const num = this.peekFirst();
            // Указатель головы сдвигается на одну позицию назад
            this.#front = this.index(this.#front + 1);
            this.#queSize--;
            return num;
        }

        /* Извлечение из хвоста очереди */
        popLast() {
            const num = this.peekLast();
            this.#queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peekFirst() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.#nums[this.#front];
        }

        /* Доступ к элементу в конце очереди */
        peekLast() {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // Вычислить индекс хвостового элемента
            const last = this.index(this.#front + this.#queSize - 1);
            return this.#nums[last];
        }

        /* Вернуть массив для вывода */
        toArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
            const res = [];
            for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
                res[i] = this.#nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_deque.ts"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
        private nums: number[]; // Массив для хранения элементов двусторонней очереди
        private front: number; // Указатель head, указывающий на первый элемент очереди
        private queSize: number; // Длина двусторонней очереди

        /* Конструктор */
        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = 0;
            this.queSize = 0;
        }

        /* Получить вместимость двусторонней очереди */
        capacity(): number {
            return this.nums.length;
        }

        /* Получение длины двусторонней очереди */
        size(): number {
            return this.queSize;
        }

        /* Проверка, пуста ли двусторонняя очередь */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* Вычислить индекс в кольцевом массиве */
        index(i: number): number {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + this.capacity()) % this.capacity();
        }

        /* Добавление в голову очереди */
        pushFirst(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('Двусторонняя очередь заполнена');
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            this.front = this.index(this.front - 1);
            // Добавить num в голову очереди
            this.nums[this.front] = num;
            this.queSize++;
        }

        /* Добавление в хвост очереди */
        pushLast(num: number): void {
            if (this.queSize === this.capacity()) {
                console.log('Двусторонняя очередь заполнена');
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            const rear: number = this.index(this.front + this.queSize);
            // Добавить num в хвост очереди
            this.nums[rear] = num;
            this.queSize++;
        }

        /* Извлечение из головы очереди */
        popFirst(): number {
            const num: number = this.peekFirst();
            // Указатель головы сдвигается на одну позицию назад
            this.front = this.index(this.front + 1);
            this.queSize--;
            return num;
        }

        /* Извлечение из хвоста очереди */
        popLast(): number {
            const num: number = this.peekLast();
            this.queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peekFirst(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            return this.nums[this.front];
        }

        /* Доступ к элементу в конце очереди */
        peekLast(): number {
            if (this.isEmpty()) throw new Error('The Deque Is Empty.');
            // Вычислить индекс хвостового элемента
            const last = this.index(this.front + this.queSize - 1);
            return this.nums[last];
        }

        /* Вернуть массив для вывода */
        toArray(): number[] {
            // Преобразовывать только элементы списка в пределах фактической длины
            const res: number[] = [];
            for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
                res[i] = this.nums[this.index(j)];
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_deque.dart"
    /* Двусторонняя очередь на основе кольцевого массива */
    class ArrayDeque {
      late List<int> _nums; // Массив для хранения элементов двусторонней очереди
      late int _front; // Указатель head, указывающий на первый элемент очереди
      late int _queSize; // Длина двусторонней очереди

      /* Конструктор */
      ArrayDeque(int capacity) {
        this._nums = List.filled(capacity, 0);
        this._front = this._queSize = 0;
      }

      /* Получить вместимость двусторонней очереди */
      int capacity() {
        return _nums.length;
      }

      /* Получение длины двусторонней очереди */
      int size() {
        return _queSize;
      }

      /* Проверка, пуста ли двусторонняя очередь */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Вычислить индекс в кольцевом массиве */
      int index(int i) {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        return (i + capacity()) % capacity();
      }

      /* Добавление в голову очереди */
      void pushFirst(int _num) {
        if (_queSize == capacity()) {
          throw Exception("Двусторонняя очередь заполнена");
        }
        // Указатель головы сместить влево на одну позицию
        // С помощью операции взятия остатка реализовать возврат _front к хвосту после выхода за начало массива
        _front = index(_front - 1);
        // Добавить _num в голову очереди
        _nums[_front] = _num;
        _queSize++;
      }

      /* Добавление в хвост очереди */
      void pushLast(int _num) {
        if (_queSize == capacity()) {
          throw Exception("Двусторонняя очередь заполнена");
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        int rear = index(_front + _queSize);
        // Добавить _num в хвост очереди
        _nums[rear] = _num;
        _queSize++;
      }

      /* Извлечение из головы очереди */
      int popFirst() {
        int _num = peekFirst();
        // Указатель головы сместить вправо на одну позицию
        _front = index(_front + 1);
        _queSize--;
        return _num;
      }

      /* Извлечение из хвоста очереди */
      int popLast() {
        int _num = peekLast();
        _queSize--;
        return _num;
      }

      /* Доступ к элементу в начале очереди */
      int peekFirst() {
        if (isEmpty()) {
          throw Exception("двусторонняя очередь пуста");
        }
        return _nums[_front];
      }

      /* Доступ к элементу в конце очереди */
      int peekLast() {
        if (isEmpty()) {
          throw Exception("двусторонняя очередь пуста");
        }
        // Вычислить индекс хвостового элемента
        int last = index(_front + _queSize - 1);
        return _nums[last];
      }

      /* Вернуть массив для вывода */
      List<int> toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
        List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[index(j)];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_deque.rs"
    /* Двусторонняя очередь на основе кольцевого массива */
    struct ArrayDeque<T> {
        nums: Vec<T>,    // Массив для хранения элементов двусторонней очереди
        front: usize,    // Указатель head, указывающий на первый элемент очереди
        que_size: usize, // Длина двусторонней очереди
    }

    impl<T: Copy + Default> ArrayDeque<T> {
        /* Конструктор */
        pub fn new(capacity: usize) -> Self {
            Self {
                nums: vec![T::default(); capacity],
                front: 0,
                que_size: 0,
            }
        }

        /* Получить вместимость двусторонней очереди */
        pub fn capacity(&self) -> usize {
            self.nums.len()
        }

        /* Получение длины двусторонней очереди */
        pub fn size(&self) -> usize {
            self.que_size
        }

        /* Проверка, пуста ли двусторонняя очередь */
        pub fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* Вычислить индекс в кольцевом массиве */
        fn index(&self, i: i32) -> usize {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            ((i + self.capacity() as i32) % self.capacity() as i32) as usize
        }

        /* Добавление в голову очереди */
        pub fn push_first(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("Двусторонняя очередь заполнена");
                return;
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            self.front = self.index(self.front as i32 - 1);
            // Добавить num в голову очереди
            self.nums[self.front] = num;
            self.que_size += 1;
        }

        /* Добавление в хвост очереди */
        pub fn push_last(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("Двусторонняя очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            let rear = self.index(self.front as i32 + self.que_size as i32);
            // Добавить num в хвост очереди
            self.nums[rear] = num;
            self.que_size += 1;
        }

        /* Извлечение из головы очереди */
        fn pop_first(&mut self) -> T {
            let num = self.peek_first();
            // Указатель головы сдвигается на одну позицию назад
            self.front = self.index(self.front as i32 + 1);
            self.que_size -= 1;
            num
        }

        /* Извлечение из хвоста очереди */
        fn pop_last(&mut self) -> T {
            let num = self.peek_last();
            self.que_size -= 1;
            num
        }

        /* Доступ к элементу в начале очереди */
        fn peek_first(&self) -> T {
            if self.is_empty() {
                panic!("двусторонняя очередь пуста")
            };
            self.nums[self.front]
        }

        /* Доступ к элементу в конце очереди */
        fn peek_last(&self) -> T {
            if self.is_empty() {
                panic!("двусторонняя очередь пуста")
            };
            // Вычислить индекс хвостового элемента
            let last = self.index(self.front as i32 + self.que_size as i32 - 1);
            self.nums[last]
        }

        /* Вернуть массив для вывода */
        fn to_array(&self) -> Vec<T> {
            // Преобразовывать только элементы списка в пределах фактической длины
            let mut res = vec![T::default(); self.que_size];
            let mut j = self.front;
            for i in 0..self.que_size {
                res[i] = self.nums[self.index(j as i32)];
                j += 1;
            }
            res
        }
    }
    ```

=== "C"

    ```c title="array_deque.c"
    /* Двусторонняя очередь на основе кольцевого массива */
    typedef struct {
        int *nums;       // Массив для хранения элементов очереди
        int front;       // Указатель head, указывающий на первый элемент очереди
        int queSize;     // Указатель хвоста, указывающий на позицию после хвоста
        int queCapacity; // Вместимость очереди
    } ArrayDeque;

    /* Конструктор */
    ArrayDeque *newArrayDeque(int capacity) {
        ArrayDeque *deque = (ArrayDeque *)malloc(sizeof(ArrayDeque));
        // Инициализация массива
        deque->queCapacity = capacity;
        deque->nums = (int *)malloc(sizeof(int) * deque->queCapacity);
        deque->front = deque->queSize = 0;
        return deque;
    }

    /* Деструктор */
    void delArrayDeque(ArrayDeque *deque) {
        free(deque->nums);
        free(deque);
    }

    /* Получить вместимость двусторонней очереди */
    int capacity(ArrayDeque *deque) {
        return deque->queCapacity;
    }

    /* Получение длины двусторонней очереди */
    int size(ArrayDeque *deque) {
        return deque->queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    bool empty(ArrayDeque *deque) {
        return deque->queSize == 0;
    }

    /* Вычислить индекс в кольцевом массиве */
    int dequeIndex(ArrayDeque *deque, int i) {
        // С помощью операции взятия остатка соединить начало и конец массива
        // Когда i выходит за хвост массива, вернуться к началу
        // Когда i выходит за голову массива, вернуться к концу
        return ((i + capacity(deque)) % capacity(deque));
    }

    /* Добавление в голову очереди */
    void pushFirst(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("Дек заполнен\r\n");
            return;
        }
        // Указатель головы сместить влево на одну позицию
        // С помощью операции взятия остатка реализовать возврат front к хвосту после выхода за начало массива
        deque->front = dequeIndex(deque, deque->front - 1);
        // Добавить num в голову очереди
        deque->nums[deque->front] = num;
        deque->queSize++;
    }

    /* Добавление в хвост очереди */
    void pushLast(ArrayDeque *deque, int num) {
        if (deque->queSize == capacity(deque)) {
            printf("Дек заполнен\r\n");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        int rear = dequeIndex(deque, deque->front + deque->queSize);
        // Добавить num в хвост очереди
        deque->nums[rear] = num;
        deque->queSize++;
    }

    /* Доступ к элементу в начале очереди */
    int peekFirst(ArrayDeque *deque) {
        // Ошибка доступа: двусторонняя очередь пуста
        assert(empty(deque) == 0);
        return deque->nums[deque->front];
    }

    /* Доступ к элементу в конце очереди */
    int peekLast(ArrayDeque *deque) {
        // Ошибка доступа: двусторонняя очередь пуста
        assert(empty(deque) == 0);
        int last = dequeIndex(deque, deque->front + deque->queSize - 1);
        return deque->nums[last];
    }

    /* Извлечение из головы очереди */
    int popFirst(ArrayDeque *deque) {
        int num = peekFirst(deque);
        // Указатель головы сдвигается на одну позицию назад
        deque->front = dequeIndex(deque, deque->front + 1);
        deque->queSize--;
        return num;
    }

    /* Извлечение из хвоста очереди */
    int popLast(ArrayDeque *deque) {
        int num = peekLast(deque);
        deque->queSize--;
        return num;
    }

    /* Вернуть массив для вывода */
    int *toArray(ArrayDeque *deque, int *queSize) {
        *queSize = deque->queSize;
        int *res = (int *)calloc(deque->queSize, sizeof(int));
        int j = deque->front;
        for (int i = 0; i < deque->queSize; i++) {
            res[i] = deque->nums[j % deque->queCapacity];
            j++;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_deque.kt"
    /* Конструктор */
    class ArrayDeque(capacity: Int) {
        private var nums: IntArray = IntArray(capacity) // Массив для хранения элементов двусторонней очереди
        private var front: Int = 0 // Указатель head, указывающий на первый элемент очереди
        private var queSize: Int = 0 // Длина двусторонней очереди

        /* Получить вместимость двусторонней очереди */
        fun capacity(): Int {
            return nums.size
        }

        /* Получение длины двусторонней очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверка, пуста ли двусторонняя очередь */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* Вычислить индекс в кольцевом массиве */
        private fun index(i: Int): Int {
            // С помощью операции взятия по модулю соединить начало и конец массива
            // Когда i выходит за конец массива, он возвращается в начало
            // Когда i выходит за начало массива, он возвращается в конец
            return (i + capacity()) % capacity()
        }

        /* Добавление в голову очереди */
        fun pushFirst(num: Int) {
            if (queSize == capacity()) {
                println("Двусторонняя очередь заполнена")
                return
            }
            // Указатель головы сдвигается на одну позицию влево
            // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
            front = index(front - 1)
            // Добавить num в голову очереди
            nums[front] = num
            queSize++
        }

        /* Добавление в хвост очереди */
        fun pushLast(num: Int) {
            if (queSize == capacity()) {
                println("Двусторонняя очередь заполнена")
                return
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            val rear = index(front + queSize)
            // Добавить num в хвост очереди
            nums[rear] = num
            queSize++
        }

        /* Извлечение из головы очереди */
        fun popFirst(): Int {
            val num = peekFirst()
            // Указатель головы сдвигается на одну позицию назад
            front = index(front + 1)
            queSize--
            return num
        }

        /* Извлечение из хвоста очереди */
        fun popLast(): Int {
            val num = peekLast()
            queSize--
            return num
        }

        /* Доступ к элементу в начале очереди */
        fun peekFirst(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* Доступ к элементу в конце очереди */
        fun peekLast(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            // Вычислить индекс хвостового элемента
            val last = index(front + queSize - 1)
            return nums[last]
        }

        /* Вернуть массив для вывода */
        fun toArray(): IntArray {
            // Преобразовывать только элементы списка в пределах фактической длины
            val res = IntArray(queSize)
            var i = 0
            var j = front
            while (i < queSize) {
                res[i] = nums[index(j)]
                i++
                j++
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_deque.rb"
    ### Двусторонняя очередь на основе кольцевого массива ###
    class ArrayDeque
      ### Получение длины двусторонней очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize(capacity)
        @nums = Array.new(capacity, 0)
        @front = 0
        @size = 0
      end

      ### Получить вместимость двусторонней очереди ###
      def capacity
        @nums.length
      end

      ### Проверка, пуста ли двусторонняя очередь ###
      def is_empty?
        size.zero?
      end

      ### Добавление в голову очереди ###
      def push_first(num)
        if size == capacity
          puts 'Двусторонняя очередь заполнена'
          return
        end

        # Указатель головы сдвигается на одну позицию влево
        # С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        @front = index(@front - 1)
        # Добавить num в голову очереди
        @nums[@front] = num
        @size += 1
      end

      ### Добавление в хвост очереди ###
      def push_last(num)
        if size == capacity
          puts 'Двусторонняя очередь заполнена'
          return
        end

        # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        rear = index(@front + size)
        # Добавить num в хвост очереди
        @nums[rear] = num
        @size += 1
      end

      ### Извлечение из головы очереди ###
      def pop_first
        num = peek_first
        # Указатель головы сдвигается на одну позицию назад
        @front = index(@front + 1)
        @size -= 1
        num
      end

      ### Извлечение из хвоста очереди ###
      def pop_last
        num = peek_last
        @size -= 1
        num
      end

      ### Доступ к элементу в начале очереди ###
      def peek_first
        raise IndexError, 'двусторонняя очередь пуста' if is_empty?

        @nums[@front]
      end

      ### Доступ к элементу в хвосте очереди ###
      def peek_last
        raise IndexError, 'двусторонняя очередь пуста' if is_empty?

        # Вычислить индекс хвостового элемента
        last = index(@front + size - 1)
        @nums[last]
      end

      ### Вернуть массив для вывода ###
      def to_array
        # Преобразовывать только элементы списка в пределах фактической длины
        res = []
        for i in 0...size
          res << @nums[index(@front + i)]
        end
        res
      end

      private

      ### Вычислить индекс в кольцевом массиве ###
      def index(i)
        # С помощью операции взятия по модулю соединить начало и конец массива
        # Когда i выходит за конец массива, он возвращается в начало
        # Когда i выходит за начало массива, он возвращается в конец
        (i + capacity) % capacity
      end
    end
    ```

## 5.3.3 &nbsp; Применение двусторонней очереди

Двусторонняя очередь сочетает в себе логику стека и очереди, **поэтому она может покрыть все сценарии применения обеих структур и при этом предоставляет более высокую степень свободы**.

Мы знаем, что функция "undo" в программном обеспечении обычно реализуется с помощью стека: система `push`-ит каждое изменение в стек, а затем использует `pop` для отмены. Однако, учитывая ограниченность системных ресурсов, программы обычно ограничивают число шагов отмены (например, разрешают хранить только $50$ шагов). Когда длина стека превышает $50$, программе нужно удалить элемент с дна стека (то есть с головы очереди). **Но стек не может реализовать такую операцию, и в этом случае его приходится заменять двусторонней очередью**. Обрати внимание: основная логика "undo" по-прежнему следует стековому правилу LIFO, просто двусторонняя очередь позволяет более гибко реализовать некоторые дополнительные механизмы.
