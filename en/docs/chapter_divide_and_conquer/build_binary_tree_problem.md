---
comments: true
---

# 12.3 &nbsp; Building a binary tree problem

!!! question

    Given the pre-order traversal `preorder` sequence and the in-order traversal `inorder` sequence of a binary tree, construct the binary tree and return its root node. Assume there are no duplicate node values in the binary tree (as shown in Figure 12-5).

![Example data for building a binary tree](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> Figure 12-5 &nbsp; Example data for building a binary tree </p>

### 1. &nbsp; Determining if it is a divide-and-conquer problem

The original problem of building a binary tree from the `preorder` and the `inorder` sequences is a typical divide-and-conquer problem.

- **The problem can be decomposed**: From the perspective of divide-and-conquer, we can divide the original problem into two subproblems—building the left subtree and building the right subtree—plus one operation of initializing the root node. For each subtree (subproblem), we continue applying the same approach, partitioning it into smaller subtrees (subproblems), until reaching the smallest subproblem (an empty subtree).
- **The subproblems are independent**: The left and right subtrees do not overlap. When building the left subtree, we only need the segments of the in-order and pre-order traversals that correspond to the left subtree. The same approach applies to the right subtree.
- **Solutions to subproblems can be combined**: Once we have constructed the left and right subtrees (the subproblem solutions), we can attach them to the root node to obtain the solution to the original problem.

### 2. &nbsp; How to divide the subtrees

Based on the above analysis, this problem can be solved using divide-and-conquer. **However, how do we use the pre-order traversal `preorder` sequence and the in-order traversal `inorder` sequence to divide the left and right subtrees?**

By definition, both the `preorder` and `inorder` sequences can be divided into three parts:

- Pre-order traversal: `[ Root | Left Subtree | Right Subtree ]`. For example, in the figure, the tree corresponds to `[ 3 | 9 | 2 1 7 ]`.
- In-order traversal: `[ Left Subtree | Root | Right Subtree ]`. For example, in the figure, the tree corresponds to `[ 9 | 3 | 1 2 7 ]`.

Using the data from the preceding figure, we can follow the steps shown in the next figure to obtain the division results:

1. The first element 3 in the pre-order traversal is the value of the root node.
2. Find the index of the root node 3 in the `inorder` sequence, and use this index to split `inorder` into `[ 9 | 3 ｜ 1 2 7 ]`.
3. According to the split of the `inorder` sequence, it is straightforward to determine that the left and right subtrees contain 1 and 3 nodes, respectively, so we can split the `preorder` sequence into `[ 3 | 9 | 2 1 7 ]` accordingly.

![Dividing the subtrees in pre-order and in-order traversals](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> Figure 12-6 &nbsp; Dividing the subtrees in pre-order and in-order traversals </p>

### 3. &nbsp; Describing subtree ranges based on variables

Based on the above division method, **we have now obtained the index ranges of the root, left subtree, and right subtree in the `preorder` and `inorder` sequences**. To describe these index ranges, we use several pointer variables.

- Let the index of the current tree's root node in the `preorder` sequence be denoted as $i$.
- Let the index of the current tree's root node in the `inorder` sequence be denoted as $m$.
- Let the index range of the current tree in the `inorder` sequence be denoted as $[l, r]$.

As shown in Table 12-1, these variables represent the root node’s index in the `preorder` sequence and the index ranges of the subtrees in the `inorder` sequence.

<p align="center"> Table 12-1 &nbsp; Indexes of the root node and subtrees in pre-order and in-order traversals </p>

<div class="center-table" markdown>

|               | Root node index in `preorder` | Subtree index range in `inorder`    |
| ------------- | ----------------------------- | ----------------------------------- |
| Current tree  | $i$                           | $[l, r]$                            |
| Left subtree  | $i + 1$                       | $[l, m-1]$                          |
| Right subtree | $i + 1 + (m - l)$             | $[m+1, r]$                          |

</div>

Please note that $(m-l)$ in the right subtree root index represents "the number of nodes in the left subtree." It may help to consult Figure 12-7 for a clearer understanding.

![Indexes of the root node and left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> Figure 12-7 &nbsp; Indexes of the root node and left and right subtrees </p>

### 4. &nbsp; Code implementation

To improve the efficiency of querying $m$, we use a hash table `hmap` to store the mapping from elements in the `inorder` sequence to their indexes:

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
    /* Build binary tree: Divide and conquer */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // Terminate when subtree interval is empty
        if (r - l < 0)
            return NULL;
        // Initialize root node
        TreeNode *root = new TreeNode(preorder[i]);
        // Query m to divide left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build left subtree
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build right subtree
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return root node
        return root;
    }

    /* Build binary tree */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // Initialize hash table, storing in-order elements to indices mapping
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

Figure 12-8 shows the recursive process of building the binary tree. Each node is created during the "descending" phase of the recursion, and each edge (reference) is formed during the "ascending" phase.

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

Each recursive function's division of the `preorder` and `inorder` sequences is illustrated in Figure 12-9.

![Division in each recursive function](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> Figure 12-9 &nbsp; Division in each recursive function </p>

Assuming the binary tree has $n$ nodes, initializing each node (calling the recursive function `dfs()`) takes $O(1)$ time. **Therefore, the overall time complexity is $O(n)$**.

Because the hash table stores the mapping from `inorder` elements to their indexes, it requires $O(n)$ space. In the worst case, if the binary tree degenerates into a linked list, the recursive depth can reach $n$, consuming $O(n)$ stack space. **Hence, the overall space complexity is $O(n)$**.
