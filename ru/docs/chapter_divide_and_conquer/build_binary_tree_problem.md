---
comments: true
---

# 12.3 &nbsp; Задача построения двоичного дерева

!!! question

    Даны прямой обход `preorder` и симметричный обход `inorder` некоторого двоичного дерева. Постройте по ним двоичное дерево и верните его корневой узел. Предполагается, что в дереве нет узлов с одинаковыми значениями (как показано на рисунке 12-5).

![Пример данных для построения двоичного дерева](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> Рисунок 12-5 &nbsp; Пример данных для построения двоичного дерева </p>

### 1. &nbsp; Проверка, является ли это задачей divide and conquer

Исходная задача - построить двоичное дерево по `preorder` и `inorder` - является типичной задачей divide and conquer.

- **Задача раскладывается на части**: если смотреть с точки зрения divide and conquer, исходную задачу можно разбить на две подзадачи: построение левого поддерева и построение правого поддерева, плюс одно действие: инициализация корневого узла. Для каждого поддерева (подзадачи) можно использовать тот же способ разбиения, пока не будет достигнута наименьшая подзадача (пустое поддерево).
- **Подзадачи независимы**: левое и правое поддеревья независимы друг от друга и не пересекаются. При построении левого поддерева нам нужно смотреть только на ту часть прямого и симметричного обходов, которая соответствует левому поддереву. Для правого поддерева рассуждение аналогично.
- **Решения подзадач можно объединить**: когда левое и правое поддеревья (решения подзадач) уже построены, их можно присоединить к корневому узлу и тем самым получить решение исходной задачи.

### 2. &nbsp; Как разделить поддеревья

Из анализа выше видно, что эта задача действительно решается через divide and conquer, **но как именно, имея прямой обход `preorder` и симметричный обход `inorder`, разделить левое и правое поддеревья**?

По определению и `preorder` , и `inorder` можно разбить на три части.

- Прямой обход: `[ корневой узел | левое поддерево | правое поддерево ]` , например для дерева на рисунке 12-5 это `[ 3 | 9 | 2 1 7 ]` .
- Симметричный обход: `[ левое поддерево | корневой узел | правое поддерево ]` , например для дерева на рисунке 12-5 это `[ 9 | 3 | 1 2 7 ]` .

На примере данных с рисунка можно получить результат разбиения по следующим шагам.

1. Первый элемент прямого обхода, равный 3, является значением корневого узла.
2. Найти индекс корневого узла 3 в `inorder` ; используя этот индекс, можно разбить `inorder` на `[ 9 | 3 | 1 2 7 ]` .
3. По результату разбиения `inorder` нетрудно определить, что число узлов в левом и правом поддеревьях равно 1 и 3 соответственно, а значит, `preorder` можно разбить как `[ 3 | 9 | 2 1 7 ]` .

![Разбиение поддеревьев в прямом и симметричном обходах](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> Рисунок 12-6 &nbsp; Разбиение поддеревьев в прямом и симметричном обходах </p>

### 3. &nbsp; Описание интервалов поддеревьев через переменные

Согласно описанному выше способу разбиения, **мы уже получили интервалы индексов корневого узла, левого и правого поддеревьев в `preorder` и `inorder`**. Чтобы описывать эти интервалы, нам понадобится несколько указателей-переменных.

- Обозначим индекс корневого узла текущего дерева в `preorder` через $i$ .
- Обозначим индекс корневого узла текущего дерева в `inorder` через $m$ .
- Обозначим интервал индексов текущего дерева в `inorder` через $[l, r]$ .

Как показано в таблице 12-1, этих переменных достаточно для описания индекса корневого узла в `preorder` и интервалов поддеревьев в `inorder` .

<p align="center"> Таблица 12-1 &nbsp; Индексы корневого узла и поддеревьев в прямом и симметричном обходах </p>

<div class="center-table" markdown>

|                  | Индекс корневого узла в `preorder` | Интервал индексов поддерева в `inorder` |
| ---------------- | ---------------------------------- | ---------------------------------------- |
| Текущее дерево   | $i$                                | $[l, r]$                                 |
| Левое поддерево  | $i + 1$                            | $[l, m-1]$                               |
| Правое поддерево | $i + 1 + (m - l)$                  | $[m+1, r]$                               |

</div>

Обратите внимание, что $(m-l)$ в индексе корневого узла правого поддерева означает "число узлов в левом поддереве"; лучше всего понимать это выражение вместе с рисунком ниже.

![Представление индексных интервалов корня и поддеревьев](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> Рисунок 12-7 &nbsp; Представление индексных интервалов корня и поддеревьев </p>

### 4. &nbsp; Реализация кода

Чтобы ускорить поиск $m$ , мы используем хеш-таблицу `hmap` для хранения отображения значений массива `inorder` в индексы:

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """Построить двоичное дерево: разделяй и властвуй"""
        # Завершить при пустом диапазоне поддерева
        if r - l < 0:
            return None
        # Инициализировать корневой узел
        root = TreeNode(preorder[i])
        # Найти m, чтобы разделить левое и правое поддеревья
        m = inorder_map[preorder[i]]
        # Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # Вернуть корневой узел
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """Построить двоичное дерево"""
        # Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return NULL;
        // Инициализировать корневой узел
        TreeNode *root = new TreeNode(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap[preorder[i]];
        // Подзадача: построить левое поддерево
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        unordered_map<int, int> inorderMap;
        for (int i = 0; i < inorder.size(); i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
        return root;
    }
    ```

=== "Java"

    ```java title="build_tree.java"
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return null;
        // Инициализировать корневой узел
        TreeNode root = new TreeNode(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap.get(preorder[i]);
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        Map<Integer, Integer> inorderMap = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        TreeNode root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "C#"

    ```csharp title="build_tree.cs"
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return null;
        // Инициализировать корневой узел
        TreeNode root = new(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap[preorder[i]];
        // Подзадача: построить левое поддерево
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        Dictionary<int, int> inorderMap = [];
        for (int i = 0; i < inorder.Length; i++) {
            inorderMap.TryAdd(inorder[i], i);
        }
        TreeNode? root = DFS(preorder, inorderMap, 0, 0, inorder.Length - 1);
        return root;
    }
    ```

=== "Go"

    ```go title="build_tree.go"
    /* Построить двоичное дерево: разделяй и властвуй */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // Завершить при пустом диапазоне поддерева
        if r-l < 0 {
            return nil
        }
        // Инициализировать корневой узел
        root := NewTreeNode(preorder[i])
        // Найти m, чтобы разделить левое и правое поддеревья
        m := inorderMap[preorder[i]]
        // Подзадача: построить левое поддерево
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // Подзадача: построить правое поддерево
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // Вернуть корневой узел
        return root
    }

    /* Построить двоичное дерево */
    func buildTree(preorder, inorder []int) *TreeNode {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        inorderMap := make(map[int]int, len(inorder))
        for i := 0; i < len(inorder); i++ {
            inorderMap[inorder[i]] = i
        }

        root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
        return root
    }
    ```

=== "Swift"

    ```swift title="build_tree.swift"
    /* Построить двоичное дерево: разделяй и властвуй */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // Завершить при пустом диапазоне поддерева
        if r - l < 0 {
            return nil
        }
        // Инициализировать корневой узел
        let root = TreeNode(x: preorder[i])
        // Найти m, чтобы разделить левое и правое поддеревья
        let m = inorderMap[preorder[i]]!
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // Вернуть корневой узел
        return root
    }

    /* Построить двоичное дерево */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* Построить двоичное дерево: разделяй и властвуй */
    function dfs(preorder, inorderMap, i, l, r) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0) return null;
        // Инициализировать корневой узел
        const root = new TreeNode(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        const m = inorderMap.get(preorder[i]);
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    function buildTree(preorder, inorder) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        let inorderMap = new Map();
        for (let i = 0; i < inorder.length; i++) {
            inorderMap.set(inorder[i], i);
        }
        const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "TS"

    ```typescript title="build_tree.ts"
    /* Построить двоичное дерево: разделяй и властвуй */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0) return null;
        // Инициализировать корневой узел
        const root: TreeNode = new TreeNode(preorder[i]);
        // Найти m, чтобы разделить левое и правое поддеревья
        const m = inorderMap.get(preorder[i]);
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        let inorderMap = new Map<number, number>();
        for (let i = 0; i < inorder.length; i++) {
            inorderMap.set(inorder[i], i);
        }
        const root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
        return root;
    }
    ```

=== "Dart"

    ```dart title="build_tree.dart"
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // Завершить при пустом диапазоне поддерева
      if (r - l < 0) {
        return null;
      }
      // Инициализировать корневой узел
      TreeNode? root = TreeNode(preorder[i]);
      // Найти m, чтобы разделить левое и правое поддеревья
      int m = inorderMap[preorder[i]]!;
      // Подзадача: построить левое поддерево
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // Подзадача: построить правое поддерево
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // Вернуть корневой узел
      return root;
    }

    /* Построить двоичное дерево */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
      Map<int, int> inorderMap = {};
      for (int i = 0; i < inorder.length; i++) {
        inorderMap[inorder[i]] = i;
      }
      TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
      return root;
    }
    ```

=== "Rust"

    ```rust title="build_tree.rs"
    /* Построить двоичное дерево: разделяй и властвуй */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // Завершить при пустом диапазоне поддерева
        if r - l < 0 {
            return None;
        }
        // Инициализировать корневой узел
        let root = TreeNode::new(preorder[i as usize]);
        // Найти m, чтобы разделить левое и правое поддеревья
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // Подзадача: построить левое поддерево
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // Подзадача: построить правое поддерево
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // Вернуть корневой узел
        Some(root)
    }

    /* Построить двоичное дерево */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        let mut inorder_map: HashMap<i32, i32> = HashMap::new();
        for i in 0..inorder.len() {
            inorder_map.insert(inorder[i], i as i32);
        }
        let root = dfs(preorder, &inorder_map, 0, 0, inorder.len() as i32 - 1);
        root
    }
    ```

=== "C"

    ```c title="build_tree.c"
    /* Построить двоичное дерево: разделяй и властвуй */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0)
            return NULL;
        // Инициализировать корневой узел
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // Найти m, чтобы разделить левое и правое поддеревья
        int m = inorderMap[preorder[i]];
        // Подзадача: построить левое поддерево
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // Подзадача: построить правое поддерево
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // Вернуть корневой узел
        return root;
    }

    /* Построить двоичное дерево */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
        for (int i = 0; i < inorderSize; i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
        free(inorderMap);
        return root;
    }
    ```

=== "Kotlin"

    ```kotlin title="build_tree.kt"
    /* Построить двоичное дерево: разделяй и властвуй */
    fun dfs(
        preorder: IntArray,
        inorderMap: Map<Int?, Int?>,
        i: Int,
        l: Int,
        r: Int
    ): TreeNode? {
        // Завершить при пустом диапазоне поддерева
        if (r - l < 0) return null
        // Инициализировать корневой узел
        val root = TreeNode(preorder[i])
        // Найти m, чтобы разделить левое и правое поддеревья
        val m = inorderMap[preorder[i]]!!
        // Подзадача: построить левое поддерево
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
        // Подзадача: построить правое поддерево
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
        // Вернуть корневой узел
        return root
    }

    /* Построить двоичное дерево */
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
        val inorderMap = HashMap<Int?, Int?>()
        for (i in inorder.indices) {
            inorderMap[inorder[i]] = i
        }
        val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
        return root
    }
    ```

=== "Ruby"

    ```ruby title="build_tree.rb"
    =begin
    File: build_tree.rb
    Created Time: 2024-05-13
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Построить двоичное дерево: разделяй и властвуй ###
    def dfs(preorder, inorder_map, i, l, r)
      # Завершить при пустом диапазоне поддерева
      return if r - l < 0

      # Инициализировать корневой узел
      root = TreeNode.new(preorder[i])
      # Найти m, чтобы разделить левое и правое поддеревья
      m = inorder_map[preorder[i]]
      # Подзадача: построить левое поддерево
      root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
      # Подзадача: построить правое поддерево
      root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

      # Вернуть корневой узел
      root
    end

    =begin
    File: build_tree.rb
    Created Time: 2024-05-13
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Построить двоичное дерево: разделяй и властвуй ###
    def dfs(preorder, inorder_map, i, l, r)
      # Завершить при пустом диапазоне поддерева
      return if r - l < 0

      # Инициализировать корневой узел
      root = TreeNode.new(preorder[i])
      # Найти m, чтобы разделить левое и правое поддеревья
      m = inorder_map[preorder[i]]
      # Подзадача: построить левое поддерево
      root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
      # Подзадача: построить правое поддерево
      root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

      # Вернуть корневой узел
      root
    end

    # ## Построить двоичное дерево ###
    def build_tree(preorder, inorder)
      # Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
      inorder_map = {}
      inorder.each_with_index { |val, i| inorder_map[val] = i }
      dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D%2C%0A%20%20%20%20inorder_map%3A%20dict%5Bint%2C%20int%5D%2C%0A%20%20%20%20i%3A%20int%2C%0A%20%20%20%20l%3A%20int%2C%0A%20%20%20%20r%3A%20int%2C%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D1%8F%D0%B9%20%D0%B8%20%D0%B2%D0%BB%D0%B0%D1%81%D1%82%D0%B2%D1%83%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%97%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B8%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%BC%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20m%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%3A%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20root.left%20%3D%20dfs%28preorder%2C%20inorder_map%2C%20i%20%2B%201%2C%20l%2C%20m%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%3A%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20root.right%20%3D%20dfs%28preorder%2C%20inorder_map%2C%20i%20%2B%201%20%2B%20m%20-%20l%2C%20m%20%2B%201%2C%20r%29%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D%2C%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20inorder%20%D0%B8%D1%85%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i%2C%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder%2C%20inorder_map%2C%200%2C%200%2C%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3%2C%209%2C%202%2C%201%2C%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9%2C%203%2C%201%2C%202%2C%207%5D%0A%20%20%20%20print%28f%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder%2C%20inorder%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%D0%97%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BB%D0%B5%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%D0%A1%D1%81%D1%8B%D0%BB%D0%BA%D0%B0%20%D0%BD%D0%B0%20%D0%BF%D1%80%D0%B0%D0%B2%D1%8B%D0%B9%20%D0%B4%D0%BE%D1%87%D0%B5%D1%80%D0%BD%D0%B8%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D%2C%0A%20%20%20%20inorder_map%3A%20dict%5Bint%2C%20int%5D%2C%0A%20%20%20%20i%3A%20int%2C%0A%20%20%20%20l%3A%20int%2C%0A%20%20%20%20r%3A%20int%2C%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%3A%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D1%8F%D0%B9%20%D0%B8%20%D0%B2%D0%BB%D0%B0%D1%81%D1%82%D0%B2%D1%83%D0%B9%22%22%22%0A%20%20%20%20%23%20%D0%97%D0%B0%D0%B2%D0%B5%D1%80%D1%88%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B8%20%D0%BF%D1%83%D1%81%D1%82%D0%BE%D0%BC%20%D0%B4%D0%B8%D0%B0%D0%BF%D0%B0%D0%B7%D0%BE%D0%BD%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%D0%9D%D0%B0%D0%B9%D1%82%D0%B8%20m%2C%20%D1%87%D1%82%D0%BE%D0%B1%D1%8B%20%D1%80%D0%B0%D0%B7%D0%B4%D0%B5%D0%BB%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%B8%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D1%8C%D1%8F%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%3A%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20root.left%20%3D%20dfs%28preorder%2C%20inorder_map%2C%20i%20%2B%201%2C%20l%2C%20m%20-%201%29%0A%20%20%20%20%23%20%D0%9F%D0%BE%D0%B4%D0%B7%D0%B0%D0%B4%D0%B0%D1%87%D0%B0%3A%20%D0%BF%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B5%20%D0%BF%D0%BE%D0%B4%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20%20%20%20root.right%20%3D%20dfs%28preorder%2C%20inorder_map%2C%20i%20%2B%201%20%2B%20m%20-%20l%2C%20m%20%2B%201%2C%20r%29%0A%20%20%20%20%23%20%D0%92%D0%B5%D1%80%D0%BD%D1%83%D1%82%D1%8C%20%D0%BA%D0%BE%D1%80%D0%BD%D0%B5%D0%B2%D0%BE%D0%B9%20%D1%83%D0%B7%D0%B5%D0%BB%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D%2C%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%D0%9F%D0%BE%D1%81%D1%82%D1%80%D0%BE%D0%B8%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%22%22%22%0A%20%20%20%20%23%20%D0%98%D0%BD%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C%20%D1%85%D0%B5%D1%88-%D1%82%D0%B0%D0%B1%D0%BB%D0%B8%D1%86%D1%83%20%D0%B4%D0%BB%D1%8F%20%D1%85%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D1%8F%20%D1%81%D0%BE%D0%BE%D1%82%D0%B2%D0%B5%D1%82%D1%81%D1%82%D0%B2%D0%B8%D1%8F%20%D1%8D%D0%BB%D0%B5%D0%BC%D0%B5%D0%BD%D1%82%D0%BE%D0%B2%20inorder%20%D0%B8%D1%85%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%B0%D0%BC%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i%2C%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder%2C%20inorder_map%2C%200%2C%200%2C%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3%2C%209%2C%202%2C%201%2C%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9%2C%203%2C%201%2C%202%2C%207%5D%0A%20%20%20%20print%28f%22%D0%9F%D1%80%D0%B5%D0%B4%D0%B2%D0%B0%D1%80%D0%B8%D1%82%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder%2C%20inorder%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

На рисунке 12-8 показан рекурсивный процесс построения двоичного дерева: каждый узел создается в фазе "спуска", а каждое ребро (ссылка) формируется в фазе "подъема".

=== "<1>"
    ![Рекурсивный процесс построения двоичного дерева](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

=== "<2>"
    ![built_tree_step2](build_binary_tree_problem.assets/built_tree_step2.png){ class="animation-figure" }

=== "<3>"
    ![built_tree_step3](build_binary_tree_problem.assets/built_tree_step3.png){ class="animation-figure" }

=== "<4>"
    ![built_tree_step4](build_binary_tree_problem.assets/built_tree_step4.png){ class="animation-figure" }

=== "<5>"
    ![built_tree_step5](build_binary_tree_problem.assets/built_tree_step5.png){ class="animation-figure" }

=== "<6>"
    ![built_tree_step6](build_binary_tree_problem.assets/built_tree_step6.png){ class="animation-figure" }

=== "<7>"
    ![built_tree_step7](build_binary_tree_problem.assets/built_tree_step7.png){ class="animation-figure" }

=== "<8>"
    ![built_tree_step8](build_binary_tree_problem.assets/built_tree_step8.png){ class="animation-figure" }

=== "<9>"
    ![built_tree_step9](build_binary_tree_problem.assets/built_tree_step9.png){ class="animation-figure" }

<p align="center"> Рисунок 12-8 &nbsp; Рекурсивный процесс построения двоичного дерева </p>

Результаты разбиения `preorder` и `inorder` внутри каждого рекурсивного вызова показаны на рисунке 12-9.

![Результаты разбиения в каждом рекурсивном вызове](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> Рисунок 12-9 &nbsp; Результаты разбиения в каждом рекурсивном вызове </p>

Пусть число узлов дерева равно $n$ ; инициализация каждого узла (то есть выполнение одного рекурсивного вызова `dfs()` ) занимает $O(1)$ времени. **Следовательно, общая временная сложность равна $O(n)$** .

Хеш-таблица хранит отображение значений `inorder` в индексы, поэтому ее пространственная сложность равна $O(n)$ . В худшем случае, когда двоичное дерево вырождается в связный список, глубина рекурсии достигает $n$ и требует $O(n)$ памяти стека. **Следовательно, общая пространственная сложность также равна $O(n)$** .
