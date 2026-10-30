---
comments: true
---

# 12.3 &nbsp; Building a binary tree

!!! question

    Given a binary tree's preorder traversal `preorder` and inorder traversal `inorder`, reconstruct the tree and return its root node. Assume that all node values are distinct, as shown in Figure 12-5.

![Example input for reconstructing a binary tree](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> Figure 12-5 &nbsp; Example input for reconstructing a binary tree </p>

### 1. &nbsp; Identifying a divide-and-conquer problem

Reconstructing a binary tree from `preorder` and `inorder` is a typical divide-and-conquer problem.

- **The problem can be divided**: We can split the original problem into two subproblems, building the left subtree and building the right subtree, plus one operation: initializing the root node. Each subtree can be divided in the same way into smaller subtrees, until we reach the smallest subproblem, an empty subtree.
- **The subproblems are independent**: The left and right subtrees are independent and do not overlap. To build the left subtree, we need only the portions of the preorder and inorder traversals corresponding to it. The same applies to the right subtree.
- **The subproblem solutions can be combined**: Once we have built the left and right subtrees, we can attach them to the root to obtain the solution to the original problem.

### 2. &nbsp; Dividing the subtrees

The analysis above shows that divide and conquer applies, **but how do we use `preorder` and `inorder` to separate the left and right subtrees**?

By definition, both `preorder` and `inorder` consist of three parts.

- Preorder: `[ root | left subtree | right subtree ]`. For the tree above, this is `[ 3 | 9 | 2 1 7 ]`.
- Inorder: `[ left subtree | root | right subtree ]`. For the tree above, this is `[ 9 | 3 | 1 2 7 ]`.

Using the example above, we can divide the traversals with the steps shown in Figure 12-6.

1. The first element in the preorder traversal, 3, is the root value.
2. Find the index of root value 3 in `inorder`, then use it to divide `inorder` into `[ 9 | 3 | 1 2 7 ]`.
3. This division of `inorder` tells us that the left and right subtrees have 1 and 3 nodes, respectively, allowing us to divide `preorder` into `[ 3 | 9 | 2 1 7 ]`.

![Separating subtrees in preorder and inorder traversals](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> Figure 12-6 &nbsp; Separating subtrees in preorder and inorder traversals </p>

### 3. &nbsp; Describing subtree intervals with variables

Using this method, **we have identified the index intervals for the root, left subtree, and right subtree in `preorder` and `inorder`**. We need a few pointer variables to describe these intervals.

- Let $i$ be the index of the current tree's root in `preorder`.
- Let $m$ be the index of the current tree's root in `inorder`.
- Let $[l, r]$ be the interval occupied by the current tree in `inorder`.

As shown in Table 12-1, these variables describe the root index in `preorder` and each subtree's interval in `inorder`.

<p align="center"> Table 12-1 &nbsp; Root and subtree indices in preorder and inorder traversals </p>

<div class="center-table" markdown>

|        | Root index in `preorder` | Subtree interval in `inorder` |
| ------ | ---------------------------- | ----------------------------- |
| Current tree | $i$                          | $[l, r]$                      |
| Left subtree | $i + 1$                      | $[l, m-1]$                    |
| Right subtree | $i + 1 + (m - l)$            | $[m+1, r]$                    |

</div>

The term $(m-l)$ in the right subtree's root index is the number of nodes in the left subtree. Figure 12-7 helps illustrate this.

![Index intervals for the root and the left and right subtrees](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> Figure 12-7 &nbsp; Index intervals for the root and the left and right subtrees </p>

### 4. &nbsp; Code implementation

To find $m$ efficiently, we use a hash table `hmap` mapping each element of `inorder` to its index:

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """Build a binary tree: divide and conquer"""
        # Stop when the subtree interval is empty
        if r - l < 0:
            return None
        # Initialize the root node
        root = TreeNode(preorder[i])
        # Look up m to separate the left and right subtrees
        m = inorder_map[preorder[i]]
        # Subproblem: build the left subtree
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # Subproblem: build the right subtree
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # Return the root node
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """Build a binary tree"""
        # Initialize a hash table mapping each element in inorder to its index
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* Build a binary tree: divide and conquer */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // Stop when the subtree interval is empty
        if (r - l < 0)
            return NULL;
        // Initialize the root node
        TreeNode *root = new TreeNode(preorder[i]);
        // Look up m to separate the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // Stop when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new TreeNode(preorder[i]);
        // Look up m to separate the left and right subtrees
        int m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // Stop when the subtree interval is empty
        if (r - l < 0)
            return null;
        // Initialize the root node
        TreeNode root = new(preorder[i]);
        // Look up m to separate the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // Stop when the subtree interval is empty
        if r-l < 0 {
            return nil
        }
        // Initialize the root node
        root := NewTreeNode(preorder[i])
        // Look up m to separate the left and right subtrees
        m := inorderMap[preorder[i]]
        // Subproblem: build the left subtree
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // Subproblem: build the right subtree
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // Return the root node
        return root
    }

    /* Build a binary tree */
    func buildTree(preorder, inorder []int) *TreeNode {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // Stop when the subtree interval is empty
        if r - l < 0 {
            return nil
        }
        // Initialize the root node
        let root = TreeNode(x: preorder[i])
        // Look up m to separate the left and right subtrees
        let m = inorderMap[preorder[i]]!
        // Subproblem: build the left subtree
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // Subproblem: build the right subtree
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // Return the root node
        return root
    }

    /* Build a binary tree */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // Initialize a hash table mapping each element in inorder to its index
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* Build a binary tree: divide and conquer */
    function dfs(preorder, inorderMap, i, l, r) {
        // Stop when the subtree interval is empty
        if (r - l < 0) return null;
        // Initialize the root node
        const root = new TreeNode(preorder[i]);
        // Look up m to separate the left and right subtrees
        const m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    function buildTree(preorder, inorder) {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // Stop when the subtree interval is empty
        if (r - l < 0) return null;
        // Initialize the root node
        const root: TreeNode = new TreeNode(preorder[i]);
        // Look up m to separate the left and right subtrees
        const m = inorderMap.get(preorder[i]);
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // Stop when the subtree interval is empty
      if (r - l < 0) {
        return null;
      }
      // Initialize the root node
      TreeNode? root = TreeNode(preorder[i]);
      // Look up m to separate the left and right subtrees
      int m = inorderMap[preorder[i]]!;
      // Subproblem: build the left subtree
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // Subproblem: build the right subtree
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // Return the root node
      return root;
    }

    /* Build a binary tree */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // Stop when the subtree interval is empty
        if r - l < 0 {
            return None;
        }
        // Initialize the root node
        let root = TreeNode::new(preorder[i as usize]);
        // Look up m to separate the left and right subtrees
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // Subproblem: build the left subtree
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // Subproblem: build the right subtree
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // Return the root node
        Some(root)
    }

    /* Build a binary tree */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // Initialize a hash table mapping each element in inorder to its index
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
    /* Build a binary tree: divide and conquer */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // Stop when the subtree interval is empty
        if (r - l < 0)
            return NULL;
        // Initialize the root node
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // Look up m to separate the left and right subtrees
        int m = inorderMap[preorder[i]];
        // Subproblem: build the left subtree
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // Subproblem: build the right subtree
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // Return the root node
        return root;
    }

    /* Build a binary tree */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // Initialize a lookup array mapping inorder values to their indices
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
    /* Build a binary tree: divide and conquer */
    fun dfs(
        preorder: IntArray,
        inorderMap: Map<Int?, Int?>,
        i: Int,
        l: Int,
        r: Int
    ): TreeNode? {
        // Stop when the subtree interval is empty
        if (r - l < 0) return null
        // Initialize the root node
        val root = TreeNode(preorder[i])
        // Look up m to separate the left and right subtrees
        val m = inorderMap[preorder[i]]!!
        // Subproblem: build the left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
        // Subproblem: build the right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
        // Return the root node
        return root
    }

    /* Build a binary tree */
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        // Initialize a hash table mapping each element in inorder to its index
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
    ### Build a binary tree: divide and conquer ###
    def dfs(preorder, inorder_map, i, l, r)
      # Stop when the subtree interval is empty
      return if r - l < 0

      # Initialize the root node
      root = TreeNode.new(preorder[i])
      # Look up m to separate the left and right subtrees
      m = inorder_map[preorder[i]]
      # Subproblem: build the left subtree
      root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
      # Subproblem: build the right subtree
      root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

      # Return the root node
      root
    end

    ### Build a binary tree ###
    def build_tree(preorder, inorder)
      # Initialize a hash table mapping each element in inorder to its index
      inorder_map = {}
      inorder.each_with_index { |val, i| inorder_map[val] = i }
      dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20right%20child%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22Build%20a%20binary%20tree%3A%20divide%20and%20conquer%22%22%22%0A%20%20%20%20%23%20Stop%20when%20the%20subtree%20interval%20is%20empty%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20Initialize%20the%20root%20node%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20Look%20up%20m%20to%20separate%20the%20left%20and%20right%20subtrees%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20Subproblem%3A%20build%20the%20left%20subtree%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20Subproblem%3A%20build%20the%20right%20subtree%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20Return%20the%20root%20node%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22Build%20a%20binary%20tree%22%22%22%0A%20%20%20%20%23%20Initialize%20a%20hash%20table%20mapping%20each%20element%20in%20inorder%20to%20its%20index%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22Preorder%20traversal%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22Inorder%20traversal%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20Node%20value%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20left%20child%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20Reference%20to%20the%20right%20child%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22Build%20a%20binary%20tree%3A%20divide%20and%20conquer%22%22%22%0A%20%20%20%20%23%20Stop%20when%20the%20subtree%20interval%20is%20empty%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20Initialize%20the%20root%20node%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20Look%20up%20m%20to%20separate%20the%20left%20and%20right%20subtrees%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20Subproblem%3A%20build%20the%20left%20subtree%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20Subproblem%3A%20build%20the%20right%20subtree%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20Return%20the%20root%20node%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22Build%20a%20binary%20tree%22%22%22%0A%20%20%20%20%23%20Initialize%20a%20hash%20table%20mapping%20each%20element%20in%20inorder%20to%20its%20index%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22Preorder%20traversal%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22Inorder%20traversal%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Figure 12-8 shows the recursive reconstruction process. Nodes are created during recursive descent, while edges (references) are established as the recursive calls return.

=== "<1>"
    ![Recursive process for building a binary tree](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 12-8 &nbsp; Recursive process for building a binary tree </p>

Figure 12-9 shows how `preorder` and `inorder` are divided in each recursive call.

![Division within each recursive call](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> Figure 12-9 &nbsp; Division within each recursive call </p>

For a tree with $n$ nodes, initializing each node (executing one call to `dfs()`) takes $O(1)$ time. **The overall time complexity is therefore $O(n)$**.

The hash table maps `inorder` elements to indices, requiring $O(n)$ space. In the worst case, the binary tree degenerates into a linked list, and the recursion depth reaches $n$, using $O(n)$ space for stack frames. **The overall space complexity is therefore $O(n)$**.
