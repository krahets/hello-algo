---
comments: true
---

# 12.3 &nbsp; Building binary tree problem

!!! question

    Given the preorder traversal `preorder` and inorder traversal `inorder` of a binary tree, construct the binary tree and return the root node of the binary tree. Assume that there are no duplicate values in the nodes of the binary tree (as shown in the diagram below).

![Example data for building a binary tree](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> Figure 12-5 &nbsp; Example data for building a binary tree </p>

### 1. &nbsp; Determining if it is a divide and conquer problem

The original problem of constructing a binary tree from `preorder` and `inorder` is a typical divide and conquer problem.

- **The problem can be decomposed**: From the perspective of divide and conquer, we can divide the original problem into two subproblems: building the left subtree and building the right subtree, plus one operation: initializing the root node. For each subtree (subproblem), we can still use the above division method, dividing it into smaller subtrees (subproblems), until the smallest subproblem (empty subtree) is reached.
- **The subproblems are independent**: The left and right subtrees are independent of each other, with no overlap. When building the left subtree, we only need to focus on the parts of the inorder and preorder traversals that correspond to the left subtree. The same applies to the right subtree.
- **Solutions to subproblems can be combined**: Once the solutions for the left and right subtrees (solutions to subproblems) are obtained, we can link them to the root node to obtain the solution to the original problem.

### 2. &nbsp; How to divide the subtrees

Based on the above analysis, this problem can be solved using divide and conquer, **but how do we use the preorder traversal `preorder` and inorder traversal `inorder` to divide the left and right subtrees?**

By definition, `preorder` and `inorder` can be divided into three parts.

- Preorder traversal: `[ Root | Left Subtree | Right Subtree ]`, for example, the tree in the diagram corresponds to `[ 3 | 9 | 2 1 7 ]`.
- Inorder traversal: `[ Left Subtree | Root | Right Subtree ]`, for example, the tree in the diagram corresponds to `[ 9 | 3 | 1 2 7 ]`.

Using the data in the diagram above, we can obtain the division results as shown in the steps below.

1. The first element 3 in the preorder traversal is the value of the root node.
2. Find the index of the root node 3 in `inorder`, and use this index to divide `inorder` into `[ 9 | 3 ｜ 1 2 7 ]`.
3. Based on the division results of `inorder`, it is easy to determine the number of nodes in the left and right subtrees as 1 and 3, respectively, thus dividing `preorder` into `[ 3 | 9 | 2 1 7 ]`.

![Dividing the subtrees in preorder and inorder traversals](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> Figure 12-6 &nbsp; Dividing the subtrees in preorder and inorder traversals </p>

### 3. &nbsp; Describing subtree intervals based on variables

Based on the above division method, **we have now obtained the index intervals of the root, left subtree, and right subtree in `preorder` and `inorder`**. To describe these index intervals, we need the help of several pointer variables.

- Let the index of the current tree's root node in `preorder` be denoted as $i$.
- Let the index of the current tree's root node in `inorder` be denoted as $m$.
- Let the index interval of the current tree in `inorder` be denoted as $[l, r]$.

As shown in Table 12-1, the above variables can represent the index of the root node in `preorder` as well as the index intervals of the subtrees in `inorder`.

<p align="center"> Table 12-1 &nbsp; Indexes of the root node and subtrees in preorder and inorder traversals </p>

<div class="center-table" markdown>

|               | Root node index in `preorder` | Subtree index interval in `inorder` |
| ------------- | ----------------------------- | ----------------------------------- |
| Current tree  | $i$                           | $[l, r]$                            |
| Left subtree  | $i + 1$                       | $[l, m-1]$                          |
| Right subtree | $i + 1 + (m - l)$             | $[m+1, r]$                          |

</div>

Please note, the meaning of $(m-l)$ in the right subtree root index is "the number of nodes in the left subtree", which is suggested to be understood in conjunction with the diagram below.

![Indexes of the root node and left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> Figure 12-7 &nbsp; Indexes of the root node and left and right subtrees </p>

### 4. &nbsp; Code implementation

To improve the efficiency of querying $m$, we use a hash table `hmap` to store the mapping of elements in `inorder` to their indexes:

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """Build binary tree: Divide and conquer"""
        # Terminate when subtree interval is empty
        if r - l < 0:
            return None
        # Initialize root node
        root = TreeNode(preorder[i])
        # Query m to divide left and right subtrees
        m = inorder_map[preorder[i]]
        # Subproblem: build left subtree
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # Subproblem: build right subtree
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # Return root node
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """Build binary tree"""
        # Initialize hash table, storing in-order elements to indices mapping
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Java"

    ```java title="build_tree.java"
    /* Build binary tree: Divide and conquer */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Terminate when subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize root node
        TreeNode root = new TreeNode(preorder[i]);
        // Query m to divide left and right subtrees
        int m = inorderMap.get(preorder[i]);
        // Subproblem: build left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return root node
        return root;
    }

    /* Build binary tree */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // Initialize hash table, storing in-order elements to indices mapping
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
    [class]{build_tree}-[func]{DFS}

    [class]{build_tree}-[func]{BuildTree}
    ```

=== "Go"

    ```go title="build_tree.go"
    [class]{}-[func]{dfsBuildTree}

    [class]{}-[func]{buildTree}
    ```

=== "Swift"

    ```swift title="build_tree.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "JS"

    ```javascript title="build_tree.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "TS"

    ```typescript title="build_tree.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Dart"

    ```dart title="build_tree.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Rust"

    ```rust title="build_tree.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{build_tree}
    ```

=== "C"

    ```c title="build_tree.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Kotlin"

    ```kotlin title="build_tree.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

=== "Ruby"

    ```ruby title="build_tree.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{build_tree}
    ```

=== "Zig"

    ```zig title="build_tree.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

The diagram below shows the recursive process of building the binary tree, where each node is established during the "descending" process, and each edge (reference) is established during the "ascending" process.

=== "<1>"
    ![Recursive process of building a binary tree](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 12-8 &nbsp; Recursive process of building a binary tree </p>

Each recursive function's division results of `preorder` and `inorder` are shown in the diagram below.

![Division results in each recursive function](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> Figure 12-9 &nbsp; Division results in each recursive function </p>

Assuming the number of nodes in the tree is $n$, initializing each node (executing a recursive function `dfs()`) takes $O(1)$ time. **Thus, the overall time complexity is $O(n)$**.

The hash table stores the mapping of `inorder` elements to their indexes, with a space complexity of $O(n)$. In the worst case, when the binary tree degenerates into a linked list, the recursive depth reaches $n$, using $O(n)$ stack frame space. **Therefore, the overall space complexity is $O(n)$**.
