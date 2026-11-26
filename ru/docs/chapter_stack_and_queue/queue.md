---
comments: true
---

# 5.2 &nbsp; Очередь

<u>Очередь (queue)</u> — линейная структура данных, в которой первым извлекают элемент, добавленный первым. Она устроена как обычная очередь людей: вновь пришедшие встают в конец, а из начала люди уходят один за другим.

На рисунке 5-4 показаны начало и конец очереди. Поместить элемент в конец — значит добавить его в очередь, а удалить элемент из начала — извлечь его из очереди.

![Принцип очереди: первым пришёл — первым ушёл](queue.assets/queue_operations.svg){ class="animation-figure" }

<p align="center"> Рисунок 5-4 &nbsp; Принцип очереди: первым пришёл — первым ушёл </p>

## 5.2.1 &nbsp; Основные операции с очередью

В таблице ниже перечислены основные операции с очередью. Имена методов могут различаться в зависимости от языка программирования. Здесь мы используем те же имена, что и для стека.

<p align="center">Таблица <id>&nbsp; Временная сложность операций с очередью</p>

<div class="center-table" markdown>

| Имя метода   | Описание                         | Временная сложность |
| -------- | ---------------------------- | ---------- |
| `push()` | Добавить элемент в конец очереди | $O(1)$     |
| `pop()`  | Извлечь первый элемент очереди                 | $O(1)$     |
| `peek()` | Посмотреть первый элемент очереди                 | $O(1)$     |

</div>

Можно воспользоваться готовым классом очереди в выбранном языке программирования.

=== "Python"

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

=== "C++"

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

=== "Java"

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

=== "C#"

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

=== "Go"

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

=== "Swift"

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

=== "JS"

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

=== "TS"

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

=== "Dart"

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

=== "Rust"

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

=== "C"

    ```c title="queue.c"
    // В C нет встроенной очереди
    ```

=== "Kotlin"

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

=== "Ruby"

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

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%0A%20%20%20%20%23%20%D0%94%D0%BB%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B5%D0%B9%20%D0%B5%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%20queue.Queue%28%29,%20%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BC%D0%B5%D0%BD%D0%B5%D0%B5%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%91%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%91%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B2%20%D0%BA%D0%B0%D1%87%D0%B5%D1%81%D1%82%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%0A%20%20%20%20%23%20%D0%94%D0%BB%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B5%D0%B9%20%D0%B5%D1%81%D1%82%D1%8C%20%D0%BE%D1%82%D0%B4%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%20queue.Queue%28%29,%20%D0%BD%D0%BE%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BC%D0%B5%D0%BD%D0%B5%D0%B5%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D1%8F%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A7%D0%B8%D1%82%D0%B0%D0%B5%D0%BC%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D0%BA%D0%B0%D0%B5%D0%BC%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%91%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22,%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20que%20%3D%22,%20que%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%91%D0%BC%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D1%8F%D0%B5%D0%BC,%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 5.2.2 &nbsp; Реализация очереди

Для реализации очереди нужна структура данных, которая позволяет добавлять элементы с одного конца и удалять с другого. Этому требованию отвечают и связный список, и массив.

### 1. &nbsp; Реализация на основе связного списка

Как показано на рисунке 5-5, первый узел списка можно считать началом очереди, а последний — её концом. В конец разрешим только добавлять узлы, а из начала — только удалять.

=== "<1>"
    ![Добавление и извлечение элементов в очереди на основе связного списка](queue.assets/linkedlist_queue_step1.svg){ class="animation-figure" }

=== "<2>"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.svg){ class="animation-figure" }

<p align="center"> Рисунок 5-5 &nbsp; Добавление и извлечение элементов в очереди на основе связного списка </p>

Так выглядит реализация очереди на основе связного списка.

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """Очередь на основе связного списка"""

        def __init__(self):
            """Конструктор"""
            self._front: ListNode | None = None  # Первый узел front
            self._rear: ListNode | None = None  # Последний узел rear
            self._size: int = 0

        def size(self) -> int:
            """Получить длину очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверить, пуста ли очередь"""
            return self._size == 0

        def push(self, num: int):
            """Добавить элемент в очередь"""
            # Добавить узел со значением num после последнего узла
            node = ListNode(num)
            # Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if self._front is None:
                self._front = node
                self._rear = node
            # Если очередь непуста, добавить новый узел после последнего
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """Извлечь элемент из очереди"""
            num = self.peek()
            # Удалить первый узел
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Посмотреть первый элемент очереди"""
            if self.is_empty():
                raise IndexError("Очередь пуста")
            return self._front.val

        def to_list(self) -> list[int]:
            """Преобразовать в список для вывода"""
            queue = []
            temp = self._front
            while temp:
                queue.append(temp.val)
                temp = temp.next
            return queue
    ```

=== "C++"

    ```cpp title="linkedlist_queue.cpp"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
      private:
        ListNode *front, *rear; // front — первый узел, rear — последний
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // Пройти по связному списку и удалить узлы, освободив память
            freeMemoryLinkedList(front);
        }

        /* Получить длину очереди */
        int size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        bool isEmpty() {
            return queSize == 0;
        }

        /* Добавить элемент в очередь */
        void push(int num) {
            // Добавить узел со значением num после последнего узла
            ListNode *node = new ListNode(num);
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // Если очередь непуста, добавить новый узел после последнего
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь элемент из очереди */
        int pop() {
            int num = peek();
            // Удалить первый узел
            ListNode *tmp = front;
            front = front->next;
            // Освободить память
            delete tmp;
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        int peek() {
            if (size() == 0)
                throw out_of_range("Очередь пуста");
            return front->val;
        }

        /* Преобразовать связный список в вектор и вернуть его */
        vector<int> toVector() {
            ListNode *node = front;
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

    ```java title="linkedlist_queue.java"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        private ListNode front, rear; // front — первый узел, rear — последний
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Получить длину очереди */
        public int size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Добавить элемент в очередь */
        public void push(int num) {
            // Добавить узел со значением num после последнего узла
            ListNode node = new ListNode(num);
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (front == null) {
                front = node;
                rear = node;
            // Если очередь непуста, добавить новый узел после последнего
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь элемент из очереди */
        public int pop() {
            int num = peek();
            // Удалить первый узел
            front = front.next;
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* Преобразовать связный список в массив и вернуть его */
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

    ```csharp title="linkedlist_queue.cs"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        ListNode? front, rear;  // front — первый узел, rear — последний 
        int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Получить длину очереди */
        public int Size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Добавить элемент в очередь */
        public void Push(int num) {
            // Добавить узел со значением num после последнего узла
            ListNode node = new(num);
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (front == null) {
                front = node;
                rear = node;
                // Если очередь непуста, добавить новый узел после последнего
            } else if (rear != null) {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь элемент из очереди */
        public int Pop() {
            int num = Peek();
            // Удалить первый узел
            front = front?.next;
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return front!.val;
        }

        /* Преобразовать связный список в массив и вернуть его */
        public int[] ToArray() {
            if (front == null)
                return [];

            ListNode? node = front;
            int[] res = new int[Size()];
            for (int i = 0; i < res.Length; i++) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_queue.go"
    /* Очередь на основе связного списка */
    type linkedListQueue struct {
        // Реализовать очередь с помощью стандартного пакета list
        data *list.List
    }

    /* Инициализировать очередь */
    func newLinkedListQueue() *linkedListQueue {
        return &linkedListQueue{
            data: list.New(),
        }
    }

    /* Добавить элемент в очередь */
    func (s *linkedListQueue) push(value any) {
        s.data.PushBack(value)
    }

    /* Извлечь элемент из очереди */
    func (s *linkedListQueue) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* Посмотреть первый элемент очереди */
    func (s *linkedListQueue) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* Получить длину очереди */
    func (s *linkedListQueue) size() int {
        return s.data.Len()
    }

    /* Проверить, пуста ли очередь */
    func (s *linkedListQueue) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Получить список для вывода */
    func (s *linkedListQueue) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        private var front: ListNode? // Первый узел
        private var rear: ListNode? // Последний узел
        private var _size: Int

        init() {
            _size = 0
        }

        /* Получить длину очереди */
        func size() -> Int {
            _size
        }

        /* Проверить, пуста ли очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Добавить элемент в очередь */
        func push(num: Int) {
            // Добавить узел со значением num после последнего узла
            let node = ListNode(x: num)
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if front == nil {
                front = node
                rear = node
            }
            // Если очередь непуста, добавить новый узел после последнего
            else {
                rear?.next = node
                rear = node
            }
            _size += 1
        }

        /* Извлечь элемент из очереди */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Удалить первый узел
            front = front?.next
            _size -= 1
            return num
        }

        /* Посмотреть первый элемент очереди */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Очередь пуста")
            }
            return front!.val
        }

        /* Преобразовать связный список в массив и вернуть его */
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

    ```javascript title="linkedlist_queue.js"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        #front; // Первый узел #front
        #rear; // Последний узел #rear
        #queSize = 0;

        constructor() {
            this.#front = null;
            this.#rear = null;
        }

        /* Получить длину очереди */
        get size() {
            return this.#queSize;
        }

        /* Проверить, пуста ли очередь */
        isEmpty() {
            return this.size === 0;
        }

        /* Добавить элемент в очередь */
        push(num) {
            // Добавить узел со значением num после последнего узла
            const node = new ListNode(num);
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (!this.#front) {
                this.#front = node;
                this.#rear = node;
                // Если очередь непуста, добавить новый узел после последнего
            } else {
                this.#rear.next = node;
                this.#rear = node;
            }
            this.#queSize++;
        }

        /* Извлечь элемент из очереди */
        pop() {
            const num = this.peek();
            // Удалить первый узел
            this.#front = this.#front.next;
            this.#queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        peek() {
            if (this.size === 0) throw new Error('Очередь пуста');
            return this.#front.val;
        }

        /* Преобразовать связный список в массив и вернуть его */
        toArray() {
            let node = this.#front;
            const res = new Array(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_queue.ts"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        private front: ListNode | null; // Первый узел front
        private rear: ListNode | null; // Последний узел rear
        private queSize: number = 0;

        constructor() {
            this.front = null;
            this.rear = null;
        }

        /* Получить длину очереди */
        get size(): number {
            return this.queSize;
        }

        /* Проверить, пуста ли очередь */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* Добавить элемент в очередь */
        push(num: number): void {
            // Добавить узел со значением num после последнего узла
            const node = new ListNode(num);
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (!this.front) {
                this.front = node;
                this.rear = node;
                // Если очередь непуста, добавить новый узел после последнего
            } else {
                this.rear!.next = node;
                this.rear = node;
            }
            this.queSize++;
        }

        /* Извлечь элемент из очереди */
        pop(): number {
            const num = this.peek();
            if (!this.front) throw new Error('Очередь пуста');
            // Удалить первый узел
            this.front = this.front.next;
            this.queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        peek(): number {
            if (this.size === 0) throw new Error('Очередь пуста');
            return this.front!.val;
        }

        /* Преобразовать связный список в массив и вернуть его */
        toArray(): number[] {
            let node = this.front;
            const res = new Array<number>(this.size);
            for (let i = 0; i < res.length; i++) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_queue.dart"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
      ListNode? _front; // Первый узел _front
      ListNode? _rear; // Последний узел _rear
      int _queSize = 0; // Длина очереди

      LinkedListQueue() {
        _front = null;
        _rear = null;
      }

      /* Получить длину очереди */
      int size() {
        return _queSize;
      }

      /* Проверить, пуста ли очередь */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Добавить элемент в очередь */
      void push(int _num) {
        // Добавить узел со значением _num после последнего узла
        final node = ListNode(_num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (_front == null) {
          _front = node;
          _rear = node;
        } else {
          // Если очередь непуста, добавить новый узел после последнего
          _rear!.next = node;
          _rear = node;
        }
        _queSize++;
      }

      /* Извлечь элемент из очереди */
      int pop() {
        final int _num = peek();
        // Удалить первый узел
        _front = _front!.next;
        _queSize--;
        return _num;
      }

      /* Посмотреть первый элемент очереди */
      int peek() {
        if (_queSize == 0) {
          throw Exception('Очередь пуста');
        }
        return _front!.val;
      }

      /* Преобразовать связный список в список значений и вернуть его */
      List<int> toArray() {
        ListNode? node = _front;
        final List<int> queue = [];
        while (node != null) {
          queue.add(node.val);
          node = node.next;
        }
        return queue;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_queue.rs"
    /* Очередь на основе связного списка */
    #[allow(dead_code)]
    pub struct LinkedListQueue<T> {
        front: Option<Rc<RefCell<ListNode<T>>>>, // Первый узел front
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // Последний узел rear
        que_size: usize,                         // Длина очереди
    }

    impl<T: Copy> LinkedListQueue<T> {
        pub fn new() -> Self {
            Self {
                front: None,
                rear: None,
                que_size: 0,
            }
        }

        /* Получить длину очереди */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* Проверить, пуста ли очередь */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* Добавить элемент в очередь */
        pub fn push(&mut self, num: T) {
            // Добавить узел со значением num после последнего узла
            let new_rear = ListNode::new(num);
            match self.rear.take() {
                // Если очередь непуста, добавить новый узел после последнего
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
                // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
                None => {
                    self.front = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
            }
            self.que_size += 1;
        }

        /* Извлечь элемент из очереди */
        pub fn pop(&mut self) -> Option<T> {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        self.front = Some(new_front);
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1;
                old_front.borrow().val
            })
        }

        /* Посмотреть первый элемент очереди */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* Преобразовать связный список в динамический массив и вернуть его */
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

    ```c title="linkedlist_queue.c"
    /* Очередь на основе связного списка */
    typedef struct {
        ListNode *front, *rear;
        int queSize;
    } LinkedListQueue;

    /* Конструктор */
    LinkedListQueue *newLinkedListQueue() {
        LinkedListQueue *queue = (LinkedListQueue *)malloc(sizeof(LinkedListQueue));
        queue->front = NULL;
        queue->rear = NULL;
        queue->queSize = 0;
        return queue;
    }

    /* Деструктор */
    void delLinkedListQueue(LinkedListQueue *queue) {
        // Освободить память, занятую всеми узлами
        while (queue->front != NULL) {
            ListNode *tmp = queue->front;
            queue->front = queue->front->next;
            free(tmp);
        }
        // Освободить память структуры queue
        free(queue);
    }

    /* Получить длину очереди */
    int size(LinkedListQueue *queue) {
        return queue->queSize;
    }

    /* Проверить, пуста ли очередь */
    bool empty(LinkedListQueue *queue) {
        return (size(queue) == 0);
    }

    /* Добавить элемент в очередь */
    void push(LinkedListQueue *queue, int num) {
        // Добавить node в конец списка
        ListNode *node = newListNode(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (queue->front == NULL) {
            queue->front = node;
            queue->rear = node;
        }
        // Если очередь непуста, добавить новый узел после последнего
        else {
            queue->rear->next = node;
            queue->rear = node;
        }
        queue->queSize++;
    }

    /* Посмотреть первый элемент очереди */
    int peek(LinkedListQueue *queue) {
        assert(size(queue) && queue->front);
        return queue->front->val;
    }

    /* Извлечь элемент из очереди */
    int pop(LinkedListQueue *queue) {
        int num = peek(queue);
        ListNode *tmp = queue->front;
        queue->front = queue->front->next;
        free(tmp);
        queue->queSize--;
        return num;
    }

    /* Вывести очередь */
    void printLinkedListQueue(LinkedListQueue *queue) {
        int *arr = malloc(sizeof(int) * queue->queSize);
        // Скопировать данные из связного списка в массив
        int i;
        ListNode *node;
        for (i = 0, node = queue->front; i < queue->queSize; i++) {
            arr[i] = node->val;
            node = node->next;
        }
        printArray(arr, queue->queSize);
        free(arr);
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_queue.kt"
    /* Очередь на основе связного списка */
    class LinkedListQueue(
        // front — первый узел, rear — последний
        private var front: ListNode? = null,
        private var rear: ListNode? = null,
        private var queSize: Int = 0
    ) {

        /* Получить длину очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверить, пуста ли очередь */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Добавить элемент в очередь */
        fun push(num: Int) {
            // Добавить узел со значением num после последнего узла
            val node = ListNode(num)
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            if (front == null) {
                front = node
                rear = node
                // Если очередь непуста, добавить новый узел после последнего
            } else {
                rear?.next = node
                rear = node
            }
            queSize++
        }

        /* Извлечь элемент из очереди */
        fun pop(): Int {
            val num = peek()
            // Удалить первый узел
            front = front?.next
            queSize--
            return num
        }

        /* Посмотреть первый элемент очереди */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* Преобразовать связный список в массив и вернуть его */
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

    ```ruby title="linkedlist_queue.rb"
    ### Очередь на основе связного списка ###
    class LinkedListQueue
      ### Получить длину очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize
        @front = nil  # Первый узел front
        @rear = nil   # Последний узел rear
        @size = 0
      end

      ### Проверить, пуста ли очередь ###
      def is_empty?
        @front.nil?
      end

      ### Добавить элемент в очередь ###
      def push(num)
        # Добавить узел со значением num после последнего узла
        node = ListNode.new(num)

        # Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if @front.nil?
          @front = node
          @rear = node
        # Если очередь непуста, добавить новый узел после последнего
        else
          @rear.next = node
          @rear = node
        end

        @size += 1
      end

      ### Извлечь элемент из очереди ###
      def pop
        num = peek
        # Удалить первый узел
        @front = @front.next
        @size -= 1
        num
      end

      ### Посмотреть первый элемент очереди ###
      def peek
        raise IndexError, 'Очередь пуста' if is_empty?

        @front.val
      end

      ### Преобразовать связный список в массив и вернуть его ###
      def to_array
        queue = []
        temp = @front
        while temp
          queue << temp.val
          temp = temp.next
        end
        queue
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%0Aclass%20LinkedListQueue%3A%0A%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BD%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B5%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%93%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%20front%0A%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%20rear%0A%20%20self._size%3A%20int%20%3D%200%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%22%22%22%0A%20%20return%20not%20self._front%0A%0A%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%22%22%22%0A%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20num%20%D0%B7%D0%B0%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%BC%0A%20%20node%20%3D%20ListNode%28num%29%0A%20%20%23%20%D0%92%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%D0%B8%20rear%20%D1%83%D0%BA%D0%B0%D0%B6%D1%83%D1%82%20%D0%BD%D0%B0%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20if%20self._front%20is%20None%3A%0A%20%20%20self._front%20%3D%20node%0A%20%20%20self._rear%20%3D%20node%0A%20%20%23%20%D0%98%D0%BD%D0%B0%D1%87%D0%B5%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20%D0%B7%D0%B0%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%BC%0A%20%20else%3A%0A%20%20%20self._rear.next%20%3D%20node%0A%20%20%20self._rear%20%3D%20node%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20num%20%3D%20self.peek%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%83%0A%20%20self._front%20%3D%20self._front.next%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%22%22%22%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%22%29%0A%20%20return%20self._front.val%0A%0A%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%A1%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D0%B8%22%22%22%0A%20%20queue%20%3D%20%5B%5D%0A%20%20temp%20%3D%20self._front%0A%20%20while%20temp%3A%0A%20%20%20queue.append%28temp.val%29%0A%20%20%20temp%20%3D%20temp.next%0A%20%20return%20queue%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20queue%20%3D%20LinkedListQueue%28%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20queue.push%281%29%0A%20queue.push%283%29%0A%20queue.push%282%29%0A%20queue.push%285%29%0A%20queue.push%284%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20peek%20%3D%20queue.peek%28%29%0A%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20peek%29%0A%0A%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20pop_front%20%3D%20queue.pop%28%29%0A%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BE%3A%20pop%20%3D%22,%20pop_front%29%0A%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%0A%20size%20%3D%20queue.size%28%29%0A%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%23%20%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%0A%20is_empty%20%3D%20queue.is_empty%28%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D1%81%D0%BB%D0%B5%D0%B4%D1%83%D1%8E%D1%89%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0A%0Aclass%20LinkedListQueue%3A%0A%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BD%D0%B0%20%D1%81%D0%B2%D1%8F%D0%B7%D0%BD%D0%BE%D0%BC%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B5%22%22%22%0A%0A%20def%20__init__%28self%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%93%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%20front%0A%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A5%D0%B2%D0%BE%D1%81%D1%82%20rear%0A%20%20self._size%3A%20int%20%3D%200%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%22%22%22%0A%20%20return%20not%20self._front%0A%0A%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%22%22%22%0A%20%20%23%20%D0%92%D1%81%D1%82%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20num%20%D0%B7%D0%B0%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%BC%0A%20%20node%20%3D%20ListNode%28num%29%0A%20%20%23%20%D0%92%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%D0%B8%20rear%20%D1%83%D0%BA%D0%B0%D0%B6%D1%83%D1%82%20%D0%BD%D0%B0%20%D0%BD%D0%BE%D0%B2%D1%8B%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20if%20self._front%20is%20None%3A%0A%20%20%20self._front%20%3D%20node%0A%20%20%20self._rear%20%3D%20node%0A%20%20%23%20%D0%98%D0%BD%D0%B0%D1%87%D0%B5%20%D0%B4%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%83%D0%B7%D0%B5%D0%BB%20%D0%B7%D0%B0%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%BE%D0%BC%0A%20%20else%3A%0A%20%20%20self._rear.next%20%3D%20node%0A%20%20%20self._rear%20%3D%20node%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20num%20%3D%20self.peek%28%29%0A%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B8%D1%82%D1%8C%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%83%0A%20%20self._front%20%3D%20self._front.next%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%22%22%22%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%22%29%0A%20%20return%20self._front.val%0A%0A%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%A1%D0%BE%D0%B1%D1%80%D0%B0%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D0%B8%22%22%22%0A%20%20queue%20%3D%20%5B%5D%0A%20%20temp%20%3D%20self._front%0A%20%20while%20temp%3A%0A%20%20%20queue.append%28temp.val%29%0A%20%20%20temp%20%3D%20temp.next%0A%20%20return%20queue%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20queue%20%3D%20LinkedListQueue%28%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20queue.push%281%29%0A%20queue.push%283%29%0A%20queue.push%282%29%0A%20queue.push%285%29%0A%20queue.push%284%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20peek%20%3D%20queue.peek%28%29%0A%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%22,%20peek%29%0A%0A%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20pop_front%20%3D%20queue.pop%28%29%0A%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BE%3A%20pop%20%3D%22,%20pop_front%29%0A%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20queue%20%3D%22,%20queue.to_list%28%29%29%0A%0A%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%0A%20size%20%3D%20queue.size%28%29%0A%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%23%20%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%0A%20is_empty%20%3D%20queue.is_empty%28%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Реализация на основе массива

Удаление первого элемента массива занимает $O(n)$ времени, поэтому извлекать элементы из такой очереди было бы неэффективно. Обойти эту трудность можно следующим образом.

Сохраним в переменной `front` индекс первого элемента очереди, а в переменной `size` — длину очереди. Положим `rear = front + size`. Вычисленный по этой формуле индекс `rear` указывает на позицию сразу за последним элементом очереди.

При таком устройстве **элементы очереди занимают в массиве диапазон индексов `[front, rear - 1]`**. На рисунке 5-6 показано, как выполнять операции с очередью.

- Добавление: записать новый элемент по индексу `rear` и увеличить `size` на 1.
- Извлечение: достаточно увеличить `front` на 1 и уменьшить `size` на 1.

Как видно, и добавление, и извлечение выполняются за один шаг, поэтому временная сложность обеих операций составляет $O(1)$.

=== "<1>"
    ![Добавление и извлечение элементов в очереди на основе массива](queue.assets/array_queue_step1.svg){ class="animation-figure" }

=== "<2>"
    ![array_queue_push](queue.assets/array_queue_step2_push.svg){ class="animation-figure" }

=== "<3>"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.svg){ class="animation-figure" }

<p align="center"> Рисунок 5-6 &nbsp; Добавление и извлечение элементов в очереди на основе массива </p>

При последовательных добавлениях и извлечениях возникает трудность: `front` и `rear` смещаются вправо, и **на конце массива им будет некуда двигаться дальше**. Решим эту задачу, мысленно соединив конец массива с началом. Такой массив называют кольцевым.

В кольцевом массиве индекс `front` или `rear`, перешагнув через конец, должен вернуться к началу и продолжить движение оттуда. Такое циклическое изменение индексов можно реализовать с помощью остатка от деления, как в следующем примере.

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """Очередь на основе кольцевого массива"""

        def __init__(self, size: int):
            """Конструктор"""
            self._nums: list[int] = [0] * size  # Массив для хранения элементов очереди
            self._front: int = 0  # Индекс первого элемента очереди
            self._size: int = 0  # Длина очереди

        def capacity(self) -> int:
            """Получить ёмкость очереди"""
            return len(self._nums)

        def size(self) -> int:
            """Получить длину очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверить, пуста ли очередь"""
            return self._size == 0

        def push(self, num: int):
            """Добавить элемент в очередь"""
            if self._size == self.capacity():
                raise IndexError("Очередь заполнена")
            # Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            # При выходе за конец массива операция взятия остатка возвращает rear в начало
            rear: int = (self._front + self._size) % self.capacity()
            # Добавить num в конец очереди
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """Извлечь элемент из очереди"""
            num: int = self.peek()
            # Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """Посмотреть первый элемент очереди"""
            if self.is_empty():
                raise IndexError("Очередь пуста")
            return self._nums[self._front]

        def to_list(self) -> list[int]:
            """Вернуть список для вывода"""
            res = [0] * self.size()
            j: int = self._front
            for i in range(self.size()):
                res[i] = self._nums[(j % self.capacity())]
                j += 1
            return res
    ```

=== "C++"

    ```cpp title="array_queue.cpp"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
      private:
        int *nums;       // Массив для хранения элементов очереди
        int front;       // Индекс первого элемента очереди
        int queSize;     // Длина очереди
        int queCapacity; // Ёмкость очереди

      public:
        ArrayQueue(int capacity) {
            // Инициализировать массив
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* Получить ёмкость очереди */
        int capacity() {
            return queCapacity;
        }

        /* Получить длину очереди */
        int size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        bool isEmpty() {
            return size() == 0;
        }

        /* Добавить элемент в очередь */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "Очередь заполнена" << endl;
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            int rear = (front + queSize) % queCapacity;
            // Добавить num в конец очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь элемент из очереди */
        int pop() {
            int num = peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            front = (front + 1) % queCapacity;
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        int peek() {
            if (isEmpty())
                throw out_of_range("Очередь пуста");
            return nums[front];
        }

        /* Преобразовать массив в вектор и вернуть его */
        vector<int> toVector() {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            vector<int> arr(queSize);
            for (int i = 0, j = front; i < queSize; i++, j++) {
                arr[i] = nums[j % queCapacity];
            }
            return arr;
        }
    };
    ```

=== "Java"

    ```java title="array_queue.java"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        private int[] nums; // Массив для хранения элементов очереди
        private int front; // Индекс первого элемента очереди
        private int queSize; // Длина очереди

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить ёмкость очереди */
        public int capacity() {
            return nums.length;
        }

        /* Получить длину очереди */
        public int size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* Добавить элемент в очередь */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("Очередь заполнена");
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            int rear = (front + queSize) % capacity();
            // Добавить num в конец очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь элемент из очереди */
        public int pop() {
            int num = peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* Вернуть массив */
        public int[] toArray() {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % capacity()];
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_queue.cs"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        int[] nums;  // Массив для хранения элементов очереди
        int front;   // Индекс первого элемента очереди
        int queSize; // Длина очереди

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить ёмкость очереди */
        int Capacity() {
            return nums.Length;
        }

        /* Получить длину очереди */
        public int Size() {
            return queSize;
        }

        /* Проверить, пуста ли очередь */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* Добавить элемент в очередь */
        public void Push(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("Очередь заполнена");
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            int rear = (front + queSize) % Capacity();
            // Добавить num в конец очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь элемент из очереди */
        public int Pop() {
            int num = Peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            front = (front + 1) % Capacity();
            queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return nums[front];
        }

        /* Вернуть массив */
        public int[] ToArray() {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            int[] res = new int[queSize];
            for (int i = 0, j = front; i < queSize; i++, j++) {
                res[i] = nums[j % this.Capacity()];
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_queue.go"
    /* Очередь на основе кольцевого массива */
    type arrayQueue struct {
        nums        []int // Массив для хранения элементов очереди
        front       int   // Индекс первого элемента очереди
        queSize     int   // Длина очереди
        queCapacity int   // Ёмкость очереди (максимальное число элементов)
    }

    /* Инициализировать очередь */
    func newArrayQueue(queCapacity int) *arrayQueue {
        return &arrayQueue{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* Получить длину очереди */
    func (q *arrayQueue) size() int {
        return q.queSize
    }

    /* Проверить, пуста ли очередь */
    func (q *arrayQueue) isEmpty() bool {
        return q.queSize == 0
    }

    /* Добавить элемент в очередь */
    func (q *arrayQueue) push(num int) {
        // Равенство queSize == queCapacity означает, что очередь заполнена
        if q.queSize == q.queCapacity {
            return
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        rear := (q.front + q.queSize) % q.queCapacity
        // Добавить num в конец очереди
        q.nums[rear] = num
        q.queSize++
    }

    /* Извлечь элемент из очереди */
    func (q *arrayQueue) pop() any {
        num := q.peek()
        if num == nil {
            return nil
        }

        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        q.front = (q.front + 1) % q.queCapacity
        q.queSize--
        return num
    }

    /* Посмотреть первый элемент очереди */
    func (q *arrayQueue) peek() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* Получить срез для вывода */
    func (q *arrayQueue) toSlice() []int {
        rear := (q.front + q.queSize)
        if rear >= q.queCapacity {
            rear %= q.queCapacity
            return append(q.nums[q.front:], q.nums[:rear]...)
        }
        return q.nums[q.front:rear]
    }
    ```

=== "Swift"

    ```swift title="array_queue.swift"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        private var nums: [Int] // Массив для хранения элементов очереди
        private var front: Int // Индекс первого элемента очереди
        private var _size: Int // Длина очереди

        init(capacity: Int) {
            // Инициализировать массив
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* Получить ёмкость очереди */
        func capacity() -> Int {
            nums.count
        }

        /* Получить длину очереди */
        func size() -> Int {
            _size
        }

        /* Проверить, пуста ли очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Добавить элемент в очередь */
        func push(num: Int) {
            if size() == capacity() {
                print("Очередь заполнена")
                return
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            let rear = (front + size()) % capacity()
            // Добавить num в конец очереди
            nums[rear] = num
            _size += 1
        }

        /* Извлечь элемент из очереди */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            front = (front + 1) % capacity()
            _size -= 1
            return num
        }

        /* Посмотреть первый элемент очереди */
        func peek() -> Int {
            if isEmpty() {
                fatalError("Очередь пуста")
            }
            return nums[front]
        }

        /* Вернуть массив */
        func toArray() -> [Int] {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            (front ..< front + size()).map { nums[$0 % capacity()] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_queue.js"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        #nums; // Массив для хранения элементов очереди
        #front = 0; // Индекс первого элемента очереди
        #queSize = 0; // Длина очереди

        constructor(capacity) {
            this.#nums = new Array(capacity);
        }

        /* Получить ёмкость очереди */
        get capacity() {
            return this.#nums.length;
        }

        /* Получить длину очереди */
        get size() {
            return this.#queSize;
        }

        /* Проверить, пуста ли очередь */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* Добавить элемент в очередь */
        push(num) {
            if (this.size === this.capacity) {
                console.log('Очередь заполнена');
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            const rear = (this.#front + this.size) % this.capacity;
            // Добавить num в конец очереди
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* Извлечь элемент из очереди */
        pop() {
            const num = this.peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            this.#front = (this.#front + 1) % this.capacity;
            this.#queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        peek() {
            if (this.isEmpty()) throw new Error('Очередь пуста');
            return this.#nums[this.#front];
        }

        /* Вернуть массив */
        toArray() {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            const arr = new Array(this.size);
            for (let i = 0, j = this.#front; i < this.size; i++, j++) {
                arr[i] = this.#nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "TS"

    ```typescript title="array_queue.ts"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        private nums: number[]; // Массив для хранения элементов очереди
        private front: number; // Индекс первого элемента очереди
        private queSize: number; // Длина очереди

        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = this.queSize = 0;
        }

        /* Получить ёмкость очереди */
        get capacity(): number {
            return this.nums.length;
        }

        /* Получить длину очереди */
        get size(): number {
            return this.queSize;
        }

        /* Проверить, пуста ли очередь */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* Добавить элемент в очередь */
        push(num: number): void {
            if (this.size === this.capacity) {
                console.log('Очередь заполнена');
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            const rear = (this.front + this.queSize) % this.capacity;
            // Добавить num в конец очереди
            this.nums[rear] = num;
            this.queSize++;
        }

        /* Извлечь элемент из очереди */
        pop(): number {
            const num = this.peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            this.front = (this.front + 1) % this.capacity;
            this.queSize--;
            return num;
        }

        /* Посмотреть первый элемент очереди */
        peek(): number {
            if (this.isEmpty()) throw new Error('Очередь пуста');
            return this.nums[this.front];
        }

        /* Вернуть массив */
        toArray(): number[] {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            const arr = new Array(this.size);
            for (let i = 0, j = this.front; i < this.size; i++, j++) {
                arr[i] = this.nums[j % this.capacity];
            }
            return arr;
        }
    }
    ```

=== "Dart"

    ```dart title="array_queue.dart"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
      late List<int> _nums; // Массив для хранения элементов очереди
      late int _front; // Индекс первого элемента очереди
      late int _queSize; // Длина очереди

      ArrayQueue(int capacity) {
        _nums = List.filled(capacity, 0);
        _front = _queSize = 0;
      }

      /* Получить ёмкость очереди */
      int capaCity() {
        return _nums.length;
      }

      /* Получить длину очереди */
      int size() {
        return _queSize;
      }

      /* Проверить, пуста ли очередь */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Добавить элемент в очередь */
      void push(int _num) {
        if (_queSize == capaCity()) {
          throw Exception("Очередь заполнена");
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        int rear = (_front + _queSize) % capaCity();
        // Добавить _num в конец очереди
        _nums[rear] = _num;
        _queSize++;
      }

      /* Извлечь элемент из очереди */
      int pop() {
        int _num = peek();
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        _front = (_front + 1) % capaCity();
        _queSize--;
        return _num;
      }

      /* Посмотреть первый элемент очереди */
      int peek() {
        if (isEmpty()) {
          throw Exception("Очередь пуста");
        }
        return _nums[_front];
      }

      /* Вернуть список */
      List<int> toArray() {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        final List<int> res = List.filled(_queSize, 0);
        for (int i = 0, j = _front; i < _queSize; i++, j++) {
          res[i] = _nums[j % capaCity()];
        }
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_queue.rs"
    /* Очередь на основе кольцевого массива */
    struct ArrayQueue<T> {
        nums: Vec<T>,      // Массив для хранения элементов очереди
        front: i32,        // Индекс первого элемента очереди
        que_size: i32,     // Длина очереди
        que_capacity: i32, // Ёмкость очереди
    }

    impl<T: Copy + Default> ArrayQueue<T> {
        /* Конструктор */
        fn new(capacity: i32) -> ArrayQueue<T> {
            ArrayQueue {
                nums: vec![T::default(); capacity as usize],
                front: 0,
                que_size: 0,
                que_capacity: capacity,
            }
        }

        /* Получить ёмкость очереди */
        fn capacity(&self) -> i32 {
            self.que_capacity
        }

        /* Получить длину очереди */
        fn size(&self) -> i32 {
            self.que_size
        }

        /* Проверить, пуста ли очередь */
        fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* Добавить элемент в очередь */
        fn push(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("Очередь заполнена");
                return;
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            let rear = (self.front + self.que_size) % self.que_capacity;
            // Добавить num в конец очереди
            self.nums[rear as usize] = num;
            self.que_size += 1;
        }

        /* Извлечь элемент из очереди */
        fn pop(&mut self) -> T {
            let num = self.peek();
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            self.front = (self.front + 1) % self.que_capacity;
            self.que_size -= 1;
            num
        }

        /* Посмотреть первый элемент очереди */
        fn peek(&self) -> T {
            if self.is_empty() {
                panic!("index out of bounds");
            }
            self.nums[self.front as usize]
        }

        /* Вернуть динамический массив */
        fn to_vector(&self) -> Vec<T> {
            let cap = self.que_capacity;
            let mut j = self.front;
            let mut arr = vec![T::default(); cap as usize];
            for i in 0..self.que_size {
                arr[i as usize] = self.nums[(j % cap) as usize];
                j += 1;
            }
            arr
        }
    }
    ```

=== "C"

    ```c title="array_queue.c"
    /* Очередь на основе кольцевого массива */
    typedef struct {
        int *nums;       // Массив для хранения элементов очереди
        int front;       // Индекс первого элемента очереди
        int queSize;     // Текущее число элементов в очереди
        int queCapacity; // Ёмкость очереди
    } ArrayQueue;

    /* Конструктор */
    ArrayQueue *newArrayQueue(int capacity) {
        ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
        // Инициализировать массив
        queue->queCapacity = capacity;
        queue->nums = (int *)malloc(sizeof(int) * queue->queCapacity);
        queue->front = queue->queSize = 0;
        return queue;
    }

    /* Деструктор */
    void delArrayQueue(ArrayQueue *queue) {
        free(queue->nums);
        free(queue);
    }

    /* Получить ёмкость очереди */
    int capacity(ArrayQueue *queue) {
        return queue->queCapacity;
    }

    /* Получить длину очереди */
    int size(ArrayQueue *queue) {
        return queue->queSize;
    }

    /* Проверить, пуста ли очередь */
    bool empty(ArrayQueue *queue) {
        return queue->queSize == 0;
    }

    /* Посмотреть первый элемент очереди */
    int peek(ArrayQueue *queue) {
        assert(size(queue) != 0);
        return queue->nums[queue->front];
    }

    /* Добавить элемент в очередь */
    void push(ArrayQueue *queue, int num) {
        if (size(queue) == capacity(queue)) {
            printf("Очередь заполнена\r\n");
            return;
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        int rear = (queue->front + queue->queSize) % queue->queCapacity;
        // Добавить num в конец очереди
        queue->nums[rear] = num;
        queue->queSize++;
    }

    /* Извлечь элемент из очереди */
    int pop(ArrayQueue *queue) {
        int num = peek(queue);
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        queue->front = (queue->front + 1) % queue->queCapacity;
        queue->queSize--;
        return num;
    }

    /* Вернуть массив для вывода */
    int *toArray(ArrayQueue *queue, int *queSize) {
        *queSize = queue->queSize;
        int *res = (int *)calloc(queue->queSize, sizeof(int));
        int j = queue->front;
        for (int i = 0; i < queue->queSize; i++) {
            res[i] = queue->nums[j % queue->queCapacity];
            j++;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_queue.kt"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue(capacity: Int) {
        private val nums: IntArray = IntArray(capacity) // Массив для хранения элементов очереди
        private var front: Int = 0 // Индекс первого элемента очереди
        private var queSize: Int = 0 // Длина очереди

        /* Получить ёмкость очереди */
        fun capacity(): Int {
            return nums.size
        }

        /* Получить длину очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверить, пуста ли очередь */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* Добавить элемент в очередь */
        fun push(num: Int) {
            if (queSize == capacity()) {
                println("Очередь заполнена")
                return
            }
            // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
            // При выходе за конец массива операция взятия остатка возвращает rear в начало
            val rear = (front + queSize) % capacity()
            // Добавить num в конец очереди
            nums[rear] = num
            queSize++
        }

        /* Извлечь элемент из очереди */
        fun pop(): Int {
            val num = peek()
            // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
            front = (front + 1) % capacity()
            queSize--
            return num
        }

        /* Посмотреть первый элемент очереди */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* Вернуть массив */
        fun toArray(): IntArray {
            // Преобразовать только те элементы, которые сейчас находятся в очереди
            val res = IntArray(queSize)
            var i = 0
            var j = front
            while (i < queSize) {
                res[i] = nums[j % capacity()]
                i++
                j++
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_queue.rb"
    ### Очередь на основе кольцевого массива ###
    class ArrayQueue
      ### Получить длину очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize(size)
        @nums = Array.new(size, 0) # Массив для хранения элементов очереди
        @front = 0 # Индекс первого элемента очереди
        @size = 0 # Длина очереди
      end

      ### Получить ёмкость очереди ###
      def capacity
        @nums.length
      end

      ### Проверить, пуста ли очередь ###
      def is_empty?
        size.zero?
      end

      ### Добавить элемент в очередь ###
      def push(num)
        raise IndexError, 'Очередь заполнена' if size == capacity

        # Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        # При выходе за конец массива операция взятия остатка возвращает rear в начало
        rear = (@front + size) % capacity
        # Добавить num в конец очереди
        @nums[rear] = num
        @size += 1
      end

      ### Извлечь элемент из очереди ###
      def pop
        num = peek
        # Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        @front = (@front + 1) % capacity
        @size -= 1
        num
      end

      ### Посмотреть первый элемент очереди ###
      def peek
        raise IndexError, 'Очередь пуста' if is_empty?

        @nums[@front]
      end

      ### Вернуть массив для вывода ###
      def to_array
        res = Array.new(size, 0)
        j = @front

        for i in 0...size
          res[i] = @nums[j % capacity]
          j += 1
        end

        res
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BD%D0%B0%20%D0%BA%D0%BE%D0%BB%D1%8C%D1%86%D0%B5%D0%B2%D0%BE%D0%BC%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%0A%20def%20__init__%28self,%20size%3A%20int%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20self._front%3A%20int%20%3D%200%20%20%23%20%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20self._size%3A%20int%20%3D%200%20%20%23%20%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20len%28self._nums%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%22%22%22%0A%20%20return%20self._size%20%3D%3D%200%0A%0A%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%22%22%22%0A%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D0%BE%D0%BB%D0%BD%D0%B0%22%29%0A%20%20%23%20rear%20%3D%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%2B%201%0A%20%20%23%20%D0%9E%D1%81%D1%82%D0%B0%D1%82%D0%BE%D0%BA%20%D0%BE%D1%82%20%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%B5%D1%80%D0%BD%D1%91%D1%82%20rear%20%D1%81%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BA%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%83%0A%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20num%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20front%20%D0%BD%D0%B0%201,%20%D1%81%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%E2%80%94%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%BE%0A%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%22%22%22%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%22%29%0A%20%20return%20self._nums%5Bself._front%5D%0A%0A%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0%22%22%22%0A%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20j%3A%20int%20%3D%20self._front%0A%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20res%5Bi%5D%20%3D%20self._nums%5B%28j%20%25%20self.capacity%28%29%29%5D%0A%20%20%20j%20%2B%3D%201%0A%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20queue%20%3D%20ArrayQueue%2810%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20queue.push%281%29%0A%20queue.push%283%29%0A%20queue.push%282%29%0A%20queue.push%285%29%0A%20queue.push%284%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20peek%20%3D%20queue.peek%28%29%0A%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%22,%20peek%29%0A%0A%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20pop%20%3D%20queue.pop%28%29%0A%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BE%3A%20pop%20%3D%22,%20pop%29%0A%0A%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%0A%20size%20%3D%20queue.size%28%29%0A%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%23%20%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%0A%20is_empty%20%3D%20queue.is_empty%28%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BD%D0%B0%20%D0%BA%D0%BE%D0%BB%D1%8C%D1%86%D0%B5%D0%B2%D0%BE%D0%BC%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B5%22%22%22%0A%0A%20def%20__init__%28self,%20size%3A%20int%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%20%20%23%20%D0%9C%D0%B0%D1%81%D1%81%D0%B8%D0%B2%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%0A%20%20self._front%3A%20int%20%3D%200%20%20%23%20%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D0%B5%D1%80%D0%B2%D0%BE%D0%B3%D0%BE%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%0A%20%20self._size%3A%20int%20%3D%200%20%20%23%20%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%0A%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20len%28self._nums%29%0A%0A%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%22%22%22%0A%20%20return%20self._size%0A%0A%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%22%22%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%22%22%22%0A%20%20return%20self._size%20%3D%3D%200%0A%0A%20def%20push%28self,%20num%3A%20int%29%3A%0A%20%20%22%22%22%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%22%22%22%0A%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D0%BE%D0%BB%D0%BD%D0%B0%22%29%0A%20%20%23%20rear%20%3D%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%2B%201%0A%20%20%23%20%D0%9E%D1%81%D1%82%D0%B0%D1%82%D0%BE%D0%BA%20%D0%BE%D1%82%20%D0%B4%D0%B5%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B2%D0%B5%D1%80%D0%BD%D1%91%D1%82%20rear%20%D1%81%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%D0%BA%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D1%83%0A%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20num%20%D0%B2%20%D0%BA%D0%BE%D0%BD%D0%B5%D1%86%0A%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20self._size%20%2B%3D%201%0A%0A%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%22%22%22%0A%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%23%20%D0%A1%D0%B4%D0%B2%D0%B8%D0%BD%D1%83%D1%82%D1%8C%20front%20%D0%BD%D0%B0%201,%20%D1%81%20%D0%BA%D0%BE%D0%BD%D1%86%D0%B0%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%20%E2%80%94%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%BE%0A%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20self._size%20-%3D%201%0A%20%20return%20num%0A%0A%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%22%22%22%0A%20%20if%20self.is_empty%28%29%3A%0A%20%20%20raise%20IndexError%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%22%29%0A%20%20return%20self._nums%5Bself._front%5D%0A%0A%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0%22%22%22%0A%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20j%3A%20int%20%3D%20self._front%0A%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20res%5Bi%5D%20%3D%20self._nums%5B%28j%20%25%20self.capacity%28%29%29%5D%0A%20%20%20j%20%2B%3D%201%0A%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20queue%20%3D%20ArrayQueue%2810%29%0A%0A%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%8B%0A%20queue.push%281%29%0A%20queue.push%283%29%0A%20queue.push%282%29%0A%20queue.push%285%29%0A%20queue.push%284%29%0A%0A%20%23%20%D0%9F%D1%80%D0%BE%D1%87%D0%B8%D1%82%D0%B0%D1%82%D1%8C%20%D0%BF%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20peek%20%3D%20queue.peek%28%29%0A%20print%28%22%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%22,%20peek%29%0A%0A%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%0A%20pop%20%3D%20queue.pop%28%29%0A%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BE%3A%20pop%20%3D%22,%20pop%29%0A%0A%20%23%20%D0%A3%D0%B7%D0%BD%D0%B0%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%0A%20size%20%3D%20queue.size%28%29%0A%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20size%20%3D%22,%20size%29%0A%0A%20%23%20%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%3F%0A%20is_empty%20%3D%20queue.is_empty%28%29%0A%20print%28%22%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

У этой реализации очереди остаётся ограничение: её длина фиксирована. Его легко снять, если заменить массив динамическим массивом, который может расширяться. Попробуйте реализовать такую очередь самостоятельно.

Сравнение двух реализаций приводит к тем же выводам, что и для стека.

## 5.2.3 &nbsp; Примеры применения очереди

- **Заказы на Taobao**. Когда покупатель оформляет заказ, он попадает в очередь. Затем система обрабатывает заказы по порядку. Во время распродажи 11 ноября за короткое время поступает огромное число заказов. Одна из главных задач инженеров — справиться с таким количеством одновременных запросов.
- **Задачи, ожидающие выполнения**. Очередь помогает сохранять порядок обработки везде, где заявки должны обслуживаться в порядке поступления. Например, в очередь ставят задания на печать или заказы на выдачу блюд в ресторане.
