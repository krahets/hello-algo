---
comments: true
---

# 7.3 &nbsp; Array Representation of Binary Trees

Under the linked list representation, the storage unit of a binary tree is a node `TreeNode`, and nodes are connected by pointers. The previous section introduced the basic operations of binary trees under the linked list representation.

So, can we use an array to represent a binary tree? The answer is yes.

## 7.3.1 &nbsp; Representing Perfect Binary Trees

Let's analyze a simple case first. Given a perfect binary tree, we store all nodes in an array according to the order of level-order traversal, where each node corresponds to a unique array index.

Based on the characteristics of level-order traversal, we can derive a "mapping formula" between parent node index and child node indices: **If a node's index is $i$, then its left child index is $2i + 1$ and its right child index is $2i + 2$**. Figure 7-12 shows the mapping relationships between various node indices.

![Array representation of a perfect binary tree](array_representation_of_tree.assets/array_representation_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-12 &nbsp; Array representation of a perfect binary tree </p>

**The mapping formula plays a role similar to the node references (pointers) in linked lists**. Given any node in the array, we can access its left (right) child node using the mapping formula.

## 7.3.2 &nbsp; Representing Any Binary Tree

Perfect binary trees are a special case; in the middle levels of a binary tree, there are typically many `None` values. Since the level-order traversal sequence does not include these `None` values, we cannot infer the number and distribution of `None` values based on this sequence alone. **This means multiple binary tree structures can correspond to the same level-order traversal sequence**.

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
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### Array representation of a binary tree ###
    # Using nil to represent empty slots
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![Array representation of any type of binary tree](array_representation_of_tree.assets/array_representation_with_empty.png){ class="animation-figure" }

<p align="center"> Figure 7-14 &nbsp; Array representation of any type of binary tree </p>

It's worth noting that **complete binary trees are very well-suited for array representation**. Recalling the definition of a complete binary tree, `None` only appears at the bottom level and towards the right, **meaning all `None` values must appear at the end of the level-order traversal sequence**.

This means that when using an array to represent a complete binary tree, it's possible to omit storing all `None` values, which is very convenient. Figure 7-15 gives an example.

![Array representation of a complete binary tree](array_representation_of_tree.assets/array_representation_complete_binary_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-15 &nbsp; Array representation of a complete binary tree </p>

The following code implements a binary tree based on array representation, including the following operations:

- Given a certain node, obtain its value, left (right) child node, and parent node.
- Obtain the preorder, inorder, postorder, and level-order traversal sequences.

=== "Python"

    ```python title="array_binary_tree.py"
    class ArrayBinaryTree:
        """Binary tree class represented by array"""

        def __init__(self, arr: list[int | None]):
            """Constructor"""
            self._tree = list(arr)

        def size(self):
            """List capacity"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """Get value of node at index i"""
            # If index is out of bounds, return None, representing empty position
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """Get index of left child node of node at index i"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """Get index of right child node of node at index i"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """Get index of parent node of node at index i"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """Level-order traversal"""
            self.res = []
            # Traverse array directly
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
      public:
        /* Constructor */
        ArrayBinaryTree(vector<int> arr) {
            tree = arr;
        }

        /* List capacity */
        int size() {
            return tree.size();
        }

        /* Get value of node at index i */
        int val(int i) {
            // Return INT_MAX if index out of bounds, representing empty position
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* Get index of left child node of node at index i */
        int left(int i) {
            return 2 * i + 1;
        }

        /* Get index of right child node of node at index i */
        int right(int i) {
            return 2 * i + 2;
        }

        /* Get index of parent node of node at index i */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        vector<int> levelOrder() {
            vector<int> res;
            // Traverse array directly
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
            // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
        private List<Integer> tree;

        /* Constructor */
        public ArrayBinaryTree(List<Integer> arr) {
            tree = new ArrayList<>(arr);
        }

        /* List capacity */
        public int size() {
            return tree.size();
        }

        /* Get value of node at index i */
        public Integer val(int i) {
            // If index out of bounds, return null to represent empty position
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* Get index of left child node of node at index i */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* Get index of right child node of node at index i */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* Get index of parent node of node at index i */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // Traverse array directly
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        private void dfs(Integer i, String order, List<Integer> res) {
            // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree(List<int?> arr) {
        List<int?> tree = new(arr);

        /* List capacity */
        public int Size() {
            return tree.Count;
        }

        /* Get value of node at index i */
        public int? Val(int i) {
            // If index out of bounds, return null to represent empty position
            if (i < 0 || i >= Size())
                return null;
            return tree[i];
        }

        /* Get index of left child node of node at index i */
        public int Left(int i) {
            return 2 * i + 1;
        }

        /* Get index of right child node of node at index i */
        public int Right(int i) {
            return 2 * i + 2;
        }

        /* Get index of parent node of node at index i */
        public int Parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        public List<int> LevelOrder() {
            List<int> res = [];
            // Traverse array directly
            for (int i = 0; i < Size(); i++) {
                if (Val(i).HasValue)
                    res.Add(Val(i)!.Value);
            }
            return res;
        }

        /* Depth-first traversal */
        void DFS(int i, string order, List<int> res) {
            // If empty position, return
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
    /* Binary tree class represented by array */
    type arrayBinaryTree struct {
        tree []any
    }

    /* Constructor */
    func newArrayBinaryTree(arr []any) *arrayBinaryTree {
        return &arrayBinaryTree{
            tree: arr,
        }
    }

    /* List capacity */
    func (abt *arrayBinaryTree) size() int {
        return len(abt.tree)
    }

    /* Get value of node at index i */
    func (abt *arrayBinaryTree) val(i int) any {
        // If index out of bounds, return null to represent empty position
        if i < 0 || i >= abt.size() {
            return nil
        }
        return abt.tree[i]
    }

    /* Get index of left child node of node at index i */
    func (abt *arrayBinaryTree) left(i int) int {
        return 2*i + 1
    }

    /* Get index of right child node of node at index i */
    func (abt *arrayBinaryTree) right(i int) int {
        return 2*i + 2
    }

    /* Get index of parent node of node at index i */
    func (abt *arrayBinaryTree) parent(i int) int {
        return (i - 1) / 2
    }

    /* Level-order traversal */
    func (abt *arrayBinaryTree) levelOrder() []any {
        var res []any
        // Traverse array directly
        for i := 0; i < abt.size(); i++ {
            if abt.val(i) != nil {
                res = append(res, abt.val(i))
            }
        }
        return res
    }

    /* Depth-first traversal */
    func (abt *arrayBinaryTree) dfs(i int, order string, res *[]any) {
        // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
        private var tree: [Int?]

        /* Constructor */
        init(arr: [Int?]) {
            tree = arr
        }

        /* List capacity */
        func size() -> Int {
            tree.count
        }

        /* Get value of node at index i */
        func val(i: Int) -> Int? {
            // If index out of bounds, return null to represent empty position
            if i < 0 || i >= size() {
                return nil
            }
            return tree[i]
        }

        /* Get index of left child node of node at index i */
        func left(i: Int) -> Int {
            2 * i + 1
        }

        /* Get index of right child node of node at index i */
        func right(i: Int) -> Int {
            2 * i + 2
        }

        /* Get index of parent node of node at index i */
        func parent(i: Int) -> Int {
            (i - 1) / 2
        }

        /* Level-order traversal */
        func levelOrder() -> [Int] {
            var res: [Int] = []
            // Traverse array directly
            for i in 0 ..< size() {
                if let val = val(i: i) {
                    res.append(val)
                }
            }
            return res
        }

        /* Depth-first traversal */
        private func dfs(i: Int, order: String, res: inout [Int]) {
            // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
        #tree;

        /* Constructor */
        constructor(arr) {
            this.#tree = arr;
        }

        /* List capacity */
        size() {
            return this.#tree.length;
        }

        /* Get value of node at index i */
        val(i) {
            // If index out of bounds, return null to represent empty position
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Get index of left child node of node at index i */
        left(i) {
            return 2 * i + 1;
        }

        /* Get index of right child node of node at index i */
        right(i) {
            return 2 * i + 2;
        }

        /* Get index of parent node of node at index i */
        parent(i) {
            return Math.floor((i - 1) / 2); // Floor division
        }

        /* Level-order traversal */
        levelOrder() {
            let res = [];
            // Traverse array directly
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        #dfs(i, order, res) {
            // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
        #tree: (number | null)[];

        /* Constructor */
        constructor(arr: (number | null)[]) {
            this.#tree = arr;
        }

        /* List capacity */
        size(): number {
            return this.#tree.length;
        }

        /* Get value of node at index i */
        val(i: number): number | null {
            // If index out of bounds, return null to represent empty position
            if (i < 0 || i >= this.size()) return null;
            return this.#tree[i];
        }

        /* Get index of left child node of node at index i */
        left(i: number): number {
            return 2 * i + 1;
        }

        /* Get index of right child node of node at index i */
        right(i: number): number {
            return 2 * i + 2;
        }

        /* Get index of parent node of node at index i */
        parent(i: number): number {
            return Math.floor((i - 1) / 2); // Floor division
        }

        /* Level-order traversal */
        levelOrder(): number[] {
            let res = [];
            // Traverse array directly
            for (let i = 0; i < this.size(); i++) {
                if (this.val(i) !== null) res.push(this.val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        #dfs(i: number, order: Order, res: (number | null)[]): void {
            // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree {
      late List<int?> _tree;

      /* Constructor */
      ArrayBinaryTree(this._tree);

      /* List capacity */
      int size() {
        return _tree.length;
      }

      /* Get value of node at index i */
      int? val(int i) {
        // If index out of bounds, return null to represent empty position
        if (i < 0 || i >= size()) {
          return null;
        }
        return _tree[i];
      }

      /* Get index of left child node of node at index i */
      int? left(int i) {
        return 2 * i + 1;
      }

      /* Get index of right child node of node at index i */
      int? right(int i) {
        return 2 * i + 2;
      }

      /* Get index of parent node of node at index i */
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
        // If empty position, return
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
    /* Binary tree class represented by array */
    struct ArrayBinaryTree {
        tree: Vec<Option<i32>>,
    }

    impl ArrayBinaryTree {
        /* Constructor */
        fn new(arr: Vec<Option<i32>>) -> Self {
            Self { tree: arr }
        }

        /* List capacity */
        fn size(&self) -> i32 {
            self.tree.len() as i32
        }

        /* Get value of node at index i */
        fn val(&self, i: i32) -> Option<i32> {
            // If index is out of bounds, return None, representing empty position
            if i < 0 || i >= self.size() {
                None
            } else {
                self.tree[i as usize]
            }
        }

        /* Get index of left child node of node at index i */
        fn left(&self, i: i32) -> i32 {
            2 * i + 1
        }

        /* Get index of right child node of node at index i */
        fn right(&self, i: i32) -> i32 {
            2 * i + 2
        }

        /* Get index of parent node of node at index i */
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
    /* Binary tree structure in array representation */
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

    /* List capacity */
    int size(ArrayBinaryTree *abt) {
        return abt->size;
    }

    /* Get value of node at index i */
    int val(ArrayBinaryTree *abt, int i) {
        // Return INT_MAX if index out of bounds, representing empty position
        if (i < 0 || i >= size(abt))
            return INT_MAX;
        return abt->tree[i];
    }

    /* Level-order traversal */
    int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
        int *res = (int *)malloc(sizeof(int) * size(abt));
        int index = 0;
        // Traverse array directly
        for (int i = 0; i < size(abt); i++) {
            if (val(abt, i) != INT_MAX)
                res[index++] = val(abt, i);
        }
        *returnSize = index;
        return res;
    }

    /* Depth-first traversal */
    void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
        // If empty position, return
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
    /* Binary tree class represented by array */
    class ArrayBinaryTree(val tree: MutableList<Int?>) {
        /* List capacity */
        fun size(): Int {
            return tree.size
        }

        /* Get value of node at index i */
        fun _val(i: Int): Int? {
            // If index out of bounds, return null to represent empty position
            if (i < 0 || i >= size()) return null
            return tree[i]
        }

        /* Get index of left child node of node at index i */
        fun left(i: Int): Int {
            return 2 * i + 1
        }

        /* Get index of right child node of node at index i */
        fun right(i: Int): Int {
            return 2 * i + 2
        }

        /* Get index of parent node of node at index i */
        fun parent(i: Int): Int {
            return (i - 1) / 2
        }

        /* Level-order traversal */
        fun levelOrder(): MutableList<Int?> {
            val res = mutableListOf<Int?>()
            // Traverse array directly
            for (i in 0..<size()) {
                if (_val(i) != null)
                    res.add(_val(i))
            }
            return res
        }

        /* Depth-first traversal */
        fun dfs(i: Int, order: String, res: MutableList<Int?>) {
            // If empty position, return
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
    ### Array representation of binary tree class ###
    class ArrayBinaryTree
      ### Constructor ###
      def initialize(arr)
        @tree = arr.to_a
      end

      ### List capacity ###
      def size
        @tree.length
      end

      ### Get value of node at index i ###
      def val(i)
        # Return nil if index out of bounds, representing empty position
        return if i < 0 || i >= size

        @tree[i]
      end

      ### Get left child index of node at index i ###
      def left(i)
        2 * i + 1
      end

      ### Get right child index of node at index i ###
      def right(i)
        2 * i + 2
      end

      ### Get parent node index of node at index i ###
      def parent(i)
        (i - 1) / 2
      end

      ### Level-order traversal ###
      def level_order
        @res = []

        # Traverse array directly
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

      ### Pre-order traversal ###
      def pre_order
        @res = []
        dfs(0, :pre)
        @res
      end

      ### In-order traversal ###
      def in_order
        @res = []
        dfs(0, :in)
        @res
      end

      ### Post-order traversal ###
      def post_order
        @res = []
        dfs(0, :post)
        @res
      end
    end
    ```

## 7.3.3 &nbsp; Advantages and Limitations

The array representation of binary trees has the following advantages:

- Arrays are stored in contiguous memory space, which is cache-friendly, allowing faster access and traversal.
- It does not require storing pointers, which saves space.
- It allows random access to nodes.

However, the array representation also has some limitations:

- Array storage requires contiguous memory space, so it is not suitable for storing trees with a large amount of data.
- Adding or removing nodes requires array insertion and deletion operations, which have lower efficiency.
- When there are many `None` values in the binary tree, the proportion of node data contained in the array is low, leading to lower space utilization.
