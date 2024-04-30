---
comments: true
---

# 7.3 &nbsp; Array representation of binary trees

Under the linked list representation, the storage unit of a binary tree is a node `TreeNode`, with nodes connected by pointers. The basic operations of binary trees under the linked list representation were introduced in the previous section.

So, can we use an array to represent a binary tree? The answer is yes.

## 7.3.1 &nbsp; Representing perfect binary trees

Let's analyze a simple case first. Given a perfect binary tree, we store all nodes in an array according to the order of level-order traversal, where each node corresponds to a unique array index.

Based on the characteristics of level-order traversal, we can deduce a "mapping formula" between the index of a parent node and its children: **If a node's index is $i$, then the index of its left child is $2i + 1$ and the right child is $2i + 2$**. Figure 7-12 shows the mapping relationship between the indices of various nodes.

![Array representation of a perfect binary tree](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-12 &nbsp; Array representation of a perfect binary tree </p>

**The mapping formula plays a role similar to the node references (pointers) in linked lists**. Given any node in the array, we can access its left (right) child node using the mapping formula.

## 7.3.2 &nbsp; Representing any binary tree

Perfect binary trees are a special case; there are often many `None` values in the middle levels of a binary tree. Since the sequence of level-order traversal does not include these `None` values, we cannot solely rely on this sequence to deduce the number and distribution of `None` values. **This means that multiple binary tree structures can match the same level-order traversal sequence**.

As shown in Figure 7-13, given a non-perfect binary tree, the above method of array representation fails.

![Level-order traversal sequence corresponds to multiple binary tree possibilities](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> Figure 7-13 &nbsp; Level-order traversal sequence corresponds to multiple binary tree possibilities </p>

To solve this problem, **we can consider explicitly writing out all `None` values in the level-order traversal sequence**. As shown in Figure 7-14, after this treatment, the level-order traversal sequence can uniquely represent a binary tree. Example code is as follows:

=== "Python"

    ```python title=""
    # Array representation of a binary tree
    # Using None to represent empty slots
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* Array representation of a binary tree */
    // Using the maximum integer value INT_MAX to mark empty slots
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* Array representation of a binary tree */
    // Using the Integer wrapper class allows for using null to mark empty slots
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* Array representation of a binary tree */
    // Using nullable int (int?) allows for using null to mark empty slots
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* Array representation of a binary tree */
    // Using an any type slice, allowing for nil to mark empty slots
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* Array representation of a binary tree */
    // Using optional Int (Int?) allows for using nil to mark empty slots
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* Array representation of a binary tree */
    // Using null to represent empty slots
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* Array representation of a binary tree */
    // Using null to represent empty slots
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* Array representation of a binary tree */
    // Using nullable int (int?) allows for using null to mark empty slots
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* Array representation of a binary tree */
    // Using None to mark empty slots
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* Array representation of a binary tree */
    // Using the maximum int value to mark empty slots, therefore, node values must not be INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Array representation of a binary tree */
    // Using null to represent empty slots
    val tree = mutableListOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""

    ```

=== "Zig"

    ```zig title=""

    ```

![Array representation of any type of binary tree](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> Figure 7-14 &nbsp; Array representation of any type of binary tree </p>

It's worth noting that **complete binary trees are very suitable for array representation**. Recalling the definition of a complete binary tree, `None` appears only at the bottom level and towards the right, **meaning all `None` values definitely appear at the end of the level-order traversal sequence**.

This means that when using an array to represent a complete binary tree, it's possible to omit storing all `None` values, which is very convenient. Figure 7-15 gives an example.

![Array representation of a complete binary tree](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-15 &nbsp; Array representation of a complete binary tree </p>

The following code implements a binary tree based on array representation, including the following operations:

- Given a node, obtain its value, left (right) child node, and parent node.
- Obtain the preorder, inorder, postorder, and level-order traversal sequences.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """数组表示下的二叉树类"""

        def __init__(self, arr: list[int | None]):
            """构造方法"""
            self._tree = list(arr)

        def size(self):
            """列表容量"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """获取索引为 i 节点的值"""
            # 若索引越界，则返回 None ，代表空位
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """获取索引为 i 节点的左子节点的索引"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """获取索引为 i 节点的右子节点的索引"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """获取索引为 i 节点的父节点的索引"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """层序遍历"""
            self.res = []
            # 直接遍历数组
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """深度优先遍历"""
            if self.val(i) is None:
                return
            # 前序遍历
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # 中序遍历
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # 后序遍历
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """前序遍历"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """中序遍历"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """后序遍历"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
      public:
        /* 构造方法 */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* 列表容量 */
        int size() {
            return tree.size();
        }

        /* 获取索引为 i 节点的值 */
        int val(int i) {
            // 若索引越界，则返回 INT_MAX ，代表空位
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        int left(int i) {
            return 2 * i + 1;
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        int right(int i) {
            return 2 * i + 2;
        }

        /* 获取索引为 i 节点的父节点的索引 */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* 层序遍历 */
        vector<int> levelOrder() {
            vector<int> res;
            // 直接遍历数组
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* 前序遍历 */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* 中序遍历 */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* 后序遍历 */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* 深度优先遍历 */
        void dfs(int i, string order, vector<int> &res) {
            // 若为空位，则返回
            if (val(i) == INT_MAX)
                return;
            // 前序遍历
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // 中序遍历
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // 后序遍历
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* 构造方法 */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* 列表容量 */
        public int size() {
            return tree.size();
        }

        /* 获取索引为 i 节点的值 */
        public Integer val(int i) {
            // 若索引越界，则返回 null ，代表空位
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* 获取索引为 i 节点的父节点的索引 */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* 层序遍历 */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // 直接遍历数组
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* 深度优先遍历 */
        private void dfs(Integer i, String order, List<Integer> res) {
            // 若为空位，则返回
            if (val(i) == null)
                return;
            // 前序遍历
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // 中序遍历
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // 后序遍历
            if ("post".equals(order))
                res.add(val(i));
        }

        /* 前序遍历 */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* 中序遍历 */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* 后序遍历 */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* 列表容量 */
        public int Size() {
            return tree.Count;
        }

        /* 获取索引为 i 节点的值 */
        public int? Val(int i) {
            // 若索引越界，则返回 null ，代表空位
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* 获取索引为 i 节点的父节点的索引 */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* 层序遍历 */
        public List<int> LevelOrder() {
            List<int> res = [];
            // 直接遍历数组
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* 深度优先遍历 */
        void DFS(int i, string order, List<int> res) {
            // 若为空位，则返回
            if (!Val(i).HasValue)
                return;
            // 前序遍历
            if (order == "pre")
                res.Add(Val(i)!.Value);
            DFS(Left(i), order, res);
            // 中序遍历
            if (order == "in")
                res.Add(Val(i)!.Value);
            DFS(Right(i), order, res);
            // 后序遍历
            if (order == "post")
                res.Add(Val(i)!.Value);
        }

        /* 前序遍历 */
        public List<int> PreOrder() {
            List<int> res = [];
            DFS(0, "pre", res);
            return res;
        }

        /* 中序遍历 */
        public List<int> InOrder() {
            List<int> res = [];
            DFS(0, "in", res);
            return res;
        }

        /* 后序遍历 */
        public List<int> PostOrder() {
            List<int> res = [];
            DFS(0, "post", res);
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    /* 数组表示下的二叉树类 */
    type arrayBinaryTree struct {
        tree []any
    }

    /* 构造方法 */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* 列表容量 */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* 获取索引为 i 节点的值 */
    func (abt *arrayBinaryTree) val(i int) any {
        // 若索引越界，则返回 null ，代表空位
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* 获取索引为 i 节点的父节点的索引 */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* 层序遍历 */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // 直接遍历数组
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* 深度优先遍历 */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // 若为空位，则返回
        if abt.val(i) == nil {
            return
        }
        // 前序遍历
        if order == "pre" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.left(i), order, res)
        // 中序遍历
        if order == "in" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.right(i), order, res)
        // 后序遍历
        if order == "post" {
            *res = append(*res, abt.val(i))
        }
    }

    /* 前序遍历 */
    func (abt *arrayBinaryTree) preOrder() []any {
        var res []any
        abt.dfs(0, "pre", &res)
        return res
    }

    /* 中序遍历 */
    func (abt *arrayBinaryTree) inOrder() []any {
        var res []any
        abt.dfs(0, "in", &res)
        return res
    }

    /* 后序遍历 */
    func (abt *arrayBinaryTree) postOrder() []any {
        var res []any
        abt.dfs(0, "post", &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* 构造方法 */
        init(arr: [Int?]) {
            tree = arr
        }

        /* 列表容量 */
        func size() -> Int {
            tree.count
        }

        /* 获取索引为 i 节点的值 */
        func val(i: Int) -> Int? {
            // 若索引越界，则返回 null ，代表空位
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* 获取索引为 i 节点的父节点的索引 */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* 层序遍历 */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // 直接遍历数组
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* 深度优先遍历 */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // 若为空位，则返回
            guard let val = val(i: i) else {
                return
            }
            // 前序遍历
            if order == "pre" {
                res.append(val)
            }
            dfs(i: left(i: i), order: order, res: &res)
            // 中序遍历
            if order == "in" {
                res.append(val)
            }
            dfs(i: right(i: i), order: order, res: &res)
            // 后序遍历
            if order == "post" {
                res.append(val)
            }
        }

        /* 前序遍历 */
        func preOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "pre", res: &res)
            return res
        }

        /* 中序遍历 */
        func inOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "in", res: &res)
            return res
        }

        /* 后序遍历 */
        func postOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "post", res: &res)
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
        #tree;

        /* 构造方法 */
        constructor(arr) {
            this.#tree = arr;
        }

        /* 列表容量 */
        size() {
            return this.#tree.length;
        }

        /* 获取索引为 i 节点的值 */
        val(i) {
            // 若索引越界，则返回 null ，代表空位
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        left(i) {
            return 2 * i + 1;
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        right(i) {
            return 2 * i + 2;
        }

        /* 获取索引为 i 节点的父节点的索引 */
        parent(i) {
            return Math.floor((i - 1) / 2); // 向下整除
        }

        /* 层序遍历 */
        levelOrder() {
            let res = [];
            // 直接遍历数组
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 深度优先遍历 */
        #dfs(i, order, res) {
            // 若为空位，则返回
            if (this.val(i) === null) return;
            // 前序遍历
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 中序遍历
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 后序遍历
            if (order === 'post') res.push(this.val(i));
        }

        /* 前序遍历 */
        preOrder() {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 中序遍历 */
        inOrder() {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 后序遍历 */
        postOrder() {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* 构造方法 */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* 列表容量 */
        size(): number {
            return this.#tree.length;
        }

        /* 获取索引为 i 节点的值 */
        val(i: number): number | null {
            // 若索引越界，则返回 null ，代表空位
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* 获取索引为 i 节点的父节点的索引 */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // 向下整除
        }

        /* 层序遍历 */
        levelOrder(): number[] {
            let res = [];
            // 直接遍历数组
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* 深度优先遍历 */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // 若为空位，则返回
            if (this.val(i) === null) return;
            // 前序遍历
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // 中序遍历
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // 后序遍历
            if (order === 'post') res.push(this.val(i));
        }

        /* 前序遍历 */
        preOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* 中序遍历 */
        inOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* 后序遍历 */
        postOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* 构造方法 */
      ArrayBinaryTree(this._tree);

      /* 列表容量 */
      int size() {
        return _tree.length;
      }

      /* 获取索引为 i 节点的值 */
      int? val(int i) {
        // 若索引越界，则返回 null ，代表空位
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* 获取索引为 i 节点的左子节点的索引 */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* 获取索引为 i 节点的右子节点的索引 */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* 获取索引为 i 节点的父节点的索引 */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* 层序遍历 */
      List<int> levelOrder() {
        List<int> res = [];
        for (int i = 0; i < size(); i++) {
          if (val(i) != null) {
            res.add(val(i)!);
          }
        }
        return res;
      }

      /* 深度优先遍历 */
      void dfs(int i, String order, List<int?> res) {
        // 若为空位，则返回
        if (val(i) == null) {
          return;
        }
        // 前序遍历
        if (order == 'pre') {
          res.add(val(i));
        }
        dfs(left(i)!, order, res);
        // 中序遍历
        if (order == 'in') {
          res.add(val(i));
        }
        dfs(right(i)!, order, res);
        // 后序遍历
        if (order == 'post') {
          res.add(val(i));
        }
      }

      /* 前序遍历 */
      List<int?> preOrder() {
        List<int?> res = [];
        dfs(0, 'pre', res);
        return res;
      }

      /* 中序遍历 */
      List<int?> inOrder() {
        List<int?> res = [];
        dfs(0, 'in', res);
        return res;
      }

      /* 后序遍历 */
      List<int?> postOrder() {
        List<int?> res = [];
        dfs(0, 'post', res);
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    /* 数组表示下的二叉树类 */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* 构造方法 */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* 列表容量 */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* 获取索引为 i 节点的值 */
        fn val(&self, i: i32) -> Option<i32> {
            // 若索引越界，则返回 None ，代表空位
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* 获取索引为 i 节点的父节点的索引 */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* 层序遍历 */
        fn level_order(&self) -> Vec<i32> {
            let mut res = vec![];
            // 直接遍历数组
            for i in 0..self.size() {
                if let Some(val) = self.val(i) {
                    res.push(val)
                }
            }
            res
        }

        /* 深度优先遍历 */
        fn dfs(&self, i: i32, order: &str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // 前序遍历
            if order == "pre" {
                res.push(val);
            }
            self.dfs(self.left(i), order, res);
            // 中序遍历
            if order == "in" {
                res.push(val);
            }
            self.dfs(self.right(i), order, res);
            // 后序遍历
            if order == "post" {
                res.push(val);
            }
        }

        /* 前序遍历 */
        fn pre_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "pre", &mut res);
            res
        }

        /* 中序遍历 */
        fn in_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "in", &mut res);
            res
        }

        /* 后序遍历 */
        fn post_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "post", &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="array_binary_tree.c"
    /* 数组表示下的二叉树结构体 */
    typedef struct {
        int *tree;
        int size;
    } ArrayBinaryTree;

    /* 构造函数 */
    ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
        ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
        abt->tree = malloc(sizeof(int) * arrSize);
        memcpy(abt->tree, arr, sizeof(int) * arrSize);
        abt->size = arrSize;
        return abt;
    }

    /* 析构函数 */
    void delArrayBinaryTree(ArrayBinaryTree *abt) {
        free(abt->tree);
        free(abt);
    }

    /* 列表容量 */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* 获取索引为 i 节点的值 */
    int val(ArrayBinaryTree *abt, int i) {
        // 若索引越界，则返回 INT_MAX ，代表空位
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* 层序遍历 */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // 直接遍历数组
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* 深度优先遍历 */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // 若为空位，则返回
        if (val(abt, i) == INT_MAX)
            return;
        // 前序遍历
        if (strcmp(order, "pre") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, left(i), order, res, index);
        // 中序遍历
        if (strcmp(order, "in") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, right(i), order, res, index);
        // 后序遍历
        if (strcmp(order, "post") == 0)
            res[(*index)++] = val(abt, i);
    }

    /* 前序遍历 */
    int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "pre", res, &index);
        *returnSize = index;
        return res;
    }

    /* 中序遍历 */
    int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "in", res, &index);
        *returnSize = index;
        return res;
    }

    /* 后序遍历 */
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
    /* 数组表示下的二叉树类 */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* 列表容量 */
        fun size(): Int {
            return tree.size
        }

        /* 获取索引为 i 节点的值 */
        fun _val(i: Int): Int? {
            // 若索引越界，则返回 null ，代表空位
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* 获取索引为 i 节点的左子节点的索引 */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* 获取索引为 i 节点的右子节点的索引 */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* 获取索引为 i 节点的父节点的索引 */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* 层序遍历 */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // 直接遍历数组
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* 深度优先遍历 */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // 若为空位，则返回
            if (_val(i) == null)
                return
            // 前序遍历
            if ("pre" == order)
                res.add(_val(i))
            dfs(left(i), order, res)
            // 中序遍历
            if ("in" == order)
                res.add(_val(i))
            dfs(right(i), order, res)
            // 后序遍历
            if ("post" == order)
                res.add(_val(i))
        }

        /* 前序遍历 */
        fun preOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "pre", res)
            return res
        }

        /* 中序遍历 */
        fun inOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "in", res)
            return res
        }

        /* 后序遍历 */
        fun postOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "post", res)
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    ### 数组表示下的二叉树类 ###
    class ArrayBinaryTree
      ### 构造方法 ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### 列表容量 ###
      def size
        @tree.length
      end

      ### 获取索引为 i 节点的值 ###
      def val(i)
        # 若索引越界，则返回 nil ，代表空位
        return if i < 0 || i >= size

        @tree[i]
      end

      ### 获取索引为 i 节点的左子节点的索引 ###
      def left(i)
        2 * i + 1
      end

      ### 获取索引为 i 节点的右子节点的索引 ###
      def right(i)
        2 * i + 2
      end

      ### 获取索引为 i 节点的父节点的索引 ###
      def parent(i)
        (i - 1) / 2
      end

      ### 层序遍历 ###
      def level_order
        @res = []

        # 直接遍历数组
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      ### 深度优先遍历 ###
      def dfs(i, order)
        return if val(i).nil?
        # 前序遍历
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # 中序遍历
        @res << val(i) if order == :in
        dfs(right(i), order)
        # 后序遍历
        @res << val(i) if order == :post
      end

      ### 前序遍历 ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### 中序遍历 ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### 后序遍历 ###
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22%E6%95%B0%E7%BB%84%E8%A1%A8%E7%A4%BA%E4%B8%8B%E7%9A%84%E4%BA%8C%E5%8F%89%E6%A0%91%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E7%B4%A2%E5%BC%95%E4%B8%BA%20i%20%E8%8A%82%E7%82%B9%E7%9A%84%E5%80%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20*%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20*%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E7%88%B6%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B1%82%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%8E%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%90%8E%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E8%8A%82%E7%82%B9%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%A0%91%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22%E6%95%B0%E7%BB%84%E8%A1%A8%E7%A4%BA%E4%B8%8B%E7%9A%84%E4%BA%8C%E5%8F%89%E6%A0%91%E7%B1%BB%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%97%E8%A1%A8%E5%AE%B9%E9%87%8F%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E7%B4%A2%E5%BC%95%E4%B8%BA%20i%20%E8%8A%82%E7%82%B9%E7%9A%84%E5%80%BC%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20*%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20*%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E7%88%B6%E8%8A%82%E7%82%B9%E7%9A%84%E7%B4%A2%E5%BC%95%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%B1%82%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%9B%B4%E6%8E%A5%E9%81%8D%E5%8E%86%E6%95%B0%E7%BB%84%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%B7%B1%E5%BA%A6%E4%BC%98%E5%85%88%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20%E5%90%8E%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%90%8E%E5%BA%8F%E9%81%8D%E5%8E%86%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%A0%91%0A%20%20%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20%E8%AE%BF%E9%97%AE%E8%8A%82%E7%82%B9%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%A0%91%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 7.3.3 &nbsp; Advantages and limitations

The array representation of binary trees has the following advantages:

- Arrays are stored in contiguous memory spaces, which is cache-friendly and allows for faster access and traversal.
- It does not require storing pointers, which saves space.
- It allows random access to nodes.

However, the array representation also has some limitations:

- Array storage requires contiguous memory space, so it is not suitable for storing trees with a large amount of data.
- Adding or deleting nodes requires array insertion and deletion operations, which are less efficient.
- When there are many `None` values in the binary tree, the proportion of node data contained in the array is low, leading to lower space utilization.
