---
comments: true
---

# 7.3 &nbsp; Представление двоичного дерева массивом

В представлении через связную структуру единицей хранения двоичного дерева является узел `TreeNode` , а между узлами существуют связи через указатели. В предыдущем разделе были рассмотрены основные операции двоичного дерева в таком представлении.

Возникает вопрос: можно ли представить двоичное дерево с помощью массива? Ответ: да.

## 7.3.1 &nbsp; Представление идеального двоичного дерева

Сначала разберем простой случай. Если дана идеальная двоичная структура и все ее узлы хранятся в массиве в порядке обхода по уровням, то каждому узлу будет соответствовать единственный индекс массива.

Из свойств обхода по уровням можно вывести "формулу соответствия" между индексом родителя и индексами дочерних узлов: **если индекс некоторого узла равен $i$ , то индекс его левого дочернего узла равен $2i + 1$ , а правого - $2i + 2$** . На рисунке 7-12 показано соответствие между индексами разных узлов.

![Представление идеального двоичного дерева массивом](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 7-12 &nbsp; Представление идеального двоичного дерева массивом </p>

**Эта формула соответствия играет ту же роль, что и ссылки на узлы в связной структуре** . Имея любой узел в массиве, мы можем по формуле получить доступ к его левому и правому дочерним узлам.

## 7.3.2 &nbsp; Представление произвольного двоичного дерева

Идеальное двоичное дерево - лишь частный случай; в обычной двоичной структуре на промежуточных уровнях часто существует множество `None` . Поскольку последовательность обхода по уровням не содержит этих `None` , мы не можем по одной лишь этой последовательности определить их количество и расположение. **Это означает, что одному и тому же обходу по уровням может соответствовать сразу несколько различных структур двоичного дерева**.

Как показано на рисунке 7-13, для неполной двоичной структуры описанный выше способ представления массивом уже перестает работать.

![Одной последовательности обхода по уровням соответствуют разные двоичные структуры](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> Рисунок 7-13 &nbsp; Одной последовательности обхода по уровням соответствуют разные двоичные структуры </p>

Чтобы решить эту проблему, **мы можем явно записывать все `None` в последовательности обхода по уровням** . Как показано на рисунке 7-14, после такой обработки последовательность обхода по уровням уже сможет однозначно задавать двоичное дерево. Пример кода приведен ниже:

=== "Python"

    ```python title=""
    # Представление двоичного дерева массивом
    # Используем None для обозначения пустых позиций
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* Представление двоичного дерева массивом */
    // Используем максимальное значение int, INT_MAX, для обозначения пустых позиций
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* Представление двоичного дерева массивом */
    // Используя обертку Integer для int, можно применять null для обозначения пустых позиций
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* Представление двоичного дерева массивом */
    // Используя nullable-тип int? , можно применять null для обозначения пустых позиций
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* Представление двоичного дерева массивом */
    // Используем срез типа any, чтобы можно было применять nil для обозначения пустых позиций
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* Представление двоичного дерева массивом */
    // Используя nullable-тип Int? , можно применять nil для обозначения пустых позиций
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* Представление двоичного дерева массивом */
    // Используем null для обозначения пустых позиций
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* Представление двоичного дерева массивом */
    // Используем null для обозначения пустых позиций
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* Представление двоичного дерева массивом */
    // Используя nullable-тип int? , можно применять null для обозначения пустых позиций
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* Представление двоичного дерева массивом */
    // Используем None для обозначения пустых позиций
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* Представление двоичного дерева массивом */
    // Используем максимальное значение int для обозначения пустых позиций, поэтому узлы не должны принимать значение INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Представление двоичного дерева массивом */
    // Используем null для обозначения пустых позиций
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### Представление двоичного дерева массивом ###
    # Используем nil для обозначения пустых позиций
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![Представление произвольного двоичного дерева массивом](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> Рисунок 7-14 &nbsp; Представление произвольного двоичного дерева массивом </p>

Стоит отметить, что **полное двоичное дерево очень удобно представлять массивом** . Если вспомнить определение полного двоичного дерева, то `None` появляются только на самом нижнем уровне и справа, **а значит, все `None` обязательно находятся в конце последовательности обхода по уровням**.

Это означает, что при представлении полного двоичного дерева массивом можно не хранить все `None` , что очень удобно. На рисунке 7-15 приведен пример.

![Представление полного двоичного дерева массивом](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> Рисунок 7-15 &nbsp; Представление полного двоичного дерева массивом </p>

Ниже приведен код реализации двоичного дерева, представленного массивом. Он включает следующие операции.

- Для заданного узла получить его значение, левого дочернего узла, правого дочернего узла и родительский узел.
- Получить последовательности прямого, симметричного, обратного обходов и обхода по уровням.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """Класс двоичного дерева в массивном представлении"""

        def __init__(self, arr: list[int | None]):
            """Конструктор"""
            self._tree = list(arr)

        def size(self):
            """Вместимость списка"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """Получить значение узла с индексом i"""
            # Если индекс выходит за границы, вернуть None, обозначающий пустую позицию
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """Получить индекс левого дочернего узла узла с индексом i"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """Получить индекс правого дочернего узла узла с индексом i"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """Получить индекс родительского узла узла с индексом i"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """Обход в ширину"""
            self.res = []
            # Непосредственно обходить массив
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """Обход в глубину"""
            if self.val(i) is None:
                return
            # Предварительный обход
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
            """Предварительный обход"""
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
      public:
        /* Конструктор */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* Вместимость списка */
        int size() {
            return tree.size();
        }

        /* Получить значение узла с индексом i */
        int val(int i) {
            // Если индекс выходит за границы, вернуть INT_MAX, обозначающий пустую позицию
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        int left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        int right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родительского узла узла с индексом i */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход в ширину */
        vector<int> levelOrder() {
            vector<int> res;
            // Непосредственно обходить массив
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* Предварительный обход */
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
            // Если это пустая позиция, вернуть
            if (val(i) == INT_MAX)
                return;
            // Предварительный обход
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* Конструктор */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* Вместимость списка */
        public int size() {
            return tree.size();
        }

        /* Получить значение узла с индексом i */
        public Integer val(int i) {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родительского узла узла с индексом i */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход в ширину */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // Непосредственно обходить массив
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* Обход в глубину */
        private void dfs(Integer i, String order, List<Integer> res) {
            // Если это пустая позиция, вернуть
            if (val(i) == null)
                return;
            // Предварительный обход
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

        /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* Вместимость списка */
        public int Size() {
            return tree.Count;
        }

        /* Получить значение узла с индексом i */
        public int? Val(int i) {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* Получить индекс родительского узла узла с индексом i */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* Обход в ширину */
        public List<int> LevelOrder() {
            List<int> res = [];
            // Непосредственно обходить массив
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* Обход в глубину */
        void DFS(int i, string order, List<int> res) {
            // Если это пустая позиция, вернуть
            if (!Val(i).HasValue)
                return;
            // Предварительный обход
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

        /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    type arrayBinaryTree struct {
        tree []any
    }

    /* Конструктор */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* Вместимость списка */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* Получить значение узла с индексом i */
    func (abt *arrayBinaryTree) val(i int) any {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* Получить индекс родительского узла узла с индексом i */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* Обход в ширину */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // Непосредственно обходить массив
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* Обход в глубину */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // Если это пустая позиция, вернуть
        if abt.val(i) == nil {
            return
        }
        // Предварительный обход
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

    /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* Конструктор */
        init(arr: [Int?]) {
            tree = arr
        }

        /* Вместимость списка */
        func size() -> Int {
            tree.count
        }

        /* Получить значение узла с индексом i */
        func val(i: Int) -> Int? {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* Получить индекс родительского узла узла с индексом i */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* Обход в ширину */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // Непосредственно обходить массив
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* Обход в глубину */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // Если это пустая позиция, вернуть
            guard let val = val(i: i) else {
                return
            }
            // Предварительный обход
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

        /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
        #tree;

        /* Конструктор */
        constructor(arr) {
            this.#tree = arr;
        }

        /* Вместимость списка */
        size() {
            return this.#tree.length;
        }

        /* Получить значение узла с индексом i */
        val(i) {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        left(i) {
            return 2 * i + 1;
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        right(i) {
            return 2 * i + 2;
        }

        /* Получить индекс родительского узла узла с индексом i */
        parent(i) {
            return Math.floor((i - 1) / 2); // Округление вниз при делении
        }

        /* Обход в ширину */
        levelOrder() {
            let res = [];
            // Непосредственно обходить массив
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Обход в глубину */
        #dfs(i, order, res) {
            // Если это пустая позиция, вернуть
            if (this.val(i) === null) return;
            // Предварительный обход
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Симметричный обход
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Обратный обход
            if (order === 'post') res.push(this.val(i));
        }

        /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* Конструктор */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* Вместимость списка */
        size(): number {
            return this.#tree.length;
        }

        /* Получить значение узла с индексом i */
        val(i: number): number | null {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* Получить индекс родительского узла узла с индексом i */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // Округление вниз при делении
        }

        /* Обход в ширину */
        levelOrder(): number[] {
            let res = [];
            // Непосредственно обходить массив
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Обход в глубину */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // Если это пустая позиция, вернуть
            if (this.val(i) === null) return;
            // Предварительный обход
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Симметричный обход
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Обратный обход
            if (order === 'post') res.push(this.val(i));
        }

        /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* Конструктор */
      ArrayBinaryTree(this._tree);

      /* Вместимость списка */
      int size() {
        return _tree.length;
      }

      /* Получить значение узла с индексом i */
      int? val(int i) {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* Получить индекс левого дочернего узла узла с индексом i */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* Получить индекс правого дочернего узла узла с индексом i */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* Получить индекс родительского узла узла с индексом i */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* Обход в ширину */
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
        // Если это пустая позиция, вернуть
        if (val(i) == null) {
          return;
        }
        // Предварительный обход
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

      /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* Конструктор */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* Вместимость списка */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* Получить значение узла с индексом i */
        fn val(&self, i: i32) -> Option<i32> {
            // Если индекс выходит за границы, вернуть None, обозначающий пустую позицию
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* Получить индекс родительского узла узла с индексом i */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* Обход в ширину */
        fn level_order(&self) -> Vec<i32> {
            self.tree.iter().filter_map(|&x| x).collect()
        }

        /* Обход в глубину */
        fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // Предварительный обход
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

        /* Предварительный обход */
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
    /* Структура двоичного дерева в представлении массивом */
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

    /* Вместимость списка */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* Получить значение узла с индексом i */
    int val(ArrayBinaryTree *abt, int i) {
        // Если индекс выходит за границы, вернуть INT_MAX, обозначающий пустую позицию
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* Обход в ширину */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // Непосредственно обходить массив
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* Обход в глубину */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // Если это пустая позиция, вернуть
        if (val(abt, i) == INT_MAX)
            return;
        // Предварительный обход
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

    /* Предварительный обход */
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
    /* Класс двоичного дерева в массивном представлении */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* Вместимость списка */
        fun size(): Int {
            return tree.size
        }

        /* Получить значение узла с индексом i */
        fun _val(i: Int): Int? {
            // Если индекс выходит за границы, вернуть null, обозначающий пустую позицию
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* Получить индекс левого дочернего узла узла с индексом i */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Получить индекс правого дочернего узла узла с индексом i */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Получить индекс родительского узла узла с индексом i */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* Обход в ширину */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // Непосредственно обходить массив
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* Обход в глубину */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // Если это пустая позиция, вернуть
            if (_val(i) == null)
                return
            // Предварительный обход
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

        /* Предварительный обход */
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
    =begin
    File: array_binary_tree.rb
    Created Time: 2024-04-17
    Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
    =end

    require_relative '../utils/tree_node'
    require_relative '../utils/print_util'

    # ## Класс двоичного дерева в массивном представлении ###
    class ArrayBinaryTree
      # ## Конструктор ###
      def initialize(arr)
        @tree = arr.to_a
      end

      # ## Вместимость списка ###
      def size
        @tree.length
      end

      # ## Получить значение узла с индексом i ###
      def val(i)
        # Если индекс выходит за границы, вернуть nil, обозначающий пустую ячейку
        return if i < 0 || i >= size

        @tree[i]
      end

      # ## Получить индекс левого дочернего узла узла с индексом i ###
      def left(i)
        2 * i + 1
      end

      # ## Получить индекс правого дочернего узла узла с индексом i ###
      def right(i)
        2 * i + 2
      end

      # ## Получить индекс родительского узла узла с индексом i ###
      def parent(i)
        (i - 1) / 2
      end

      # ## Обход в ширину ###
      def level_order
        @res = []

        # Непосредственно обходить массив
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      # ## Обход в глубину ###
      def dfs(i, order)
        return if val(i).nil?
        # Предварительный обход
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # Симметричный обход
        @res << val(i) if order == :in
        dfs(right(i), order)
        # Обратный обход
        @res << val(i) if order == :post
      end

      # ## Предварительный обход ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      # ## Симметричный обход ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      # ## Обратный обход ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

??? pythontutor "Визуализация кода"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self%2C%20i%3A%20int%2C%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27pre%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27in%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27post%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27pre%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27in%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27post%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20arr%20%3D%20%5B1%2C%202%2C%203%2C%204%2C%20None%2C%206%2C%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20%28l%2C%20r%2C%20p%29%20%3D%20%28abt.left%28i%29%2C%20abt.right%28i%29%2C%20abt.parent%28i%29%29%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%0A%20%20%20%20def%20__init__%28self%2C%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20%2F%2F%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self%2C%20i%3A%20int%2C%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27pre%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27in%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%27post%27%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27pre%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27in%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%27post%27%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%27Driver%20Code%27%0Aif%20__name__%20%3D%3D%20%27__main__%27%3A%0A%20%20%20%20arr%20%3D%20%5B1%2C%202%2C%203%2C%204%2C%20None%2C%206%2C%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20%28l%2C%20r%2C%20p%29%20%3D%20%28abt.left%28i%29%2C%20abt.right%28i%29%2C%20abt.parent%28i%29%29%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Во весь экран ></a></div>

## 7.3.3 &nbsp; Преимущества и ограничения

Представление двоичного дерева массивом имеет в основном следующие преимущества.

- Массив хранится в непрерывной области памяти, хорошо работает с кешем и обеспечивает высокую скорость доступа и обхода.
- Не нужно хранить указатели, поэтому память расходуется экономнее.
- Разрешается произвольный доступ к узлам.

Однако у представления массивом есть и некоторые ограничения.

- Для хранения массива требуется непрерывная область памяти, поэтому такой способ не подходит для деревьев с очень большим объемом данных.
- Добавление и удаление узлов приходится реализовывать через вставку и удаление элементов массива, а это не слишком эффективно.
- Когда в двоичном дереве имеется большое число `None` , доля действительно полезных данных в массиве оказывается низкой, и эффективность использования пространства падает.
