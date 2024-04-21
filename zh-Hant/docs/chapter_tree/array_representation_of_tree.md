---
comments: true
---

# 7.3 &nbsp; 二元樹陣列表示

在鏈結串列表示下，二元樹的儲存單元為節點 `TreeNode` ，節點之間透過指標相連線。上一節介紹了鏈結串列表示下的二元樹的各項基本操作。

那麼，我們能否用陣列來表示二元樹呢？答案是肯定的。

## 7.3.1 &nbsp; 表示完美二元樹

先分析一個簡單案例。給定一棵完美二元樹，我們將所有節點按照層序走訪的順序儲存在一個陣列中，則每個節點都對應唯一的陣列索引。

根據層序走訪的特性，我們可以推導出父節點索引與子節點索引之間的“對映公式”：**若某節點的索引為 $i$ ，則該節點的左子節點索引為 $2i + 1$ ，右子節點索引為 $2i + 2$** 。圖 7-12 展示了各個節點索引之間的對映關係。

![完美二元樹的陣列表示](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> 圖 7-12 &nbsp; 完美二元樹的陣列表示 </p>

**對映公式的角色相當於鏈結串列中的節點引用（指標）**。給定陣列中的任意一個節點，我們都可以透過對映公式來訪問它的左（右）子節點。

## 7.3.2 &nbsp; 表示任意二元樹

完美二元樹是一個特例，在二元樹的中間層通常存在許多 `None` 。由於層序走訪序列並不包含這些 `None` ，因此我們無法僅憑該序列來推測 `None` 的數量和分佈位置。**這意味著存在多種二元樹結構都符合該層序走訪序列**。

如圖 7-13 所示，給定一棵非完美二元樹，上述陣列表示方法已經失效。

![層序走訪序列對應多種二元樹可能性](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> 圖 7-13 &nbsp; 層序走訪序列對應多種二元樹可能性 </p>

為了解決此問題，**我們可以考慮在層序走訪序列中顯式地寫出所有 `None`** 。如圖 7-14 所示，這樣處理後，層序走訪序列就可以唯一表示二元樹了。示例程式碼如下：

=== "Python"

    ```python title=""
    # 二元樹的陣列表示
    # 使用 None 來表示空位
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* 二元樹的陣列表示 */
    // 使用 int 最大值 INT_MAX 標記空位
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* 二元樹的陣列表示 */
    // 使用 int 的包裝類別 Integer ，就可以使用 null 來標記空位
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* 二元樹的陣列表示 */
    // 使用 int? 可空型別 ，就可以使用 null 來標記空位
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* 二元樹的陣列表示 */
    // 使用 any 型別的切片, 就可以使用 nil 來標記空位
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* 二元樹的陣列表示 */
    // 使用 Int? 可空型別 ，就可以使用 nil 來標記空位
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* 二元樹的陣列表示 */
    // 使用 null 來表示空位
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* 二元樹的陣列表示 */
    // 使用 null 來表示空位
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* 二元樹的陣列表示 */
    // 使用 int? 可空型別 ，就可以使用 null 來標記空位
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* 二元樹的陣列表示 */
    // 使用 None 來標記空位
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* 二元樹的陣列表示 */
    // 使用 int 最大值標記空位，因此要求節點值不能為 INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* 二元樹的陣列表示 */
    // 使用 null 來表示空位
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### 二元樹的陣列表示 ###
    # 使用 nil 來表示空位
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "Zig"

    ```zig title=""

    ```

![任意型別二元樹的陣列表示](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> 圖 7-14 &nbsp; 任意型別二元樹的陣列表示 </p>

值得說明的是，**完全二元樹非常適合使用陣列來表示**。回顧完全二元樹的定義，`None` 只出現在最底層且靠右的位置，**因此所有 `None` 一定出現在層序走訪序列的末尾**。

這意味著使用陣列表示完全二元樹時，可以省略儲存所有 `None` ，非常方便。圖 7-15 給出了一個例子。

![完全二元樹的陣列表示](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> 圖 7-15 &nbsp; 完全二元樹的陣列表示 </p>

以下程式碼實現了一棵基於陣列表示的二元樹，包括以下幾種操作。

- 給定某節點，獲取它的值、左（右）子節點、父節點。
- 獲取前序走訪、中序走訪、後序走訪、層序走訪序列。

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """陣列表示下的二元樹類別"""

        def __init__(self, arr: list[int | None]):
            """建構子"""
            self._tree = list(arr)

        def size(self):
            """串列容量"""
            return len(self._tree)

        def val(self, i: int) -> int:
            """獲取索引為 i 節點的值"""
            # 若索引越界，則返回 None ，代表空位
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """獲取索引為 i 節點的左子節點的索引"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """獲取索引為 i 節點的右子節點的索引"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """獲取索引為 i 節點的父節點的索引"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """層序走訪"""
            self.res = []
            # 直接走訪陣列
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """深度優先走訪"""
            if self.val(i) is None:
                return
            # 前序走訪
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # 中序走訪
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # 後序走訪
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """前序走訪"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """中序走訪"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """後序走訪"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
      public:
        /* 建構子 */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* 串列容量 */
        int size() {
            return tree.size();
        }

        /* 獲取索引為 i 節點的值 */
        int val(int i) {
            // 若索引越界，則返回 INT_MAX ，代表空位
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        int left(int i) {
            return 2 * i + 1;
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        int right(int i) {
            return 2 * i + 2;
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* 層序走訪 */
        vector<int> levelOrder() {
            vector<int> res;
            // 直接走訪陣列
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* 前序走訪 */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* 中序走訪 */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* 後序走訪 */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* 深度優先走訪 */
        void dfs(int i, string order, vector<int> &res) {
            // 若為空位，則返回
            if (val(i) == INT_MAX)
                return;
            // 前序走訪
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // 中序走訪
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // 後序走訪
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* 建構子 */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* 串列容量 */
        public int size() {
            return tree.size();
        }

        /* 獲取索引為 i 節點的值 */
        public Integer val(int i) {
            // 若索引越界，則返回 null ，代表空位
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* 層序走訪 */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // 直接走訪陣列
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* 深度優先走訪 */
        private void dfs(Integer i, String order, List<Integer> res) {
            // 若為空位，則返回
            if (val(i) == null)
                return;
            // 前序走訪
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // 中序走訪
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // 後序走訪
            if ("post".equals(order))
                res.add(val(i));
        }

        /* 前序走訪 */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* 中序走訪 */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* 後序走訪 */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* 串列容量 */
        public int Size() {
            return tree.Count;
        }

        /* 獲取索引為 i 節點的值 */
        public int? Val(int i) {
            // 若索引越界，則返回 null ，代表空位
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* 層序走訪 */
        public List<int> LevelOrder() {
            List<int> res = [];
            // 直接走訪陣列
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* 深度優先走訪 */
        void DFS(int i, string order, List<int> res) {
            // 若為空位，則返回
            if (!Val(i).HasValue)
                return;
            // 前序走訪
            if (order == "pre")
                res.Add(Val(i)!.Value);
            DFS(Left(i), order, res);
            // 中序走訪
            if (order == "in")
                res.Add(Val(i)!.Value);
            DFS(Right(i), order, res);
            // 後序走訪
            if (order == "post")
                res.Add(Val(i)!.Value);
        }

        /* 前序走訪 */
        public List<int> PreOrder() {
            List<int> res = [];
            DFS(0, "pre", res);
            return res;
        }

        /* 中序走訪 */
        public List<int> InOrder() {
            List<int> res = [];
            DFS(0, "in", res);
            return res;
        }

        /* 後序走訪 */
        public List<int> PostOrder() {
            List<int> res = [];
            DFS(0, "post", res);
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    /* 陣列表示下的二元樹類別 */
    type arrayBinaryTree struct {
        tree []any
    }

    /* 建構子 */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* 串列容量 */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* 獲取索引為 i 節點的值 */
    func (abt *arrayBinaryTree) val(i int) any {
        // 若索引越界，則返回 null ，代表空位
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* 獲取索引為 i 節點的父節點的索引 */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* 層序走訪 */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // 直接走訪陣列
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* 深度優先走訪 */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // 若為空位，則返回
        if abt.val(i) == nil {
            return
        }
        // 前序走訪
        if order == "pre" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.left(i), order, res)
        // 中序走訪
        if order == "in" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.right(i), order, res)
        // 後序走訪
        if order == "post" {
            *res = append(*res, abt.val(i))
        }
    }

    /* 前序走訪 */
    func (abt *arrayBinaryTree) preOrder() []any {
        var res []any
        abt.dfs(0, "pre", &res)
        return res
    }

    /* 中序走訪 */
    func (abt *arrayBinaryTree) inOrder() []any {
        var res []any
        abt.dfs(0, "in", &res)
        return res
    }

    /* 後序走訪 */
    func (abt *arrayBinaryTree) postOrder() []any {
        var res []any
        abt.dfs(0, "post", &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* 建構子 */
        init(arr: [Int?]) {
            tree = arr
        }

        /* 串列容量 */
        func size() -> Int {
            tree.count
        }

        /* 獲取索引為 i 節點的值 */
        func val(i: Int) -> Int? {
            // 若索引越界，則返回 null ，代表空位
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* 層序走訪 */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // 直接走訪陣列
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* 深度優先走訪 */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // 若為空位，則返回
            guard let val = val(i: i) else {
                return
            }
            // 前序走訪
            if order == "pre" {
                res.append(val)
            }
            dfs(i: left(i: i), order: order, res: &res)
            // 中序走訪
            if order == "in" {
                res.append(val)
            }
            dfs(i: right(i: i), order: order, res: &res)
            // 後序走訪
            if order == "post" {
                res.append(val)
            }
        }

        /* 前序走訪 */
        func preOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "pre", res: &res)
            return res
        }

        /* 中序走訪 */
        func inOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "in", res: &res)
            return res
        }

        /* 後序走訪 */
        func postOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "post", res: &res)
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
        #tree;

        /* 建構子 */
        constructor(arr) {
            this.#tree = arr;
        }

        /* 串列容量 */
        size() {
            return this.#tree.length;
        }

        /* 獲取索引為 i 節點的值 */
        val(i) {
            // 若索引越界，則返回 null ，代表空位
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        left(i) {
            return 2 * i + 1;
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        right(i) {
            return 2 * i + 2;
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        parent(i) {
            return Math.floor((i - 1) / 2); // 向下整除
        }

        /* 層序走訪 */
        levelOrder() {
            let res = [];
            // 直接走訪陣列
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 深度優先走訪 */
        #dfs(i, order, res) {
            // 若為空位，則返回
            if (this.val(i) === null) return;
            // 前序走訪
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 中序走訪
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 後序走訪
            if (order === 'post') res.push(this.val(i));
        }

        /* 前序走訪 */
        preOrder() {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 中序走訪 */
        inOrder() {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 後序走訪 */
        postOrder() {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* 建構子 */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* 串列容量 */
        size(): number {
            return this.#tree.length;
        }

        /* 獲取索引為 i 節點的值 */
        val(i: number): number | null {
            // 若索引越界，則返回 null ，代表空位
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // 向下整除
        }

        /* 層序走訪 */
        levelOrder(): number[] {
            let res = [];
            // 直接走訪陣列
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 深度優先走訪 */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // 若為空位，則返回
            if (this.val(i) === null) return;
            // 前序走訪
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 中序走訪
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 後序走訪
            if (order === 'post') res.push(this.val(i));
        }

        /* 前序走訪 */
        preOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 中序走訪 */
        inOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 後序走訪 */
        postOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* 建構子 */
      ArrayBinaryTree(this._tree);

      /* 串列容量 */
      int size() {
        return _tree.length;
      }

      /* 獲取索引為 i 節點的值 */
      int? val(int i) {
        // 若索引越界，則返回 null ，代表空位
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* 獲取索引為 i 節點的左子節點的索引 */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* 獲取索引為 i 節點的右子節點的索引 */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* 獲取索引為 i 節點的父節點的索引 */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* 層序走訪 */
      List<int> levelOrder() {
        List<int> res = [];
        for (int i = 0; i < size(); i++) {
          if (val(i) != null) {
            res.add(val(i)!);
          }
        }
        return res;
      }

      /* 深度優先走訪 */
      void dfs(int i, String order, List<int?> res) {
        // 若為空位，則返回
        if (val(i) == null) {
          return;
        }
        // 前序走訪
        if (order == 'pre') {
          res.add(val(i));
        }
        dfs(left(i)!, order, res);
        // 中序走訪
        if (order == 'in') {
          res.add(val(i));
        }
        dfs(right(i)!, order, res);
        // 後序走訪
        if (order == 'post') {
          res.add(val(i));
        }
      }

      /* 前序走訪 */
      List<int?> preOrder() {
        List<int?> res = [];
        dfs(0, 'pre', res);
        return res;
      }

      /* 中序走訪 */
      List<int?> inOrder() {
        List<int?> res = [];
        dfs(0, 'in', res);
        return res;
      }

      /* 後序走訪 */
      List<int?> postOrder() {
        List<int?> res = [];
        dfs(0, 'post', res);
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    /* 陣列表示下的二元樹類別 */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* 建構子 */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* 串列容量 */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* 獲取索引為 i 節點的值 */
        fn val(&self, i: i32) -> Option<i32> {
            // 若索引越界，則返回 None ，代表空位
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* 層序走訪 */
        fn level_order(&self) -> Vec<i32> {
            let mut res = vec![];
            // 直接走訪陣列
            for i in 0..self.size() {
                if let Some(val) = self.val(i) {
                    res.push(val)
                }
            }
            res
        }

        /* 深度優先走訪 */
        fn dfs(&self, i: i32, order: &str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // 前序走訪
            if order == "pre" {
                res.push(val);
            }
            self.dfs(self.left(i), order, res);
            // 中序走訪
            if order == "in" {
                res.push(val);
            }
            self.dfs(self.right(i), order, res);
            // 後序走訪
            if order == "post" {
                res.push(val);
            }
        }

        /* 前序走訪 */
        fn pre_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "pre", &mut res);
            res
        }

        /* 中序走訪 */
        fn in_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "in", &mut res);
            res
        }

        /* 後序走訪 */
        fn post_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "post", &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="array_binary_tree.c"
    /* 陣列表示下的二元樹結構體 */
    typedef struct {
        int *tree;
        int size;
    } ArrayBinaryTree;

    /* 建構子 */
    ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
        ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
        abt->tree = malloc(sizeof(int) * arrSize);
        memcpy(abt->tree, arr, sizeof(int) * arrSize);
        abt->size = arrSize;
        return abt;
    }

    /* 析構函式 */
    void delArrayBinaryTree(ArrayBinaryTree *abt) {
        free(abt->tree);
        free(abt);
    }

    /* 串列容量 */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* 獲取索引為 i 節點的值 */
    int val(ArrayBinaryTree *abt, int i) {
        // 若索引越界，則返回 INT_MAX ，代表空位
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* 層序走訪 */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // 直接走訪陣列
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* 深度優先走訪 */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // 若為空位，則返回
        if (val(abt, i) == INT_MAX)
            return;
        // 前序走訪
        if (strcmp(order, "pre") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, left(i), order, res, index);
        // 中序走訪
        if (strcmp(order, "in") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, right(i), order, res, index);
        // 後序走訪
        if (strcmp(order, "post") == 0)
            res[(*index)++] = val(abt, i);
    }

    /* 前序走訪 */
    int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "pre", res, &index);
        *returnSize = index;
        return res;
    }

    /* 中序走訪 */
    int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "in", res, &index);
        *returnSize = index;
        return res;
    }

    /* 後序走訪 */
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
    /* 陣列表示下的二元樹類別 */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* 串列容量 */
        fun size(): Int {
            return tree.size
        }

        /* 獲取索引為 i 節點的值 */
        fun _val(i: Int): Int? {
            // 若索引越界，則返回 null ，代表空位
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* 獲取索引為 i 節點的左子節點的索引 */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 獲取索引為 i 節點的右子節點的索引 */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 獲取索引為 i 節點的父節點的索引 */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* 層序走訪 */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // 直接走訪陣列
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* 深度優先走訪 */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // 若為空位，則返回
            if (_val(i) == null)
                return
            // 前序走訪
            if ("pre" == order)
                res.add(_val(i))
            dfs(left(i), order, res)
            // 中序走訪
            if ("in" == order)
                res.add(_val(i))
            dfs(right(i), order, res)
            // 後序走訪
            if ("post" == order)
                res.add(_val(i))
        }

        /* 前序走訪 */
        fun preOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "pre", res)
            return res
        }

        /* 中序走訪 */
        fun inOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "in", res)
            return res
        }

        /* 後序走訪 */
        fun postOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "post", res)
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    ### 陣列表示下的二元樹類別 ###
    class ArrayBinaryTree
      ### 建構子 ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### 串列容量 ###
      def size
        @tree.length
      end

      ### 獲取索引為 i 節點的值 ###
      def val(i)
        # 若索引越界，則返回 nil ，代表空位
        return if i < 0 || i >= size

        @tree[i]
      end

      ### 獲取索引為 i 節點的左子節點的索引 ###
      def left(i)
        2 * i + 1
      end

      ### 獲取索引為 i 節點的右子節點的索引 ###
      def right(i)
        2 * i + 2
      end

      ### 獲取索引為 i 節點的父節點的索引 ###
      def parent(i)
        (i - 1) / 2
      end

      ### 層序走訪 ###
      def level_order
        @res = []

        # 直接走訪陣列
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      ### 深度優先走訪 ###
      def dfs(i, order)
        return if val(i).nil?
        # 前序走訪
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # 中序走訪
        @res << val(i) if order == :in
        dfs(right(i), order)
        # 後序走訪
        @res << val(i) if order == :post
      end

      ### 前序走訪 ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### 中序走訪 ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### 後序走訪 ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

=== "Zig"

    ```zig title="array_binary_tree.zig"
    [class]{ArrayBinaryTree}-[func]{}
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22%E9%99%A3%E5%88%97%E8%A1%A8%E7%A4%BA%E4%B8%8B%E7%9A%84%E4%BA%8C%E5%85%83%E6%A8%B9%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E7%B4%A2%E5%BC%95%E7%82%BA%20i%20%E7%AF%80%E9%BB%9E%E7%9A%84%E5%80%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self%2C%20i%3A%20int%2C%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E5%84%AA%E5%85%88%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20arr%20%3D%20%5B1%2C%202%2C%203%2C%204%2C%20None%2C%206%2C%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E7%AF%80%E9%BB%9E%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l%2C%20r%2C%20p%20%3D%20abt.left%28i%29%2C%20abt.right%28i%29%2C%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%A8%B9%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22%E9%99%A3%E5%88%97%E8%A1%A8%E7%A4%BA%E4%B8%8B%E7%9A%84%E4%BA%8C%E5%85%83%E6%A8%B9%E9%A1%9E%E5%88%A5%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%2C%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%B2%E5%88%97%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self%2C%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E7%B4%A2%E5%BC%95%E7%82%BA%20i%20%E7%AF%80%E9%BB%9E%E7%9A%84%E5%80%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self%2C%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E7%8D%B2%E5%8F%96%E7%88%B6%E7%AF%80%E9%BB%9E%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E8%B5%B0%E8%A8%AA%E9%99%A3%E5%88%97%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self%2C%20i%3A%20int%2C%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E5%84%AA%E5%85%88%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29%2C%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280%2C%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20arr%20%3D%20%5B1%2C%202%2C%203%2C%204%2C%20None%2C%206%2C%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E7%AF%80%E9%BB%9E%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l%2C%20r%2C%20p%20%3D%20abt.left%28i%29%2C%20abt.right%28i%29%2C%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20%E8%B5%B0%E8%A8%AA%E6%A8%B9%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 7.3.3 &nbsp; 優點與侷限性

二元樹的陣列表示主要有以下優點。

- 陣列儲存在連續的記憶體空間中，對快取友好，訪問與走訪速度較快。
- 不需要儲存指標，比較節省空間。
- 允許隨機訪問節點。

然而，陣列表示也存在一些侷限性。

- 陣列儲存需要連續記憶體空間，因此不適合儲存資料量過大的樹。
- 增刪節點需要透過陣列插入與刪除操作實現，效率較低。
- 當二元樹中存在大量 `None` 時，陣列中包含的節點資料比重較低，空間利用率較低。
