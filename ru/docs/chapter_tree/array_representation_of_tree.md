---
comments: true
---

# 7.3 &nbsp; Представление двоичного дерева в виде массива

В связном представлении двоичного дерева данные хранятся в узлах `TreeNode`, соединённых указателями. В предыдущем разделе мы рассмотрели основные операции над таким деревом.

Можно ли представить двоичное дерево массивом? Да, можно.

## 7.3.1 &nbsp; Представление совершенного двоичного дерева

Начнём с простого случая. Запишем узлы совершенного двоичного дерева в массив в порядке обхода по уровням. Тогда каждому узлу будет соответствовать свой индекс в массиве.

Порядок обхода по уровням позволяет вывести формулы, связывающие индексы родителя и потомков: **если индекс узла равен $i$, то индекс его левого потомка равен $2i + 1$, а правого — $2i + 2$**. Это соответствие показано на рисунке.

![Представление совершенного двоичного дерева в виде массива](array_representation_of_tree.assets/array_representation_binary_tree.svg){ class="animation-figure" }

<p align="center"> Рисунок 7-12 &nbsp; Представление совершенного двоичного дерева в виде массива </p>

**Эти формулы играют ту же роль, что и ссылки (указатели) на узлы в связном представлении**. Для любого узла массива по формулам можно обратиться к его левому или правому потомку.

## 7.3.2 &nbsp; Представление произвольного двоичного дерева

Совершенное двоичное дерево — частный случай. На промежуточных уровнях двоичного дерева обычно встречается много пустых позиций `None`. Последовательность обхода по уровням не содержит этих `None`, поэтому по ней одной нельзя определить количество и расположение `None`. **Таким образом, одной последовательности обхода могут соответствовать деревья разной структуры**.

На рисунке 7-13 видно, почему описанный способ представления в массиве перестаёт работать, когда дерево не является совершенным.

![Одна последовательность обхода по уровням допускает несколько вариантов двоичного дерева](array_representation_of_tree.assets/array_representation_without_empty.svg){ class="animation-figure" }

<p align="center"> Рисунок 7-13 &nbsp; Одна последовательность обхода по уровням допускает несколько вариантов двоичного дерева </p>

Чтобы решить эту проблему, **явно запишем в последовательность обхода по уровням все пустые позиции `None`**. Теперь последовательность однозначно задаёт двоичное дерево, как показано на рисунке. Далее приведён пример кода:

=== "Python"

    ```python title=""
    # Представление двоичного дерева в виде массива
    # Пустую позицию обозначаем значением None
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем максимальным значением типа int — INT_MAX
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* Представление двоичного дерева в виде массива */
    // Класс-обёртка Integer для типа int позволяет обозначать пустые позиции значением null
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* Представление двоичного дерева в виде массива */
    // Тип int? допускает значение null, которым можно обозначать пустые позиции
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* Представление двоичного дерева в виде массива */
    // Срез с элементами типа any позволяет обозначать пустые позиции значением nil
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* Представление двоичного дерева в виде массива */
    // Тип Int? допускает значение nil, которым можно обозначать пустые позиции
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем значением null
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем значением null
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* Представление двоичного дерева в виде массива */
    // Тип int? допускает значение null, которым можно обозначать пустые позиции
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем значением None
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем максимальным значением типа int, поэтому значение узла не может равняться INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Представление двоичного дерева в виде массива */
    // Пустую позицию обозначаем значением null
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### Представление двоичного дерева в виде массива ###
    # Пустую позицию обозначаем значением nil
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![Представление произвольного двоичного дерева в виде массива](array_representation_of_tree.assets/array_representation_with_empty.svg){ class="animation-figure" }

<p align="center"> Рисунок 7-14 &nbsp; Представление произвольного двоичного дерева в виде массива </p>

Отметим, что **полное двоичное дерево особенно удобно представлять массивом**. По определению полного дерева пустые позиции `None` могут находиться только справа на последнем уровне, **поэтому все `None` окажутся в конце последовательности обхода по уровням**.

Следовательно, при хранении полного двоичного дерева в массиве все `None` можно просто опустить. Пример приведён на рисунке 7-15.

![Представление полного двоичного дерева в виде массива](array_representation_of_tree.assets/array_representation_complete_binary_tree.svg){ class="animation-figure" }

<p align="center"> Рисунок 7-15 &nbsp; Представление полного двоичного дерева в виде массива </p>

В следующем коде реализовано двоичное дерево на основе массива. Оно поддерживает следующие операции.

- Получение значения узла и доступ к его левому или правому потомку и родителю.
- Получение последовательностей прямого, симметричного, обратного и поуровневого обходов.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """Класс двоичного дерева на основе массива"""

        def __init__(self, arr: list[int | None]):
            """Конструктор"""
            self._tree = list(arr)

        def size(self):
            """Ёмкость списка"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """Получить значение узла с индексом i"""
            # Если индекс выходит за границы массива, вернуть None — признак пустой позиции
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """Получить индекс левого потомка узла с индексом i"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """Получить индекс правого потомка узла с индексом i"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """Получить индекс родителя узла с индексом i"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """Обход по уровням"""
            self.res = []
            # Пройти непосредственно по массиву
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """Обход в глубину"""
            if self.val(i) is None:
                return
            # Прямой обход
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # Симметричный обход
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # Обратный обход
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """Прямой обход"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """Симметричный обход"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """Обратный обход"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
      public:
        /* Конструктор */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* Ёмкость списка */
        int size() {
            return tree.size();
        }

        /* Получить значение узла с индексом i */
        int val(int i) {
            // Если индекс выходит за границы массива, вернуть INT_MAX — признак пустой позиции
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* Получить индекс левого потомка узла с индексом i */
        int left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого потомка узла с индексом i */
        int right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родителя узла с индексом i */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход по уровням */
        vector<int> levelOrder() {
            vector<int> res;
            // Пройти непосредственно по массиву
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* Прямой обход */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* Симметричный обход */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* Обратный обход */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* Обход в глубину */
        void dfs(int i, string order, vector<int> &res) {
            // Если позиция пуста, завершить вызов
            if (val(i) == INT_MAX)
                return;
            // Прямой обход
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // Симметричный обход
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // Обратный обход
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* Конструктор */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* Ёмкость списка */
        public int size() {
            return tree.size();
        }

        /* Получить значение узла с индексом i */
        public Integer val(int i) {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* Получить индекс левого потомка узла с индексом i */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого потомка узла с индексом i */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родителя узла с индексом i */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход по уровням */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // Пройти непосредственно по массиву
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* Обход в глубину */
        private void dfs(Integer i, String order, List<Integer> res) {
            // Если позиция пуста, завершить вызов
            if (val(i) == null)
                return;
            // Прямой обход
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // Симметричный обход
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // Обратный обход
            if ("post".equals(order))
                res.add(val(i));
        }

        /* Прямой обход */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* Симметричный обход */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* Обратный обход */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* Ёмкость списка */
        public int Size() {
            return tree.Count;
        }

        /* Получить значение узла с индексом i */
        public int? Val(int i) {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* Получить индекс левого потомка узла с индексом i */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого потомка узла с индексом i */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родителя узла с индексом i */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход по уровням */
        public List<int> LevelOrder() {
            List<int> res = [];
            // Пройти непосредственно по массиву
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* Обход в глубину */
        void DFS(int i, string order, List<int> res) {
            // Если позиция пуста, завершить вызов
            if (!Val(i).HasValue)
                return;
            // Прямой обход
            if (order == "pre")
                res.Add(Val(i)!.Value);
            DFS(Left(i), order, res);
            // Симметричный обход
            if (order == "in")
                res.Add(Val(i)!.Value);
            DFS(Right(i), order, res);
            // Обратный обход
            if (order == "post")
                res.Add(Val(i)!.Value);
        }

        /* Прямой обход */
        public List<int> PreOrder() {
            List<int> res = [];
            DFS(0, "pre", res);
            return res;
        }

        /* Симметричный обход */
        public List<int> InOrder() {
            List<int> res = [];
            DFS(0, "in", res);
            return res;
        }

        /* Обратный обход */
        public List<int> PostOrder() {
            List<int> res = [];
            DFS(0, "post", res);
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    /* Класс двоичного дерева на основе массива */
    type arrayBinaryTree struct {
        tree []any
    }

    /* Конструктор */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* Ёмкость списка */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* Получить значение узла с индексом i */
    func (abt *arrayBinaryTree) val(i int) any {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* Получить индекс левого потомка узла с индексом i */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* Получить индекс правого потомка узла с индексом i */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* Получить индекс родителя узла с индексом i */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* Обход по уровням */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // Пройти непосредственно по массиву
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* Обход в глубину */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // Если позиция пуста, завершить вызов
        if abt.val(i) == nil {
            return
        }
        // Прямой обход
        if order == "pre" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.left(i), order, res)
        // Симметричный обход
        if order == "in" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.right(i), order, res)
        // Обратный обход
        if order == "post" {
            *res = append(*res, abt.val(i))
        }
    }

    /* Прямой обход */
    func (abt *arrayBinaryTree) preOrder() []any {
        var res []any
        abt.dfs(0, "pre", &res)
        return res
    }

    /* Симметричный обход */
    func (abt *arrayBinaryTree) inOrder() []any {
        var res []any
        abt.dfs(0, "in", &res)
        return res
    }

    /* Обратный обход */
    func (abt *arrayBinaryTree) postOrder() []any {
        var res []any
        abt.dfs(0, "post", &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* Конструктор */
        init(arr: [Int?]) {
            tree = arr
        }

        /* Ёмкость списка */
        func size() -> Int {
            tree.count
        }

        /* Получить значение узла с индексом i */
        func val(i: Int) -> Int? {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* Получить индекс левого потомка узла с индексом i */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* Получить индекс правого потомка узла с индексом i */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* Получить индекс родителя узла с индексом i */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* Обход по уровням */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // Пройти непосредственно по массиву
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* Обход в глубину */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // Если позиция пуста, завершить вызов
            guard let val = val(i: i) else {
                return
            }
            // Прямой обход
            if order == "pre" {
                res.append(val)
            }
            dfs(i: left(i: i), order: order, res: &res)
            // Симметричный обход
            if order == "in" {
                res.append(val)
            }
            dfs(i: right(i: i), order: order, res: &res)
            // Обратный обход
            if order == "post" {
                res.append(val)
            }
        }

        /* Прямой обход */
        func preOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "pre", res: &res)
            return res
        }

        /* Симметричный обход */
        func inOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "in", res: &res)
            return res
        }

        /* Обратный обход */
        func postOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "post", res: &res)
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
        #tree;

        /* Конструктор */
        constructor(arr) {
            this.#tree = arr;
        }

        /* Ёмкость списка */
        size() {
            return this.#tree.length;
        }

        /* Получить значение узла с индексом i */
        val(i) {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Получить индекс левого потомка узла с индексом i */
        left(i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого потомка узла с индексом i */
        right(i) {
            return 2 * i + 2;
        }

        /* Получить индекс родителя узла с индексом i */
        parent(i) {
            return Math.floor((i - 1) / 2); // Целочисленное деление с округлением вниз
        }

        /* Обход по уровням */
        levelOrder() {
            let res = [];
            // Пройти непосредственно по массиву
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Обход в глубину */
        #dfs(i, order, res) {
            // Если позиция пуста, завершить вызов
            if (this.val(i) === null) return;
            // Прямой обход
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Симметричный обход
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Обратный обход
            if (order === 'post') res.push(this.val(i));
        }

        /* Прямой обход */
        preOrder() {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* Симметричный обход */
        inOrder() {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* Обратный обход */
        postOrder() {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* Конструктор */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* Ёмкость списка */
        size(): number {
            return this.#tree.length;
        }

        /* Получить значение узла с индексом i */
        val(i: number): number | null {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Получить индекс левого потомка узла с индексом i */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* Получить индекс правого потомка узла с индексом i */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* Получить индекс родителя узла с индексом i */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // Целочисленное деление с округлением вниз
        }

        /* Обход по уровням */
        levelOrder(): number[] {
            let res = [];
            // Пройти непосредственно по массиву
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Обход в глубину */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // Если позиция пуста, завершить вызов
            if (this.val(i) === null) return;
            // Прямой обход
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Симметричный обход
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Обратный обход
            if (order === 'post') res.push(this.val(i));
        }

        /* Прямой обход */
        preOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* Симметричный обход */
        inOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* Обратный обход */
        postOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* Конструктор */
      ArrayBinaryTree(this._tree);

      /* Ёмкость списка */
      int size() {
        return _tree.length;
      }

      /* Получить значение узла с индексом i */
      int? val(int i) {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* Получить индекс левого потомка узла с индексом i */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* Получить индекс правого потомка узла с индексом i */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* Получить индекс родителя узла с индексом i */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* Обход по уровням */
      List<int> levelOrder() {
        List<int> res = [];
        for (int i = 0; i < size(); i++) {
          if (val(i) != null) {
            res.add(val(i)!);
          }
        }
        return res;
      }

      /* Обход в глубину */
      void dfs(int i, String order, List<int?> res) {
        // Если позиция пуста, завершить вызов
        if (val(i) == null) {
          return;
        }
        // Прямой обход
        if (order == 'pre') {
          res.add(val(i));
        }
        dfs(left(i)!, order, res);
        // Симметричный обход
        if (order == 'in') {
          res.add(val(i));
        }
        dfs(right(i)!, order, res);
        // Обратный обход
        if (order == 'post') {
          res.add(val(i));
        }
      }

      /* Прямой обход */
      List<int?> preOrder() {
        List<int?> res = [];
        dfs(0, 'pre', res);
        return res;
      }

      /* Симметричный обход */
      List<int?> inOrder() {
        List<int?> res = [];
        dfs(0, 'in', res);
        return res;
      }

      /* Обратный обход */
      List<int?> postOrder() {
        List<int?> res = [];
        dfs(0, 'post', res);
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    /* Класс двоичного дерева на основе массива */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* Конструктор */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* Ёмкость списка */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* Получить значение узла с индексом i */
        fn val(&self, i: i32) -> Option<i32> {
            // Если индекс выходит за границы массива, вернуть None — признак пустой позиции
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* Получить индекс левого потомка узла с индексом i */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* Получить индекс правого потомка узла с индексом i */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* Получить индекс родителя узла с индексом i */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* Обход по уровням */
        fn level_order(&self) -> Vec<i32> {
            self.tree.iter().filter_map(|&x| x).collect()
        }

        /* Обход в глубину */
        fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // Прямой обход
            if order == "pre" {
                res.push(val);
            }
            self.dfs(self.left(i), order, res);
            // Симметричный обход
            if order == "in" {
                res.push(val);
            }
            self.dfs(self.right(i), order, res);
            // Обратный обход
            if order == "post" {
                res.push(val);
            }
        }

        /* Прямой обход */
        fn pre_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "pre", &mut res);
            res
        }

        /* Симметричный обход */
        fn in_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "in", &mut res);
            res
        }

        /* Обратный обход */
        fn post_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "post", &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="array_binary_tree.c"
    /* Структура двоичного дерева на основе массива */
    typedef struct {
        int *tree;
        int size;
    } ArrayBinaryTree;

    /* Конструктор */
    ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
        ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
        abt->tree = malloc(sizeof(int) * arrSize);
        memcpy(abt->tree, arr, sizeof(int) * arrSize);
        abt->size = arrSize;
        return abt;
    }

    /* Деструктор */
    void delArrayBinaryTree(ArrayBinaryTree *abt) {
        free(abt->tree);
        free(abt);
    }

    /* Ёмкость списка */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* Получить значение узла с индексом i */
    int val(ArrayBinaryTree *abt, int i) {
        // Если индекс выходит за границы массива, вернуть INT_MAX — признак пустой позиции
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* Обход по уровням */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // Пройти непосредственно по массиву
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* Обход в глубину */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // Если позиция пуста, завершить вызов
        if (val(abt, i) == INT_MAX)
            return;
        // Прямой обход
        if (strcmp(order, "pre") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, left(i), order, res, index);
        // Симметричный обход
        if (strcmp(order, "in") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, right(i), order, res, index);
        // Обратный обход
        if (strcmp(order, "post") == 0)
            res[(*index)++] = val(abt, i);
    }

    /* Прямой обход */
    int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "pre", res, &index);
        *returnSize = index;
        return res;
    }

    /* Симметричный обход */
    int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "in", res, &index);
        *returnSize = index;
        return res;
    }

    /* Обратный обход */
    int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "post", res, &index);
        *returnSize = index;
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="array_binary_tree.kt"
    /* Класс двоичного дерева на основе массива */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* Ёмкость списка */
        fun size(): Int {
            return tree.size
        }

        /* Получить значение узла с индексом i */
        fun _val(i: Int): Int? {
            // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* Получить индекс левого потомка узла с индексом i */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Получить индекс правого потомка узла с индексом i */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Получить индекс родителя узла с индексом i */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* Обход по уровням */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // Пройти непосредственно по массиву
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* Обход в глубину */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // Если позиция пуста, завершить вызов
            if (_val(i) == null)
                return
            // Прямой обход
            if ("pre" == order)
                res.add(_val(i))
            dfs(left(i), order, res)
            // Симметричный обход
            if ("in" == order)
                res.add(_val(i))
            dfs(right(i), order, res)
            // Обратный обход
            if ("post" == order)
                res.add(_val(i))
        }

        /* Прямой обход */
        fun preOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "pre", res)
            return res
        }

        /* Симметричный обход */
        fun inOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "in", res)
            return res
        }

        /* Обратный обход */
        fun postOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "post", res)
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    ### Класс двоичного дерева на основе массива ###
    class ArrayBinaryTree
      ### Конструктор ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### Ёмкость списка ###
      def size
        @tree.length
      end

      ### Получить значение узла с индексом i ###
      def val(i)
        # Если индекс выходит за границы массива, вернуть nil — признак пустой позиции
        return if i < 0 || i >= size

        @tree[i]
      end

      ### Получить индекс левого потомка узла с индексом i ###
      def left(i)
        2 * i + 1
      end

      ### Получить индекс правого потомка узла с индексом i ###
      def right(i)
        2 * i + 2
      end

      ### Получить индекс родителя узла с индексом i ###
      def parent(i)
        (i - 1) / 2
      end

      ### Обход по уровням ###
      def level_order
        @res = []

        # Пройти непосредственно по массиву
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      ### Обход в глубину ###
      def dfs(i, order)
        return if val(i).nil?
        # Прямой обход
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # Симметричный обход
        @res << val(i) if order == :in
        dfs(right(i), order)
        # Обратный обход
        @res << val(i) if order == :post
      end

      ### Прямой обход ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### Симметричный обход ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### Обратный обход ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

??? pythontutor "Визуализация выполнения"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Визуализация выполнения" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20def%20__init__%28self,%20val%29%3A%0A%20%20self.val%20%3D%20val%0A%20%20self.left%20%3D%20None%0A%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%0A%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20def%20size%28self%29%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20return%20len%28self._tree%29%0A%0A%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20i%22%22%22%0A%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20return%20None%0A%20%20return%20self._tree%5Bi%5D%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BC%D0%BA%D0%B0%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BC%D0%BA%D0%B0%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%80%D0%BE%D0%B4%D0%B8%D1%82%D0%B5%D0%BB%D1%8F%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BF%D0%BE%20%D1%83%D1%80%D0%BE%D0%B2%D0%BD%D1%8F%D0%BC%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B9%D1%82%D0%B8%20%D0%BD%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BF%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D1%83%0A%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20return%20self.res%0A%0A%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B2%20%D0%B3%D0%BB%D1%83%D0%B1%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20return%0A%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%23%20%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20return%20self.res%0A%0A%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20return%20self.res%0A%0A%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%0A%20i%20%3D%201%0A%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%0A%20res%20%3D%20abt.level_order%28%29%0A%20res%20%3D%20abt.pre_order%28%29%0A%20res%20%3D%20abt.in_order%28%29%0A%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D1%83%D0%B7%D0%BB%D0%B0%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%22%22%22%0A%20def%20__init__%28self,%20val%29%3A%0A%20%20self.val%20%3D%20val%0A%20%20self.left%20%3D%20None%0A%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%22%22%22%D0%9A%D0%BB%D0%B0%D1%81%D1%81%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B3%D0%BE%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%20%D0%BD%D0%B0%20%D0%BE%D1%81%D0%BD%D0%BE%D0%B2%D0%B5%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D0%B0%22%22%22%0A%0A%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%22%22%22%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%82%D0%BE%D1%80%22%22%22%0A%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20def%20size%28self%29%3A%0A%20%20%22%22%22%D0%81%D0%BC%D0%BA%D0%BE%D1%81%D1%82%D1%8C%20%D1%81%D0%BF%D0%B8%D1%81%D0%BA%D0%B0%22%22%22%0A%20%20return%20len%28self._tree%29%0A%0A%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%22%22%22%D0%9F%D0%BE%D0%BB%D1%83%D1%87%D0%B8%D1%82%D1%8C%20%D0%B7%D0%BD%D0%B0%D1%87%D0%B5%D0%BD%D0%B8%D0%B5%20%D1%83%D0%B7%D0%BB%D0%B0%20%D1%81%20%D0%B8%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%D0%BE%D0%BC%20i%22%22%22%0A%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20return%20None%0A%20%20return%20self._tree%5Bi%5D%0A%0A%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BB%D0%B5%D0%B2%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BC%D0%BA%D0%B0%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D0%BF%D1%80%D0%B0%D0%B2%D0%BE%D0%B3%D0%BE%20%D0%BF%D0%BE%D1%82%D0%BE%D0%BC%D0%BA%D0%B0%22%22%22%0A%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%22%22%22%D0%98%D0%BD%D0%B4%D0%B5%D0%BA%D1%81%20%D1%80%D0%BE%D0%B4%D0%B8%D1%82%D0%B5%D0%BB%D1%8F%22%22%22%0A%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%BF%D0%BE%20%D1%83%D1%80%D0%BE%D0%B2%D0%BD%D1%8F%D0%BC%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20%23%20%D0%9F%D1%80%D0%BE%D0%B9%D1%82%D0%B8%20%D0%BD%D0%B5%D0%BF%D0%BE%D1%81%D1%80%D0%B5%D0%B4%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D0%BE%20%D0%BF%D0%BE%20%D0%BC%D0%B0%D1%81%D1%81%D0%B8%D0%B2%D1%83%0A%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20return%20self.res%0A%0A%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B2%20%D0%B3%D0%BB%D1%83%D0%B1%D0%B8%D0%BD%D1%83%22%22%22%0A%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20return%0A%20%20%23%20%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%23%20%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%23%20%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%0A%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9F%D1%80%D1%8F%D0%BC%D0%BE%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20return%20self.res%0A%0A%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%A1%D0%B8%D0%BC%D0%BC%D0%B5%D1%82%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20return%20self.res%0A%0A%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%22%22%22%D0%9E%D0%B1%D1%80%D0%B0%D1%82%D0%BD%D1%8B%D0%B9%20%D0%BE%D0%B1%D1%85%D0%BE%D0%B4%22%22%22%0A%20%20self.res%20%3D%20%5B%5D%0A%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%23%20%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D1%82%D1%8C%20%D0%B4%D0%B2%D0%BE%D0%B8%D1%87%D0%BD%D0%BE%D0%B5%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%0A%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%23%20%D0%94%D0%BE%D1%81%D1%82%D1%83%D0%BF%20%D0%BA%20%D1%83%D0%B7%D0%BB%D1%83%0A%20i%20%3D%201%0A%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%23%20%D0%9E%D0%B1%D1%85%D0%BE%D0%B4%20%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B0%0A%20res%20%3D%20abt.level_order%28%29%0A%20res%20%3D%20abt.pre_order%28%29%0A%20res%20%3D%20abt.in_order%28%29%0A%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 7.3.3 &nbsp; Преимущества и ограничения

Представление двоичного дерева в виде массива имеет несколько преимуществ.

- Массив занимает непрерывный участок памяти. Это способствует эффективной работе кеша и ускоряет доступ к узлам и обход дерева.
- Хранить указатели не требуется, что экономит память.
- Возможен произвольный доступ к узлам.

У представления в виде массива есть и ограничения.

- Для массива нужен непрерывный участок памяти, поэтому он плохо подходит для очень больших деревьев.
- Добавление и удаление узлов требуют вставки и удаления элементов массива, а эти операции малоэффективны.
- Если в двоичном дереве много пустых позиций `None`, данные узлов занимают лишь малую долю массива, и память расходуется неэффективно.
