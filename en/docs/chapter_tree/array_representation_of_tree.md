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
        """Array-based binary tree class"""

        def __init__(self, arr: list[int | None]):
            """Constructor"""
            self._tree = list(arr)

        def size(self):
            """List capacity"""
            return len(self._tree)

        def val(self, i: int) -> int | None:
            """Get the value of the node at index i"""
            # If the index is out of bounds, return None, representing a vacancy
            if i < 0 or i >= self.size():
                return None
            return self._tree[i]

        def left(self, i: int) -> int | None:
            """Get the index of the left child of the node at index i"""
            return 2 * i + 1

        def right(self, i: int) -> int | None:
            """Get the index of the right child of the node at index i"""
            return 2 * i + 2

        def parent(self, i: int) -> int | None:
            """Get the index of the parent of the node at index i"""
            return (i - 1) // 2

        def level_order(self) -> list[int]:
            """Level-order traversal"""
            self.res = []
            # Traverse array
            for i in range(self.size()):
                if self.val(i) is not None:
                    self.res.append(self.val(i))
            return self.res

        def dfs(self, i: int, order: str):
            """Depth-first traversal"""
            if self.val(i) is None:
                return
            # Pre-order traversal
            if order == "pre":
                self.res.append(self.val(i))
            self.dfs(self.left(i), order)
            # In-order traversal
            if order == "in":
                self.res.append(self.val(i))
            self.dfs(self.right(i), order)
            # Post-order traversal
            if order == "post":
                self.res.append(self.val(i))

        def pre_order(self) -> list[int]:
            """Pre-order traversal"""
            self.res = []
            self.dfs(0, order="pre")
            return self.res

        def in_order(self) -> list[int]:
            """In-order traversal"""
            self.res = []
            self.dfs(0, order="in")
            return self.res

        def post_order(self) -> list[int]:
            """Post-order traversal"""
            self.res = []
            self.dfs(0, order="post")
            return self.res
    ```

=== "C++"

    ```cpp title="array_binary_tree.cpp"
    /* Array-based binary tree class */
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

        /* Get the value of the node at index i */
        int val(int i) {
            // If index is out of bounds, return INT_MAX, representing a null
            if (i < 0 || i >= size())
                return INT_MAX;
            return tree[i];
        }

        /* Get the index of the left child of the node at index i */
        int left(int i) {
            return 2 * i + 1;
        }

        /* Get the index of the right child of the node at index i */
        int right(int i) {
            return 2 * i + 2;
        }

        /* Get the index of the parent of the node at index i */
        int parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        vector<int> levelOrder() {
            vector<int> res;
            // Traverse array
            for (int i = 0; i < size(); i++) {
                if (val(i) != INT_MAX)
                    res.push_back(val(i));
            }
            return res;
        }

        /* Pre-order traversal */
        vector<int> preOrder() {
            vector<int> res;
            dfs(0, "pre", res);
            return res;
        }

        /* In-order traversal */
        vector<int> inOrder() {
            vector<int> res;
            dfs(0, "in", res);
            return res;
        }

        /* Post-order traversal */
        vector<int> postOrder() {
            vector<int> res;
            dfs(0, "post", res);
            return res;
        }

      private:
        vector<int> tree;

        /* Depth-first traversal */
        void dfs(int i, string order, vector<int> &res) {
            // If it is an empty spot, return
            if (val(i) == INT_MAX)
                return;
            // Pre-order traversal
            if (order == "pre")
                res.push_back(val(i));
            dfs(left(i), order, res);
            // In-order traversal
            if (order == "in")
                res.push_back(val(i));
            dfs(right(i), order, res);
            // Post-order traversal
            if (order == "post")
                res.push_back(val(i));
        }
    };
    ```

=== "Java"

    ```java title="array_binary_tree.java"
    /* Array-based binary tree class */
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

        /* Get the value of the node at index i */
        public Integer val(int i) {
            // If the index is out of bounds, return null, representing an empty spot
            if (i < 0 || i >= size())
                return null;
            return tree.get(i);
        }

        /* Get the index of the left child of the node at index i */
        public Integer left(int i) {
            return 2 * i + 1;
        }

        /* Get the index of the right child of the node at index i */
        public Integer right(int i) {
            return 2 * i + 2;
        }

        /* Get the index of the parent of the node at index i */
        public Integer parent(int i) {
            return (i - 1) / 2;
        }

        /* Level-order traversal */
        public List<Integer> levelOrder() {
            List<Integer> res = new ArrayList<>();
            // Traverse array
            for (int i = 0; i < size(); i++) {
                if (val(i) != null)
                    res.add(val(i));
            }
            return res;
        }

        /* Depth-first traversal */
        private void dfs(Integer i, String order, List<Integer> res) {
            // If it is an empty spot, return
            if (val(i) == null)
                return;
            // Pre-order traversal
            if ("pre".equals(order))
                res.add(val(i));
            dfs(left(i), order, res);
            // In-order traversal
            if ("in".equals(order))
                res.add(val(i));
            dfs(right(i), order, res);
            // Post-order traversal
            if ("post".equals(order))
                res.add(val(i));
        }

        /* Pre-order traversal */
        public List<Integer> preOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "pre", res);
            return res;
        }

        /* In-order traversal */
        public List<Integer> inOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "in", res);
            return res;
        }

        /* Post-order traversal */
        public List<Integer> postOrder() {
            List<Integer> res = new ArrayList<>();
            dfs(0, "post", res);
            return res;
        }
    }
    ```

=== "C#"

    ```csharp title="array_binary_tree.cs"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Go"

    ```go title="array_binary_tree.go"
    [class]{arrayBinaryTree}-[func]{}
    ```

=== "Swift"

    ```swift title="array_binary_tree.swift"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "JS"

    ```javascript title="array_binary_tree.js"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "TS"

    ```typescript title="array_binary_tree.ts"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Dart"

    ```dart title="array_binary_tree.dart"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Rust"

    ```rust title="array_binary_tree.rs"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "C"

    ```c title="array_binary_tree.c"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Kotlin"

    ```kotlin title="array_binary_tree.kt"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Ruby"

    ```ruby title="array_binary_tree.rb"
    [class]{ArrayBinaryTree}-[func]{}
    ```

=== "Zig"

    ```zig title="array_binary_tree.zig"
    [class]{ArrayBinaryTree}-[func]{}
    ```

## 7.3.3 &nbsp; Advantages and limitations

The array representation of binary trees has the following advantages:

- Arrays are stored in contiguous memory spaces, which is cache-friendly and allows for faster access and traversal.
- It does not require storing pointers, which saves space.
- It allows random access to nodes.

However, the array representation also has some limitations:

- Array storage requires contiguous memory space, so it is not suitable for storing trees with a large amount of data.
- Adding or deleting nodes requires array insertion and deletion operations, which are less efficient.
- When there are many `None` values in the binary tree, the proportion of node data contained in the array is low, leading to lower space utilization.
