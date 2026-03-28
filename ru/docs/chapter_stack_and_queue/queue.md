---
comments: true
---

# 5.2 &nbsp; Очередь

<u>Очередь (queue)</u> - это линейная структура данных, подчиняющаяся правилу "первым пришел - первым вышел". Как видно из названия, очередь моделирует обычную ситуацию ожидания: новые люди непрерывно присоединяются к хвосту очереди, а стоящие в начале по одному уходят.

Как показано на рисунке 5-4, начало очереди называется "головой очереди", а конец - "хвостом очереди"; операцию добавления элемента в хвост называют "enqueue", а операцию удаления элемента из головы - "dequeue".

![Правило FIFO для очереди](queue.assets/queue_operations.png){ class="animation-figure" }

<p align="center"> Рисунок 5-4 &nbsp; Правило FIFO для очереди </p>

## 5.2.1 &nbsp; Основные операции с очередью

Распространенные операции с очередью показаны в таблице 5-2. Следует учитывать, что названия методов в разных языках могут различаться. Здесь мы используем те же названия, что и для стека.

<p align="center"> Таблица 5-2 &nbsp; Эффективность операций с очередью </p>

<div class="center-table" markdown>

| Имя метода | Описание                                  | Временная сложность |
| ---------- | ----------------------------------------- | ------------------- |
| `push()`   | Поместить элемент в очередь, то есть добавить его в хвост | $O(1)$ |
| `pop()`    | Извлечь элемент из головы очереди         | $O(1)$              |
| `peek()`   | Просмотреть элемент в голове очереди      | $O(1)$              |

</div>

Мы можем напрямую использовать готовые классы очереди, предоставляемые языками программирования:

=== "Python"

    ```python title="queue.py"
    from collections import deque

    # Инициализация очереди
    # В Python обычно используют двустороннюю очередь deque как обычную очередь
    # Хотя queue.Queue() является "чистой" очередью, она не слишком удобна, поэтому ее не рекомендуют
    que: deque[int] = deque()

    # Поместить элементы в очередь
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)

    # Просмотреть элемент в голове очереди
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
    /* Инициализация очереди */
    queue<int> queue;

    /* Поместить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Просмотреть элемент в голове очереди */
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
    /* Инициализация очереди */
    Queue<Integer> queue = new LinkedList<>();

    /* Поместить элементы в очередь */
    queue.offer(1);
    queue.offer(3);
    queue.offer(2);
    queue.offer(5);
    queue.offer(4);

    /* Просмотреть элемент в голове очереди */
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
    /* Инициализация очереди */
    Queue<int> queue = new();

    /* Поместить элементы в очередь */
    queue.Enqueue(1);
    queue.Enqueue(3);
    queue.Enqueue(2);
    queue.Enqueue(5);
    queue.Enqueue(4);

    /* Просмотреть элемент в голове очереди */
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
    /* Инициализация очереди */
    // В Go очередь обычно реализуют через list
    queue := list.New()

    /* Поместить элементы в очередь */
    queue.PushBack(1)
    queue.PushBack(3)
    queue.PushBack(2)
    queue.PushBack(5)
    queue.PushBack(4)

    /* Просмотреть элемент в голове очереди */
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
    /* Инициализация очереди */
    // В Swift нет встроенного класса очереди, поэтому можно использовать Array как очередь
    var queue: [Int] = []

    /* Поместить элементы в очередь */
    queue.append(1)
    queue.append(3)
    queue.append(2)
    queue.append(5)
    queue.append(4)

    /* Просмотреть элемент в голове очереди */
    let peek = queue.first!

    /* Извлечь элемент из очереди */
    // Поскольку в основе лежит массив, removeFirst имеет сложность O(n)
    let pool = queue.removeFirst()

    /* Получить длину очереди */
    let size = queue.count

    /* Проверить, пуста ли очередь */
    let isEmpty = queue.isEmpty
    ```

=== "JS"

    ```javascript title="queue.js"
    /* Инициализация очереди */
    // В JavaScript нет встроенной очереди, поэтому можно использовать Array как очередь
    const queue = [];

    /* Поместить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Просмотреть элемент в голове очереди */
    const peek = queue[0];

    /* Извлечь элемент из очереди */
    // В основе лежит массив, поэтому shift() имеет сложность O(n)
    const pop = queue.shift();

    /* Получить длину очереди */
    const size = queue.length;

    /* Проверить, пуста ли очередь */
    const empty = queue.length === 0;
    ```

=== "TS"

    ```typescript title="queue.ts"
    /* Инициализация очереди */
    // В TypeScript нет встроенной очереди, поэтому можно использовать Array как очередь
    const queue: number[] = [];

    /* Поместить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);

    /* Просмотреть элемент в голове очереди */
    const peek = queue[0];

    /* Извлечь элемент из очереди */
    // В основе лежит массив, поэтому shift() имеет сложность O(n)
    const pop = queue.shift();

    /* Получить длину очереди */
    const size = queue.length;

    /* Проверить, пуста ли очередь */
    const empty = queue.length === 0;
    ```

=== "Dart"

    ```dart title="queue.dart"
    /* Инициализация очереди */
    // В Dart класс Queue является двусторонней очередью и может использоваться как обычная очередь
    Queue<int> queue = Queue();

    /* Поместить элементы в очередь */
    queue.add(1);
    queue.add(3);
    queue.add(2);
    queue.add(5);
    queue.add(4);

    /* Просмотреть элемент в голове очереди */
    int peek = queue.first;

    /* Извлечь элемент из очереди */
    int pop = queue.removeFirst();

    /* Получить длину очереди */
    int size = queue.length;

    /* Проверить, пуста ли очередь */
    bool isEmpty = queue.isEmpty;
    ```

=== "Rust"

    ```rust title="queue.rs"
    /* Инициализация двусторонней очереди */
    // В Rust двусторонняя очередь может использоваться как обычная очередь
    let mut deque: VecDeque<u32> = VecDeque::new();

    /* Поместить элементы в очередь */
    deque.push_back(1);
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);

    /* Просмотреть элемент в голове очереди */
    if let Some(front) = deque.front() {
    }

    /* Извлечь элемент из очереди */
    if let Some(pop) = deque.pop_front() {
    }

    /* Получить длину очереди */
    let size = deque.len();

    /* Проверить, пуста ли очередь */
    let is_empty = deque.is_empty();
    ```

=== "C"

    ```c title="queue.c"
    // В C нет встроенной очереди
    ```

=== "Kotlin"

    ```kotlin title="queue.kt"
    /* Инициализация очереди */
    val queue = LinkedList<Int>()

    /* Поместить элементы в очередь */
    queue.offer(1)
    queue.offer(3)
    queue.offer(2)
    queue.offer(5)
    queue.offer(4)

    /* Просмотреть элемент в голове очереди */
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
    # Инициализация очереди
    # Встроенная очередь в Ruby (Thread::Queue) не имеет методов peek и traverse, поэтому можно использовать Array как очередь
    queue = []

    # Поместить элементы в очередь
    queue.push(1)
    queue.push(3)
    queue.push(2)
    queue.push(5)
    queue.push(4)

    # Просмотреть элемент очереди
    peek = queue.first

    # Извлечь элемент из очереди
    # Обрати внимание: поскольку это массив, метод Array#shift имеет сложность O(n)
    pop = queue.shift

    # Получить длину очереди
    size = queue.length

    # Проверить, пуста ли очередь
    is_empty = queue.empty?
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=from%20collections%20import%20deque%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%B4%D0%B2%D1%83%D1%81%D1%82%D0%BE%D1%80%D0%BE%D0%BD%D0%BD%D1%8E%D1%8E%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20deque%20%D0%BE%D0%B1%D1%8B%D1%87%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8E%D1%82%20%D0%BA%D0%B0%D0%BA%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20%23%20%D0%A5%D0%BE%D1%82%D1%8F%20queue.Queue%28%29%20%D1%8F%D0%B2%D0%BB%D1%8F%D0%B5%D1%82%D1%81%D1%8F%20%D0%BD%D0%B0%D1%81%D1%82%D0%BE%D1%8F%D1%89%D0%B8%D0%BC%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%BE%D0%BC%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%2C%20%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%D1%81%D1%8F%20%D0%B8%D0%BC%20%D0%BD%D0%B5%20%D1%81%D0%BB%D0%B8%D1%88%D0%BA%D0%BE%D0%BC%20%D1%83%D0%B4%D0%BE%D0%B1%D0%BD%D0%BE%0A%20%20%20%20que%20%3D%20deque%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20que.append%281%29%0A%20%20%20%20que.append%283%29%0A%20%20%20%20que.append%282%29%0A%20%20%20%20que.append%285%29%0A%20%20%20%20que.append%284%29%0A%20%20%20%20print%28%22%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20que%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20front%20%3D%20que%5B0%5D%0A%20%20%20%20print%28%22%D0%AD%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D0%BD%D0%B0%D1%87%D0%B0%D0%BB%D0%B5%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20front%20%3D%22%2C%20front%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20pop%20%3D%20que.popleft%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22que%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20que%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%0A%20%20%20%20size%20%3D%20len%28que%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%0A%20%20%20%20is_empty%20%3D%20len%28que%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 5.2.2 &nbsp; Реализация очереди

Чтобы реализовать очередь, нам нужна такая структура данных, которая позволяет добавлять элементы с одного конца и удалять их с другого; и связный список, и массив этим требованиям удовлетворяют.

### 1. &nbsp; Реализация на основе связного списка

Как показано на рисунке 5-5, мы можем рассматривать "головной узел" и "хвостовой узел" связного списка как "голову очереди" и "хвост очереди" соответственно, договорившись, что добавлять узлы можно только в хвост, а удалять - только из головы.

=== "LinkedListQueue"
    ![Операции enqueue и dequeue в реализации очереди на связном списке](queue.assets/linkedlist_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![linkedlist_queue_push](queue.assets/linkedlist_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![linkedlist_queue_pop](queue.assets/linkedlist_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> Рисунок 5-5 &nbsp; Операции enqueue и dequeue в реализации очереди на связном списке </p>

Ниже приведен код реализации очереди на связном списке:

=== "Python"

    ```python title="linkedlist_queue.py"
    class LinkedListQueue:
        """Очередь на основе связного списка"""

        def __init__(self):
            """Конструктор"""
            self._front: ListNode | None = None  # Головной узел front
            self._rear: ListNode | None = None  # Хвостовой узел rear
            self._size: int = 0

        def size(self) -> int:
            """Получение длины очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверка, пуста ли очередь"""
            return self._size == 0

        def push(self, num: int):
            """Поместить в очередь"""
            # Добавить num после хвостового узла
            node = ListNode(num)
            # Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if self._front is None:
                self._front = node
                self._rear = node
            # Если очередь не пуста, добавить этот узел после хвостового узла
            else:
                self._rear.next = node
                self._rear = node
            self._size += 1

        def pop(self) -> int:
            """Извлечь из очереди"""
            num = self.peek()
            # Удалить головной узел
            self._front = self._front.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Доступ к элементу в начале очереди"""
            if self.is_empty():
                raise IndexError("очередь пуста")
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
        ListNode *front, *rear; // Головной узел front, хвостовой узел rear
        int queSize;

      public:
        LinkedListQueue() {
            front = nullptr;
            rear = nullptr;
            queSize = 0;
        }

        ~LinkedListQueue() {
            // Обходить связный список, удалять узлы и освобождать память
            freeMemoryLinkedList(front);
        }

        /* Получение длины очереди */
        int size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        bool isEmpty() {
            return queSize == 0;
        }

        /* Поместить в очередь */
        void push(int num) {
            // Добавить num после хвостового узла
            ListNode *node = new ListNode(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (front == nullptr) {
                front = node;
                rear = node;
            }
            // Если очередь не пуста, добавить этот узел после хвостового узла
            else {
                rear->next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь из очереди */
        int pop() {
            int num = peek();
            // Удалить головной узел
            ListNode *tmp = front;
            front = front->next;
            // Освободить память
            delete tmp;
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        int peek() {
            if (size() == 0)
                throw out_of_range("очередь пуста");
            return front->val;
        }

        /* Преобразовать связный список в Vector и вернуть */
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
        private ListNode front, rear; // Головной узел front, хвостовой узел rear
        private int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Получение длины очереди */
        public int size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Поместить в очередь */
        public void push(int num) {
            // Добавить num после хвостового узла
            ListNode node = new ListNode(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (front == null) {
                front = node;
                rear = node;
            // Если очередь не пуста, добавить этот узел после хвостового узла
            } else {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь из очереди */
        public int pop() {
            int num = peek();
            // Удалить головной узел
            front = front.next;
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return front.val;
        }

        /* Преобразовать связный список в Array и вернуть */
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
        ListNode? front, rear;  // Головной узел front, хвостовой узел rear
        int queSize = 0;

        public LinkedListQueue() {
            front = null;
            rear = null;
        }

        /* Получение длины очереди */
        public int Size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Поместить в очередь */
        public void Push(int num) {
            // Добавить num после хвостового узла
            ListNode node = new(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (front == null) {
                front = node;
                rear = node;
                // Если очередь не пуста, добавить этот узел после хвостового узла
            } else if (rear != null) {
                rear.next = node;
                rear = node;
            }
            queSize++;
        }

        /* Извлечь из очереди */
        public int Pop() {
            int num = Peek();
            // Удалить головной узел
            front = front?.next;
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return front!.val;
        }

        /* Преобразовать связный список в Array и вернуть */
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
        // Использовать встроенный пакет list для реализации очереди
        data *list.List
    }

    /* Инициализация очереди */
    func newLinkedListQueue() *linkedListQueue {
        return &linkedListQueue{
            data: list.New(),
        }
    }

    /* Поместить в очередь */
    func (s *linkedListQueue) push(value any) {
        s.data.PushBack(value)
    }

    /* Извлечь из очереди */
    func (s *linkedListQueue) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        s.data.Remove(e)
        return e.Value
    }

    /* Доступ к элементу в начале очереди */
    func (s *linkedListQueue) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Front()
        return e.Value
    }

    /* Получение длины очереди */
    func (s *linkedListQueue) size() int {
        return s.data.Len()
    }

    /* Проверка, пуста ли очередь */
    func (s *linkedListQueue) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Получить List для вывода */
    func (s *linkedListQueue) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_queue.swift"
    /* Очередь на основе связного списка */
    class LinkedListQueue {
        private var front: ListNode? // Головной узел
        private var rear: ListNode? // Хвостовой узел
        private var _size: Int

        init() {
            _size = 0
        }

        /* Получение длины очереди */
        func size() -> Int {
            _size
        }

        /* Проверка, пуста ли очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Поместить в очередь */
        func push(num: Int) {
            // Добавить num после хвостового узла
            let node = ListNode(x: num)
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if front == nil {
                front = node
                rear = node
            }
            // Если очередь не пуста, добавить этот узел после хвостового узла
            else {
                rear?.next = node
                rear = node
            }
            _size += 1
        }

        /* Извлечь из очереди */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Удалить головной узел
            front = front?.next
            _size -= 1
            return num
        }

        /* Доступ к элементу в начале очереди */
        func peek() -> Int {
            if isEmpty() {
                fatalError("очередь пуста")
            }
            return front!.val
        }

        /* Преобразовать связный список в Array и вернуть */
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
        #front; // Головной узел #front
        #rear; // Хвостовой узел #rear
        #queSize = 0;

        constructor() {
            this.#front = null;
            this.#rear = null;
        }

        /* Получение длины очереди */
        get size() {
            return this.#queSize;
        }

        /* Проверка, пуста ли очередь */
        isEmpty() {
            return this.size === 0;
        }

        /* Поместить в очередь */
        push(num) {
            // Добавить num после хвостового узла
            const node = new ListNode(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (!this.#front) {
                this.#front = node;
                this.#rear = node;
                // Если очередь не пуста, добавить этот узел после хвостового узла
            } else {
                this.#rear.next = node;
                this.#rear = node;
            }
            this.#queSize++;
        }

        /* Извлечь из очереди */
        pop() {
            const num = this.peek();
            // Удалить головной узел
            this.#front = this.#front.next;
            this.#queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peek() {
            if (this.size === 0) throw new Error('очередь пуста');
            return this.#front.val;
        }

        /* Преобразовать связный список в Array и вернуть */
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
        private front: ListNode | null; // Головной узел front
        private rear: ListNode | null; // Хвостовой узел rear
        private queSize: number = 0;

        constructor() {
            this.front = null;
            this.rear = null;
        }

        /* Получение длины очереди */
        get size(): number {
            return this.queSize;
        }

        /* Проверка, пуста ли очередь */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* Поместить в очередь */
        push(num: number): void {
            // Добавить num после хвостового узла
            const node = new ListNode(num);
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (!this.front) {
                this.front = node;
                this.rear = node;
                // Если очередь не пуста, добавить этот узел после хвостового узла
            } else {
                this.rear!.next = node;
                this.rear = node;
            }
            this.queSize++;
        }

        /* Извлечь из очереди */
        pop(): number {
            const num = this.peek();
            if (!this.front) throw new Error('очередь пуста');
            // Удалить головной узел
            this.front = this.front.next;
            this.queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peek(): number {
            if (this.size === 0) throw new Error('очередь пуста');
            return this.front!.val;
        }

        /* Преобразовать связный список в Array и вернуть */
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
      ListNode? _front; // Головной узел _front
      ListNode? _rear; // Хвостовой узел _rear
      int _queSize = 0; // Длина очереди

      LinkedListQueue() {
        _front = null;
        _rear = null;
      }

      /* Получение длины очереди */
      int size() {
        return _queSize;
      }

      /* Проверка, пуста ли очередь */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Поместить в очередь */
      void push(int _num) {
        // Добавить _num после хвостового узла
        final node = ListNode(_num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (_front == null) {
          _front = node;
          _rear = node;
        } else {
          // Если очередь не пуста, добавить этот узел после хвостового узла
          _rear!.next = node;
          _rear = node;
        }
        _queSize++;
      }

      /* Извлечь из очереди */
      int pop() {
        final int _num = peek();
        // Удалить головной узел
        _front = _front!.next;
        _queSize--;
        return _num;
      }

      /* Доступ к элементу в начале очереди */
      int peek() {
        if (_queSize == 0) {
          throw Exception('очередь пуста');
        }
        return _front!.val;
      }

      /* Преобразовать связный список в Array и вернуть */
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
        front: Option<Rc<RefCell<ListNode<T>>>>, // Головной узел front
        rear: Option<Rc<RefCell<ListNode<T>>>>,  // Хвостовой узел rear
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

        /* Получение длины очереди */
        pub fn size(&self) -> usize {
            return self.que_size;
        }

        /* Проверка, пуста ли очередь */
        pub fn is_empty(&self) -> bool {
            return self.que_size == 0;
        }

        /* Поместить в очередь */
        pub fn push(&mut self, num: T) {
            // Добавить num после хвостового узла
            let new_rear = ListNode::new(num);
            match self.rear.take() {
                // Если очередь не пуста, добавить этот узел после хвостового узла
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
                // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
                None => {
                    self.front = Some(new_rear.clone());
                    self.rear = Some(new_rear);
                }
            }
            self.que_size += 1;
        }

        /* Извлечь из очереди */
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

        /* Доступ к элементу в начале очереди */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.front.as_ref()
        }

        /* Преобразовать связный список в Array и вернуть */
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
        // Освободить все узлы
        while (queue->front != NULL) {
            ListNode *tmp = queue->front;
            queue->front = queue->front->next;
            free(tmp);
        }
        // Освободить структуру queue
        free(queue);
    }

    /* Получение длины очереди */
    int size(LinkedListQueue *queue) {
        return queue->queSize;
    }

    /* Проверка, пуста ли очередь */
    bool empty(LinkedListQueue *queue) {
        return (size(queue) == 0);
    }

    /* Поместить в очередь */
    void push(LinkedListQueue *queue, int num) {
        // Добавить node в хвост
        ListNode *node = newListNode(num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (queue->front == NULL) {
            queue->front = node;
            queue->rear = node;
        }
        // Если очередь не пуста, добавить этот узел после хвостового узла
        else {
            queue->rear->next = node;
            queue->rear = node;
        }
        queue->queSize++;
    }

    /* Доступ к элементу в начале очереди */
    int peek(LinkedListQueue *queue) {
        assert(size(queue) && queue->front);
        return queue->front->val;
    }

    /* Извлечь из очереди */
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
        // Скопировать данные связного списка в массив
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
        // Головной узел front, хвостовой узел rear
        private var front: ListNode? = null,
        private var rear: ListNode? = null,
        private var queSize: Int = 0
    ) {

        /* Получение длины очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверка, пуста ли очередь */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Поместить в очередь */
        fun push(num: Int) {
            // Добавить num после хвостового узла
            val node = ListNode(num)
            // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
            if (front == null) {
                front = node
                rear = node
                // Если очередь не пуста, добавить этот узел после хвостового узла
            } else {
                rear?.next = node
                rear = node
            }
            queSize++
        }

        /* Извлечь из очереди */
        fun pop(): Int {
            val num = peek()
            // Удалить головной узел
            front = front?.next
            queSize--
            return num
        }

        /* Доступ к элементу в начале очереди */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return front!!._val
        }

        /* Преобразовать связный список в Array и вернуть */
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
      ### Получение длины очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize
        @front = nil  # Головной узел front
        @rear = nil   # Хвостовой узел rear
        @size = 0
      end

      ### Проверка, пуста ли очередь ###
      def is_empty?
        @front.nil?
      end

      ### Добавление в очередь ###
      def push(num)
        # Добавить num после хвостового узла
        node = ListNode.new(num)

        # Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if @front.nil?
          @front = node
          @rear = node
        # Если очередь не пуста, добавить этот узел после хвостового узла
        else
          @rear.next = node
          @rear = node
        end

        @size += 1
      end

      ### Извлечение из очереди ###
      def pop
        num = peek
        # Удалить головной узел
        @front = @front.next
        @size -= 1
        num
      end

      ### Доступ к элементу в начале очереди ###
      def peek
        raise IndexError, 'очередь пуста' if is_empty?

        @front.val
      end

      ### Преобразовать связный список в Array и вернуть ###
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

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%0A%0Aclass%20LinkedListQueue%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20not%20self._front%0A%0A%20%20%20%20def%20push%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28num%29%0A%20%20%20%20%20%20%20%20if%20self._front%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._front%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear.next%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._front%20%3D%20self._front.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%27%29%0A%20%20%20%20%20%20%20%20return%20self._front.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20queue%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20temp%20%3D%20self._front%0A%20%20%20%20%20%20%20%20while%20temp%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28temp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20temp.next%0A%20%20%20%20%20%20%20%20return%20queue%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20queue%20%3D%20LinkedListQueue%28%29%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20print%28%27%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20queue%20%3D%27%2C%20queue.to_list%28%29%29%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%27%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%27%2C%20peek%29%0A%20%20%20%20pop_front%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop_front%29%0A%20%20%20%20print%28%27queue%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%27%2C%20queue.to_list%28%29%29%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%27%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%0A%0Aclass%20LinkedListQueue%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._front%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._rear%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20not%20self._front%0A%0A%20%20%20%20def%20push%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28num%29%0A%20%20%20%20%20%20%20%20if%20self._front%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._front%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear.next%20%3D%20node%0A%20%20%20%20%20%20%20%20%20%20%20%20self._rear%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._front%20%3D%20self._front.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%27%29%0A%20%20%20%20%20%20%20%20return%20self._front.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20queue%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20temp%20%3D%20self._front%0A%20%20%20%20%20%20%20%20while%20temp%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28temp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20temp%20%3D%20temp.next%0A%20%20%20%20%20%20%20%20return%20queue%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20queue%20%3D%20LinkedListQueue%28%29%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20print%28%27%D0%9E%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20queue%20%3D%27%2C%20queue.to_list%28%29%29%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%27%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20front%20%3D%27%2C%20peek%29%0A%20%20%20%20pop_front%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop_front%29%0A%20%20%20%20print%28%27queue%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%27%2C%20queue.to_list%28%29%29%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%27%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Реализация на основе массива

Удаление первого элемента из массива имеет временную сложность $O(n)$ , из-за чего операция dequeue оказывается неэффективной. Однако этого можно избежать с помощью следующего приема.

Мы можем использовать переменную `front` , указывающую на индекс элемента в голове очереди, и поддерживать переменную `size` , которая хранит длину очереди. Определим `rear = front + size` ; эта формула дает позицию `rear`, указывающую на ячейку сразу после хвоста очереди.

Исходя из этого, **эффективный диапазон элементов массива равен `[front, rear - 1]`**, а различные операции реализуются, как показано на рисунке 5-6.

- Операция enqueue: записать входной элемент по индексу `rear` и увеличить `size` на 1.
- Операция dequeue: просто увеличить `front` на 1 и уменьшить `size` на 1.

Можно увидеть, что и enqueue, и dequeue требуют всего одной операции, а значит обе имеют временную сложность $O(1)$ .

=== "ArrayQueue"
    ![Операции enqueue и dequeue в реализации очереди на массиве](queue.assets/array_queue_step1.png){ class="animation-figure" }

=== "push()"
    ![array_queue_push](queue.assets/array_queue_step2_push.png){ class="animation-figure" }

=== "pop()"
    ![array_queue_pop](queue.assets/array_queue_step3_pop.png){ class="animation-figure" }

<p align="center"> Рисунок 5-6 &nbsp; Операции enqueue и dequeue в реализации очереди на массиве </p>

Ты можешь заметить еще одну проблему: при непрерывных операциях enqueue и dequeue значения `front` и `rear` оба движутся вправо, и **когда они доходят до конца массива, дальше сдвигаться уже нельзя**. Чтобы решить эту проблему, можно рассматривать массив как "кольцевой массив", у которого начало и конец соединены.

Для кольцевого массива нужно сделать так, чтобы `front` или `rear`, перешагнув конец массива, сразу возвращались к его началу и продолжали движение. Такую периодичность удобно реализовать с помощью операции взятия остатка, как показано в коде ниже:

=== "Python"

    ```python title="array_queue.py"
    class ArrayQueue:
        """Очередь на основе кольцевого массива"""

        def __init__(self, size: int):
            """Конструктор"""
            self._nums: list[int] = [0] * size  # Массив для хранения элементов очереди
            self._front: int = 0  # Указатель head, указывающий на первый элемент очереди
            self._size: int = 0  # Длина очереди

        def capacity(self) -> int:
            """Получить вместимость очереди"""
            return len(self._nums)

        def size(self) -> int:
            """Получение длины очереди"""
            return self._size

        def is_empty(self) -> bool:
            """Проверка, пуста ли очередь"""
            return self._size == 0

        def push(self, num: int):
            """Поместить в очередь"""
            if self._size == self.capacity():
                raise IndexError("очередь заполнена")
            # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            # С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            rear: int = (self._front + self._size) % self.capacity()
            # Добавить num в хвост очереди
            self._nums[rear] = num
            self._size += 1

        def pop(self) -> int:
            """Извлечь из очереди"""
            num: int = self.peek()
            # Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            self._front = (self._front + 1) % self.capacity()
            self._size -= 1
            return num

        def peek(self) -> int:
            """Доступ к элементу в начале очереди"""
            if self.is_empty():
                raise IndexError("очередь пуста")
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
        int front;       // Указатель head, указывающий на первый элемент очереди
        int queSize;     // Длина очереди
        int queCapacity; // Вместимость очереди

      public:
        ArrayQueue(int capacity) {
            // Инициализация массива
            nums = new int[capacity];
            queCapacity = capacity;
            front = queSize = 0;
        }

        ~ArrayQueue() {
            delete[] nums;
        }

        /* Получить вместимость очереди */
        int capacity() {
            return queCapacity;
        }

        /* Получение длины очереди */
        int size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        bool isEmpty() {
            return size() == 0;
        }

        /* Поместить в очередь */
        void push(int num) {
            if (queSize == queCapacity) {
                cout << "Очередь заполнена" << endl;
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            int rear = (front + queSize) % queCapacity;
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь из очереди */
        int pop() {
            int num = peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            front = (front + 1) % queCapacity;
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        int peek() {
            if (isEmpty())
                throw out_of_range("очередь пуста");
            return nums[front];
        }

        /* Преобразовать массив в Vector и вернуть */
        vector<int> toVector() {
            // Преобразовывать только элементы списка в пределах фактической длины
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
        private int front; // Указатель head, указывающий на первый элемент очереди
        private int queSize; // Длина очереди

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить вместимость очереди */
        public int capacity() {
            return nums.length;
        }

        /* Получение длины очереди */
        public int size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        public boolean isEmpty() {
            return queSize == 0;
        }

        /* Поместить в очередь */
        public void push(int num) {
            if (queSize == capacity()) {
                System.out.println("Очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            int rear = (front + queSize) % capacity();
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь из очереди */
        public int pop() {
            int num = peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            front = (front + 1) % capacity();
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return nums[front];
        }

        /* Вернуть массив */
        public int[] toArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
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
        int front;   // Указатель head, указывающий на первый элемент очереди
        int queSize; // Длина очереди

        public ArrayQueue(int capacity) {
            nums = new int[capacity];
            front = queSize = 0;
        }

        /* Получить вместимость очереди */
        int Capacity() {
            return nums.Length;
        }

        /* Получение длины очереди */
        public int Size() {
            return queSize;
        }

        /* Проверка, пуста ли очередь */
        public bool IsEmpty() {
            return queSize == 0;
        }

        /* Поместить в очередь */
        public void Push(int num) {
            if (queSize == Capacity()) {
                Console.WriteLine("Очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            int rear = (front + queSize) % Capacity();
            // Добавить num в хвост очереди
            nums[rear] = num;
            queSize++;
        }

        /* Извлечь из очереди */
        public int Pop() {
            int num = Peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            front = (front + 1) % Capacity();
            queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return nums[front];
        }

        /* Вернуть массив */
        public int[] ToArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
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
        front       int   // Указатель head, указывающий на первый элемент очереди
        queSize     int   // Длина очереди
        queCapacity int   // Вместимость очереди (то есть максимальное число элементов)
    }

    /* Инициализация очереди */
    func newArrayQueue(queCapacity int) *arrayQueue {
        return &arrayQueue{
            nums:        make([]int, queCapacity),
            queCapacity: queCapacity,
            front:       0,
            queSize:     0,
        }
    }

    /* Получение длины очереди */
    func (q *arrayQueue) size() int {
        return q.queSize
    }

    /* Проверка, пуста ли очередь */
    func (q *arrayQueue) isEmpty() bool {
        return q.queSize == 0
    }

    /* Поместить в очередь */
    func (q *arrayQueue) push(num int) {
        // Когда rear == queCapacity, очередь заполнена
        if q.queSize == q.queCapacity {
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        rear := (q.front + q.queSize) % q.queCapacity
        // Добавить num в хвост очереди
        q.nums[rear] = num
        q.queSize++
    }

    /* Извлечь из очереди */
    func (q *arrayQueue) pop() any {
        num := q.peek()
        if num == nil {
            return nil
        }

        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        q.front = (q.front + 1) % q.queCapacity
        q.queSize--
        return num
    }

    /* Доступ к элементу в начале очереди */
    func (q *arrayQueue) peek() any {
        if q.isEmpty() {
            return nil
        }
        return q.nums[q.front]
    }

    /* Получить Slice для вывода */
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
        private var front: Int // Указатель head, указывающий на первый элемент очереди
        private var _size: Int // Длина очереди

        init(capacity: Int) {
            // Инициализация массива
            nums = Array(repeating: 0, count: capacity)
            front = 0
            _size = 0
        }

        /* Получить вместимость очереди */
        func capacity() -> Int {
            nums.count
        }

        /* Получение длины очереди */
        func size() -> Int {
            _size
        }

        /* Проверка, пуста ли очередь */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Поместить в очередь */
        func push(num: Int) {
            if size() == capacity() {
                print("Очередь заполнена")
                return
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            let rear = (front + size()) % capacity()
            // Добавить num в хвост очереди
            nums[rear] = num
            _size += 1
        }

        /* Извлечь из очереди */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            front = (front + 1) % capacity()
            _size -= 1
            return num
        }

        /* Доступ к элементу в начале очереди */
        func peek() -> Int {
            if isEmpty() {
                fatalError("очередь пуста")
            }
            return nums[front]
        }

        /* Вернуть массив */
        func toArray() -> [Int] {
            // Преобразовывать только элементы списка в пределах фактической длины
            (front ..< front + size()).map { nums[$0 % capacity()] }
        }
    }
    ```

=== "JS"

    ```javascript title="array_queue.js"
    /* Очередь на основе кольцевого массива */
    class ArrayQueue {
        #nums; // Массив для хранения элементов очереди
        #front = 0; // Указатель head, указывающий на первый элемент очереди
        #queSize = 0; // Длина очереди

        constructor(capacity) {
            this.#nums = new Array(capacity);
        }

        /* Получить вместимость очереди */
        get capacity() {
            return this.#nums.length;
        }

        /* Получение длины очереди */
        get size() {
            return this.#queSize;
        }

        /* Проверка, пуста ли очередь */
        isEmpty() {
            return this.#queSize === 0;
        }

        /* Поместить в очередь */
        push(num) {
            if (this.size === this.capacity) {
                console.log('Очередь заполнена');
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            const rear = (this.#front + this.size) % this.capacity;
            // Добавить num в хвост очереди
            this.#nums[rear] = num;
            this.#queSize++;
        }

        /* Извлечь из очереди */
        pop() {
            const num = this.peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            this.#front = (this.#front + 1) % this.capacity;
            this.#queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peek() {
            if (this.isEmpty()) throw new Error('очередь пуста');
            return this.#nums[this.#front];
        }

        /* Вернуть Array */
        toArray() {
            // Преобразовывать только элементы списка в пределах фактической длины
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
        private front: number; // Указатель head, указывающий на первый элемент очереди
        private queSize: number; // Длина очереди

        constructor(capacity: number) {
            this.nums = new Array(capacity);
            this.front = this.queSize = 0;
        }

        /* Получить вместимость очереди */
        get capacity(): number {
            return this.nums.length;
        }

        /* Получение длины очереди */
        get size(): number {
            return this.queSize;
        }

        /* Проверка, пуста ли очередь */
        isEmpty(): boolean {
            return this.queSize === 0;
        }

        /* Поместить в очередь */
        push(num: number): void {
            if (this.size === this.capacity) {
                console.log('Очередь заполнена');
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            const rear = (this.front + this.queSize) % this.capacity;
            // Добавить num в хвост очереди
            this.nums[rear] = num;
            this.queSize++;
        }

        /* Извлечь из очереди */
        pop(): number {
            const num = this.peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            this.front = (this.front + 1) % this.capacity;
            this.queSize--;
            return num;
        }

        /* Доступ к элементу в начале очереди */
        peek(): number {
            if (this.isEmpty()) throw new Error('очередь пуста');
            return this.nums[this.front];
        }

        /* Вернуть Array */
        toArray(): number[] {
            // Преобразовывать только элементы списка в пределах фактической длины
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
      late int _front; // Указатель head, указывающий на первый элемент очереди
      late int _queSize; // Длина очереди

      ArrayQueue(int capacity) {
        _nums = List.filled(capacity, 0);
        _front = _queSize = 0;
      }

      /* Получить вместимость очереди */
      int capaCity() {
        return _nums.length;
      }

      /* Получение длины очереди */
      int size() {
        return _queSize;
      }

      /* Проверка, пуста ли очередь */
      bool isEmpty() {
        return _queSize == 0;
      }

      /* Поместить в очередь */
      void push(int _num) {
        if (_queSize == capaCity()) {
          throw Exception("Очередь заполнена");
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        int rear = (_front + _queSize) % capaCity();
        // Добавить _num в хвост очереди
        _nums[rear] = _num;
        _queSize++;
      }

      /* Извлечь из очереди */
      int pop() {
        int _num = peek();
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        _front = (_front + 1) % capaCity();
        _queSize--;
        return _num;
      }

      /* Доступ к элементу в начале очереди */
      int peek() {
        if (isEmpty()) {
          throw Exception("очередь пуста");
        }
        return _nums[_front];
      }

      /* Вернуть Array */
      List<int> toArray() {
        // Преобразовывать только элементы списка в пределах фактической длины
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
        front: i32,        // Указатель head, указывающий на первый элемент очереди
        que_size: i32,     // Длина очереди
        que_capacity: i32, // Вместимость очереди
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

        /* Получить вместимость очереди */
        fn capacity(&self) -> i32 {
            self.que_capacity
        }

        /* Получение длины очереди */
        fn size(&self) -> i32 {
            self.que_size
        }

        /* Проверка, пуста ли очередь */
        fn is_empty(&self) -> bool {
            self.que_size == 0
        }

        /* Поместить в очередь */
        fn push(&mut self, num: T) {
            if self.que_size == self.capacity() {
                println!("Очередь заполнена");
                return;
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            let rear = (self.front + self.que_size) % self.que_capacity;
            // Добавить num в хвост очереди
            self.nums[rear as usize] = num;
            self.que_size += 1;
        }

        /* Извлечь из очереди */
        fn pop(&mut self) -> T {
            let num = self.peek();
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            self.front = (self.front + 1) % self.que_capacity;
            self.que_size -= 1;
            num
        }

        /* Доступ к элементу в начале очереди */
        fn peek(&self) -> T {
            if self.is_empty() {
                panic!("index out of bounds");
            }
            self.nums[self.front as usize]
        }

        /* Вернуть массив */
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
        int front;       // Указатель head, указывающий на первый элемент очереди
        int queSize;     // Указатель хвоста, указывающий на позицию после хвоста
        int queCapacity; // Вместимость очереди
    } ArrayQueue;

    /* Конструктор */
    ArrayQueue *newArrayQueue(int capacity) {
        ArrayQueue *queue = (ArrayQueue *)malloc(sizeof(ArrayQueue));
        // Инициализация массива
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

    /* Получить вместимость очереди */
    int capacity(ArrayQueue *queue) {
        return queue->queCapacity;
    }

    /* Получение длины очереди */
    int size(ArrayQueue *queue) {
        return queue->queSize;
    }

    /* Проверка, пуста ли очередь */
    bool empty(ArrayQueue *queue) {
        return queue->queSize == 0;
    }

    /* Доступ к элементу в начале очереди */
    int peek(ArrayQueue *queue) {
        assert(size(queue) != 0);
        return queue->nums[queue->front];
    }

    /* Поместить в очередь */
    void push(ArrayQueue *queue, int num) {
        if (size(queue) == capacity(queue)) {
            printf("Очередь заполнена\r\n");
            return;
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        int rear = (queue->front + queue->queSize) % queue->queCapacity;
        // Добавить num в хвост очереди
        queue->nums[rear] = num;
        queue->queSize++;
    }

    /* Извлечь из очереди */
    int pop(ArrayQueue *queue) {
        int num = peek(queue);
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
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
        private var front: Int = 0 // Указатель head, указывающий на первый элемент очереди
        private var queSize: Int = 0 // Длина очереди

        /* Получить вместимость очереди */
        fun capacity(): Int {
            return nums.size
        }

        /* Получение длины очереди */
        fun size(): Int {
            return queSize
        }

        /* Проверка, пуста ли очередь */
        fun isEmpty(): Boolean {
            return queSize == 0
        }

        /* Поместить в очередь */
        fun push(num: Int) {
            if (queSize == capacity()) {
                println("Очередь заполнена")
                return
            }
            // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
            // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
            val rear = (front + queSize) % capacity()
            // Добавить num в хвост очереди
            nums[rear] = num
            queSize++
        }

        /* Извлечь из очереди */
        fun pop(): Int {
            val num = peek()
            // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
            front = (front + 1) % capacity()
            queSize--
            return num
        }

        /* Доступ к элементу в начале очереди */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return nums[front]
        }

        /* Вернуть массив */
        fun toArray(): IntArray {
            // Преобразовывать только элементы списка в пределах фактической длины
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
      ### Получение длины очереди ###
      attr_reader :size

      ### Конструктор ###
      def initialize(size)
        @nums = Array.new(size, 0) # Массив для хранения элементов очереди
        @front = 0 # Указатель head, указывающий на первый элемент очереди
        @size = 0 # Длина очереди
      end

      ### Получить вместимость очереди ###
      def capacity
        @nums.length
      end

      ### Проверка, пуста ли очередь ###
      def is_empty?
        size.zero?
      end

      ### Добавление в очередь ###
      def push(num)
        raise IndexError, 'очередь заполнена' if size == capacity

        # Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        # С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        rear = (@front + size) % capacity
        # Добавить num в хвост очереди
        @nums[rear] = num
        @size += 1
      end

      ### Извлечение из очереди ###
      def pop
        num = peek
        # Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        @front = (@front + 1) % capacity
        @size -= 1
        num
      end

      ### Доступ к элементу в начале очереди ###
      def peek
        raise IndexError, 'очередь пуста' if is_empty?

        @nums[@front]
      end

      ### Вернуть список для вывода ###
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

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20size%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%0A%20%20%20%20%20%20%20%20self._front%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self._nums%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20self._size%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%B7%D0%B0%D0%BF%D0%BE%D0%BB%D0%BD%D0%B5%D0%BD%D0%B0%27%29%0A%20%20%20%20%20%20%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%27%29%0A%20%20%20%20%20%20%20%20return%20self._nums%5Bself._front%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20%20%20%20%20%20%20j%3A%20int%20%3D%20self._front%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20self._nums%5Bj%20%25%20self.capacity%28%29%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20queue%20%3D%20ArrayQueue%2810%29%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%27%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%27%2C%20peek%29%0A%20%20%20%20pop%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop%29%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%27%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayQueue%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20size%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self._nums%3A%20list%5Bint%5D%20%3D%20%5B0%5D%20%2A%20size%0A%20%20%20%20%20%20%20%20self._front%3A%20int%20%3D%200%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20capacity%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20len%28self._nums%29%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20self._size%20%3D%3D%200%0A%0A%20%20%20%20def%20push%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20if%20self._size%20%3D%3D%20self.capacity%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%B7%D0%B0%D0%BF%D0%BE%D0%BB%D0%BD%D0%B5%D0%BD%D0%B0%27%29%0A%20%20%20%20%20%20%20%20rear%3A%20int%20%3D%20%28self._front%20%2B%20self._size%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._nums%5Brear%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%3A%20int%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._front%20%3D%20%28self._front%20%2B%201%29%20%25%20self.capacity%28%29%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%27%29%0A%20%20%20%20%20%20%20%20return%20self._nums%5Bself._front%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20self.size%28%29%0A%20%20%20%20%20%20%20%20j%3A%20int%20%3D%20self._front%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%5Bi%5D%20%3D%20self._nums%5Bj%20%25%20self.capacity%28%29%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20return%20res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20queue%20%3D%20ArrayQueue%2810%29%0A%20%20%20%20queue.push%281%29%0A%20%20%20%20queue.push%283%29%0A%20%20%20%20queue.push%282%29%0A%20%20%20%20queue.push%285%29%0A%20%20%20%20queue.push%284%29%0A%20%20%20%20peek%20%3D%20queue.peek%28%29%0A%20%20%20%20print%28%27%D0%9F%D0%B5%D1%80%D0%B2%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%27%2C%20peek%29%0A%20%20%20%20pop%20%3D%20queue.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop%29%0A%20%20%20%20size%20%3D%20queue.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D0%B8%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20queue.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D0%BE%D1%87%D0%B5%D1%80%D0%B5%D0%B4%D1%8C%20%3D%27%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

Даже такая реализация очереди остается ограниченной: ее длина неизменяема. Однако это несложно исправить, заменив массив на динамический массив и тем самым введя механизм расширения. Заинтересованные читатели могут попробовать реализовать это самостоятельно.

Выводы сравнения двух реализаций в целом такие же, как и для стека, поэтому здесь мы не будем повторяться.

## 5.2.3 &nbsp; Типичные применения очереди

- **Заказы на Taobao**. После оформления заказа покупателем заказ попадает в очередь, а затем система обрабатывает заказы по порядку. Во время крупных распродаж, таких как Double 11, за короткое время возникает огромный поток заказов, и высокая конкурентная нагрузка становится ключевой инженерной проблемой.
- **Различные отложенные задачи**. Любой сценарий, где нужно реализовать принцип "кто раньше пришел, тот раньше обслуживается", например очередь заданий принтера или очередь блюд на кухне ресторана, хорошо моделируется очередью, которая эффективно поддерживает нужный порядок обработки.
