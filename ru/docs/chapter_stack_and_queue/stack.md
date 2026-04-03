---
comments: true
---

# 5.1 &nbsp; Стек

<u>Стек (stack)</u> - это линейная структура данных, подчиняющаяся логике "последним пришел - первым вышел".

Стек можно сравнить со стопкой тарелок на столе. Если разрешено перемещать только одну тарелку за раз, то, чтобы достать тарелку снизу, сначала придется по одной убрать все тарелки сверху. Если заменить тарелки различными элементами, например целыми числами, символами, объектами и т.д., получится структура данных "стек".

Как показано на рисунке 5-1, верхнюю часть стопки элементов мы называем вершиной стека, а нижнюю - основанием стека. Операция добавления элемента на вершину называется `push`, а операция удаления верхнего элемента - `pop`.

![Правило LIFO для стека](stack.assets/stack_operations.png){ class="animation-figure" }

<p align="center"> Рисунок 5-1 &nbsp; Правило LIFO для стека </p>

## 5.1.1 &nbsp; Основные операции со стеком

Основные операции со стеком показаны в таблице 5-1. Конкретные имена методов зависят от используемого языка программирования. Здесь в качестве примера используются распространенные названия `push()` , `pop()` и `peek()` .

<p align="center"> Таблица 5-1 &nbsp; Эффективность операций со стеком </p>

<div class="center-table" markdown>

| Метод    | Описание                          | Временная сложность |
| -------- | --------------------------------- | ------------------- |
| `push()` | Поместить элемент в стек (на вершину) | $O(1)$          |
| `pop()`  | Извлечь верхний элемент стека     | $O(1)$              |
| `peek()` | Просмотреть верхний элемент       | $O(1)$              |

</div>

Обычно достаточно использовать встроенный стек, предоставляемый языком программирования. Однако в некоторых языках специальный класс стека может отсутствовать. В таком случае можно использовать массив или связный список как стек и в логике программы игнорировать операции, не относящиеся к стеку.

=== "Python"

    ```python title="stack.py"
    # Инициализация стека
    # В Python нет встроенного класса стека, поэтому можно использовать list как стек
    stack: list[int] = []

    # Поместить элементы в стек
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    # Просмотреть верхний элемент
    peek: int = stack[-1]

    # Извлечь элемент
    pop: int = stack.pop()

    # Получить длину стека
    size: int = len(stack)

    # Проверить, пуст ли стек
    is_empty: bool = len(stack) == 0
    ```

=== "C++"

    ```cpp title="stack.cpp"
    /* Инициализация стека */
    stack<int> stack;

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Просмотреть верхний элемент */
    int top = stack.top();

    /* Извлечь элемент */
    stack.pop(); // Без возвращаемого значения

    /* Получить длину стека */
    int size = stack.size();

    /* Проверить, пуст ли стек */
    bool empty = stack.empty();
    ```

=== "Java"

    ```java title="stack.java"
    /* Инициализация стека */
    Stack<Integer> stack = new Stack<>();

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Просмотреть верхний элемент */
    int peek = stack.peek();

    /* Извлечь элемент */
    int pop = stack.pop();

    /* Получить длину стека */
    int size = stack.size();

    /* Проверить, пуст ли стек */
    boolean isEmpty = stack.isEmpty();
    ```

=== "C#"

    ```csharp title="stack.cs"
    /* Инициализация стека */
    Stack<int> stack = new();

    /* Поместить элементы в стек */
    stack.Push(1);
    stack.Push(3);
    stack.Push(2);
    stack.Push(5);
    stack.Push(4);

    /* Просмотреть верхний элемент */
    int peek = stack.Peek();

    /* Извлечь элемент */
    int pop = stack.Pop();

    /* Получить длину стека */
    int size = stack.Count;

    /* Проверить, пуст ли стек */
    bool isEmpty = stack.Count == 0;
    ```

=== "Go"

    ```go title="stack_test.go"
    /* Инициализация стека */
    // В Go рекомендуется использовать Slice как стек
    var stack []int

    /* Поместить элементы в стек */
    stack = append(stack, 1)
    stack = append(stack, 3)
    stack = append(stack, 2)
    stack = append(stack, 5)
    stack = append(stack, 4)

    /* Просмотреть верхний элемент */
    peek := stack[len(stack)-1]

    /* Извлечь элемент */
    pop := stack[len(stack)-1]
    stack = stack[:len(stack)-1]

    /* Получить длину стека */
    size := len(stack)

    /* Проверить, пуст ли стек */
    isEmpty := len(stack) == 0
    ```

=== "Swift"

    ```swift title="stack.swift"
    /* Инициализация стека */
    // В Swift нет встроенного класса стека, поэтому можно использовать Array как стек
    var stack: [Int] = []

    /* Поместить элементы в стек */
    stack.append(1)
    stack.append(3)
    stack.append(2)
    stack.append(5)
    stack.append(4)

    /* Просмотреть верхний элемент */
    let peek = stack.last!

    /* Извлечь элемент */
    let pop = stack.removeLast()

    /* Получить длину стека */
    let size = stack.count

    /* Проверить, пуст ли стек */
    let isEmpty = stack.isEmpty
    ```

=== "JS"

    ```javascript title="stack.js"
    /* Инициализация стека */
    // В JavaScript нет встроенного класса стека, поэтому можно использовать Array как стек
    const stack = [];

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Просмотреть верхний элемент */
    const peek = stack[stack.length-1];

    /* Извлечь элемент */
    const pop = stack.pop();

    /* Получить длину стека */
    const size = stack.length;

    /* Проверить, пуст ли стек */
    const is_empty = stack.length === 0;
    ```

=== "TS"

    ```typescript title="stack.ts"
    /* Инициализация стека */
    // В TypeScript нет встроенного класса стека, поэтому можно использовать Array как стек
    const stack: number[] = [];

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Просмотреть верхний элемент */
    const peek = stack[stack.length - 1];

    /* Извлечь элемент */
    const pop = stack.pop();

    /* Получить длину стека */
    const size = stack.length;

    /* Проверить, пуст ли стек */
    const is_empty = stack.length === 0;
    ```

=== "Dart"

    ```dart title="stack.dart"
    /* Инициализация стека */
    // В Dart нет встроенного класса стека, поэтому можно использовать List как стек
    List<int> stack = [];

    /* Поместить элементы в стек */
    stack.add(1);
    stack.add(3);
    stack.add(2);
    stack.add(5);
    stack.add(4);

    /* Просмотреть верхний элемент */
    int peek = stack.last;

    /* Извлечь элемент */
    int pop = stack.removeLast();

    /* Получить длину стека */
    int size = stack.length;

    /* Проверить, пуст ли стек */
    bool isEmpty = stack.isEmpty;
    ```

=== "Rust"

    ```rust title="stack.rs"
    /* Инициализация стека */
    // Используем Vec как стек
    let mut stack: Vec<i32> = Vec::new();

    /* Поместить элементы в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);

    /* Просмотреть верхний элемент */
    let top = stack.last().unwrap();

    /* Извлечь элемент */
    let pop = stack.pop().unwrap();

    /* Получить длину стека */
    let size = stack.len();

    /* Проверить, пуст ли стек */
    let is_empty = stack.is_empty();
    ```

=== "C"

    ```c title="stack.c"
    // В C нет встроенного стека
    ```

=== "Kotlin"

    ```kotlin title="stack.kt"
    /* Инициализация стека */
    val stack = Stack<Int>()

    /* Поместить элементы в стек */
    stack.push(1)
    stack.push(3)
    stack.push(2)
    stack.push(5)
    stack.push(4)

    /* Просмотреть верхний элемент */
    val peek = stack.peek()

    /* Извлечь элемент */
    val pop = stack.pop()

    /* Получить длину стека */
    val size = stack.size

    /* Проверить, пуст ли стек */
    val isEmpty = stack.isEmpty()
    ```

=== "Ruby"

    ```ruby title="stack.rb"
    # Инициализация стека
    # В Ruby нет встроенного класса стека, поэтому можно использовать Array как стек
    stack = []

    # Поместить элементы в стек
    stack << 1
    stack << 3
    stack << 2
    stack << 5
    stack << 4

    # Просмотреть верхний элемент
    peek = stack.last

    # Извлечь элемент
    pop = stack.pop

    # Получить длину стека
    size = stack.length

    # Проверить, пуст ли стек
    is_empty = stack.empty?
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20%23%20%D0%92%20Python%20%D0%BD%D0%B5%D1%82%20%D0%B2%D1%81%D1%82%D1%80%D0%BE%D0%B5%D0%BD%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%2C%20%D0%BF%D0%BE%D1%8D%D1%82%D0%BE%D0%BC%D1%83%20list%20%D0%BC%D0%BE%D0%B6%D0%BD%D0%BE%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%B0%D0%BA%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.append%281%29%0A%20%20%20%20stack.append%283%29%0A%20%20%20%20stack.append%282%29%0A%20%20%20%20stack.append%285%29%0A%20%20%20%20stack.append%284%29%0A%20%20%20%20print%28%22%D1%81%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack%5B-1%5D%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20stack%20%3D%22%2C%20stack%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20len%28stack%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%B8%D1%82%D1%8C%2C%20%D0%BF%D1%83%D1%81%D1%82%D0%B0%20%D0%BB%D0%B8%20%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D1%83%D1%80%D0%B0%0A%20%20%20%20is_empty%20%3D%20len%28stack%29%20%3D%3D%200%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&cumulative=false&curInstr=2&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

## 5.1.2 &nbsp; Реализация стека

Чтобы глубже понять механизм работы стека, попробуем самостоятельно реализовать класс стека.

Стек подчиняется принципу LIFO, поэтому мы можем добавлять и удалять элементы только на вершине. Однако и массив, и связный список позволяют добавлять и удалять элементы в произвольном месте. **Следовательно, стек можно рассматривать как ограниченный массив или связный список**. Иными словами, мы можем скрыть часть нерелевантных операций массива или списка, так чтобы внешняя логика соответствовала свойствам стека.

### 1. &nbsp; Реализация на основе связного списка

Если реализовывать стек на основе связного списка, то головной узел списка можно рассматривать как вершину стека, а хвостовой - как основание.

Как показано на рисунке 5-2, для операции `push` достаточно вставить элемент в голову связного списка. Такой способ вставки называется вставкой в голову. Для операции `pop` достаточно удалить головной узел из списка.

=== "<1>"
    ![Операции push и pop в реализации стека на связном списке](stack.assets/linkedlist_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![linkedlist_stack_push](stack.assets/linkedlist_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![linkedlist_stack_pop](stack.assets/linkedlist_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Рисунок 5-2 &nbsp; Операции push и pop в реализации стека на связном списке </p>

Ниже приведен пример кода реализации стека на основе связного списка:

=== "Python"

    ```python title="linkedlist_stack.py"
    class LinkedListStack:
        """Стек на основе связного списка"""

        def __init__(self):
            """Конструктор"""
            self._peek: ListNode | None = None
            self._size: int = 0

        def size(self) -> int:
            """Получение длины стека"""
            return self._size

        def is_empty(self) -> bool:
            """Проверка, пуст ли стек"""
            return self._size == 0

        def push(self, val: int):
            """Поместить в стек"""
            node = ListNode(val)
            node.next = self._peek
            self._peek = node
            self._size += 1

        def pop(self) -> int:
            """Извлечь из стека"""
            num = self.peek()
            self._peek = self._peek.next
            self._size -= 1
            return num

        def peek(self) -> int:
            """Доступ к верхнему элементу стека"""
            if self.is_empty():
                raise IndexError("стек пуст")
            return self._peek.val

        def to_list(self) -> list[int]:
            """Преобразовать в список для вывода"""
            arr = []
            node = self._peek
            while node:
                arr.append(node.val)
                node = node.next
            arr.reverse()
            return arr
    ```

=== "C++"

    ```cpp title="linkedlist_stack.cpp"
    /* Стек на основе связного списка */
    class LinkedListStack {
      private:
        ListNode *stackTop; // Использовать головной узел как вершину стека
        int stkSize;        // Длина стека

      public:
        LinkedListStack() {
            stackTop = nullptr;
            stkSize = 0;
        }

        ~LinkedListStack() {
            // Обходить связный список, удалять узлы и освобождать память
            freeMemoryLinkedList(stackTop);
        }

        /* Получение длины стека */
        int size() {
            return stkSize;
        }

        /* Проверка, пуст ли стек */
        bool isEmpty() {
            return size() == 0;
        }

        /* Поместить в стек */
        void push(int num) {
            ListNode *node = new ListNode(num);
            node->next = stackTop;
            stackTop = node;
            stkSize++;
        }

        /* Извлечь из стека */
        int pop() {
            int num = top();
            ListNode *tmp = stackTop;
            stackTop = stackTop->next;
            // Освободить память
            delete tmp;
            stkSize--;
            return num;
        }

        /* Доступ к верхнему элементу стека */
        int top() {
            if (isEmpty())
                throw out_of_range("стек пуст");
            return stackTop->val;
        }

        /* Преобразовать List в Array и вернуть */
        vector<int> toVector() {
            ListNode *node = stackTop;
            vector<int> res(size());
            for (int i = res.size() - 1; i >= 0; i--) {
                res[i] = node->val;
                node = node->next;
            }
            return res;
        }
    };
    ```

=== "Java"

    ```java title="linkedlist_stack.java"
    /* Стек на основе связного списка */
    class LinkedListStack {
        private ListNode stackPeek; // Использовать головной узел как вершину стека
        private int stkSize = 0; // Длина стека

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Получение длины стека */
        public int size() {
            return stkSize;
        }

        /* Проверка, пуст ли стек */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Поместить в стек */
        public void push(int num) {
            ListNode node = new ListNode(num);
            node.next = stackPeek;
            stackPeek = node;
            stkSize++;
        }

        /* Извлечь из стека */
        public int pop() {
            int num = peek();
            stackPeek = stackPeek.next;
            stkSize--;
            return num;
        }

        /* Доступ к верхнему элементу стека */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stackPeek.val;
        }

        /* Преобразовать List в Array и вернуть */
        public int[] toArray() {
            ListNode node = stackPeek;
            int[] res = new int[size()];
            for (int i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="linkedlist_stack.cs"
    /* Стек на основе связного списка */
    class LinkedListStack {
        ListNode? stackPeek;  // Использовать головной узел как вершину стека
        int stkSize = 0;   // Длина стека

        public LinkedListStack() {
            stackPeek = null;
        }

        /* Получение длины стека */
        public int Size() {
            return stkSize;
        }

        /* Проверка, пуст ли стек */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Поместить в стек */
        public void Push(int num) {
            ListNode node = new(num) {
                next = stackPeek
            };
            stackPeek = node;
            stkSize++;
        }

        /* Извлечь из стека */
        public int Pop() {
            int num = Peek();
            stackPeek = stackPeek!.next;
            stkSize--;
            return num;
        }

        /* Доступ к верхнему элементу стека */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stackPeek!.val;
        }

        /* Преобразовать List в Array и вернуть */
        public int[] ToArray() {
            if (stackPeek == null)
                return [];

            ListNode? node = stackPeek;
            int[] res = new int[Size()];
            for (int i = res.Length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "Go"

    ```go title="linkedlist_stack.go"
    /* Стек на основе связного списка */
    type linkedListStack struct {
        // Использовать встроенный пакет list для реализации стека
        data *list.List
    }

    /* Инициализация стека */
    func newLinkedListStack() *linkedListStack {
        return &linkedListStack{
            data: list.New(),
        }
    }

    /* Поместить в стек */
    func (s *linkedListStack) push(value int) {
        s.data.PushBack(value)
    }

    /* Извлечь из стека */
    func (s *linkedListStack) pop() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        s.data.Remove(e)
        return e.Value
    }

    /* Доступ к верхнему элементу стека */
    func (s *linkedListStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        e := s.data.Back()
        return e.Value
    }

    /* Получение длины стека */
    func (s *linkedListStack) size() int {
        return s.data.Len()
    }

    /* Проверка, пуст ли стек */
    func (s *linkedListStack) isEmpty() bool {
        return s.data.Len() == 0
    }

    /* Получить List для вывода */
    func (s *linkedListStack) toList() *list.List {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="linkedlist_stack.swift"
    /* Стек на основе связного списка */
    class LinkedListStack {
        private var _peek: ListNode? // Использовать головной узел как вершину стека
        private var _size: Int // Длина стека

        init() {
            _size = 0
        }

        /* Получение длины стека */
        func size() -> Int {
            _size
        }

        /* Проверка, пуст ли стек */
        func isEmpty() -> Bool {
            size() == 0
        }

        /* Поместить в стек */
        func push(num: Int) {
            let node = ListNode(x: num)
            node.next = _peek
            _peek = node
            _size += 1
        }

        /* Извлечь из стека */
        @discardableResult
        func pop() -> Int {
            let num = peek()
            _peek = _peek?.next
            _size -= 1
            return num
        }

        /* Доступ к верхнему элементу стека */
        func peek() -> Int {
            if isEmpty() {
                fatalError("стек пуст")
            }
            return _peek!.val
        }

        /* Преобразовать List в Array и вернуть */
        func toArray() -> [Int] {
            var node = _peek
            var res = Array(repeating: 0, count: size())
            for i in res.indices.reversed() {
                res[i] = node!.val
                node = node?.next
            }
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="linkedlist_stack.js"
    /* Стек на основе связного списка */
    class LinkedListStack {
        #stackPeek; // Использовать головной узел как вершину стека
        #stkSize = 0; // Длина стека

        constructor() {
            this.#stackPeek = null;
        }

        /* Получение длины стека */
        get size() {
            return this.#stkSize;
        }

        /* Проверка, пуст ли стек */
        isEmpty() {
            return this.size === 0;
        }

        /* Поместить в стек */
        push(num) {
            const node = new ListNode(num);
            node.next = this.#stackPeek;
            this.#stackPeek = node;
            this.#stkSize++;
        }

        /* Извлечь из стека */
        pop() {
            const num = this.peek();
            this.#stackPeek = this.#stackPeek.next;
            this.#stkSize--;
            return num;
        }

        /* Доступ к верхнему элементу стека */
        peek() {
            if (!this.#stackPeek) throw new Error('стек пуст');
            return this.#stackPeek.val;
        }

        /* Преобразовать связный список в Array и вернуть */
        toArray() {
            let node = this.#stackPeek;
            const res = new Array(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node.val;
                node = node.next;
            }
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="linkedlist_stack.ts"
    /* Стек на основе связного списка */
    class LinkedListStack {
        private stackPeek: ListNode | null; // Использовать головной узел как вершину стека
        private stkSize: number = 0; // Длина стека

        constructor() {
            this.stackPeek = null;
        }

        /* Получение длины стека */
        get size(): number {
            return this.stkSize;
        }

        /* Проверка, пуст ли стек */
        isEmpty(): boolean {
            return this.size === 0;
        }

        /* Поместить в стек */
        push(num: number): void {
            const node = new ListNode(num);
            node.next = this.stackPeek;
            this.stackPeek = node;
            this.stkSize++;
        }

        /* Извлечь из стека */
        pop(): number {
            const num = this.peek();
            if (!this.stackPeek) throw new Error('стек пуст');
            this.stackPeek = this.stackPeek.next;
            this.stkSize--;
            return num;
        }

        /* Доступ к верхнему элементу стека */
        peek(): number {
            if (!this.stackPeek) throw new Error('стек пуст');
            return this.stackPeek.val;
        }

        /* Преобразовать связный список в Array и вернуть */
        toArray(): number[] {
            let node = this.stackPeek;
            const res = new Array<number>(this.size);
            for (let i = res.length - 1; i >= 0; i--) {
                res[i] = node!.val;
                node = node!.next;
            }
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="linkedlist_stack.dart"
    /* Стек на основе класса связного списка */
    class LinkedListStack {
      ListNode? _stackPeek; // Использовать головной узел как вершину стека
      int _stkSize = 0; // Длина стека

      LinkedListStack() {
        _stackPeek = null;
      }

      /* Получение длины стека */
      int size() {
        return _stkSize;
      }

      /* Проверка, пуст ли стек */
      bool isEmpty() {
        return _stkSize == 0;
      }

      /* Поместить в стек */
      void push(int _num) {
        final ListNode node = ListNode(_num);
        node.next = _stackPeek;
        _stackPeek = node;
        _stkSize++;
      }

      /* Извлечь из стека */
      int pop() {
        final int _num = peek();
        _stackPeek = _stackPeek!.next;
        _stkSize--;
        return _num;
      }

      /* Доступ к верхнему элементу стека */
      int peek() {
        if (_stackPeek == null) {
          throw Exception("стек пуст");
        }
        return _stackPeek!.val;
      }

      /* Преобразовать связный список в List и вернуть */
      List<int> toList() {
        ListNode? node = _stackPeek;
        List<int> list = [];
        while (node != null) {
          list.add(node.val);
          node = node.next;
        }
        list = list.reversed.toList();
        return list;
      }
    }
    ```

=== "Rust"

    ```rust title="linkedlist_stack.rs"
    /* Стек на основе связного списка */
    #[allow(dead_code)]
    pub struct LinkedListStack<T> {
        stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Использовать головной узел как вершину стека
        stk_size: usize,                              // Длина стека
    }

    impl<T: Copy> LinkedListStack<T> {
        pub fn new() -> Self {
            Self {
                stack_peek: None,
                stk_size: 0,
            }
        }

        /* Получение длины стека */
        pub fn size(&self) -> usize {
            return self.stk_size;
        }

        /* Проверка, пуст ли стек */
        pub fn is_empty(&self) -> bool {
            return self.size() == 0;
        }

        /* Поместить в стек */
        pub fn push(&mut self, num: T) {
            let node = ListNode::new(num);
            node.borrow_mut().next = self.stack_peek.take();
            self.stack_peek = Some(node);
            self.stk_size += 1;
        }

        /* Извлечь из стека */
        pub fn pop(&mut self) -> Option<T> {
            self.stack_peek.take().map(|old_head| {
                self.stack_peek = old_head.borrow_mut().next.take();
                self.stk_size -= 1;

                old_head.borrow().val
            })
        }

        /* Доступ к верхнему элементу стека */
        pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
            self.stack_peek.as_ref()
        }

        /* Преобразовать List в Array и вернуть */
        pub fn to_array(&self) -> Vec<T> {
            fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
                if let Some(node) = head {
                    let mut nums = _to_array(node.borrow().next.as_ref());
                    nums.push(node.borrow().val);
                    return nums;
                }
                return Vec::new();
            }

            _to_array(self.peek())
        }
    }
    ```

=== "C"

    ```c title="linkedlist_stack.c"
    /* Стек на основе связного списка */
    typedef struct {
        ListNode *top; // Использовать головной узел как вершину стека
        int size;      // Длина стека
    } LinkedListStack;

    /* Конструктор */
    LinkedListStack *newLinkedListStack() {
        LinkedListStack *s = malloc(sizeof(LinkedListStack));
        s->top = NULL;
        s->size = 0;
        return s;
    }

    /* Деструктор */
    void delLinkedListStack(LinkedListStack *s) {
        while (s->top) {
            ListNode *n = s->top->next;
            free(s->top);
            s->top = n;
        }
        free(s);
    }

    /* Получение длины стека */
    int size(LinkedListStack *s) {
        return s->size;
    }

    /* Проверка, пуст ли стек */
    bool isEmpty(LinkedListStack *s) {
        return size(s) == 0;
    }

    /* Поместить в стек */
    void push(LinkedListStack *s, int num) {
        ListNode *node = (ListNode *)malloc(sizeof(ListNode));
        node->next = s->top; // Обновить поле указателя нового узла
        node->val = num;     // Обновить поле данных нового узла
        s->top = node;       // Обновить вершину стека
        s->size++;           // Обновить размер стека
    }

    /* Доступ к верхнему элементу стека */
    int peek(LinkedListStack *s) {
        if (s->size == 0) {
            printf("стек пуст\n");
            return INT_MAX;
        }
        return s->top->val;
    }

    /* Извлечь из стека */
    int pop(LinkedListStack *s) {
        int val = peek(s);
        ListNode *tmp = s->top;
        s->top = s->top->next;
        // Освободить память
        free(tmp);
        s->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="linkedlist_stack.kt"
    /* Стек на основе связного списка */
    class LinkedListStack(
        private var stackPeek: ListNode? = null, // Использовать головной узел как вершину стека
        private var stkSize: Int = 0 // Длина стека
    ) {

        /* Получение длины стека */
        fun size(): Int {
            return stkSize
        }

        /* Проверка, пуст ли стек */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Поместить в стек */
        fun push(num: Int) {
            val node = ListNode(num)
            node.next = stackPeek
            stackPeek = node
            stkSize++
        }

        /* Извлечь из стека */
        fun pop(): Int? {
            val num = peek()
            stackPeek = stackPeek?.next
            stkSize--
            return num
        }

        /* Доступ к верхнему элементу стека */
        fun peek(): Int? {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stackPeek?._val
        }

        /* Преобразовать List в Array и вернуть */
        fun toArray(): IntArray {
            var node = stackPeek
            val res = IntArray(size())
            for (i in res.size - 1 downTo 0) {
                res[i] = node?._val!!
                node = node.next
            }
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="linkedlist_stack.rb"
    ### Стек на основе связного списка ###
    class LinkedListStack
      attr_reader :size

      ### Конструктор ###
      def initialize
        @size = 0
      end

      ### Проверка, пуст ли стек ###
      def is_empty?
        @peek.nil?
      end

      ### Помещение в стек ###
      def push(val)
        node = ListNode.new(val)
        node.next = @peek
        @peek = node
        @size += 1
      end

      ### Извлечение из стека ###
      def pop
        num = peek
        @peek = @peek.next
        @size -= 1
        num
      end

      ### Доступ к верхнему элементу стека ###
      def peek
        raise IndexError, 'стек пуст' if is_empty?

        @peek.val
      end

      ### Преобразовать связный список в Array и вернуть ###
      def to_array
        arr = []
        node = @peek
        while node
          arr << node.val
          node = node.next
        end
        arr.reverse
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%0A%0Aclass%20LinkedListStack%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%27%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%27%D0%A1%D1%82%D0%B5%D0%BA%20stack%20%3D%27%2C%20stack.to_list%28%29%29%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%27%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%27%2C%20peek%29%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop%29%0A%20%20%20%20print%28%27stack%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%27%2C%20stack.to_list%28%29%29%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%27%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ListNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%0A%0Aclass%20LinkedListStack%3A%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20self._peek%3A%20ListNode%20%7C%20None%20%3D%20None%0A%20%20%20%20%20%20%20%20self._size%3A%20int%20%3D%200%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20return%20self._size%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20return%20not%20self._peek%0A%0A%20%20%20%20def%20push%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20node%20%3D%20ListNode%28val%29%0A%20%20%20%20%20%20%20%20node.next%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20node%0A%20%20%20%20%20%20%20%20self._size%20%2B%3D%201%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20self.peek%28%29%0A%20%20%20%20%20%20%20%20self._peek%20%3D%20self._peek.next%0A%20%20%20%20%20%20%20%20self._size%20-%3D%201%0A%20%20%20%20%20%20%20%20return%20num%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%27%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%27%29%0A%20%20%20%20%20%20%20%20return%20self._peek.val%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20arr%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20node%20%3D%20self._peek%0A%20%20%20%20%20%20%20%20while%20node%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20arr.append%28node.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20node%20%3D%20node.next%0A%20%20%20%20%20%20%20%20arr.reverse%28%29%0A%20%20%20%20%20%20%20%20return%20arr%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20stack%20%3D%20LinkedListStack%28%29%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%27%D0%A1%D1%82%D0%B5%D0%BA%20stack%20%3D%27%2C%20stack.to_list%28%29%29%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%27%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%27%2C%20peek%29%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%27%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%27%2C%20pop%29%0A%20%20%20%20print%28%27stack%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%27%2C%20stack.to_list%28%29%29%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%27%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%27%2C%20size%29%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%27%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%27%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

### 2. &nbsp; Реализация на основе массива

Если реализовывать стек на основе массива, то хвост массива можно рассматривать как вершину стека. Как показано на рисунке 5-3, операции `push` и `pop` соответствуют добавлению элемента в конец массива и удалению элемента из конца, обе имеют временную сложность $O(1)$ .

=== "<1>"
    ![Операции push и pop в реализации стека на массиве](stack.assets/array_stack_step1.png){ class="animation-figure" }

=== "<2>"
    ![array_stack_push](stack.assets/array_stack_step2_push.png){ class="animation-figure" }

=== "<3>"
    ![array_stack_pop](stack.assets/array_stack_step3_pop.png){ class="animation-figure" }

<p align="center"> Рисунок 5-3 &nbsp; Операции push и pop в реализации стека на массиве </p>

Поскольку количество элементов, помещаемых в стек, может непрерывно расти, мы можем использовать динамический массив и тем самым не заниматься расширением массива вручную. Ниже приведен пример кода:

=== "Python"

    ```python title="array_stack.py"
    class ArrayStack:
        """Стек на основе массива"""

        def __init__(self):
            """Конструктор"""
            self._stack: list[int] = []

        def size(self) -> int:
            """Получение длины стека"""
            return len(self._stack)

        def is_empty(self) -> bool:
            """Проверка, пуст ли стек"""
            return self.size() == 0

        def push(self, item: int):
            """Поместить в стек"""
            self._stack.append(item)

        def pop(self) -> int:
            """Извлечь из стека"""
            if self.is_empty():
                raise IndexError("стек пуст")
            return self._stack.pop()

        def peek(self) -> int:
            """Доступ к верхнему элементу стека"""
            if self.is_empty():
                raise IndexError("стек пуст")
            return self._stack[-1]

        def to_list(self) -> list[int]:
            """Вернуть список для вывода"""
            return self._stack
    ```

=== "C++"

    ```cpp title="array_stack.cpp"
    /* Стек на основе массива */
    class ArrayStack {
      private:
        vector<int> stack;

      public:
        /* Получение длины стека */
        int size() {
            return stack.size();
        }

        /* Проверка, пуст ли стек */
        bool isEmpty() {
            return stack.size() == 0;
        }

        /* Поместить в стек */
        void push(int num) {
            stack.push_back(num);
        }

        /* Извлечь из стека */
        int pop() {
            int num = top();
            stack.pop_back();
            return num;
        }

        /* Доступ к верхнему элементу стека */
        int top() {
            if (isEmpty())
                throw out_of_range("стек пуст");
            return stack.back();
        }

        /* Вернуть Vector */
        vector<int> toVector() {
            return stack;
        }
    };
    ```

=== "Java"

    ```java title="array_stack.java"
    /* Стек на основе массива */
    class ArrayStack {
        private ArrayList<Integer> stack;

        public ArrayStack() {
            // Инициализация списка (динамического массива)
            stack = new ArrayList<>();
        }

        /* Получение длины стека */
        public int size() {
            return stack.size();
        }

        /* Проверка, пуст ли стек */
        public boolean isEmpty() {
            return size() == 0;
        }

        /* Поместить в стек */
        public void push(int num) {
            stack.add(num);
        }

        /* Извлечь из стека */
        public int pop() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.remove(size() - 1);
        }

        /* Доступ к верхнему элементу стека */
        public int peek() {
            if (isEmpty())
                throw new IndexOutOfBoundsException();
            return stack.get(size() - 1);
        }

        /* Преобразовать List в Array и вернуть */
        public Object[] toArray() {
            return stack.toArray();
        }
    }
    ```

=== "C#"

    ```csharp title="array_stack.cs"
    /* Стек на основе массива */
    class ArrayStack {
        List<int> stack;
        public ArrayStack() {
            // Инициализация списка (динамического массива)
            stack = [];
        }

        /* Получение длины стека */
        public int Size() {
            return stack.Count;
        }

        /* Проверка, пуст ли стек */
        public bool IsEmpty() {
            return Size() == 0;
        }

        /* Поместить в стек */
        public void Push(int num) {
            stack.Add(num);
        }

        /* Извлечь из стека */
        public int Pop() {
            if (IsEmpty())
                throw new Exception();
            var val = Peek();
            stack.RemoveAt(Size() - 1);
            return val;
        }

        /* Доступ к верхнему элементу стека */
        public int Peek() {
            if (IsEmpty())
                throw new Exception();
            return stack[Size() - 1];
        }

        /* Преобразовать List в Array и вернуть */
        public int[] ToArray() {
            return [.. stack];
        }
    }
    ```

=== "Go"

    ```go title="array_stack.go"
    /* Стек на основе массива */
    type arrayStack struct {
        data []int // Данные
    }

    /* Инициализация стека */
    func newArrayStack() *arrayStack {
        return &arrayStack{
            // Установить длину стека равной 0, а емкость равной 16
            data: make([]int, 0, 16),
        }
    }

    /* Длина стека */
    func (s *arrayStack) size() int {
        return len(s.data)
    }

    /* Пуст ли стек */
    func (s *arrayStack) isEmpty() bool {
        return s.size() == 0
    }

    /* Поместить в стек */
    func (s *arrayStack) push(v int) {
        // Срез автоматически расширяется
        s.data = append(s.data, v)
    }

    /* Извлечь из стека */
    func (s *arrayStack) pop() any {
        val := s.peek()
        s.data = s.data[:len(s.data)-1]
        return val
    }

    /* Получить элемент на вершине стека */
    func (s *arrayStack) peek() any {
        if s.isEmpty() {
            return nil
        }
        val := s.data[len(s.data)-1]
        return val
    }

    /* Получить Slice для вывода */
    func (s *arrayStack) toSlice() []int {
        return s.data
    }
    ```

=== "Swift"

    ```swift title="array_stack.swift"
    /* Стек на основе массива */
    class ArrayStack {
        private var stack: [Int]

        init() {
            // Инициализация списка (динамического массива)
            stack = []
        }

        /* Получение длины стека */
        func size() -> Int {
            stack.count
        }

        /* Проверка, пуст ли стек */
        func isEmpty() -> Bool {
            stack.isEmpty
        }

        /* Поместить в стек */
        func push(num: Int) {
            stack.append(num)
        }

        /* Извлечь из стека */
        @discardableResult
        func pop() -> Int {
            if isEmpty() {
                fatalError("стек пуст")
            }
            return stack.removeLast()
        }

        /* Доступ к верхнему элементу стека */
        func peek() -> Int {
            if isEmpty() {
                fatalError("стек пуст")
            }
            return stack.last!
        }

        /* Преобразовать List в Array и вернуть */
        func toArray() -> [Int] {
            stack
        }
    }
    ```

=== "JS"

    ```javascript title="array_stack.js"
    /* Стек на основе массива */
    class ArrayStack {
        #stack;
        constructor() {
            this.#stack = [];
        }

        /* Получение длины стека */
        get size() {
            return this.#stack.length;
        }

        /* Проверка, пуст ли стек */
        isEmpty() {
            return this.#stack.length === 0;
        }

        /* Поместить в стек */
        push(num) {
            this.#stack.push(num);
        }

        /* Извлечь из стека */
        pop() {
            if (this.isEmpty()) throw new Error('стек пуст');
            return this.#stack.pop();
        }

        /* Доступ к верхнему элементу стека */
        top() {
            if (this.isEmpty()) throw new Error('стек пуст');
            return this.#stack[this.#stack.length - 1];
        }

        /* Вернуть Array */
        toArray() {
            return this.#stack;
        }
    }
    ```

=== "TS"

    ```typescript title="array_stack.ts"
    /* Стек на основе массива */
    class ArrayStack {
        private stack: number[];
        constructor() {
            this.stack = [];
        }

        /* Получение длины стека */
        get size(): number {
            return this.stack.length;
        }

        /* Проверка, пуст ли стек */
        isEmpty(): boolean {
            return this.stack.length === 0;
        }

        /* Поместить в стек */
        push(num: number): void {
            this.stack.push(num);
        }

        /* Извлечь из стека */
        pop(): number | undefined {
            if (this.isEmpty()) throw new Error('стек пуст');
            return this.stack.pop();
        }

        /* Доступ к верхнему элементу стека */
        top(): number | undefined {
            if (this.isEmpty()) throw new Error('стек пуст');
            return this.stack[this.stack.length - 1];
        }

        /* Вернуть Array */
        toArray() {
            return this.stack;
        }
    }
    ```

=== "Dart"

    ```dart title="array_stack.dart"
    /* Стек на основе массива */
    class ArrayStack {
      late List<int> _stack;
      ArrayStack() {
        _stack = [];
      }

      /* Получение длины стека */
      int size() {
        return _stack.length;
      }

      /* Проверка, пуст ли стек */
      bool isEmpty() {
        return _stack.isEmpty;
      }

      /* Поместить в стек */
      void push(int _num) {
        _stack.add(_num);
      }

      /* Извлечь из стека */
      int pop() {
        if (isEmpty()) {
          throw Exception("стек пуст");
        }
        return _stack.removeLast();
      }

      /* Доступ к верхнему элементу стека */
      int peek() {
        if (isEmpty()) {
          throw Exception("стек пуст");
        }
        return _stack.last;
      }

      /* Преобразовать стек в Array и вернуть */
      List<int> toArray() => _stack;
    }
    ```

=== "Rust"

    ```rust title="array_stack.rs"
    /* Стек на основе массива */
    struct ArrayStack<T> {
        stack: Vec<T>,
    }

    impl<T> ArrayStack<T> {
        /* Инициализация стека */
        fn new() -> ArrayStack<T> {
            ArrayStack::<T> {
                stack: Vec::<T>::new(),
            }
        }

        /* Получение длины стека */
        fn size(&self) -> usize {
            self.stack.len()
        }

        /* Проверка, пуст ли стек */
        fn is_empty(&self) -> bool {
            self.size() == 0
        }

        /* Поместить в стек */
        fn push(&mut self, num: T) {
            self.stack.push(num);
        }

        /* Извлечь из стека */
        fn pop(&mut self) -> Option<T> {
            self.stack.pop()
        }

        /* Доступ к верхнему элементу стека */
        fn peek(&self) -> Option<&T> {
            if self.is_empty() {
                panic!("стек пуст")
            };
            self.stack.last()
        }

        /* Вернуть &Vec */
        fn to_array(&self) -> &Vec<T> {
            &self.stack
        }
    }
    ```

=== "C"

    ```c title="array_stack.c"
    /* Стек на основе массива */
    typedef struct {
        int *data;
        int size;
    } ArrayStack;

    /* Конструктор */
    ArrayStack *newArrayStack() {
        ArrayStack *stack = malloc(sizeof(ArrayStack));
        // Инициализировать большую вместимость, чтобы избежать расширения
        stack->data = malloc(sizeof(int) * MAX_SIZE);
        stack->size = 0;
        return stack;
    }

    /* Деструктор */
    void delArrayStack(ArrayStack *stack) {
        free(stack->data);
        free(stack);
    }

    /* Получение длины стека */
    int size(ArrayStack *stack) {
        return stack->size;
    }

    /* Проверка, пуст ли стек */
    bool isEmpty(ArrayStack *stack) {
        return stack->size == 0;
    }

    /* Поместить в стек */
    void push(ArrayStack *stack, int num) {
        if (stack->size == MAX_SIZE) {
            printf("Стек заполнен\n");
            return;
        }
        stack->data[stack->size] = num;
        stack->size++;
    }

    /* Доступ к верхнему элементу стека */
    int peek(ArrayStack *stack) {
        if (stack->size == 0) {
            printf("стек пуст\n");
            return INT_MAX;
        }
        return stack->data[stack->size - 1];
    }

    /* Извлечь из стека */
    int pop(ArrayStack *stack) {
        int val = peek(stack);
        stack->size--;
        return val;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_stack.kt"
    /* Стек на основе массива */
    class ArrayStack {
        // Инициализация списка (динамического массива)
        private val stack = mutableListOf<Int>()

        /* Получение длины стека */
        fun size(): Int {
            return stack.size
        }

        /* Проверка, пуст ли стек */
        fun isEmpty(): Boolean {
            return size() == 0
        }

        /* Поместить в стек */
        fun push(num: Int) {
            stack.add(num)
        }

        /* Извлечь из стека */
        fun pop(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack.removeAt(size() - 1)
        }

        /* Доступ к верхнему элементу стека */
        fun peek(): Int {
            if (isEmpty()) throw IndexOutOfBoundsException()
            return stack[size() - 1]
        }

        /* Преобразовать List в Array и вернуть */
        fun toArray(): Array<Any> {
            return stack.toTypedArray()
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_stack.rb"
    ### Стек на основе массива ###
    class ArrayStack
      ### Конструктор ###
      def initialize
        @stack = []
      end

      ### Получить длину стека ###
      def size
        @stack.length
      end

      ### Проверка, пуст ли стек ###
      def is_empty?
        @stack.empty?
      end

      ### Помещение в стек ###
      def push(item)
        @stack << item
      end

      ### Извлечение из стека ###
      def pop
        raise IndexError, 'стек пуст' if is_empty?

        @stack.pop
      end

      ### Доступ к верхнему элементу стека ###
      def peek
        raise IndexError, 'стек пуст' if is_empty?

        @stack.last
      end

      ### Вернуть список для вывода ###
      def to_array
        @stack
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%D0%A1%D1%82%D0%B5%D0%BA%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%2C%20%D0%BF%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self%2C%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B5%D0%BC%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%D0%A1%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B5%D0%BC%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22stack%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D1%82%D1%83%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20ArrayStack%3A%0A%20%20%20%20%22%22%22%D0%A1%D1%82%D0%B5%D0%BA%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20%20%20%20%20%20%20self._stack%3A%20list%5Bint%5D%20%3D%20%5B%5D%0A%0A%20%20%20%20def%20size%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._stack%29%0A%0A%20%20%20%20def%20is_empty%28self%29%20-%3E%20bool%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%2C%20%D0%BF%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%20%3D%3D%20%5B%5D%0A%0A%20%20%20%20def%20push%28self%2C%20item%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%9F%D0%BE%D0%BC%D0%B5%D1%81%D1%82%D0%B8%D1%82%D1%8C%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%22%22%22%0A%20%20%20%20%20%20%20%20self._stack.append%28item%29%0A%0A%20%20%20%20def%20pop%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D1%8C%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack.pop%28%29%0A%0A%20%20%20%20def%20peek%28self%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B5%D0%BC%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.is_empty%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20raise%20IndexError%28%22%D1%81%D1%82%D0%B5%D0%BA%20%D0%BF%D1%83%D1%81%D1%82%22%29%0A%20%20%20%20%20%20%20%20return%20self._stack%5B-1%5D%0A%0A%20%20%20%20def%20to_list%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BE%D0%BA%20%D0%B4%D0%BB%D1%8F%20%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0%22%22%22%0A%20%20%20%20%20%20%20%20return%20self._stack%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20stack%20%3D%20ArrayStack%28%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BC%D0%B5%D1%89%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B2%20%D1%81%D1%82%D0%B5%D0%BA%0A%20%20%20%20stack.push%281%29%0A%20%20%20%20stack.push%283%29%0A%20%20%20%20stack.push%282%29%0A%20%20%20%20stack.push%285%29%0A%20%20%20%20stack.push%284%29%0A%20%20%20%20print%28%22%D0%A1%D1%82%D0%B5%D0%BA%20stack%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D0%B2%D0%B5%D1%80%D1%85%D0%BD%D0%B5%D0%BC%D1%83%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D1%83%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20peek%20%3D%20stack.peek%28%29%0A%20%20%20%20print%28%22%D0%92%D0%B5%D1%80%D1%85%D0%BD%D0%B8%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20peek%20%3D%22%2C%20peek%29%0A%0A%20%20%20%20%23%20%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%B0%20%D0%B8%D0%B7%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20pop%20%3D%20stack.pop%28%29%0A%20%20%20%20print%28%22%D0%98%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%20pop%20%3D%22%2C%20pop%29%0A%20%20%20%20print%28%22stack%20%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%B8%D0%B7%D0%B2%D0%BB%D0%B5%D1%87%D0%B5%D0%BD%D0%B8%D1%8F%20%3D%22%2C%20stack.to_list%28%29%29%0A%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D0%B4%D0%BB%D0%B8%D0%BD%D1%8B%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%0A%20%20%20%20size%20%3D%20stack.size%28%29%0A%20%20%20%20print%28%22%D0%94%D0%BB%D0%B8%D0%BD%D0%B0%20%D1%81%D1%82%D0%B5%D0%BA%D0%B0%20size%20%3D%22%2C%20size%29%0A%0A%20%20%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B2%D0%B5%D1%80%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D1%82%D1%83%0A%20%20%20%20is_empty%20%3D%20stack.is_empty%28%29%0A%20%20%20%20print%28%22%D0%9F%D1%83%D1%81%D1%82%20%D0%BB%D0%B8%20%D1%81%D1%82%D0%B5%D0%BA%20%3D%22%2C%20is_empty%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 5.1.3 &nbsp; Сравнение двух реализаций

**Поддерживаемые операции**

Обе реализации поддерживают все операции, определенные для стека. Реализация на массиве дополнительно позволяет выполнять произвольный доступ, но это уже выходит за рамки определения стека и обычно не используется.

**Временная эффективность**

В реализации на массиве и `push` , и `pop` выполняются в заранее выделенной непрерывной памяти, которая хорошо использует локальность кэша, поэтому такие операции обычно эффективнее. Однако если при `push` емкость массива оказывается превышена, включается механизм расширения, и временная сложность именно этой операции становится $O(n)$ .

В реализации на связном списке расширение выполняется очень гибко, и проблемы падения эффективности из-за расширения массива здесь нет. Но сама операция `push` требует инициализации объекта-узла и изменения указателей, поэтому в среднем она немного менее эффективна. Впрочем, если помещаемые в стек элементы уже сами являются объектами-узлами, шаг инициализации можно пропустить и тем самым повысить эффективность.

Итак, когда элементами, помещаемыми и извлекаемыми из стека, являются базовые типы данных, например `int` или `double` , можно сделать следующие выводы.

- Стек на основе массива теряет в эффективности в моменты расширения, но поскольку расширение происходит редко, его средняя эффективность выше.
- Стек на основе связного списка может обеспечивать более стабильную производительность.

**Пространственная эффективность**

При инициализации массива система выделяет начальную емкость, которая может превышать реальную потребность. Кроме того, механизм расширения обычно увеличивает емкость по некоторому коэффициенту, например в 2 раза, и расширенная емкость тоже может оказаться больше фактически необходимой. Поэтому **реализация стека на основе массива может приводить к некоторым потерям памяти**.

Однако, поскольку узлы связного списка должны дополнительно хранить указатели, **узлы списка сами по себе занимают больше пространства**.

В итоге нельзя просто сказать, какая из реализаций более экономна по памяти; это нужно анализировать в контексте конкретной задачи.

## 5.1.4 &nbsp; Типичные применения стека

- **Кнопки "назад" и "вперед" в браузере, undo и redo в программах**. Каждый раз, когда мы открываем новую страницу, браузер помещает предыдущую страницу в стек, чтобы по операции "назад" можно было вернуться к ней. Операция "назад" по сути является `pop` . Если нужно одновременно поддерживать и "назад", и "вперед", то обычно используются два стека.
- **Управление памятью программы**. Каждый раз при вызове функции система помещает на вершину стека стековый кадр, в котором хранится контекст функции. В рекурсивной функции на этапе углубления рекурсии непрерывно выполняются операции `push` , а на этапе возврата - операции `pop` .
