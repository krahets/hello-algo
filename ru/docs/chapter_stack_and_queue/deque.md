# Двусторонняя очередь

В очереди мы можем удалять элементы только из головы или добавлять элементы в хвост. Как показано на рисунке ниже, <u>двусторонняя очередь (double-ended queue)</u> предоставляет большую гибкость, позволяя выполнять операции добавления или удаления элементов как в голове, так и в хвосте.

![Операции двусторонней очереди](../assets/deque_operations.png)

## Основные операции с двусторонней очередью

Основные операции с двусторонней очередью представлены в таблице ниже, конкретные имена методов зависят от используемого языка программирования.

<p align="center"> Таблица <id> &nbsp; Эффективность операций двусторонней очереди </p>

| Метод          | Описание                         | Временная сложность |
| -------------- | -------------------------------- | ------------------- |
| `push_first()` | Добавление элемента в голову очереди | $O(1)$              |
| `push_last()`  | Добавление элемента в хвост очереди  | $O(1)$              |
| `pop_first()`  | Удаление элемента из головы очереди  | $O(1)$              |
| `pop_last()`   | Удаление элемента из хвоста очереди  | $O(1)$              |
| `peek_first()` | Доступ к элементу в голове очереди   | $O(1)$              |
| `peek_last()`  | Доступ к элементу в хвосте очереди   | $O(1)$              |

Аналогично, можно использовать готовый класс двусторонней очереди в языке программирования:

=== "Python"

    ```python title="deque.py"
    from collections import deque

    # Инициализация двусторонней очереди
    deq: deque[int] = deque()

    # Добавление элемента в очередь
    deq.append(2)      # Добавление в хвост
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Добавление в голову
    deq.appendleft(1)

    # Доступ к элементам
    front: int = deq[0]  # Элемент в голове очереди
    rear: int = deq[-1]  # Элемент в хвосте очереди

    # Удаление элементов из очереди
    pop_front: int = deq.popleft()  # Удаление элемента из головы
    pop_rear: int = deq.pop()       # Удаление элемента из хвоста

    # Получение длины двусторонней очереди
    size: int = len(deq)

    # Проверка двусторонней очереди на пустоту
    is_empty: bool = len(deq) == 0
    ```

=== "C++"

    ```cpp title="deque.cpp"
    /* Инициализация двусторонней очереди */
    deque<int> deque;

    /* Добавление элемента в очередь */
    deque.push_back(2);   // Добавление в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);  // Добавление в голову
    deque.push_front(1);

    /* Доступ к элементам */
    int front = deque.front(); // Элемент в голове очереди
    int back = deque.back();   // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    deque.pop_front();  // Удаление элемента из головы
    deque.pop_back();   // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    int size = deque.size();

    /* Проверка двусторонней очереди на пустоту */
    bool empty = deque.empty();
    ```

=== "Java"

    ```java title="deque.java"
    /* Инициализация двусторонней очереди */
    Deque<Integer> deque = new LinkedList<>();

    /* Добавление элемента в очередь */
    deque.offerLast(2);   // Добавление в хвост
    deque.offerLast(5);
    deque.offerLast(4);
    deque.offerFirst(3);  // Добавление в голову
    deque.offerFirst(1);

    /* Доступ к элементам */
    int peekFirst = deque.peekFirst();  // Элемент в голове очереди
    int peekLast = deque.peekLast();    // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    int popFirst = deque.pollFirst();  // Удаление элемента из головы
    int popLast = deque.pollLast();    // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    int size = deque.size();

    /* Проверка двусторонней очереди на пустоту */
    boolean isEmpty = deque.isEmpty();
    ```

=== "C#"

    ```csharp title="deque.cs"
    /* Инициализация двусторонней очереди */
    // В C# связный список LinkedList используется как двусторонняя очередь
    LinkedList<int> deque = new();

    /* Добавление элемента в очередь */
    deque.AddLast(2);   // Добавление в хвост
    deque.AddLast(5);
    deque.AddLast(4);
    deque.AddFirst(3);  // Добавление в голову
    deque.AddFirst(1);

    /* Доступ к элементам */
    int peekFirst = deque.First.Value;  // Элемент в голове очереди
    int peekLast = deque.Last.Value;    // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    deque.RemoveFirst();  // Удаление элемента из головы
    deque.RemoveLast();   // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    int size = deque.Count;

    /* Проверка двусторонней очереди на пустоту */
    bool isEmpty = deque.Count == 0;
    ```

=== "Go"

    ```go title="deque_test.go"
    /* Инициализация двусторонней очереди */
    // В Go list используется как двусторонняя очередь
    deque := list.New()

    /* Добавление элемента в очередь */
    deque.PushBack(2)      // Добавление в хвост
    deque.PushBack(5)
    deque.PushBack(4)
    deque.PushFront(3)     // Добавление в голову
    deque.PushFront(1)

    /* Доступ к элементам */
    front := deque.Front() // Элемент в голове очереди
    rear := deque.Back()   // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    deque.Remove(front)    // Удаление элемента из головы
    deque.Remove(rear)     // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    size := deque.Len()

    /* Проверка двусторонней очереди на пустоту */
    isEmpty := deque.Len() == 0
    ```

=== "Swift"

    ```swift title="deque.swift"
    /* Инициализация двусторонней очереди */
    // В Swift нет встроенного класса двусторонней очереди, можно использовать Array
    var deque: [Int] = []

    /* Добавление элемента в очередь */
    deque.append(2) // Добавление в хвост
    deque.append(5)
    deque.append(4)
    deque.insert(3, at: 0) // Добавление в голову
    deque.insert(1, at: 0)

    /* Доступ к элементам */
    let peekFirst = deque.first! // Элемент в голове очереди
    let peekLast = deque.last! // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    // При использовании Array сложность popFirst составляет O(n)
    let popFirst = deque.removeFirst() // Удаление элемента из головы
    let popLast = deque.removeLast() // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    let size = deque.count

    /* Проверка двусторонней очереди на пустоту */
    let isEmpty = deque.isEmpty
    ```

=== "JS"

    ```javascript title="deque.js"
    /* Инициализация двусторонней очереди */
    // В JavaScript нет встроенной двусторонней очереди, используется Array
    const deque = [];

    /* Добавление элемента в очередь */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Обратите внимание: при использовании массива временная сложность unshift() составляет O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* Доступ к элементам */
    const peekFirst = deque[0];
    const peekLast = deque[deque.length - 1];

    /* Удаление элементов из очереди */
    // Обратите внимание: при использовании массива временная сложность shift() составляет O(n)
    const popFront = deque.shift();
    const popBack = deque.pop();

    /* Получение длины двусторонней очереди */
    const size = deque.length;

    /* Проверка двусторонней очереди на пустоту */
    const isEmpty = size === 0;
    ```

=== "TS"

    ```typescript title="deque.ts"
    /* Инициализация двусторонней очереди */
    // В TypeScript нет встроенной двусторонней очереди, используется Array
    const deque: number[] = [];

    /* Добавление элемента в очередь */
    deque.push(2);
    deque.push(5);
    deque.push(4);
    // Обратите внимание: при использовании массива временная сложность unshift() составляет O(n)
    deque.unshift(3);
    deque.unshift(1);

    /* Доступ к элементам */
    const peekFirst: number = deque[0];
    const peekLast: number = deque[deque.length - 1];

    /* Удаление элементов из очереди */
    // Обратите внимание: при использовании массива временная сложность shift() составляет O(n)
    const popFront: number = deque.shift() as number;
    const popBack: number = deque.pop() as number;

    /* Получение длины двусторонней очереди */
    const size: number = deque.length;

    /* Проверка двусторонней очереди на пустоту */
    const isEmpty: boolean = size === 0;
    ```

=== "Dart"

    ```dart title="deque.dart"
    /* Инициализация двусторонней очереди */
    // В Dart Queue определяется как двусторонняя очередь
    Queue<int> deque = Queue<int>();

    /* Добавление элемента в очередь */
    deque.addLast(2);  // Добавление в хвост
    deque.addLast(5);
    deque.addLast(4);
    deque.addFirst(3); // Добавление в голову
    deque.addFirst(1);

    /* Доступ к элементам */
    int peekFirst = deque.first; // Элемент в голове очереди
    int peekLast = deque.last;   // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    int popFirst = deque.removeFirst(); // Удаление элемента из головы
    int popLast = deque.removeLast();   // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    int size = deque.length;

    /* Проверка двусторонней очереди на пустоту */
    bool isEmpty = deque.isEmpty;
    ```

=== "Rust"

    ```rust title="deque.rs"
    /* Инициализация двусторонней очереди */
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Добавление элемента в очередь */
    deque.push_back(2);  // Добавление в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Добавление в голову
    deque.push_front(1);

    /* Доступ к элементам */
    if let Some(front) = deque.front() { // Элемент в голове очереди
    }
    if let Some(rear) = deque.back() {   // Элемент в хвосте очереди
    }

    /* Удаление элементов из очереди */
    if let Some(pop_front) = deque.pop_front() { // Удаление элемента из головы
    }
    if let Some(pop_rear) = deque.pop_back() {   // Удаление элемента из хвоста
    }

    /* Получение длины двусторонней очереди */
    let size = deque.len();

    /* Проверка двусторонней очереди на пустоту */
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

    /* Добавление элемента в очередь */
    deque.offerLast(2)  // Добавление в хвост
    deque.offerLast(5)
    deque.offerLast(4)
    deque.offerFirst(3) // Добавление в голову
    deque.offerFirst(1)

    /* Доступ к элементам */
    val peekFirst = deque.peekFirst() // Элемент в голове очереди
    val peekLast = deque.peekLast()   // Элемент в хвосте очереди

    /* Удаление элементов из очереди */
    val popFirst = deque.pollFirst() // Удаление элемента из головы
    val popLast = deque.pollLast()   // Удаление элемента из хвоста

    /* Получение длины двусторонней очереди */
    val size = deque.size

    /* Проверка двусторонней очереди на пустоту */
    val isEmpty = deque.isEmpty()
    ```

=== "Ruby"

    ```ruby title="deque.rb"
    # Инициализация двусторонней очереди
    # В Ruby нет встроенной двусторонней очереди, используется Array
    deque = []

    # Добавление элемента в очередь
    deque << 2
    deque << 5
    deque << 4
    # Обратите внимание: при использовании массива временная сложность Array#unshift составляет O(n)
    deque.unshift(3)
    deque.unshift(1)

    # Доступ к элементам
    peek_first = deque.first
    peek_last = deque.last

    # Удаление элементов из очереди
    # Обратите внимание: при использовании массива временная сложность Array#shift составляет O(n)
    pop_front = deque.shift
    pop_back = deque.pop

    # Получение длины двусторонней очереди
    size = deque.length

    # Проверка двусторонней очереди на пустоту
    is_empty = size.zero?
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20deq%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20deq.append%282%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%0A%20%20%20%20deq.append%285%29%0A%20%20%20%20deq.append%284%29%0A%20%20%20%20deq.appendleft%283%29%20%20%23%20%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%83%0A%20%20%20%20deq.appendleft%281%29%0A%20%20%20%20print%28%22%D0%94%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%D0%BC%0A%20%20%20%20front%20%3D%20deq%5B0%5D%20%20%23%20%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D0%B5%20front%20%3D%22,%20front%29%0A%20%20%20%20rear%20%3D%20deq%5B-1%5D%20%20%23%20%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B5%20rear%20%3D%22,%20rear%29%0A%0A%20%20%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop_front%20%3D%20deq.popleft%28%29%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%0A%20%20%20%20print%28%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20%20pop_front%20%3D%22,%20pop_front%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D0%B3%D0%BE%D0%BB%D0%BE%D0%B2%D1%8B%20deque%20%3D%22,%20deq%29%0A%20%20%20%20pop_rear%20%3D%20deq.pop%28%29%20%20%23%20%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%0A%20%20%20%20print%28%22%D0%A3%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20%20pop_rear%20%3D%22,%20pop_rear%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D1%8F%20%D0%B8%D0%B7%20%D1%85%D0%B2%D0%BE%D1%81%D1%82%D0%B0%20deque%20%3D%22,%20deq%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28deq%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22,%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D0%B5%D0%B9%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D0%BD%D0%B0%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D1%82%D1%83%0A%20%20%20%20is_empty%20%3D%20len%28deq%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%94%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8F%D1%8F%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%3D%22,%20is_empty%29&cumulative=false&curIn