# Связные списки

Память -- это общий ресурс всех программ, и в сложной системной среде выполнения участки свободной памяти могут быть разбросаны по всему пространству памяти. Нам уже известно, что память для хранения массива должна быть непрерывной, и когда массив очень велик, в памяти может не оказаться столь большого непрерывного участка. В этом случае проявляется преимущество гибкости связного списка.

*Связный список* -- это линейная структура данных, в которой каждый элемент является объектом-узлом. При этом узлы соединяются друг с другом с помощью ссылок. В ссылке хранится адрес памяти следующего узла, по которому можно перейти от текущего узла к следующему.

Структура связного списка позволяет узлам храниться в различных местах памяти, а их адреса памяти не обязаны быть последовательными.

![Определение и способ хранения связного списка](../assets/linkedlist_definition.png)

На рис. 4.5 изображена структура связного списка. Составным элементом является объект узла. Каждый узел содержит две части данных: значение узла и ссылку на следующий узел.

- Первый узел связного списка называется головным узлом, а последний узел -- хвостовым узлом.
- Хвостовой узел указывает на пустое значение, которое в Java, C++ и Python обозначается как null, nullptr и None соответственно.
- В языках, поддерживающих указатели, таких как C, C++, Go и Rust, вышеупомянутая ссылка заменена на указатель.

В следующем примере кода показано, что узел связного списка ListNode, помимо значения, должен дополнительно хранить ссылку (указатель). Поэтому при одинаковом объеме данных **связный список занимает больше памяти, чем массив**.

=== "Python"

    ```python title=""
    class ListNode:
        """Класс узла связного списка"""
        def __init__(self, val: int):
            self.val: int = val               # Значение узла
            self.next: ListNode | None = None # Ссылка на следующий узел
    ```

=== "C++"

    ```cpp title=""
    /* Структура узла связного списка */
    struct ListNode {
        int val;         // Значение узла
        ListNode *next;  // Указатель на следующий узел
        ListNode(int x) : val(x), next(nullptr) {}  // Конструктор
    };
    ```

=== "Java"

    ```java title=""
    /* Класс узла связного списка */
    class ListNode {
        int val;        // Значение узла
        ListNode next;  // Ссылка на следующий узел
        ListNode(int x) { val = x; }  // Конструктор
    }
    ```

=== "C#"

    ```csharp title=""
    /* Класс узла связного списка */
    class ListNode(int x) {  // Конструктор
        int val = x;         // Значение узла
        ListNode? next;      // Ссылка на следующий узел
    }
    ```

=== "Go"

    ```go title=""
    /* Структура узла связного списка */
    type ListNode struct {
        Val  int       // Значение узла
        Next *ListNode // Указатель на следующий узел
    }

    // NewListNode конструктор, создает новый связный список
    func NewListNode(val int) *ListNode {
        return &ListNode{
            Val:  val,
            Next: nil,
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Класс узла связного списка */
    class ListNode {
        var val: Int // Значение узла
        var next: ListNode? // Ссылка на следующий узел

        init(x: Int) { // Конструктор
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Класс узла связного списка */
    class ListNode {
        constructor(val, next) {
            this.val = (val === undefined ? 0 : val);       // Значение узла
            this.next = (next === undefined ? null : next); // Ссылка на следующий узел
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Класс узла связного списка */
    class ListNode {
        val: number;
        next: ListNode | null;
        constructor(val?: number, next?: ListNode | null) {
            this.val = val === undefined ? 0 : val;        // Значение узла
            this.next = next === undefined ? null : next;  // Ссылка на следующий узел
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Класс узла связного списка */
    class ListNode {
      int val; // Значение узла
      ListNode? next; // Ссылка на следующий узел
      ListNode(this.val, [this.next]); // Конструктор
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    /* Класс узла связного списка */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Значение узла
        next: Option<Rc<RefCell<ListNode>>>, // Указатель на следующий узел
    }
    ```

=== "C"

    ```c title=""
    /* Структура узла связного списка */
    typedef struct ListNode {
        int val;               // Значение узла
        struct ListNode *next; // Указатель на следующий узел
    } ListNode;

    /* Конструктор */
    ListNode *newListNode(int val) {
        ListNode *node;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Класс узла связного списка */
    // Конструктор
    class ListNode(x: Int) {
        val _val: Int = x          // Значение узла
        val next: ListNode? = null // Ссылка на следующий узел
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Класс узла связного списка
    class ListNode
      attr_accessor :val  # Значение узла
      attr_accessor :next # Ссылка на следующий узел

      def initialize(val=0, next_node=nil)
        @val = val
        @next = next_node
      end
    end
    ```

## Основные операции со связным списком

### Инициализация связного списка

Создание связного списка состоит из двух этапов: первый этап -- инициализация каждого объекта узла, второй этап -- построение ссылочных отношений между узлами. После завершения инициализации можно начать с головного узла связного списка и последовательно посетить все узлы через ссылку next.

=== "Python"

    ```python title="linked_list.py"
    # Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4
    # Инициализация каждого узла
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Построение ссылок между узлами
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "C++"

    ```cpp title="linked_list.cpp"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    ListNode* n0 = new ListNode(1);
    ListNode* n1 = new ListNode(3);
    ListNode* n2 = new ListNode(2);
    ListNode* n3 = new ListNode(5);
    ListNode* n4 = new ListNode(4);
    // Построение ссылок между узлами
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Java"

    ```java title="linked_list.java"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    ListNode n0 = new ListNode(1);
    ListNode n1 = new ListNode(3);
    ListNode n2 = new ListNode(2);
    ListNode n3 = new ListNode(5);
    ListNode n4 = new ListNode(4);
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "C#"

    ```csharp title="linked_list.cs"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    ListNode n0 = new(1);
    ListNode n1 = new(3);
    ListNode n2 = new(2);
    ListNode n3 = new(5);
    ListNode n4 = new(4);
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Go"

    ```go title="linked_list.go"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    n0 := NewListNode(1)
    n1 := NewListNode(3)
    n2 := NewListNode(2)
    n3 := NewListNode(5)
    n4 := NewListNode(4)
    // Построение ссылок между узлами
    n0.Next = n1
    n1.Next = n2
    n2.Next = n3
    n3.Next = n4
    ```

=== "Swift"

    ```swift title="linked_list.swift"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    let n0 = ListNode(x: 1)
    let n1 = ListNode(x: 3)
    let n2 = ListNode(x: 2)
    let n3 = ListNode(x: 5)
    let n4 = ListNode(x: 4)
    // Построение ссылок между узлами
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "JS"

    ```javascript title="linked_list.js"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "TS"

    ```typescript title="linked_list.ts"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Dart"

    ```dart title="linked_list.dart"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    ListNode n0 = ListNode(1);
    ListNode n1 = ListNode(3);
    ListNode n2 = ListNode(2);
    ListNode n3 = ListNode(5);
    ListNode n4 = ListNode(4);
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Rust"

    ```rust title="linked_list.rs"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
    let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
    let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
    let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
    let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

    // Построение ссылок между узлами
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    ```

=== "C"

    ```c title="linked_list.c"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    ListNode* n0 = newListNode(1);
    ListNode* n1 = newListNode(3);
    ListNode* n2 = newListNode(2);
    ListNode* n3 = newListNode(5);
    ListNode* n4 = newListNode(4);
    // Построение ссылок между узлами
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Kotlin"

    ```kotlin title="linked_list.kt"
    /* Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4 */
    // Инициализация каждого узла
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)
    // Построение ссылок между узлами
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Ruby"

    ```ruby title="linked_list.rb"
    # Инициализация связного списка 1 -> 3 -> 2 -> 5 -> 4
    # Инициализация каждого узла
    n0 = ListNode.new(1)
    n1 = ListNode.new(3)
    n2 = ListNode.new(2)
    n3 = ListNode.new(5)
    n4 = ListNode.new(4)
    # Построение ссылок между узлами
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

<!-- 🔴 Русская версия не содержит раздел "可视化运行" (визуализация выполнения) -->

Массив в целом является переменной, например массив nums содержит элементы nums[0] и nums[1] и т.д., в то время как связный список состоит из множества независимых объектов-узлов. **Обычно головной узел рассматривается как представитель связного списка**, например, в приведенном выше коде связный список можно обозначить как связный список n0.

### Вставка узла

<!-- 🔴 Русская версия не содержит описание вставки узла с изображением -->
<!-- Китайский оригинал: 在链表中插入节点非常容易。如下图所示，假设我们想在相邻的两个节点 `n0` 和 `n1` 之间插入一个新节点 `P`... -->

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Удаление узла

<!-- 🔴 Русская версия не содержит описание удаления узла с изображением -->
<!-- Китайский оригинал: 如下图所示，在链表中删除节点也非常方便，**只需改变一个节点的引用（指针）即可**... -->

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Доступ к узлу

<!-- 🔴 Русская версия не содержит полное описание доступа к узлу -->
<!-- Китайский оригинал: **在链表中访问节点的效率较低**。如上一节所述，我们可以在 $O(1)$ 时间下访问数组中的任意元素... -->

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Поиск узла

<!-- 🔴 Русская версия не содержит описание поиска узла -->
<!-- Китайский оригинал: 遍历链表，查找其中值为 `target` 的节点，输出该节点在链表中的索引... -->

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Массивы vs. Связные списки

<!-- 🔴 Русская версия не содержит сравнительную таблицу и описание -->
<!-- Китайский оригинал: 下表总结了数组和链表的各项特点并对比了操作效率... -->

## Распространенные типы связных списков

<!-- 🔴 Русская версия не содержит описание типов связных списков -->
<!-- Китайский оригинал: 如下图所示，常见的链表类型包括三种... -->

<!-- 🔴 Русская версия не содержит код для двусвязного списка на разных языках -->

<!-- 🔴 Русская версия не содержит изображение с типами связных списков -->

## Типичные применения связных списков

<!-- 🔴 Русская версия не содержит раздел о применении связных списков -->
<!-- Китайский оригинал: 单向链表通常用于实现栈、队列、哈希表和图等数据结构... -->