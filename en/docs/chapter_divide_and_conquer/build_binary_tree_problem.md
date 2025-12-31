---
comments: true
---

# 12.3 &nbsp; Building a Binary Tree Problem

!!! question

    Given the preorder traversal `preorder` and inorder traversal `inorder` of a binary tree, construct the binary tree and return the root node of the binary tree. Assume there are no duplicate node values in the binary tree (as shown in Figure 12-5).

![Example data for building a binary tree](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> Figure 12-5 &nbsp; Example data for building a binary tree </p>

### 1. &nbsp; Determining If It Is a Divide and Conquer Problem

The original problem is defined as constructing a binary tree from `preorder` and `inorder`, which is a typical divide and conquer problem.

- **The problem can be decomposed**: From a divide and conquer perspective, we can divide the original problem into two subproblems: constructing the left subtree and constructing the right subtree, plus one operation: initializing the root node. For each subtree (subproblem), we can still reuse the above division method, dividing it into smaller subtrees (subproblems) until the smallest subproblem (empty subtree) is reached.
- **Subproblems are independent**: The left and right subtrees are independent of each other; there is no overlap between them. When constructing the left subtree, we only need to focus on the parts of the inorder and preorder traversals corresponding to the left subtree. The same applies to the right subtree.
- **Solutions of subproblems can be merged**: Once we have the left and right subtrees (solutions of subproblems), we can link them to the root node to obtain the solution to the original problem.

### 2. &nbsp; How to Divide Subtrees

Based on the above analysis, this problem can be solved using divide and conquer, **but how do we divide the left and right subtrees through the preorder traversal `preorder` and inorder traversal `inorder`**?

According to the definition, both `preorder` and `inorder` can be divided into three parts.

- Preorder traversal: `[ Root Node | Left Subtree | Right Subtree ]`, for example, the tree in Figure 12-5 corresponds to `[ 3 | 9 | 2 1 7 ]`.
- Inorder traversal: `[ Left Subtree | Root Node ｜ Right Subtree ]`, for example, the tree in Figure 12-5 corresponds to `[ 9 | 3 | 1 2 7 ]`.

Using the data from the figure above as an example, we can obtain the division results through the steps shown in Figure 12-6.

1. The first element 3 in the preorder traversal is the value of the root node.
2. Find the index of root node 3 in `inorder`, and use this index to divide `inorder` into `[ 9 | 3 ｜ 1 2 7 ]`.
3. Based on the division result of `inorder`, it is easy to determine that the left and right subtrees have 1 and 3 nodes respectively, allowing us to divide `preorder` into `[ 3 | 9 | 2 1 7 ]`.

![Dividing subtrees in preorder and inorder traversals](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> Figure 12-6 &nbsp; Dividing subtrees in preorder and inorder traversals </p>

### 3. &nbsp; Describing Subtree Intervals Based on Variables

Based on the above division method, **we have obtained the index intervals of the root node, left subtree, and right subtree in `preorder` and `inorder`**. To describe these index intervals, we need to use several pointer variables.

- Denote the index of the current tree's root node in `preorder` as $i$.
- Denote the index of the current tree's root node in `inorder` as $m$.
- Denote the index interval of the current tree in `inorder` as $[l, r]$.

As shown in Table 12-1, through these variables we can represent the index of the root node in `preorder` and the index intervals of the subtrees in `inorder`.

<p align="center"> Table 12-1 &nbsp; Indices of root node and subtrees in preorder and inorder traversals </p>

<div class="center-table" markdown>

|              | Root node index in `preorder` | Subtree index interval in `inorder` |
| ------------ | ----------------------------- | ----------------------------------- |
| Current tree | $i$                           | $[l, r]$                            |
| Left subtree | $i + 1$                       | $[l, m-1]$                          |
| Right subtree| $i + 1 + (m - l)$             | $[m+1, r]$                          |

</div>

Please note that $(m-l)$ in the right subtree root node index means "the number of nodes in the left subtree". It is recommended to understand this in conjunction with Figure 12-7.

![Index interval representation of root node and left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> Figure 12-7 &nbsp; Index interval representation of root node and left and right subtrees </p>

### 4. &nbsp; Code Implementation

To improve the efficiency of querying $m$, we use a hash table `hmap` to store the mapping from elements in the `inorder` array to their indices:

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """Build binary tree: divide and conquer"""
        # Terminate when the subtree interval is empty
        if r - l < 0:
            return None
        # Initialize the root node
        root = TreeNode(preorder[i])
        # Query m to divide the left and right subtrees
        m = inorder_map[preorder[i]]
        # Subproblem: build the left subtree
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # Subproblem: build the right subtree
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # Return the root node
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """Build binary tree"""
        # Initialize hash map, storing the mapping from inorder elements to indices
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* Build binary tree: divide and conquer */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // Terminate when the subtree interval is empty
        if (r - l < 0)
            return NULL;
        // Initialize the root node
        TreeNode *root = new TreeNode(preorder[i]);
        // Query m to divide the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Terminate when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new TreeNode(preorder[i]);
        // Query m to divide the left and right subtrees
        int m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Terminate when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new(preorder[i]);
        // Query m to divide the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // Terminate when the subtree interval is empty
        if r-l < 0 {
            return nil
        }
        // Initialize the root node
        root := NewTreeNode(preorder[i])
        // Query m to divide the left and right subtrees
        m := inorderMap[preorder[i]]
        // Subproblem: build the left subtree
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // Subproblem: build the right subtree
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // Return the root node
        return root
    }

    /* Build binary tree */
    func buildTree(preorder, inorder []int) *TreeNode {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // Terminate when the subtree interval is empty
        if r - l < 0 {
            return nil
        }
        // Initialize the root node
        let root = TreeNode(x: preorder[i])
        // Query m to divide the left and right subtrees
        let m = inorderMap[preorder[i]]!
        // Subproblem: build the left subtree
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // Subproblem: build the right subtree
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // Return the root node
        return root
    }

    /* Build binary tree */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // Initialize hash map, storing the mapping from inorder elements to indices
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* Build binary tree: divide and conquer */
    function dfs(preorder, inorderMap, i, l, r) {
        // Terminate when the subtree interval is empty
        if (r - l < 0) return null;
        // Initialize the root node
        const root = new TreeNode(preorder[i]);
        // Query m to divide the left and right subtrees
        const m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    function buildTree(preorder, inorder) {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // Terminate when the subtree interval is empty
        if (r - l < 0) return null;
        // Initialize the root node
        const root: TreeNode = new TreeNode(preorder[i]);
        // Query m to divide the left and right subtrees
        const m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // Terminate when the subtree interval is empty
      if (r - l < 0) {
        return null;
      }
      // Initialize the root node
      TreeNode? root = TreeNode(preorder[i]);
      // Query m to divide the left and right subtrees
      int m = inorderMap[preorder[i]]!;
      // Subproblem: build the left subtree
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // Subproblem: build the right subtree
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // Return the root node
      return root;
    }

    /* Build binary tree */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // Terminate when the subtree interval is empty
        if r - l < 0 {
            return None;
        }
        // Initialize the root node
        let root = TreeNode::new(preorder[i as usize]);
        // Query m to divide the left and right subtrees
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // Subproblem: build the left subtree
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // Return the root node
        Some(root)
    }

    /* Build binary tree */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // Terminate when the subtree interval is empty
        if (r - l < 0)
            return NULL;
        // Initialize the root node
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // Query m to divide the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // Subproblem: build the right subtree
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // Return the root node
        return root;
    }

    /* Build binary tree */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    /* Build binary tree: divide and conquer */
    fun dfs(
        preorder: IntArray,
        inorderMap: Map<Int?, Int?>,
        i: Int,
        l: Int,
        r: Int
    ): TreeNode? {
        // Terminate when the subtree interval is empty
        if (r - l < 0) return null
        // Initialize the root node
        val root = TreeNode(preorder[i])
        // Query m to divide the left and right subtrees
        val m = inorderMap[preorder[i]]!!
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
        // Return the root node
        return root
    }

    /* Build binary tree */
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        // Initialize hash map, storing the mapping from inorder elements to indices
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
    ### Build binary tree: divide and conquer ###
    def dfs(preorder, inorder_map, i, l, r)
      # Terminate when the subtree interval is empty
      return if r - l < 0

      # Initialize the root node
      root = TreeNode.new(preorder[i])
      # Query m to divide the left and right subtrees
      m = inorder_map[preorder[i]]
      # Subproblem: build the left subtree
      root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
      # Subproblem: build the right subtree
      root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

      # Return the root node
      root
    end

    ### Build binary tree ###
    def build_tree(preorder, inorder)
      # Initialize hash map, storing the mapping from inorder elements to indices
      inorder_map = {}
      inorder.each_with_index { |val, i| inorder_map[val] = i }
      dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
    end
    ```

Figure 12-8 shows the recursive process of building the binary tree. Each node is established during the downward "recursion" process, while each edge (reference) is established during the upward "return" process.

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

The division results of the preorder traversal `preorder` and inorder traversal `inorder` within each recursive function are shown in Figure 12-9.

![Division results in each recursive function](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> Figure 12-9 &nbsp; Division results in each recursive function </p>

Let the number of nodes in the tree be $n$. Initializing each node (executing one recursive function `dfs()`) takes $O(1)$ time. **Therefore, the overall time complexity is $O(n)$**.

The hash table stores the mapping from `inorder` elements to their indices, with a space complexity of $O(n)$. In the worst case, when the binary tree degenerates into a linked list, the recursion depth reaches $n$, using $O(n)$ stack frame space. **Therefore, the overall space complexity is $O(n)$**.
