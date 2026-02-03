# Двоичные деревья

<u>Двоичное (бинарное) дерево (binary tree)</u> -- это нелинейная структура данных, представляющая отношения между предками и потомками и отражающая логику «разделяй и властвуй». Подобно спискам, основным элементом двоичного дерева является узел, который содержит значение, ссылку на левый дочерний узел и ссылку на правый дочерний узел.

=== "Python"

    ```python title=""
    class TreeNode:
        """Класс узла двоичного дерева"""
        def __init__(self, val: int):
            self.val: int = val                # Значение узла
            self.left: TreeNode | None = None  # Ссылка на левый дочерний узел
            self.right: TreeNode | None = None # Ссылка на правый дочерний узел
    ```

=== "C++"

    ```cpp title=""
    /* Структура узла двоичного дерева */
    struct TreeNode {
        int val;          // Значение узла
        TreeNode *left;   // Указатель на левый дочерний узел
        TreeNode *right;  // Указатель на правый дочерний узел
        TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    };
    ```

=== "Java"

    ```java title=""
    /* Класс узла двоичного дерева */
    class TreeNode {
        int val;         // Значение узла
        TreeNode left;   // Ссылка на левый дочерний узел
        TreeNode right;  // Ссылка на правый дочерний узел
        TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Класс узла двоичного дерева */
    class TreeNode(int? x) {
        public int? val = x;    // Значение узла
        public TreeNode? left;  // Ссылка на левый дочерний узел
        public TreeNode? right; // Ссылка на правый дочерний узел
    }
    ```

=== "Go"

    ```go title=""
    /* Структура узла двоичного дерева */
    type TreeNode struct {
        Val   int
        Left  *TreeNode
        Right *TreeNode
    }
    /* Конструктор */
    func NewTreeNode(v int) *TreeNode {
        return &TreeNode{
            Left:  nil, // Указатель на левый дочерний узел
            Right: nil, // Указатель на правый дочерний узел
            Val:   v,   // Значение узла
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Класс узла двоичного дерева */
    class TreeNode {
        var val: Int // Значение узла
        var left: TreeNode? // Ссылка на левый дочерний узел
        var right: TreeNode? // Ссылка на правый дочерний узел

        init(x: Int) {
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Класс узла двоичного дерева */
    class TreeNode {
        val; // Значение узла
        left; // Указатель на левый дочерний узел
        right; // Указатель на правый дочерний узел
        constructor(val, left, right) {
            this.val = val === undefined ? 0 : val;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Класс узла двоичного дерева */
    class TreeNode {
        val: number;
        left: TreeNode | null;
        right: TreeNode | null;

        constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val; // Значение узла
            this.left = left === undefined ? null : left; // Ссылка на левый дочерний узел
            this.right = right === undefined ? null : right; // Ссылка на правый дочерний узел
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Класс узла двоичного дерева */
    class TreeNode {
      int val;         // Значение узла
      TreeNode? left;  // Ссылка на левый дочерний узел
      TreeNode? right; // Ссылка на правый дочерний узел
      TreeNode(this.val, [this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Структура узла двоичного дерева */
    struct TreeNode {
        val: i32,                               // Значение узла
        left: Option<Rc<RefCell<TreeNode>>>,    // Ссылка на левый дочерний узел
        right: Option<Rc<RefCell<TreeNode>>>,   // Ссылка на правый дочерний узел
    }

    impl TreeNode {
        /* Конструктор */
        fn new(val: i32) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(Self {
                val,
                left: None,
                right: None
            }))
        }
    }
    ```

=== "C"

    ```c title=""
    /* Структура узла двоичного дерева */
    typedef struct TreeNode {
        int val;                // Значение узла
        int height;             // Высота узла
        struct TreeNode *left;  // Указатель на левый дочерний узел
        struct TreeNode *right; // Указатель на правый дочерний узел
    } TreeNode;

    /* Функция-конструктор */
    TreeNode *newTreeNode(int val) {
        TreeNode *node;

        node = (TreeNode *)malloc(sizeof(TreeNode));
        node->val = val;
        node->height = 0;
        node->left = NULL;
        node->right = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Класс узла двоичного дерева */
    class TreeNode(val _val: Int) {  // Значение узла
        val left: TreeNode? = null   // Ссылка на левый дочерний узел
        val right: TreeNode? = null  // Ссылка на правый дочерний узел
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Класс узла двоичного дерева ###
    class TreeNode
      attr_accessor :val    # Значение узла
      attr_accessor :left   # Ссылка на левый дочерний узел
      attr_accessor :right  # Ссылка на правый дочерний узел

      def initialize(val)
        @val = val
      end
    end
    ```

Каждый узел имеет две ссылки (указателя), указывающие на <u>левый дочерний узел (left-child node)</u> и <u>правый дочерний узел (right-child node)</u>. Текущий узел называется <u>родительским узлом (parent node)</u> для этих двух дочерних узлов. Для заданного узла дерево, образованное его левым дочерним узлом и всеми его подузлами, называется <u>левым поддеревом (left subtree)</u>. Аналогично определяется <u>правое поддерево (right subtree)</u>.

**В двоичном дереве, кроме листовых узлов, все остальные узлы содержат дочерние узлы и непустые поддеревья**. Как показано на рисунке ниже, если рассматривать «узел 2» как родительский, то его левым и правым дочерними узлами будут «узел 4» и «узел 5» соответственно. Левое поддерево -- это «узел 4 и все узлы ниже него», а правое поддерево -- «узел 5 и все узлы ниже него».

![Родительский узел, дочерние узлы, поддеревья](../assets/binary_tree_definition.png)

## Основные понятия двоичного дерева

Основные понятия двоичного дерева показаны на рисунке ниже.

- <u>Корневой узел (root node)</u>: узел, находящийся на верхнем уровне дерева и не имеющий родительского узла.
- <u>Листовой узел (leaf node)</u>: узел, не имеющий дочерних узлов, оба его указателя указывают на `None`.
- <u>Ребро (edge)</u>: отрезок, соединяющий два узла, т. е. ссылка (указатель) узла.
- <u>Уровень узла (level)</u>: увеличивается сверху вниз, уровень корневого узла равен 1.
- <u>Степень узла (degree)</u>: количество дочерних узлов узла. В двоичном дереве степень может быть 0, 1 или 2.
- <u>Высота двоичного дерева (height)</u>: количество ребер от корневого узла до самого удаленного листового узла.
- <u>Глубина узла (depth)</u>: количество ребер от корневого узла до данного узла.
- <u>Высота узла (height)</u>: количество ребер от самого удаленного листового узла до данного узла.

![Основные понятия двоичного дерева](../assets/binary_tree_terminology.png)

!!! tip

    Обратите внимание, что обычно мы определяем «высоту» и «глубину» как «количество пройденных ребер», но в некоторых задачах или учебниках они могут определяться как «количество пройденных узлов». В этом случае высота и глубина должны быть увеличены на 1.

## Основные операции с двоичными деревьями

### Инициализация двоичного дерева

Подобно спискам, сначала инициализируются узлы, затем строятся ссылки (указатели).

=== "Python"

    ```python title="binary_tree.py"
    # Инициализация двоичного дерева
    # Инициализация узлов
    n1 = TreeNode(val=1)
    n2 = TreeNode(val=2)
    n3 = TreeNode(val=3)
    n4 = TreeNode(val=4)
    n5 = TreeNode(val=5)
    # Построение ссылок (указателей) между узлами
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    TreeNode* n1 = new TreeNode(1);
    TreeNode* n2 = new TreeNode(2);
    TreeNode* n3 = new TreeNode(3);
    TreeNode* n4 = new TreeNode(4);
    TreeNode* n5 = new TreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Java"

    ```java title="binary_tree.java"
    // Инициализация узлов
    TreeNode n1 = new TreeNode(1);
    TreeNode n2 = new TreeNode(2);
    TreeNode n3 = new TreeNode(3);
    TreeNode n4 = new TreeNode(4);
    TreeNode n5 = new TreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    TreeNode n1 = new(1);
    TreeNode n2 = new(2);
    TreeNode n3 = new(3);
    TreeNode n4 = new(4);
    TreeNode n5 = new(5);
    // Построение ссылок (указателей) между узлами
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    n1 := NewTreeNode(1)
    n2 := NewTreeNode(2)
    n3 := NewTreeNode(3)
    n4 := NewTreeNode(4)
    n5 := NewTreeNode(5)
    // Построение ссылок (указателей) между узлами
    n1.Left = n2
    n1.Right = n3
    n2.Left = n4
    n2.Right = n5
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    // Инициализация узлов
    let n1 = TreeNode(x: 1)
    let n2 = TreeNode(x: 2)
    let n3 = TreeNode(x: 3)
    let n4 = TreeNode(x: 4)
    let n5 = TreeNode(x: 5)
    // Построение ссылок (указателей) между узлами
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    let n1 = new TreeNode(1),
        n2 = new TreeNode(2),
        n3 = new TreeNode(3),
        n4 = new TreeNode(4),
        n5 = new TreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    TreeNode n1 = new TreeNode(1);
    TreeNode n2 = new TreeNode(2);
    TreeNode n3 = new TreeNode(3);
    TreeNode n4 = new TreeNode(4);
    TreeNode n5 = new TreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1.left = n2;
    n1.right = n3;
    n2.left = n4;
    n2.right = n5;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    // Инициализация узлов
    let n1 = TreeNode::new(1);
    let n2 = TreeNode::new(2);
    let n3 = TreeNode::new(3);
    let n4 = TreeNode::new(4);
    let n5 = TreeNode::new(5);
    // Построение ссылок (указателей) между узлами
    n1.borrow_mut().left = Some(n2.clone());
    n1.borrow_mut().right = Some(n3);
    n2.borrow_mut().left = Some(n4);
    n2.borrow_mut().right = Some(n5);
    ```

=== "C"

    ```c title="binary_tree.c"
    /* Инициализация двоичного дерева */
    // Инициализация узлов
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // Построение ссылок (указателей) между узлами
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    // Инициализация узлов
    val n1 = TreeNode(1)
    val n2 = TreeNode(2)
    val n3 = TreeNode(3)
    val n4 = TreeNode(4)
    val n5 = TreeNode(5)
    // Построение ссылок (указателей) между узлами
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # Инициализация двоичного дерева
    # Инициализация узлов
    n1 = TreeNode.new(1)
    n2 = TreeNode.new(2)
    n3 = TreeNode.new(3)
    n4 = TreeNode.new(4)
    n5 = TreeNode.new(5)
    # Построение ссылок (указателей) между узлами
    n1.left = n2
    n1.right = n3
    n2.left = n4
    n2.right = n5
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E8%8A%82%E7%82%B9%0A%20%20%20%20n1%20%3D%20TreeNode%28val%3D1%29%0A%20%20%20%20n2%20%3D%20TreeNode%28val%3D2%29%0A%20%20%20%20n3%20%3D%20TreeNode%28val%3D3%29%0A%20%20%20%20n4%20%3D%20TreeNode%28val%3D4%29%0A%20%20%20%20n5%20%3D%20TreeNode%28val%3D5%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%EF%BC%88%E6%8C%87%E9%92%88%EF%BC%89%0A%20%20%20%20n1.left%20%3D%20n2%0A%20%20%20%20n1.right%20%3D%20n3%0A%20%20%20%20n2.left%20%3D%20n4%0A%20%20%20%20n2.right%20%3D%20n5&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

### Вставка и удаление узлов

Подобно спискам, в двоичном дереве вставку и удаление узлов можно выполнять путем изменения указателей. На рисунке ниже приведен пример.

![Вставка и удаление узлов в двоичном дереве](../assets/binary_tree_add_remove.png)

=== "Python"

    ```python title="binary_tree.py"
    # Вставка и удаление узлов
    p = TreeNode(0)
    # Вставка узла P между n1 и n2
    n1.left = p
    p.left = n2
    # Удаление узла P
    n1.left = n2
    ```

=== "C++"

    ```cpp title="binary_tree.cpp"
    /* Вставка и удаление узлов */
    TreeNode* P = new TreeNode(0);
    // Вставка узла P между n1 и n2
    n1->left = P;
    P->left = n2;
    // Удаление узла P
    n1->left = n2;
    // Освобождение памяти
    delete P;
    ```

=== "Java"

    ```java title="binary_tree.java"
    TreeNode P = new TreeNode(0);
    // Вставка узла P между n1 и n2
    n1.left = P;
    P.left = n2;
    // Удаление узла P
    n1.left = n2;
    ```

=== "C#"

    ```csharp title="binary_tree.cs"
    /* Вставка и удаление узлов */
    TreeNode P = new(0);
    // Вставка узла P между n1 и n2
    n1.left = P;
    P.left = n2;
    // Удаление узла P
    n1.left = n2;
    ```

=== "Go"

    ```go title="binary_tree.go"
    /* Вставка и удаление узлов */
    // Вставка узла P между n1 и n2
    p := NewTreeNode(0)
    n1.Left = p
    p.Left = n2
    // Удаление узла P
    n1.Left = n2
    ```

=== "Swift"

    ```swift title="binary_tree.swift"
    let P = TreeNode(x: 0)
    // Вставка узла P между n1 и n2
    n1.left = P
    P.left = n2
    // Удаление узла P
    n1.left = n2
    ```

=== "JS"

    ```javascript title="binary_tree.js"
    /* Вставка и удаление узлов */
    let P = new TreeNode(0);
    // Вставка узла P между n1 и n2
    n1.left = P;
    P.left = n2;
    // Удаление узла P
    n1.left = n2;
    ```

=== "TS"

    ```typescript title="binary_tree.ts"
    /* Вставка и удаление узлов */
    const P = new TreeNode(0);
    // Вставка узла P между n1 и n2
    n1.left = P;
    P.left = n2;
    // Удаление узла P
    n1.left = n2;
    ```

=== "Dart"

    ```dart title="binary_tree.dart"
    /* Вставка и удаление узлов */
    TreeNode P = new TreeNode(0);
    // Вставка узла P между n1 и n2
    n1.left = P;
    P.left = n2;
    // Удаление узла P
    n1.left = n2;
    ```

=== "Rust"

    ```rust title="binary_tree.rs"
    let p = TreeNode::new(0);
    // Вставка узла P между n1 и n2
    n1.borrow_mut().left = Some(p.clone());
    p.borrow_mut().left = Some(n2.clone());
    // Удаление узла p
    n1.borrow_mut().left = Some(n2);
    ```

=== "C"

    ```c title="binary_tree.c"
    /* Вставка и удаление узлов */
    TreeNode *P = newTreeNode(0);
    // Вставка узла P между n1 и n2
    n1->left = P;
    P->left = n2;
    // Удаление узла P
    n1->left = n2;
    // Освобождение памяти
    free(P);
    ```

=== "Kotlin"

    ```kotlin title="binary_tree.kt"
    val P = TreeNode(0)
    // Вставка узла P между n1 и n2
    n1.left = P
    P.left = n2
    // Удаление узла P
    n1.left = n2
    ```

=== "Ruby"

    ```ruby title="binary_tree.rb"
    # Вставка и удаление узлов
    _p = TreeNode.new(0)
    # Вставка узла _p между n1 и n2
    n1.left = _p
    _p.left = n2
    # Удаление узла
    n1.left = n2
    ```

??? pythontutor "Визуализация выполнения"

    https://pythontutor.com/render.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E8%8A%82%E7%82%B9%0A%20%20%20%20n1%20%3D%20TreeNode%