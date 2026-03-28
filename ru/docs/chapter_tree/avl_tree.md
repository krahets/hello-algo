---
comments: true
---

# 7.5 &nbsp; AVL-дерево *

В разделе "Двоичное дерево поиска" мы упоминали, что после многократных операций вставки и удаления узлов двоичное дерево поиска может выродиться в связный список. В таком случае временная сложность всех операций ухудшается с $O(\log n)$ до $O(n)$ .

Как показано на рисунке 7-24, после двух операций удаления узлов это двоичное дерево поиска вырождается в связный список.

![Деградация AVL-дерева после удаления узлов](avl_tree.assets/avltree_degradation_from_removing_node.png){ class="animation-figure" }

<p align="center"> Рисунок 7-24 &nbsp; Деградация AVL-дерева после удаления узлов </p>

Другой пример: если в идеальное двоичное дерево, показанное на рисунке 7-25, вставить два узла, то дерево сильно наклонится влево, а временная сложность поиска тоже ухудшится.

![Деградация AVL-дерева после вставки узлов](avl_tree.assets/avltree_degradation_from_inserting_node.png){ class="animation-figure" }

<p align="center"> Рисунок 7-25 &nbsp; Деградация AVL-дерева после вставки узлов </p>

В 1962 году Г. М. Adelson-Velsky и Е. М. Landis в статье "An algorithm for the organization of information" предложили <u>AVL-дерево</u>. В статье подробно описан набор операций, гарантирующий, что при непрерывном добавлении и удалении узлов AVL-дерево не вырождается, благодаря чему временная сложность различных операций сохраняется на уровне $O(\log n)$ . Иначе говоря, в сценариях, где часто выполняются вставка, удаление, поиск и изменение, AVL-дерево всегда поддерживает эффективную работу с данными и потому имеет высокую практическую ценность.

## 7.5.1 &nbsp; Распространенные термины AVL-дерева

AVL-дерево одновременно является и двоичным деревом поиска, и сбалансированным двоичным деревом, то есть одновременно удовлетворяет всем свойствам обеих этих структур. Поэтому AVL-дерево является разновидностью <u>сбалансированного двоичного дерева поиска (balanced binary search tree)</u>.

### 1. &nbsp; Высота узла

Поскольку операции AVL-дерева требуют получать высоту узла, нам нужно добавить в класс узла переменную `height` :

=== "Python"

    ```python title=""
    class TreeNode:
        """Класс узла AVL-дерева"""
        def __init__(self, val: int):
            self.val: int = val                 # Значение узла
            self.height: int = 0                # Высота узла
            self.left: TreeNode | None = None   # Ссылка на левого дочернего узла
            self.right: TreeNode | None = None  # Ссылка на правого дочернего узла
    ```

=== "C++"

    ```cpp title=""
    /* Класс узла AVL-дерева */
    struct TreeNode {
        int val{};          // Значение узла
        int height = 0;     // Высота узла
        TreeNode *left{};   // Левый дочерний узел
        TreeNode *right{};  // Правый дочерний узел
        TreeNode() = default;
        explicit TreeNode(int x) : val(x){}
    };
    ```

=== "Java"

    ```java title=""
    /* Класс узла AVL-дерева */
    class TreeNode {
        public int val;        // Значение узла
        public int height;     // Высота узла
        public TreeNode left;  // Левый дочерний узел
        public TreeNode right; // Правый дочерний узел
        public TreeNode(int x) { val = x; }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Класс узла AVL-дерева */
    class TreeNode(int? x) {
        public int? val = x;    // Значение узла
        public int height;      // Высота узла
        public TreeNode? left;  // Ссылка на левого дочернего узла
        public TreeNode? right; // Ссылка на правого дочернего узла
    }
    ```

=== "Go"

    ```go title=""
    /* Структура узла AVL-дерева */
    type TreeNode struct {
        Val    int       // Значение узла
        Height int       // Высота узла
        Left   *TreeNode // Ссылка на левого дочернего узла
        Right  *TreeNode // Ссылка на правого дочернего узла
    }
    ```

=== "Swift"

    ```swift title=""
    /* Класс узла AVL-дерева */
    class TreeNode {
        var val: Int // Значение узла
        var height: Int // Высота узла
        var left: TreeNode? // Левый дочерний узел
        var right: TreeNode? // Правый дочерний узел

        init(x: Int) {
            val = x
            height = 0
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Класс узла AVL-дерева */
    class TreeNode {
        val; // Значение узла
        height; // Высота узла
        left; // Указатель на левого дочернего узла
        right; // Указатель на правого дочернего узла
        constructor(val, left, right, height) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Класс узла AVL-дерева */
    class TreeNode {
        val: number;            // Значение узла
        height: number;         // Высота узла
        left: TreeNode | null;  // Указатель на левого дочернего узла
        right: TreeNode | null; // Указатель на правого дочернего узла
        constructor(val?: number, height?: number, left?: TreeNode | null, right?: TreeNode | null) {
            this.val = val === undefined ? 0 : val;
            this.height = height === undefined ? 0 : height;
            this.left = left === undefined ? null : left;
            this.right = right === undefined ? null : right;
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Класс узла AVL-дерева */
    class TreeNode {
      int val;         // Значение узла
      int height;      // Высота узла
      TreeNode? left;  // Левый дочерний узел
      TreeNode? right; // Правый дочерний узел
      TreeNode(this.val, [this.height = 0, this.left, this.right]);
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Структура узла AVL-дерева */
    struct TreeNode {
        val: i32,                               // Значение узла
        height: i32,                            // Высота узла
        left: Option<Rc<RefCell<TreeNode>>>,    // Левый дочерний узел
        right: Option<Rc<RefCell<TreeNode>>>,   // Правый дочерний узел
    }

    impl TreeNode {
        /* Конструктор */
        fn new(val: i32) -> Rc<RefCell<Self>> {
            Rc::new(RefCell::new(Self {
                val,
                height: 0,
                left: None,
                right: None
            }))
        }
    }
    ```

=== "C"

    ```c title=""
    /* Структура узла AVL-дерева */
    typedef struct TreeNode {
        int val;
        int height;
        struct TreeNode *left;
        struct TreeNode *right;
    } TreeNode;

    /* Конструктор */
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
    /* Класс узла AVL-дерева */
    class TreeNode(val _val: Int) {  // Значение узла
        val height: Int = 0          // Высота узла
        val left: TreeNode? = null   // Левый дочерний узел
        val right: TreeNode? = null  // Правый дочерний узел
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Класс узла AVL-дерева ###
    class TreeNode
      attr_accessor :val    # Значение узла
      attr_accessor :height # Высота узла
      attr_accessor :left   # Ссылка на левого дочернего узла
      attr_accessor :right  # Ссылка на правого дочернего узла

      def initialize(val)
        @val = val
        @height = 0
      end
    end
    ```

"Высота узла" означает расстояние от этого узла до самого удаленного листового узла, то есть число пройденных "ребер". Особенно важно помнить, что высота листового узла равна $0$ , а высота пустого узла равна $-1$ . Мы создадим две вспомогательные функции: одну для получения высоты узла, другую для ее обновления:

=== "Python"

    ```python title="avl_tree.py"
    def height(self, node: TreeNode | None) -> int:
        """Получить высоту узла"""
        # Высота пустого узла равна -1, высота листового узла равна 0
        if node is not None:
            return node.height
        return -1

    def update_height(self, node: TreeNode | None):
        """Обновить высоту узла"""
        # Высота узла равна высоте более высокого поддерева + 1
        node.height = max([self.height(node.left), self.height(node.right)]) + 1
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Получить высоту узла */
    int height(TreeNode *node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node == nullptr ? -1 : node->height;
    }

    /* Обновить высоту узла */
    void updateHeight(TreeNode *node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Получить высоту узла */
    int height(TreeNode node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void updateHeight(TreeNode node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Получить высоту узла */
    int Height(TreeNode? node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void UpdateHeight(TreeNode node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Получить высоту узла */
    func (t *aVLTree) height(node *TreeNode) int {
        // Высота пустого узла равна -1, высота листового узла равна 0
        if node != nil {
            return node.Height
        }
        return -1
    }

    /* Обновить высоту узла */
    func (t *aVLTree) updateHeight(node *TreeNode) {
        lh := t.height(node.Left)
        rh := t.height(node.Right)
        // Высота узла равна высоте более высокого поддерева + 1
        if lh > rh {
            node.Height = lh + 1
        } else {
            node.Height = rh + 1
        }
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Получить высоту узла */
    func height(node: TreeNode?) -> Int {
        // Высота пустого узла равна -1, высота листового узла равна 0
        node?.height ?? -1
    }

    /* Обновить высоту узла */
    func updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node: node?.left), height(node: node?.right)) + 1
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Получить высоту узла */
    height(node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node === null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    #updateHeight(node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Получить высоту узла */
    height(node: TreeNode): number {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node === null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    updateHeight(node: TreeNode): void {
        // Высота узла равна высоте более высокого поддерева + 1
        node.height =
            Math.max(this.height(node.left), this.height(node.right)) + 1;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Получить высоту узла */
    int height(TreeNode? node) {
      // Высота пустого узла равна -1, высота листового узла равна 0
      return node == null ? -1 : node.height;
    }

    /* Обновить высоту узла */
    void updateHeight(TreeNode? node) {
      // Высота узла равна высоте более высокого поддерева + 1
      node!.height = max(height(node.left), height(node.right)) + 1;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Получить высоту узла */
    fn height(node: OptionTreeNodeRc) -> i32 {
        // Высота пустого узла равна -1, высота листового узла равна 0
        match node {
            Some(node) => node.borrow().height,
            None => -1,
        }
    }

    /* Обновить высоту узла */
    fn update_height(node: OptionTreeNodeRc) {
        if let Some(node) = node {
            let left = node.borrow().left.clone();
            let right = node.borrow().right.clone();
            // Высота узла равна высоте более высокого поддерева + 1
            node.borrow_mut().height = std::cmp::max(Self::height(left), Self::height(right)) + 1;
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Получить высоту узла */
    int height(TreeNode *node) {
        // Высота пустого узла равна -1, высота листового узла равна 0
        if (node != NULL) {
            return node->height;
        }
        return -1;
    }

    /* Обновить высоту узла */
    void updateHeight(TreeNode *node) {
        int lh = height(node->left);
        int rh = height(node->right);
        // Высота узла равна высоте более высокого поддерева + 1
        if (lh > rh) {
            node->height = lh + 1;
        } else {
            node->height = rh + 1;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Получить высоту узла */
    fun height(node: TreeNode?): Int {
        // Высота пустого узла равна -1, высота листового узла равна 0
        return node?.height ?: -1
    }

    /* Обновить высоту узла */
    fun updateHeight(node: TreeNode?) {
        // Высота узла равна высоте более высокого поддерева + 1
        node?.height = max(height(node?.left), height(node?.right)) + 1
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end
    ```

### 2. &nbsp; Баланс-фактор узла

<u>Баланс-фактор (balance factor)</u> узла определяется как высота левого поддерева минус высота правого поддерева; при этом баланс-фактор пустого узла считается равным $0$ . Мы также инкапсулируем получение баланс-фактора в отдельную функцию, чтобы потом было удобнее ее использовать:

=== "Python"

    ```python title="avl_tree.py"
    def balance_factor(self, node: TreeNode | None) -> int:
        """Получить коэффициент баланса"""
        # Коэффициент баланса пустого узла равен 0
        if node is None:
            return 0
        # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return self.height(node.left) - self.height(node.right)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Получить коэффициент баланса */
    int balanceFactor(TreeNode *node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == nullptr)
            return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node->left) - height(node->right);
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Получить коэффициент баланса */
    int balanceFactor(TreeNode node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null)
            return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node.left) - height(node.right);
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Получить коэффициент баланса */
    int BalanceFactor(TreeNode? node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return Height(node.left) - Height(node.right);
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Получить коэффициент баланса */
    func (t *aVLTree) balanceFactor(node *TreeNode) int {
        // Коэффициент баланса пустого узла равен 0
        if node == nil {
            return 0
        }
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return t.height(node.Left) - t.height(node.Right)
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Получить коэффициент баланса */
    func balanceFactor(node: TreeNode?) -> Int {
        // Коэффициент баланса пустого узла равен 0
        guard let node = node else { return 0 }
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node: node.left) - height(node: node.right)
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Получить коэффициент баланса */
    balanceFactor(node) {
        // Коэффициент баланса пустого узла равен 0
        if (node === null) return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Получить коэффициент баланса */
    balanceFactor(node: TreeNode): number {
        // Коэффициент баланса пустого узла равен 0
        if (node === null) return 0;
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return this.height(node.left) - this.height(node.right);
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Получить коэффициент баланса */
    int balanceFactor(TreeNode? node) {
      // Коэффициент баланса пустого узла равен 0
      if (node == null) return 0;
      // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      return height(node.left) - height(node.right);
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Получить коэффициент баланса */
    fn balance_factor(node: OptionTreeNodeRc) -> i32 {
        match node {
            // Коэффициент баланса пустого узла равен 0
            None => 0,
            // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
            Some(node) => {
                Self::height(node.borrow().left.clone()) - Self::height(node.borrow().right.clone())
            }
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Получить коэффициент баланса */
    int balanceFactor(TreeNode *node) {
        // Коэффициент баланса пустого узла равен 0
        if (node == NULL) {
            return 0;
        }
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node->left) - height(node->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Получить коэффициент баланса */
    fun balanceFactor(node: TreeNode?): Int {
        // Коэффициент баланса пустого узла равен 0
        if (node == null) return 0
        // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
        return height(node.left) - height(node.right)
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end
    ```

!!! tip

    Пусть баланс-фактор равен $f$ ; тогда для любого узла AVL-дерева выполняется $-1 \le f \le 1$ .

## 7.5.2 &nbsp; Вращения AVL-дерева

Особенность AVL-дерева заключается в операции "вращения", которая позволяет заново сбалансировать разбалансированный узел, не нарушая последовательность симметричного обхода двоичного дерева. Иначе говоря, **операция вращения одновременно сохраняет свойство "двоичного дерева поиска" и возвращает дерево в состояние "сбалансированного двоичного дерева"**.

Узлы, для которых абсолютное значение баланс-фактора больше $1$ , мы называем "разбалансированными узлами". В зависимости от вида разбаланса вращения делятся на четыре типа: правое вращение, левое вращение, сначала левое затем правое, и сначала правое затем левое. Ниже разберем их подробно.

### 1. &nbsp; Правое вращение

Как показано на рисунках ниже, под узлом указан его баланс-фактор. Если двигаться снизу вверх, то первым разбалансированным узлом в двоичном дереве будет "узел 3". Рассмотрим поддерево с этим узлом в качестве корня, обозначим данный узел как `node` , его левого дочернего узла как `child` и выполним "правое вращение". После завершения правого вращения поддерево снова станет сбалансированным и при этом сохранит свойство двоичного дерева поиска.

=== "<1>"
    ![Шаги правого вращения](avl_tree.assets/avltree_right_rotate_step1.png){ class="animation-figure" }

=== "<2>"
    ![avltree_right_rotate_step2](avl_tree.assets/avltree_right_rotate_step2.png){ class="animation-figure" }

=== "<3>"
    ![avltree_right_rotate_step3](avl_tree.assets/avltree_right_rotate_step3.png){ class="animation-figure" }

=== "<4>"
    ![avltree_right_rotate_step4](avl_tree.assets/avltree_right_rotate_step4.png){ class="animation-figure" }

<p align="center"> Рисунок 7-26 &nbsp; Шаги правого вращения </p>

Как показано на рисунке 7-27, когда у узла `child` есть правый дочерний узел, который мы обозначим как `grand_child` , в правое вращение нужно добавить еще один шаг: сделать `grand_child` левым дочерним узлом `node` .

![Правое вращение при наличии grand_child](avl_tree.assets/avltree_right_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Рисунок 7-27 &nbsp; Правое вращение при наличии grand_child </p>

"Поворот вправо" - это лишь образное описание; в реальности он реализуется через изменение указателей узлов. Код приведен ниже:

=== "Python"

    ```python title="avl_tree.py"
    def right_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Операция правого вращения"""
        child = node.left
        grand_child = child.right
        # Выполнить правое вращение узла node вокруг child
        child.right = node
        node.left = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корневой узел поддерева после вращения
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Операция правого вращения */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Выполнить правое вращение узла node вокруг child
        child->right = node;
        node->left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Операция правого вращения */
    TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Операция правого вращения */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Операция правого вращения */
    func (t *aVLTree) rightRotate(node *TreeNode) *TreeNode {
        child := node.Left
        grandChild := child.Right
        // Выполнить правое вращение узла node вокруг child
        child.Right = node
        node.Left = grandChild
        // Обновить высоту узла
        t.updateHeight(node)
        t.updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Операция правого вращения */
    func rightRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.left
        let grandChild = child?.right
        // Выполнить правое вращение узла node вокруг child
        child?.right = node
        node?.left = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Операция правого вращения */
    #rightRotate(node) {
        const child = node.left;
        const grandChild = child.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Операция правого вращения */
    rightRotate(node: TreeNode): TreeNode {
        const child = node.left;
        const grandChild = child.right;
        // Выполнить правое вращение узла node вокруг child
        child.right = node;
        node.left = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Операция правого вращения */
    TreeNode? rightRotate(TreeNode? node) {
      TreeNode? child = node!.left;
      TreeNode? grandChild = child!.right;
      // Выполнить правое вращение узла node вокруг child
      child.right = node;
      node.left = grandChild;
      // Обновить высоту узла
      updateHeight(node);
      updateHeight(child);
      // Вернуть корневой узел поддерева после вращения
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Операция правого вращения */
    fn right_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().left.clone().unwrap();
                let grand_child = child.borrow().right.clone();
                // Выполнить правое вращение узла node вокруг child
                child.borrow_mut().right = Some(node.clone());
                node.borrow_mut().left = grand_child;
                // Обновить высоту узла
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Вернуть корневой узел поддерева после вращения
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Операция правого вращения */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->left;
        grandChild = child->right;
        // Выполнить правое вращение узла node вокруг child
        child->right = node;
        node->left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Операция правого вращения */
    fun rightRotate(node: TreeNode?): TreeNode {
        val child = node!!.left
        val grandChild = child!!.right
        // Выполнить правое вращение узла node вокруг child
        child.right = node
        node.left = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end
    ```

### 2. &nbsp; Левое вращение

Соответственно, если рассмотреть "зеркальную" версию приведенного выше разбалансированного двоичного дерева, то понадобится выполнить "левое вращение", показанное на рисунке 7-28.

![Левое вращение](avl_tree.assets/avltree_left_rotate.png){ class="animation-figure" }

<p align="center"> Рисунок 7-28 &nbsp; Левое вращение </p>

По той же причине, когда у узла `child` есть левый дочерний узел, который обозначим как `grand_child` , в левое вращение также требуется добавить шаг: сделать `grand_child` правым дочерним узлом `node` .

![Левое вращение при наличии grand_child](avl_tree.assets/avltree_left_rotate_with_grandchild.png){ class="animation-figure" }

<p align="center"> Рисунок 7-29 &nbsp; Левое вращение при наличии grand_child </p>

Можно заметить, что **операции правого и левого вращения логически зеркально симметричны, и два вида разбаланса, которые они исправляют, тоже симметричны**. Поэтому, опираясь на эту симметрию, достаточно заменить в коде правого вращения все `left` на `right` , а все `right` на `left` , чтобы получить реализацию левого вращения:

=== "Python"

    ```python title="avl_tree.py"
    def left_rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Операция левого вращения"""
        child = node.right
        grand_child = child.left
        # Выполнить левое вращение узла node вокруг child
        child.left = node
        node.right = grand_child
        # Обновить высоту узла
        self.update_height(node)
        self.update_height(child)
        # Вернуть корневой узел поддерева после вращения
        return child
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Операция левого вращения */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Выполнить левое вращение узла node вокруг child
        child->left = node;
        node->right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Операция левого вращения */
    TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Операция левого вращения */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        UpdateHeight(node);
        UpdateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Операция левого вращения */
    func (t *aVLTree) leftRotate(node *TreeNode) *TreeNode {
        child := node.Right
        grandChild := child.Left
        // Выполнить левое вращение узла node вокруг child
        child.Left = node
        node.Right = grandChild
        // Обновить высоту узла
        t.updateHeight(node)
        t.updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Операция левого вращения */
    func leftRotate(node: TreeNode?) -> TreeNode? {
        let child = node?.right
        let grandChild = child?.left
        // Выполнить левое вращение узла node вокруг child
        child?.left = node
        node?.right = grandChild
        // Обновить высоту узла
        updateHeight(node: node)
        updateHeight(node: child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Операция левого вращения */
    #leftRotate(node) {
        const child = node.right;
        const grandChild = child.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        this.#updateHeight(node);
        this.#updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Операция левого вращения */
    leftRotate(node: TreeNode): TreeNode {
        const child = node.right;
        const grandChild = child.left;
        // Выполнить левое вращение узла node вокруг child
        child.left = node;
        node.right = grandChild;
        // Обновить высоту узла
        this.updateHeight(node);
        this.updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Операция левого вращения */
    TreeNode? leftRotate(TreeNode? node) {
      TreeNode? child = node!.right;
      TreeNode? grandChild = child!.left;
      // Выполнить левое вращение узла node вокруг child
      child.left = node;
      node.right = grandChild;
      // Обновить высоту узла
      updateHeight(node);
      updateHeight(child);
      // Вернуть корневой узел поддерева после вращения
      return child;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Операция левого вращения */
    fn left_rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        match node {
            Some(node) => {
                let child = node.borrow().right.clone().unwrap();
                let grand_child = child.borrow().left.clone();
                // Выполнить левое вращение узла node вокруг child
                child.borrow_mut().left = Some(node.clone());
                node.borrow_mut().right = grand_child;
                // Обновить высоту узла
                Self::update_height(Some(node));
                Self::update_height(Some(child.clone()));
                // Вернуть корневой узел поддерева после вращения
                Some(child)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Операция левого вращения */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child, *grandChild;
        child = node->right;
        grandChild = child->left;
        // Выполнить левое вращение узла node вокруг child
        child->left = node;
        node->right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Операция левого вращения */
    fun leftRotate(node: TreeNode?): TreeNode {
        val child = node!!.right
        val grandChild = child!!.left
        // Выполнить левое вращение узла node вокруг child
        child.left = node
        node.right = grandChild
        // Обновить высоту узла
        updateHeight(node)
        updateHeight(child)
        // Вернуть корневой узел поддерева после вращения
        return child
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end
    ```

### 3. &nbsp; Сначала левое, затем правое вращение

Для разбалансированного узла 3 на рисунке 7-30 ни одно лишь левое вращение, ни одно лишь правое вращение не способны вернуть поддерево в баланс. В этом случае нужно сначала выполнить "левое вращение" для `child` , а затем выполнить "правое вращение" для `node` .

![Сначала левое, затем правое вращение](avl_tree.assets/avltree_left_right_rotate.png){ class="animation-figure" }

<p align="center"> Рисунок 7-30 &nbsp; Сначала левое, затем правое вращение </p>

### 4. &nbsp; Сначала правое, затем левое вращение

Как показано на рисунке 7-31, для зеркальной ситуации предыдущего разбалансированного двоичного дерева нужно сначала выполнить "правое вращение" для `child` , а затем "левое вращение" для `node` .

![Сначала правое, затем левое вращение](avl_tree.assets/avltree_right_left_rotate.png){ class="animation-figure" }

<p align="center"> Рисунок 7-31 &nbsp; Сначала правое, затем левое вращение </p>

### 5. &nbsp; Выбор вращения

Четыре вида разбаланса, показанные на рисунке 7-32, по одному соответствуют рассмотренным выше случаям; для них соответственно требуются правое вращение, сначала левое затем правое, сначала правое затем левое и левое вращение.

![Четыре случая вращений AVL-дерева](avl_tree.assets/avltree_rotation_cases.png){ class="animation-figure" }

<p align="center"> Рисунок 7-32 &nbsp; Четыре случая вращений AVL-дерева </p>

Как показано в таблице 7-3, мы определяем, какому из этих четырех случаев соответствует разбалансированный узел, по знаку баланс-фактора самого разбалансированного узла и по знаку баланс-фактора дочернего узла на более высокой стороне.

<p align="center"> Таблица 7-3 &nbsp; Условия выбора для четырех случаев вращений </p>

<div class="center-table" markdown>

| Баланс-фактор разбалансированного узла | Баланс-фактор дочернего узла | Какое вращение использовать |
| -------------------------------------- | ---------------------------- | --------------------------- |
| $> 1$ (левостороннее дерево)           | $\geq 0$                     | Правое вращение             |
| $> 1$ (левостороннее дерево)           | $<0$                         | Сначала левое, затем правое |
| $< -1$ (правостороннее дерево)         | $\leq 0$                     | Левое вращение              |
| $< -1$ (правостороннее дерево)         | $>0$                         | Сначала правое, затем левое |

</div>

Для удобства мы инкапсулируем операцию вращения в отдельную функцию. **С помощью этой функции можно выполнить корректное вращение для любой ситуации разбаланса и снова привести узел в сбалансированное состояние**. Код приведен ниже:

=== "Python"

    ```python title="avl_tree.py"
    def rotate(self, node: TreeNode | None) -> TreeNode | None:
        """Выполнить вращение, чтобы снова сбалансировать поддерево"""
        # Получить коэффициент баланса узла node
        balance_factor = self.balance_factor(node)
        # Левосторонне перекошенное дерево
        if balance_factor > 1:
            if self.balance_factor(node.left) >= 0:
                # Правое вращение
                return self.right_rotate(node)
            else:
                # Сначала левое вращение, затем правое
                node.left = self.left_rotate(node.left)
                return self.right_rotate(node)
        # Правосторонне перекошенное дерево
        elif balance_factor < -1:
            if self.balance_factor(node.right) <= 0:
                # Левое вращение
                return self.left_rotate(node)
            else:
                # Сначала правое вращение, затем левое
                node.right = self.right_rotate(node.right)
                return self.left_rotate(node)
        # Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode *rotate(TreeNode *node) {
        // Получить коэффициент баланса узла node
        int _balanceFactor = balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Правое вращение
                return rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Левое вращение
                return leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode rotate(TreeNode node) {
        // Получить коэффициент баланса узла node
        int balanceFactor = balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Правое вращение
                return rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Левое вращение
                return leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode? Rotate(TreeNode? node) {
        // Получить коэффициент баланса узла node
        int balanceFactorInt = BalanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // Правое вращение
                return RightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // Левое вращение
                return LeftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    func (t *aVLTree) rotate(node *TreeNode) *TreeNode {
        // Получить коэффициент баланса узла node
        // В Go рекомендуется использовать короткие имена переменных, здесь bf обозначает t.balanceFactor
        bf := t.balanceFactor(node)
        // Левосторонне перекошенное дерево
        if bf > 1 {
            if t.balanceFactor(node.Left) >= 0 {
                // Правое вращение
                return t.rightRotate(node)
            } else {
                // Сначала левое вращение, затем правое
                node.Left = t.leftRotate(node.Left)
                return t.rightRotate(node)
            }
        }
        // Правосторонне перекошенное дерево
        if bf < -1 {
            if t.balanceFactor(node.Right) <= 0 {
                // Левое вращение
                return t.leftRotate(node)
            } else {
                // Сначала правое вращение, затем левое
                node.Right = t.rightRotate(node.Right)
                return t.leftRotate(node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    func rotate(node: TreeNode?) -> TreeNode? {
        // Получить коэффициент баланса узла node
        let balanceFactor = balanceFactor(node: node)
        // Левосторонне перекошенное дерево
        if balanceFactor > 1 {
            if self.balanceFactor(node: node?.left) >= 0 {
                // Правое вращение
                return rightRotate(node: node)
            } else {
                // Сначала левое вращение, затем правое
                node?.left = leftRotate(node: node?.left)
                return rightRotate(node: node)
            }
        }
        // Правосторонне перекошенное дерево
        if balanceFactor < -1 {
            if self.balanceFactor(node: node?.right) <= 0 {
                // Левое вращение
                return leftRotate(node: node)
            } else {
                // Сначала правое вращение, затем левое
                node?.right = rightRotate(node: node?.right)
                return leftRotate(node: node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    #rotate(node) {
        // Получить коэффициент баланса узла node
        const balanceFactor = this.balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Правое вращение
                return this.#rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node.left = this.#leftRotate(node.left);
                return this.#rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Левое вращение
                return this.#leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node.right = this.#rightRotate(node.right);
                return this.#leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        const balanceFactor = this.balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (this.balanceFactor(node.left) >= 0) {
                // Правое вращение
                return this.rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node.left = this.leftRotate(node.left);
                return this.rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (this.balanceFactor(node.right) <= 0) {
                // Левое вращение
                return this.leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node.right = this.rightRotate(node.right);
                return this.leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode? rotate(TreeNode? node) {
      // Получить коэффициент баланса узла node
      int factor = balanceFactor(node);
      // Левосторонне перекошенное дерево
      if (factor > 1) {
        if (balanceFactor(node!.left) >= 0) {
          // Правое вращение
          return rightRotate(node);
        } else {
          // Сначала левое вращение, затем правое
          node.left = leftRotate(node.left);
          return rightRotate(node);
        }
      }
      // Правосторонне перекошенное дерево
      if (factor < -1) {
        if (balanceFactor(node!.right) <= 0) {
          // Левое вращение
          return leftRotate(node);
        } else {
          // Сначала правое вращение, затем левое
          node.right = rightRotate(node.right);
          return leftRotate(node);
        }
      }
      // Дерево сбалансировано, вращение не требуется, вернуть сразу
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    fn rotate(node: OptionTreeNodeRc) -> OptionTreeNodeRc {
        // Получить коэффициент баланса узла node
        let balance_factor = Self::balance_factor(node.clone());
        // Левосторонне перекошенное дерево
        if balance_factor > 1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().left.clone()) >= 0 {
                // Правое вращение
                Self::right_rotate(Some(node))
            } else {
                // Сначала левое вращение, затем правое
                let left = node.borrow().left.clone();
                node.borrow_mut().left = Self::left_rotate(left);
                Self::right_rotate(Some(node))
            }
        }
        // Правосторонне перекошенное дерево
        else if balance_factor < -1 {
            let node = node.unwrap();
            if Self::balance_factor(node.borrow().right.clone()) <= 0 {
                // Левое вращение
                Self::left_rotate(Some(node))
            } else {
                // Сначала правое вращение, затем левое
                let right = node.borrow().right.clone();
                node.borrow_mut().right = Self::right_rotate(right);
                Self::left_rotate(Some(node))
            }
        } else {
            // Дерево сбалансировано, вращение не требуется, вернуть сразу
            node
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    TreeNode *rotate(TreeNode *node) {
        // Получить коэффициент баланса узла node
        int bf = balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (bf > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Правое вращение
                return rightRotate(node);
            } else {
                // Сначала левое вращение, затем правое
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (bf < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Левое вращение
                return leftRotate(node);
            } else {
                // Сначала правое вращение, затем левое
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Выполнить вращение, чтобы снова сбалансировать поддерево */
    fun rotate(node: TreeNode): TreeNode {
        // Получить коэффициент баланса узла node
        val balanceFactor = balanceFactor(node)
        // Левосторонне перекошенное дерево
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // Правое вращение
                return rightRotate(node)
            } else {
                // Сначала левое вращение, затем правое
                node.left = leftRotate(node.left)
                return rightRotate(node)
            }
        }
        // Правосторонне перекошенное дерево
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // Левое вращение
                return leftRotate(node)
            } else {
                // Сначала правое вращение, затем левое
                node.right = rightRotate(node.right)
                return leftRotate(node)
            }
        }
        // Дерево сбалансировано, вращение не требуется, вернуть сразу
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
    def rotate(node)
      # Получить коэффициент баланса узла node
      balance_factor = balance_factor(node)
      # Обойти левое поддерево
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Правое вращение
          return right_rotate(node)
        else
          # Сначала левое вращение, затем правое
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Правостороннее дерево обхода
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Левое вращение
          return left_rotate(node)
        else
          # Сначала правое вращение, затем левое
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Дерево сбалансировано, вращение не требуется, вернуть сразу
      node
    end
    ```

## 7.5.3 &nbsp; Распространенные операции AVL-дерева

### 1. &nbsp; Вставка узла

Операция вставки узла в AVL-дерево по основному процессу похожа на вставку в двоичное дерево поиска. Единственная разница состоит в том, что после вставки в AVL-дерево на пути от вставленного узла к корню может появиться цепочка разбалансированных узлов. Поэтому **начиная от этого узла, мы должны выполнять вращения снизу вверх, чтобы вернуть в баланс все разбалансированные узлы**. Код приведен ниже:

=== "Python"

    ```python title="avl_tree.py"
    def insert(self, val):
        """Вставка узла"""
        self._root = self.insert_helper(self._root, val)

    def insert_helper(self, node: TreeNode | None, val: int) -> TreeNode:
        """Рекурсивная вставка узла (вспомогательный метод)"""
        if node is None:
            return TreeNode(val)
        # 1. Найти позицию вставки и вставить узел
        if val < node.val:
            node.left = self.insert_helper(node.left, val)
        elif val > node.val:
            node.right = self.insert_helper(node.right, val)
        else:
            # Повторяющийся узел не вставлять, сразу вернуть
            return node
        # Обновить высоту узла
        self.update_height(node)
        # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Вставка узла */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Повторяющийся узел не вставлять, сразу вернуть
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Вставка узла */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // Повторяющийся узел не вставлять, сразу вернуть
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Вставка узла */
    void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // Повторяющийся узел не вставлять, сразу вернуть
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Вставка узла */
    func (t *aVLTree) insert(val int) {
        t.root = t.insertHelper(t.root, val)
    }

    /* Рекурсивная вставка узла (вспомогательная функция) */
    func (t *aVLTree) insertHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return NewTreeNode(val)
        }
        /* 1. Найти позицию вставки и вставить узел */
        if val < node.Val.(int) {
            node.Left = t.insertHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.insertHelper(node.Right, val)
        } else {
            // Повторяющийся узел не вставлять, сразу вернуть
            return node
        }
        // Обновить высоту узла
        t.updateHeight(node)
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = t.rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Вставка узла */
    func insert(val: Int) {
        root = insertHelper(node: root, val: val)
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    func insertHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return TreeNode(x: val)
        }
        /* 1. Найти позицию вставки и вставить узел */
        if val < node!.val {
            node?.left = insertHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = insertHelper(node: node?.right, val: val)
        } else {
            return node // Повторяющийся узел не вставлять, сразу вернуть
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Вставка узла */
    insert(val) {
        this.root = this.#insertHelper(this.root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    #insertHelper(node, val) {
        if (node === null) return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val) node.left = this.#insertHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#insertHelper(node.right, val);
        else return node; // Повторяющийся узел не вставлять, сразу вернуть
        this.#updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.#rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Вставка узла */
    insert(val: number): void {
        this.root = this.insertHelper(this.root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    insertHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node.val) {
            node.left = this.insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.insertHelper(node.right, val);
        } else {
            return node; // Повторяющийся узел не вставлять, сразу вернуть
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Вставка узла */
    void insert(int val) {
      root = insertHelper(root, val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    TreeNode? insertHelper(TreeNode? node, int val) {
      if (node == null) return TreeNode(val);
      /* 1. Найти позицию вставки и вставить узел */
      if (val < node.val)
        node.left = insertHelper(node.left, val);
      else if (val > node.val)
        node.right = insertHelper(node.right, val);
      else
        return node; // Повторяющийся узел не вставлять, сразу вернуть
      updateHeight(node); // Обновить высоту узла
      /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
      node = rotate(node);
      // Вернуть корневой узел поддерева
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Вставка узла */
    fn insert(&mut self, val: i32) {
        self.root = Self::insert_helper(self.root.clone(), val);
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    fn insert_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Найти позицию вставки и вставить узел */
                match {
                    let node_val = node.borrow().val;
                    node_val
                }
                .cmp(&val)
                {
                    Ordering::Greater => {
                        let left = node.borrow().left.clone();
                        node.borrow_mut().left = Self::insert_helper(left, val);
                    }
                    Ordering::Less => {
                        let right = node.borrow().right.clone();
                        node.borrow_mut().right = Self::insert_helper(right, val);
                    }
                    Ordering::Equal => {
                        return Some(node); // Повторяющийся узел не вставлять, сразу вернуть
                    }
                }
                Self::update_height(Some(node.clone())); // Обновить высоту узла

                /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
                node = Self::rotate(Some(node)).unwrap();
                // Вернуть корневой узел поддерева
                Some(node)
            }
            None => Some(TreeNode::new(val)),
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Вставка узла */
    void insert(AVLTree *tree, int val) {
        tree->root = insertHelper(tree->root, val);
    }

    /* Рекурсивная вставка узла (вспомогательная функция) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == NULL) {
            return newTreeNode(val);
        }
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node->val) {
            node->left = insertHelper(node->left, val);
        } else if (val > node->val) {
            node->right = insertHelper(node->right, val);
        } else {
            // Повторяющийся узел не вставлять, сразу вернуть
            return node;
        }
        // Обновить высоту узла
        updateHeight(node);
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Вставка узла */
    fun insert(_val: Int) {
        root = insertHelper(root, _val)
    }

    /* Рекурсивная вставка узла (вспомогательный метод) */
    fun insertHelper(n: TreeNode?, _val: Int): TreeNode {
        if (n == null)
            return TreeNode(_val)
        var node = n
        /* 1. Найти позицию вставки и вставить узел */
        if (_val < node._val)
            node.left = insertHelper(node.left, _val)
        else if (_val > node._val)
            node.right = insertHelper(node.right, _val)
        else
            return node // Повторяющийся узел не вставлять, сразу вернуть
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
    def rotate(node)
      # Получить коэффициент баланса узла node
      balance_factor = balance_factor(node)
      # Обойти левое поддерево
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Правое вращение
          return right_rotate(node)
        else
          # Сначала левое вращение, затем правое
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Правостороннее дерево обхода
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Левое вращение
          return left_rotate(node)
        else
          # Сначала правое вращение, затем левое
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Дерево сбалансировано, вращение не требуется, вернуть сразу
      node
    end

    # ## Вставка узла ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
    def rotate(node)
      # Получить коэффициент баланса узла node
      balance_factor = balance_factor(node)
      # Обойти левое поддерево
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Правое вращение
          return right_rotate(node)
        else
          # Сначала левое вращение, затем правое
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Правостороннее дерево обхода
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Левое вращение
          return left_rotate(node)
        else
          # Сначала правое вращение, затем левое
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Дерево сбалансировано, вращение не требуется, вернуть сразу
      node
    end

    # ## Вставка узла ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    # ## Рекурсивная вставка узла (вспомогательный метод) ###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. Найти позицию вставки и вставить узел
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # Повторяющийся узел не вставлять, сразу вернуть
        return node
      end
      # Обновить высоту узла
      update_height(node)
      # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
      rotate(node)
    end
    ```

### 2. &nbsp; Удаление узла

Аналогично, на основе метода удаления узла из двоичного дерева поиска нужно добавить вращения снизу вверх, чтобы восстановить баланс всех разбалансированных узлов. Код приведен ниже:

=== "Python"

    ```python title="avl_tree.py"
    def remove(self, val: int):
        """Удаление узла"""
        self._root = self.remove_helper(self._root, val)

    def remove_helper(self, node: TreeNode | None, val: int) -> TreeNode | None:
        """Рекурсивное удаление узла (вспомогательный метод)"""
        if node is None:
            return None
        # 1. Найти узел и удалить его
        if val < node.val:
            node.left = self.remove_helper(node.left, val)
        elif val > node.val:
            node.right = self.remove_helper(node.right, val)
        else:
            if node.left is None or node.right is None:
                child = node.left or node.right
                # Число дочерних узлов = 0, удалить node и сразу вернуть
                if child is None:
                    return None
                # Число дочерних узлов = 1, удалить node напрямую
                else:
                    node = child
            else:
                # Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                temp = node.right
                while temp.left is not None:
                    temp = temp.left
                node.right = self.remove_helper(node.right, temp.val)
                node.val = temp.val
        # Обновить высоту узла
        self.update_height(node)
        # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
        return self.rotate(node)
    ```

=== "C++"

    ```cpp title="avl_tree.cpp"
    /* Удаление узла */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Найти узел и удалить его */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Число дочерних узлов = 1, удалить node напрямую
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Java"

    ```java title="avl_tree.java"
    /* Удаление узла */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null;
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child;
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "C#"

    ```csharp title="avl_tree.cs"
    /* Удаление узла */
    void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null;
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child;
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = Rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Go"

    ```go title="avl_tree.go"
    /* Удаление узла */
    func (t *aVLTree) remove(val int) {
        t.root = t.removeHelper(t.root, val)
    }

    /* Рекурсивное удаление узла (вспомогательная функция) */
    func (t *aVLTree) removeHelper(node *TreeNode, val int) *TreeNode {
        if node == nil {
            return nil
        }
        /* 1. Найти узел и удалить его */
        if val < node.Val.(int) {
            node.Left = t.removeHelper(node.Left, val)
        } else if val > node.Val.(int) {
            node.Right = t.removeHelper(node.Right, val)
        } else {
            if node.Left == nil || node.Right == nil {
                child := node.Left
                if node.Right != nil {
                    child = node.Right
                }
                if child == nil {
                    // Число дочерних узлов = 0, удалить node и сразу вернуть
                    return nil
                } else {
                    // Число дочерних узлов = 1, удалить node напрямую
                    node = child
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                temp := node.Right
                for temp.Left != nil {
                    temp = temp.Left
                }
                node.Right = t.removeHelper(node.Right, temp.Val.(int))
                node.Val = temp.Val
            }
        }
        // Обновить высоту узла
        t.updateHeight(node)
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = t.rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "Swift"

    ```swift title="avl_tree.swift"
    /* Удаление узла */
    func remove(val: Int) {
        root = removeHelper(node: root, val: val)
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    func removeHelper(node: TreeNode?, val: Int) -> TreeNode? {
        var node = node
        if node == nil {
            return nil
        }
        /* 1. Найти узел и удалить его */
        if val < node!.val {
            node?.left = removeHelper(node: node?.left, val: val)
        } else if val > node!.val {
            node?.right = removeHelper(node: node?.right, val: val)
        } else {
            if node?.left == nil || node?.right == nil {
                let child = node?.left ?? node?.right
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if child == nil {
                    return nil
                }
                // Число дочерних узлов = 1, удалить node напрямую
                else {
                    node = child
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                var temp = node?.right
                while temp?.left != nil {
                    temp = temp?.left
                }
                node?.right = removeHelper(node: node?.right, val: temp!.val)
                node?.val = temp!.val
            }
        }
        updateHeight(node: node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node: node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "JS"

    ```javascript title="avl_tree.js"
    /* Удаление узла */
    remove(val) {
        this.root = this.#removeHelper(this.root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    #removeHelper(node, val) {
        if (node === null) return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val) node.left = this.#removeHelper(node.left, val);
        else if (val > node.val)
            node.right = this.#removeHelper(node.right, val);
        else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child === null) return null;
                // Число дочерних узлов = 1, удалить node напрямую
                else node = child;
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.#removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.#updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.#rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "TS"

    ```typescript title="avl_tree.ts"
    /* Удаление узла */
    remove(val: number): void {
        this.root = this.removeHelper(this.root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    removeHelper(node: TreeNode, val: number): TreeNode {
        if (node === null) return null;
        /* 1. Найти узел и удалить его */
        if (val < node.val) {
            node.left = this.removeHelper(node.left, val);
        } else if (val > node.val) {
            node.right = this.removeHelper(node.right, val);
        } else {
            if (node.left === null || node.right === null) {
                const child = node.left !== null ? node.left : node.right;
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child === null) {
                    return null;
                } else {
                    // Число дочерних узлов = 1, удалить node напрямую
                    node = child;
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                let temp = node.right;
                while (temp.left !== null) {
                    temp = temp.left;
                }
                node.right = this.removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        this.updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = this.rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Dart"

    ```dart title="avl_tree.dart"
    /* Удаление узла */
    void remove(int val) {
      root = removeHelper(root, val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    TreeNode? removeHelper(TreeNode? node, int val) {
      if (node == null) return null;
      /* 1. Найти узел и удалить его */
      if (val < node.val)
        node.left = removeHelper(node.left, val);
      else if (val > node.val)
        node.right = removeHelper(node.right, val);
      else {
        if (node.left == null || node.right == null) {
          TreeNode? child = node.left ?? node.right;
          // Число дочерних узлов = 0, удалить node и сразу вернуть
          if (child == null)
            return null;
          // Число дочерних узлов = 1, удалить node напрямую
          else
            node = child;
        } else {
          // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
          TreeNode? temp = node.right;
          while (temp!.left != null) {
            temp = temp.left;
          }
          node.right = removeHelper(node.right, temp.val);
          node.val = temp.val;
        }
      }
      updateHeight(node); // Обновить высоту узла
      /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
      node = rotate(node);
      // Вернуть корневой узел поддерева
      return node;
    }
    ```

=== "Rust"

    ```rust title="avl_tree.rs"
    /* Удаление узла */
    fn remove(&self, val: i32) {
        Self::remove_helper(self.root.clone(), val);
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    fn remove_helper(node: OptionTreeNodeRc, val: i32) -> OptionTreeNodeRc {
        match node {
            Some(mut node) => {
                /* 1. Найти узел и удалить его */
                if val < node.borrow().val {
                    let left = node.borrow().left.clone();
                    node.borrow_mut().left = Self::remove_helper(left, val);
                } else if val > node.borrow().val {
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, val);
                } else if node.borrow().left.is_none() || node.borrow().right.is_none() {
                    let child = if node.borrow().left.is_some() {
                        node.borrow().left.clone()
                    } else {
                        node.borrow().right.clone()
                    };
                    match child {
                        // Число дочерних узлов = 0, удалить node и сразу вернуть
                        None => {
                            return None;
                        }
                        // Число дочерних узлов = 1, удалить node напрямую
                        Some(child) => node = child,
                    }
                } else {
                    // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                    let mut temp = node.borrow().right.clone().unwrap();
                    loop {
                        let temp_left = temp.borrow().left.clone();
                        if temp_left.is_none() {
                            break;
                        }
                        temp = temp_left.unwrap();
                    }
                    let right = node.borrow().right.clone();
                    node.borrow_mut().right = Self::remove_helper(right, temp.borrow().val);
                    node.borrow_mut().val = temp.borrow().val;
                }
                Self::update_height(Some(node.clone())); // Обновить высоту узла

                /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
                node = Self::rotate(Some(node)).unwrap();
                // Вернуть корневой узел поддерева
                Some(node)
            }
            None => None,
        }
    }
    ```

=== "C"

    ```c title="avl_tree.c"
    /* Удаление узла */
    // Из-за подключения stdio.h здесь нельзя использовать ключевое слово remove
    void removeItem(AVLTree *tree, int val) {
        TreeNode *root = removeHelper(tree->root, val);
    }

    /* Рекурсивное удаление узла (вспомогательная функция) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        TreeNode *child, *grandChild;
        if (node == NULL) {
            return NULL;
        }
        /* 1. Найти узел и удалить его */
        if (val < node->val) {
            node->left = removeHelper(node->left, val);
        } else if (val > node->val) {
            node->right = removeHelper(node->right, val);
        } else {
            if (node->left == NULL || node->right == NULL) {
                child = node->left;
                if (node->right != NULL) {
                    child = node->right;
                }
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == NULL) {
                    return NULL;
                } else {
                    // Число дочерних узлов = 1, удалить node напрямую
                    node = child;
                }
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                TreeNode *temp = node->right;
                while (temp->left != NULL) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        // Обновить высоту узла
        updateHeight(node);
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title="avl_tree.kt"
    /* Удаление узла */
    fun remove(_val: Int) {
        root = removeHelper(root, _val)
    }

    /* Рекурсивное удаление узла (вспомогательный метод) */
    fun removeHelper(n: TreeNode?, _val: Int): TreeNode? {
        var node = n ?: return null
        /* 1. Найти узел и удалить его */
        if (_val < node._val)
            node.left = removeHelper(node.left, _val)
        else if (_val > node._val)
            node.right = removeHelper(node.right, _val)
        else {
            if (node.left == null || node.right == null) {
                val child = if (node.left != null)
                    node.left
                else
                    node.right
                // Число дочерних узлов = 0, удалить node и сразу вернуть
                if (child == null)
                    return null
                // Число дочерних узлов = 1, удалить node напрямую
                else
                    node = child
            } else {
                // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
                var temp = node.right
                while (temp!!.left != null) {
                    temp = temp.left
                }
                node.right = removeHelper(node.right, temp._val)
                node._val = temp._val
            }
        }
        updateHeight(node) // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
        node = rotate(node)
        // Вернуть корневой узел поддерева
        return node
    }
    ```

=== "Ruby"

    ```ruby title="avl_tree.rb"
  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
    def rotate(node)
      # Получить коэффициент баланса узла node
      balance_factor = balance_factor(node)
      # Обойти левое поддерево
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Правое вращение
          return right_rotate(node)
        else
          # Сначала левое вращение, затем правое
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Правостороннее дерево обхода
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Левое вращение
          return left_rotate(node)
        else
          # Сначала правое вращение, затем левое
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Дерево сбалансировано, вращение не требуется, вернуть сразу
      node
    end

    # ## Вставка узла ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    # ## Рекурсивная вставка узла (вспомогательный метод) ###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. Найти позицию вставки и вставить узел
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # Повторяющийся узел не вставлять, сразу вернуть
        return node
      end
      # Обновить высоту узла
      update_height(node)
      # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
      rotate(node)
    end

    # ## Удаление узла ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

  =begin
  File: avl_tree.rb
  Created Time: 2024-04-17
  Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
  =end

  require_relative '../utils/tree_node'
  require_relative '../utils/print_util'

  # ## AVL-дерево ###
  class AVLTree
    # ## Конструктор ###
    def initialize
      @root = nil
    end

    # ## Получение корневого узла двоичного дерева ###
    def get_root
      @root
    end

    # ## Получить высоту узла ###
    def height(node)
      # Высота пустого узла равна -1, высота листового узла равна 0
      return node.height unless node.nil?

      -1
    end

    # ## Обновить высоту узла ###
    def update_height(node)
      # Высота узла равна высоте более высокого поддерева + 1
      node.height = [height(node.left), height(node.right)].max + 1
    end

    # ## Получить коэффициент баланса ###
    def balance_factor(node)
      # Коэффициент баланса пустого узла равен 0
      return 0 if node.nil?

      # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
      height(node.left) - height(node.right)
    end

    # ## Операция правого вращения ###
    def right_rotate(node)
      child = node.left
      grand_child = child.right
      # Выполнить правое вращение узла node вокруг child
      child.right = node
      node.left = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Операция левого вращения ###
    def left_rotate(node)
      child = node.right
      grand_child = child.left
      # Выполнить левое вращение узла node вокруг child
      child.left = node
      node.right = grand_child
      # Обновить высоту узла
      update_height(node)
      update_height(child)
      # Вернуть корневой узел поддерева после вращения
      child
    end

    # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
    def rotate(node)
      # Получить коэффициент баланса узла node
      balance_factor = balance_factor(node)
      # Обойти левое поддерево
      if balance_factor > 1
        if balance_factor(node.left) >= 0
          # Правое вращение
          return right_rotate(node)
        else
          # Сначала левое вращение, затем правое
          node.left = left_rotate(node.left)
          return right_rotate(node)
        end
      # Правостороннее дерево обхода
      elsif balance_factor < -1
        if balance_factor(node.right) <= 0
          # Левое вращение
          return left_rotate(node)
        else
          # Сначала правое вращение, затем левое
          node.right = right_rotate(node.right)
          return left_rotate(node)
        end
      end
      # Дерево сбалансировано, вращение не требуется, вернуть сразу
      node
    end

    # ## Вставка узла ###
    def insert(val)
      @root = insert_helper(@root, val)
    end

    # ## Рекурсивная вставка узла (вспомогательный метод) ###
    def insert_helper(node, val)
      return TreeNode.new(val) if node.nil?
      # 1. Найти позицию вставки и вставить узел
      if val < node.val
        node.left = insert_helper(node.left, val)
      elsif val > node.val
        node.right = insert_helper(node.right, val)
      else
        # Повторяющийся узел не вставлять, сразу вернуть
        return node
      end
      # Обновить высоту узла
      update_height(node)
      # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
      rotate(node)
    end

    # ## Удаление узла ###
    def remove(val)
      @root = remove_helper(@root, val)
    end

    # ## Рекурсивное удаление узла (вспомогательный метод) ###
    def remove_helper(node, val)
      return if node.nil?
      # 1. Найти узел и удалить его
      if val < node.val
        node.left = remove_helper(node.left, val)
      elsif val > node.val
        node.right = remove_helper(node.right, val)
      else
        if node.left.nil? || node.right.nil?
          child = node.left || node.right
          # Число дочерних узлов = 0, удалить node и сразу вернуть
          return if child.nil?
          # Число дочерних узлов = 1, удалить node напрямую
          node = child
        else
          # Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
          temp = node.right
          while !temp.left.nil?
            temp = temp.left
          end
          node.right = remove_helper(node.right, temp.val)
          node.val = temp.val
        end
      end
      # Обновить высоту узла
      update_height(node)
      # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
      rotate(node)
    end
    ```

### 3. &nbsp; Поиск узла

Операция поиска узла в AVL-дереве совпадает с поиском в двоичном дереве поиска, поэтому здесь она повторно не рассматривается.

## 7.5.4 &nbsp; Типичные применения AVL-дерева

- Организация и хранение больших массивов данных, особенно в сценариях с частым поиском и относительно редкими вставками и удалениями.
- Использование при построении индексных систем в базах данных.
- Красно-черное дерево тоже является распространенным видом сбалансированного двоичного дерева поиска. По сравнению с AVL-деревом условия баланса у красно-черного дерева мягче, поэтому при вставке и удалении требуется меньше вращений, а средняя эффективность операций добавления и удаления выше.
