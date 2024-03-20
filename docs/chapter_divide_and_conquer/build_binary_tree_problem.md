---
comments: true
---

# 12.3 &nbsp; 构建二叉树问题

!!! question

    给定一棵二叉树的前序遍历 `preorder` 和中序遍历 `inorder` ，请从中构建二叉树，返回二叉树的根节点。假设二叉树中没有值重复的节点（如图 12-5 所示）。

![构建二叉树的示例数据](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> 图 12-5 &nbsp; 构建二叉树的示例数据 </p>

### 1. &nbsp; 判断是否为分治问题

原问题定义为从 `preorder` 和 `inorder` 构建二叉树，是一个典型的分治问题。

- **问题可以分解**：从分治的角度切入，我们可以将原问题划分为两个子问题：构建左子树、构建右子树，加上一步操作：初始化根节点。而对于每棵子树（子问题），我们仍然可以复用以上划分方法，将其划分为更小的子树（子问题），直至达到最小子问题（空子树）时终止。
- **子问题是独立的**：左子树和右子树是相互独立的，它们之间没有交集。在构建左子树时，我们只需关注中序遍历和前序遍历中与左子树对应的部分。右子树同理。
- **子问题的解可以合并**：一旦得到了左子树和右子树（子问题的解），我们就可以将它们链接到根节点上，得到原问题的解。

### 2. &nbsp; 如何划分子树

根据以上分析，这道题可以使用分治来求解，**但如何通过前序遍历 `preorder` 和中序遍历 `inorder` 来划分左子树和右子树呢**？

根据定义，`preorder` 和 `inorder` 都可以划分为三个部分。

- 前序遍历：`[ 根节点 | 左子树 | 右子树 ]` ，例如图 12-5 的树对应 `[ 3 | 9 | 2 1 7 ]` 。
- 中序遍历：`[ 左子树 | 根节点 ｜ 右子树 ]` ，例如图 12-5 的树对应 `[ 9 | 3 | 1 2 7 ]` 。

以上图数据为例，我们可以通过图 12-6 所示的步骤得到划分结果。

1. 前序遍历的首元素 3 是根节点的值。
2. 查找根节点 3 在 `inorder` 中的索引，利用该索引可将 `inorder` 划分为 `[ 9 | 3 ｜ 1 2 7 ]` 。
3. 根据 `inorder` 的划分结果，易得左子树和右子树的节点数量分别为 1 和 3 ，从而可将 `preorder` 划分为 `[ 3 | 9 | 2 1 7 ]` 。

![在前序遍历和中序遍历中划分子树](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> 图 12-6 &nbsp; 在前序遍历和中序遍历中划分子树 </p>

### 3. &nbsp; 基于变量描述子树区间

根据以上划分方法，**我们已经得到根节点、左子树、右子树在 `preorder` 和 `inorder` 中的索引区间**。而为了描述这些索引区间，我们需要借助几个指针变量。

- 将当前树的根节点在 `preorder` 中的索引记为 $i$ 。
- 将当前树的根节点在 `inorder` 中的索引记为 $m$ 。
- 将当前树在 `inorder` 中的索引区间记为 $[l, r]$ 。

如表 12-1 所示，通过以上变量即可表示根节点在 `preorder` 中的索引，以及子树在 `inorder` 中的索引区间。

<p align="center"> 表 12-1 &nbsp; 根节点和子树在前序遍历和中序遍历中的索引 </p>

<div class="center-table" markdown>

|        | 根节点在 `preorder` 中的索引 | 子树在 `inorder` 中的索引区间 |
| ------ | ---------------------------- | ----------------------------- |
| 当前树 | $i$                          | $[l, r]$                      |
| 左子树 | $i + 1$                      | $[l, m-1]$                    |
| 右子树 | $i + 1 + (m - l)$            | $[m+1, r]$                    |

</div>

请注意，右子树根节点索引中的 $(m-l)$ 的含义是“左子树的节点数量”，建议结合图 12-7 理解。

![根节点和左右子树的索引区间表示](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> 图 12-7 &nbsp; 根节点和左右子树的索引区间表示 </p>

### 4. &nbsp; 代码实现

为了提升查询 $m$ 的效率，我们借助一个哈希表 `hmap` 来存储数组 `inorder` 中元素到索引的映射：

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """构建二叉树：分治"""
        # 子树区间为空时终止
        if r - l < 0:
            return None
        # 初始化根节点
        root = TreeNode(preorder[i])
        # 查询 m ，从而划分左右子树
        m = inorder_map[preorder[i]]
        # 子问题：构建左子树
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # 子问题：构建右子树
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # 返回根节点
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """构建二叉树"""
        # 初始化哈希表，存储 inorder 元素到索引的映射
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* 构建二叉树：分治 */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // 子树区间为空时终止
        if (r - l < 0)
            return NULL;
        // 初始化根节点
        TreeNode *root = new TreeNode(preorder[i]);
        // 查询 m ，从而划分左右子树
        int m = inorderMap[preorder[i]];
        // 子问题：构建左子树
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 子树区间为空时终止
        if (r - l < 0)
            return null;
        // 初始化根节点
        TreeNode root = new TreeNode(preorder[i]);
        // 查询 m ，从而划分左右子树
        int m = inorderMap.get(preorder[i]);
        // 子问题：构建左子树
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 子树区间为空时终止
        if (r - l < 0)
            return null;
        // 初始化根节点
        TreeNode root = new(preorder[i]);
        // 查询 m ，从而划分左右子树
        int m = inorderMap[preorder[i]];
        // 子问题：构建左子树
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // 子树区间为空时终止
        if r-l < 0 {
            return nil
        }
        // 初始化根节点
        root := NewTreeNode(preorder[i])
        // 查询 m ，从而划分左右子树
        m := inorderMap[preorder[i]]
        // 子问题：构建左子树
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // 子问题：构建右子树
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // 返回根节点
        return root
    }

    /* 构建二叉树 */
    func buildTree(preorder, inorder []int) *TreeNode {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // 子树区间为空时终止
        if r - l < 0 {
            return nil
        }
        // 初始化根节点
        let root = TreeNode(x: preorder[i])
        // 查询 m ，从而划分左右子树
        let m = inorderMap[preorder[i]]!
        // 子问题：构建左子树
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // 子问题：构建右子树
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // 返回根节点
        return root
    }

    /* 构建二叉树 */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // 初始化哈希表，存储 inorder 元素到索引的映射
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* 构建二叉树：分治 */
    function dfs(preorder, inorderMap, i, l, r) {
        // 子树区间为空时终止
        if (r - l < 0) return null;
        // 初始化根节点
        const root = new TreeNode(preorder[i]);
        // 查询 m ，从而划分左右子树
        const m = inorderMap.get(preorder[i]);
        // 子问题：构建左子树
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    function buildTree(preorder, inorder) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // 子树区间为空时终止
        if (r - l < 0) return null;
        // 初始化根节点
        const root: TreeNode = new TreeNode(preorder[i]);
        // 查询 m ，从而划分左右子树
        const m = inorderMap.get(preorder[i]);
        // 子问题：构建左子树
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // 子树区间为空时终止
      if (r - l < 0) {
        return null;
      }
      // 初始化根节点
      TreeNode? root = TreeNode(preorder[i]);
      // 查询 m ，从而划分左右子树
      int m = inorderMap[preorder[i]]!;
      // 子问题：构建左子树
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // 子问题：构建右子树
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // 返回根节点
      return root;
    }

    /* 构建二叉树 */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // 子树区间为空时终止
        if r - l < 0 {
            return None;
        }
        // 初始化根节点
        let root = TreeNode::new(preorder[i as usize]);
        // 查询 m ，从而划分左右子树
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // 子问题：构建左子树
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // 子问题：构建右子树
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // 返回根节点
        Some(root)
    }

    /* 构建二叉树 */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // 初始化哈希表，存储 inorder 元素到索引的映射
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
    /* 构建二叉树：分治 */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // 子树区间为空时终止
        if (r - l < 0)
            return NULL;
        // 初始化根节点
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // 查询 m ，从而划分左右子树
        int m = inorderMap[preorder[i]];
        // 子问题：构建左子树
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // 子问题：构建右子树
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // 返回根节点
        return root;
    }

    /* 构建二叉树 */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // 初始化哈希表，存储 inorder 元素到索引的映射
        int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
        for (int i = 0; i < inorderSize; i++) {
            inorderMap[inorder[i]] = i;
        }
        TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
        free(inorderMap);
        return root;
    }
    ```

=== "Zig"

    ```zig title="build_tree.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{buildTree}
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%9A%E5%88%86%E6%B2%BB%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%A0%91%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%20m%20%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%88%92%E5%88%86%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%B7%A6%E5%AD%90%E6%A0%91%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E5%AD%98%E5%82%A8%20inorder%20%E5%85%83%E7%B4%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%9A%84%E6%98%A0%E5%B0%84%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%9A%E5%88%86%E6%B2%BB%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%A0%91%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%20m%20%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%88%92%E5%88%86%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%B7%A6%E5%AD%90%E6%A0%91%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E5%AD%98%E5%82%A8%20inorder%20%E5%85%83%E7%B4%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%9A%84%E6%98%A0%E5%B0%84%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

图 12-8 展示了构建二叉树的递归过程，各个节点是在向下“递”的过程中建立的，而各条边（引用）是在向上“归”的过程中建立的。

=== "<1>"
    ![构建二叉树的递归过程](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

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

<p align="center"> 图 12-8 &nbsp; 构建二叉树的递归过程 </p>

每个递归函数内的前序遍历 `preorder` 和中序遍历 `inorder` 的划分结果如图 12-9 所示。

![每个递归函数中的划分结果](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> 图 12-9 &nbsp; 每个递归函数中的划分结果 </p>

设树的节点数量为 $n$ ，初始化每一个节点（执行一个递归函数 `dfs()` ）使用 $O(1)$ 时间。**因此总体时间复杂度为 $O(n)$** 。

哈希表存储 `inorder` 元素到索引的映射，空间复杂度为 $O(n)$ 。在最差情况下，即二叉树退化为链表时，递归深度达到 $n$ ，使用 $O(n)$ 的栈帧空间。**因此总体空间复杂度为 $O(n)$** 。
