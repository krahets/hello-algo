---
comments: true
---

# 7.3 &nbsp; Array representation of a binary tree

In a linked representation, a binary tree stores data in `TreeNode` nodes connected by pointers. The previous section introduced basic operations on binary trees in this form.

Can we represent a binary tree with an array instead? Yes.

## 7.3.1 &nbsp; Representing a perfect binary tree

Start with a simple case. Store every node of a perfect binary tree in an array in level order. Each node then corresponds to a unique array index.

Level-order traversal gives us a mapping between parent and child indices: **if a node has index $i$, its left child has index $2i + 1$ and its right child has index $2i + 2$**. Figure 7-12 illustrates this relationship.

![Array representation of a perfect binary tree](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-12 &nbsp; Array representation of a perfect binary tree </p>

**The mapping formulas serve the same role as node references or pointers in a linked representation**. Given any node in the array, we can use them to access its left or right child.

## 7.3.2 &nbsp; Representing an arbitrary binary tree

A perfect binary tree is a special case. Other binary trees often contain many missing nodes, `None`, at intermediate levels. Ordinary level-order traversal omits these positions, so its sequence alone cannot tell us their number or locations. **Multiple tree structures can therefore produce the same level-order sequence**.

As shown below, the array representation above no longer works for a non-perfect binary tree.

![Multiple binary trees can share a level-order sequence](array_representation_of_tree.assets/array_representation_without_empty.png){ class="animation-figure" }

<p align="center"> Figure 7-13 &nbsp; Multiple binary trees can share a level-order sequence </p>

To solve this, **include every `None` position explicitly in the level-order sequence**. The sequence then represents the tree uniquely, as shown below. Example code follows:

=== "Python"

    ```python title=""
    # Array representation of a binary tree
    # Use None for empty positions
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* Array representation of a binary tree */
    // Use INT_MAX, the maximum int value, for empty positions
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* Array representation of a binary tree */
    // Use the wrapper class Integer so that null can mark empty positions
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* Array representation of a binary tree */
    // Use the nullable type int? so that null can mark empty positions
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* Array representation of a binary tree */
    // Use a slice of any so that nil can mark empty positions
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* Array representation of a binary tree */
    // Use the optional type Int? so that nil can mark empty positions
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* Array representation of a binary tree */
    // Use null for empty positions
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* Array representation of a binary tree */
    // Use null for empty positions
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* Array representation of a binary tree */
    // Use the nullable type int? so that null can mark empty positions
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* Array representation of a binary tree */
    // Use None for empty positions
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* Array representation of a binary tree */
    // Use the maximum int value for empty positions, so node values must not equal INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Array representation of a binary tree */
    // Use null for empty positions
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### Array representation of a binary tree ###
    # Use nil for empty positions
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![Array representation of an arbitrary binary tree](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> Figure 7-14 &nbsp; Array representation of an arbitrary binary tree </p>

**Complete binary trees are particularly well suited to array representation**. By definition, missing positions occur only at the right end of the lowest level, **so all `None` entries appear at the end of the level-order sequence**.

We can therefore omit all `None` entries when storing a complete binary tree in an array. An example is shown below.

![Array representation of a complete binary tree](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-15 &nbsp; Array representation of a complete binary tree </p>

The following code implements an array-based binary tree with these operations.

- Given a node, get its value, left or right child, and parent.
- Obtain preorder, inorder, postorder, and level-order traversal sequences.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """Binary tree class using an array representation"""

        def __init__(self, arr: list[int | None]):
            """Constructor"""
            self._tree = list(arr)

        def size(self):
            """Length of the backing list"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """Get the value of the node at index i"""
            # If the index is out of bounds, return None to represent an empty position
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """Get the left child index of the node at index i"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """Get the right child index of the node at index i"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """Get the parent index of the node at index i"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """Level-order traversal"""
            self.res = []
            # Traverse the array directly
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """Depth-first traversal"""
            if self.val(i) is None:
                return
            # Preorder traversal
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # Inorder traversal
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # Postorder traversal
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """Preorder traversal"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """Inorder traversal"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """Postorder traversal"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
      public:
        /* Constructor */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* Number of positions in the array */
        int size() {
            return tree.size();
        }

        /* Get the value of the node at index i */
        int val(int i) {
            // If the index is out of bounds, return INT_MAX to represent an empty position
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* Get the left child index of the node at index i */
        int left(int i) {
            return 2 * i + 1;
        }

        /* Get the right child index of the node at index i */
        int right(int i) {
            return 2 * i + 2;
        }

        /* Get the parent index of the node at index i */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        vector<int> levelOrder() {
            vector<int> res;
            // Traverse the array directly
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* Preorder traversal */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* Inorder traversal */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* Postorder traversal */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* Depth-first traversal */
        void dfs(int i, string order, vector<int> &res) {
            // Return if this position is empty
            if (val(i) == INT_MAX)
                return;
            // Preorder traversal
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // Inorder traversal
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // Postorder traversal
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* Constructor */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* List size */
        public int size() {
            return tree.size();
        }

        /* Get the value of the node at index i */
        public Integer val(int i) {
            // If the index is out of bounds, return null to represent an empty position
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* Get the left child index of the node at index i */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* Get the right child index of the node at index i */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* Get the parent index of the node at index i */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // Traverse the array directly
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        private void dfs(Integer i, String order, List<Integer> res) {
            // Return if this position is empty
            if (val(i) == null)
                return;
            // Preorder traversal
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // Inorder traversal
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // Postorder traversal
            if ("post".equals(order))
                res.add(val(i));
        }

        /* Preorder traversal */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* Inorder traversal */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* Postorder traversal */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* List size */
        public int Size() {
            return tree.Count;
        }

        /* Get the value of the node at index i */
        public int? Val(int i) {
            // If the index is out of bounds, return null to represent an empty position
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* Get the left child index of the node at index i */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* Get the right child index of the node at index i */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* Get the parent index of the node at index i */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        public List<int> LevelOrder() {
            List<int> res = [];
            // Traverse the array directly
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* Depth-first traversal */
        void DFS(int i, string order, List<int> res) {
            // Return if this position is empty
            if (!Val(i).HasValue)
                return;
            // Preorder traversal
            if (order == "pre")
                res.Add(Val(i)!.Value);
            DFS(Left(i), order, res);
            // Inorder traversal
            if (order == "in")
                res.Add(Val(i)!.Value);
            DFS(Right(i), order, res);
            // Postorder traversal
            if (order == "post")
                res.Add(Val(i)!.Value);
        }

        /* Preorder traversal */
        public List<int> PreOrder() {
            List<int> res = [];
            DFS(0, "pre", res);
            return res;
        }

        /* Inorder traversal */
        public List<int> InOrder() {
            List<int> res = [];
            DFS(0, "in", res);
            return res;
        }

        /* Postorder traversal */
        public List<int> PostOrder() {
            List<int> res = [];
            DFS(0, "post", res);
            return res;
        }
    }
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    /* Binary tree type using an array representation */
    type arrayBinaryTree struct {
        tree []any
    }

    /* Constructor */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* Length of the backing slice */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* Get the value of the node at index i */
    func (abt *arrayBinaryTree) val(i int) any {
        // If the index is out of bounds, return nil to represent an empty position
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* Get the left child index of the node at index i */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* Get the right child index of the node at index i */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* Get the parent index of the node at index i */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* Level-order traversal */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // Traverse the array directly
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* Depth-first traversal */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // Return if this position is empty
        if abt.val(i) == nil {
            return
        }
        // Preorder traversal
        if order == "pre" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.left(i), order, res)
        // Inorder traversal
        if order == "in" {
            *res = append(*res, abt.val(i))
        }
        abt.dfs(abt.right(i), order, res)
        // Postorder traversal
        if order == "post" {
            *res = append(*res, abt.val(i))
        }
    }

    /* Preorder traversal */
    func (abt *arrayBinaryTree) preOrder() []any {
        var res []any
        abt.dfs(0, "pre", &res)
        return res
    }

    /* Inorder traversal */
    func (abt *arrayBinaryTree) inOrder() []any {
        var res []any
        abt.dfs(0, "in", &res)
        return res
    }

    /* Postorder traversal */
    func (abt *arrayBinaryTree) postOrder() []any {
        var res []any
        abt.dfs(0, "post", &res)
        return res
    }
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* Constructor */
        init(arr: [Int?]) {
            tree = arr
        }

        /* Length of the backing array */
        func size() -> Int {
            tree.count
        }

        /* Get the value of the node at index i */
        func val(i: Int) -> Int? {
            // If the index is out of bounds, return nil to represent an empty position
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* Get the left child index of the node at index i */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* Get the right child index of the node at index i */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* Get the parent index of the node at index i */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* Level-order traversal */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // Traverse the array directly
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* Depth-first traversal */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // Return if this position is empty
            guard let val = val(i: i) else {
                return
            }
            // Preorder traversal
            if order == "pre" {
                res.append(val)
            }
            dfs(i: left(i: i), order: order, res: &res)
            // Inorder traversal
            if order == "in" {
                res.append(val)
            }
            dfs(i: right(i: i), order: order, res: &res)
            // Postorder traversal
            if order == "post" {
                res.append(val)
            }
        }

        /* Preorder traversal */
        func preOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "pre", res: &res)
            return res
        }

        /* Inorder traversal */
        func inOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "in", res: &res)
            return res
        }

        /* Postorder traversal */
        func postOrder() -> [Int] {
            var res: [Int] = []
            dfs(i: 0, order: "post", res: &res)
            return res
        }
    }
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
        #tree;

        /* Constructor */
        constructor(arr) {
            this.#tree = arr;
        }

        /* Array length */
        size() {
            return this.#tree.length;
        }

        /* Get the value of the node at index i */
        val(i) {
            // If the index is out of bounds, return null to indicate an empty position
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Get the left child index of the node at index i */
        left(i) {
            return 2 * i + 1;
        }

        /* Get the right child index of the node at index i */
        right(i) {
            return 2 * i + 2;
        }

        /* Get the parent index of the node at index i */
        parent(i) {
            return Math.floor((i - 1) / 2); // Floor division
        }

        /* Level-order traversal */
        levelOrder() {
            let res = [];
            // Traverse the array directly
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        #dfs(i, order, res) {
            // Return if this position is empty
            if (this.val(i) === null) return;
            // Preorder traversal
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Inorder traversal
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Postorder traversal
            if (order === 'post') res.push(this.val(i));
        }

        /* Preorder traversal */
        preOrder() {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* Inorder traversal */
        inOrder() {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* Postorder traversal */
        postOrder() {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* Constructor */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* Array length, including empty positions */
        size(): number {
            return this.#tree.length;
        }

        /* Get the value of the node at index i */
        val(i: number): number | null {
            // If the index is out of bounds, return null to indicate an empty position
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Get the left child index of the node at index i */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* Get the right child index of the node at index i */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* Get the parent index of the node at index i */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // Floor division
        }

        /* Level-order traversal */
        levelOrder(): number[] {
            let res = [];
            // Traverse the array directly
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // Return if this position is empty
            if (this.val(i) === null) return;
            // Preorder traversal
            if (order === 'pre') res.push(this.val(i));
            this.#dfs(this.left(i), order, res);
            // Inorder traversal
            if (order === 'in') res.push(this.val(i));
            this.#dfs(this.right(i), order, res);
            // Postorder traversal
            if (order === 'post') res.push(this.val(i));
        }

        /* Preorder traversal */
        preOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'pre', res);
            return res;
        }

        /* Inorder traversal */
        inOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'in', res);
            return res;
        }

        /* Postorder traversal */
        postOrder(): (number | null)[] {
            const res = [];
            this.#dfs(0, 'post', res);
            return res;
        }
    }
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    /* Binary tree class using an array representation */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* Constructor */
      ArrayBinaryTree(this._tree);

      /* Array length, including empty positions */
      int size() {
        return _tree.length;
      }

      /* Get the value of the node at index i */
      int? val(int i) {
        // If the index is out of bounds, return null to indicate an empty position
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* Get the left child index of the node at index i */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* Get the right child index of the node at index i */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* Get the parent index of the node at index i */
      int? parent(int i) {
        return (i - 1) ~/ 2;
      }

      /* Level-order traversal */
      List<int> levelOrder() {
        List<int> res = [];
        for (int i = 0; i < size(); i++) {
          if (val(i) != null) {
            res.add(val(i)!);
          }
        }
        return res;
      }

      /* Depth-first traversal */
      void dfs(int i, String order, List<int?> res) {
        // Return if this position is empty
        if (val(i) == null) {
          return;
        }
        // Preorder traversal
        if (order == 'pre') {
          res.add(val(i));
        }
        dfs(left(i)!, order, res);
        // Inorder traversal
        if (order == 'in') {
          res.add(val(i));
        }
        dfs(right(i)!, order, res);
        // Postorder traversal
        if (order == 'post') {
          res.add(val(i));
        }
      }

      /* Preorder traversal */
      List<int?> preOrder() {
        List<int?> res = [];
        dfs(0, 'pre', res);
        return res;
      }

      /* Inorder traversal */
      List<int?> inOrder() {
        List<int?> res = [];
        dfs(0, 'in', res);
        return res;
      }

      /* Postorder traversal */
      List<int?> postOrder() {
        List<int?> res = [];
        dfs(0, 'post', res);
        return res;
      }
    }
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    /* Binary tree type using an array representation */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* Constructor */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* Number of positions in the array */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* Get the value of the node at index i */
        fn val(&self, i: i32) -> Option<i32> {
            // If the index is out of bounds, return None to represent an empty position
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* Get the left child index of the node at index i */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* Get the right child index of the node at index i */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* Get the parent index of the node at index i */
        fn parent(&self, i: i32) -> i32 {
            (i - 1) / 2
        }

        /* Level-order traversal */
        fn level_order(&self) -> Vec<i32> {
            self.tree.iter().filter_map(|&x| x).collect()
        }

        /* Depth-first traversal */
        fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
            if self.val(i).is_none() {
                return;
            }
            let val = self.val(i).unwrap();
            // Preorder traversal
            if order == "pre" {
                res.push(val);
            }
            self.dfs(self.left(i), order, res);
            // Inorder traversal
            if order == "in" {
                res.push(val);
            }
            self.dfs(self.right(i), order, res);
            // Postorder traversal
            if order == "post" {
                res.push(val);
            }
        }

        /* Preorder traversal */
        fn pre_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "pre", &mut res);
            res
        }

        /* Inorder traversal */
        fn in_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "in", &mut res);
            res
        }

        /* Postorder traversal */
        fn post_order(&self) -> Vec<i32> {
            let mut res = vec![];
            self.dfs(0, "post", &mut res);
            res
        }
    }
    ```

=== "C"

    ```c title="array_binary_tree.c"
    /* Binary tree structure represented by an array */
    typedef struct {
        int *tree;
        int size;
    } ArrayBinaryTree;

    /* Constructor */
    ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
        ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
        abt->tree = malloc(sizeof(int) * arrSize);
        memcpy(abt->tree, arr, sizeof(int) * arrSize);
        abt->size = arrSize;
        return abt;
    }

    /* Destructor */
    void delArrayBinaryTree(ArrayBinaryTree *abt) {
        free(abt->tree);
        free(abt);
    }

    /* Array length */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* Get the value of the node at index i */
    int val(ArrayBinaryTree *abt, int i) {
        // If the index is out of bounds, return INT_MAX to represent an empty position
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* Level-order traversal */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // Traverse the array directly
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* Depth-first traversal */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // Return if this position is empty
        if (val(abt, i) == INT_MAX)
            return;
        // Preorder traversal
        if (strcmp(order, "pre") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, left(i), order, res, index);
        // Inorder traversal
        if (strcmp(order, "in") == 0)
            res[(*index)++] = val(abt, i);
        dfs(abt, right(i), order, res, index);
        // Postorder traversal
        if (strcmp(order, "post") == 0)
            res[(*index)++] = val(abt, i);
    }

    /* Preorder traversal */
    int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "pre", res, &index);
        *returnSize = index;
        return res;
    }

    /* Inorder traversal */
    int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        dfs(abt, 0, "in", res, &index);
        *returnSize = index;
        return res;
    }

    /* Postorder traversal */
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
    /* Binary tree class using an array representation */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* List size */
        fun size(): Int {
            return tree.size
        }

        /* Get the value of the node at index i */
        fun _val(i: Int): Int? {
            // If the index is out of bounds, return null to represent an empty position
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* Get the left child index of the node at index i */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Get the right child index of the node at index i */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Get the parent index of the node at index i */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* Level-order traversal */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // Traverse the array directly
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* Depth-first traversal */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // Return if this position is empty
            if (_val(i) == null)
                return
            // Preorder traversal
            if ("pre" == order)
                res.add(_val(i))
            dfs(left(i), order, res)
            // Inorder traversal
            if ("in" == order)
                res.add(_val(i))
            dfs(right(i), order, res)
            // Postorder traversal
            if ("post" == order)
                res.add(_val(i))
        }

        /* Preorder traversal */
        fun preOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "pre", res)
            return res
        }

        /* Inorder traversal */
        fun inOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "in", res)
            return res
        }

        /* Postorder traversal */
        fun postOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            dfs(0, "post", res)
            return res
        }
    }
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    ### Binary tree class using an array representation ###
    class ArrayBinaryTree
      ### Constructor ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### Length of the array representation ###
      def size
        @tree.length
      end

      ### Get the value of the node at index i ###
      def val(i)
        # If the index is out of bounds, return nil to indicate an empty position
        return if i < 0 || i >= size

        @tree[i]
      end

      ### Get the left child index of the node at index i ###
      def left(i)
        2 * i + 1
      end

      ### Get the right child index of the node at index i ###
      def right(i)
        2 * i + 2
      end

      ### Get the parent index of the node at index i ###
      def parent(i)
        (i - 1) / 2
      end

      ### Level-order traversal ###
      def level_order
        @res = []

        # Traverse the array directly
        for i in 0...size
          @res << val(i) unless val(i).nil?
        end

        @res
      end

      ### Depth-first traversal ###
      def dfs(i, order)
        return if val(i).nil?
        # Preorder traversal
        @res << val(i) if order == :pre
        dfs(left(i), order)
        # Inorder traversal
        @res << val(i) if order == :in
        dfs(right(i), order)
        # Postorder traversal
        @res << val(i) if order == :post
      end

      ### Preorder traversal ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### Inorder traversal ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### Postorder traversal ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22Binary%20tree%20class%20using%20an%20array%20representation%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Length%20of%20the%20backing%20list%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20value%20of%20the%20node%20at%20index%20i%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Level-order%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20Traverse%20the%20array%20directly%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Depth-first%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Preorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20Inorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20Postorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Preorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Inorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Postorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20Access%20a%20node%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20Traverse%20the%20tree%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20ArrayBinaryTree%3A%0A%20%20%20%20%22%22%22Binary%20tree%20class%20using%20an%20array%20representation%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20arr%3A%20list%5Bint%20%7C%20None%5D%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._tree%20%3D%20list%28arr%29%0A%0A%20%20%20%20def%20size%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Length%20of%20the%20backing%20list%22%22%22%0A%20%20%20%20%20%20%20%20return%20len%28self._tree%29%0A%0A%20%20%20%20def%20val%28self,%20i%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20value%20of%20the%20node%20at%20index%20i%22%22%22%0A%20%20%20%20%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20self.size%28%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%20%20%20%20return%20self._tree%5Bi%5D%0A%0A%20%20%20%20def%20left%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20left%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%201%0A%0A%20%20%20%20def%20right%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20right%20child%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%202%20%2A%20i%20%2B%202%0A%0A%20%20%20%20def%20parent%28self,%20i%3A%20int%29%20-%3E%20int%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Get%20the%20parent%20index%22%22%22%0A%20%20%20%20%20%20%20%20return%20%28i%20-%201%29%20//%202%0A%0A%20%20%20%20def%20level_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Level-order%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20%23%20Traverse%20the%20array%20directly%0A%20%20%20%20%20%20%20%20for%20i%20in%20range%28self.size%28%29%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20dfs%28self,%20i%3A%20int,%20order%3A%20str%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Depth-first%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20if%20self.val%28i%29%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Preorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22pre%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.left%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20Inorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22in%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%20%20%20%20%20%20%20%20self.dfs%28self.right%28i%29,%20order%29%0A%20%20%20%20%20%20%20%20%23%20Postorder%20traversal%0A%20%20%20%20%20%20%20%20if%20order%20%3D%3D%20%22post%22%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self.res.append%28self.val%28i%29%29%0A%0A%20%20%20%20def%20pre_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Preorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22pre%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20in_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Inorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22in%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%20%20%20%20def%20post_order%28self%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%20%20%20%20%22%22%22Postorder%20traversal%22%22%22%0A%20%20%20%20%20%20%20%20self.res%20%3D%20%5B%5D%0A%20%20%20%20%20%20%20%20self.dfs%280,%20order%3D%22post%22%29%0A%20%20%20%20%20%20%20%20return%20self.res%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20tree%0A%20%20%20%20arr%20%3D%20%5B1,%202,%203,%204,%20None,%206,%20None%5D%0A%20%20%20%20abt%20%3D%20ArrayBinaryTree%28arr%29%0A%0A%20%20%20%20%23%20Access%20a%20node%0A%20%20%20%20i%20%3D%201%0A%20%20%20%20l,%20r,%20p%20%3D%20abt.left%28i%29,%20abt.right%28i%29,%20abt.parent%28i%29%0A%0A%20%20%20%20%23%20Traverse%20the%20tree%0A%20%20%20%20res%20%3D%20abt.level_order%28%29%0A%20%20%20%20res%20%3D%20abt.pre_order%28%29%0A%20%20%20%20res%20%3D%20abt.in_order%28%29%0A%20%20%20%20res%20%3D%20abt.post_order%28%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 7.3.3 &nbsp; Strengths and limitations

Array representation offers the following advantages.

- Contiguous memory is cache-friendly, making access and traversal fast.
- No pointers need to be stored, saving space.
- Nodes can be accessed randomly by index.

However, it also has limitations.

- Arrays require contiguous memory, making them unsuitable for extremely large trees.
- Adding and removing nodes requires array insertion and deletion operations, which are inefficient.
- If the tree has many missing nodes, actual node data occupies only a small fraction of the array, wasting space.
