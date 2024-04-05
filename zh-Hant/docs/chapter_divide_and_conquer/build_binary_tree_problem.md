---
comments: true
---

# 12.3 &nbsp; 構建二元樹問題

!!! question

    給定一棵二元樹的前序走訪 `preorder` 和中序走訪 `inorder` ，請從中構建二元樹，返回二元樹的根節點。假設二元樹中沒有值重複的節點（如圖 12-5 所示）。

![構建二元樹的示例資料](build_binary_tree_problem.assets/build_tree_example.png){ class="animation-figure" }

<p align="center"> 圖 12-5 &nbsp; 構建二元樹的示例資料 </p>

### 1. &nbsp; 判斷是否為分治問題

原問題定義為從 `preorder` 和 `inorder` 構建二元樹，是一個典型的分治問題。

- **問題可以分解**：從分治的角度切入，我們可以將原問題劃分為兩個子問題：構建左子樹、構建右子樹，加上一步操作：初始化根節點。而對於每棵子樹（子問題），我們仍然可以複用以上劃分方法，將其劃分為更小的子樹（子問題），直至達到最小子問題（空子樹）時終止。
- **子問題是獨立的**：左子樹和右子樹是相互獨立的，它們之間沒有交集。在構建左子樹時，我們只需關注中序走訪和前序走訪中與左子樹對應的部分。右子樹同理。
- **子問題的解可以合併**：一旦得到了左子樹和右子樹（子問題的解），我們就可以將它們連結到根節點上，得到原問題的解。

### 2. &nbsp; 如何劃分子樹

根據以上分析，這道題可以使用分治來求解，**但如何透過前序走訪 `preorder` 和中序走訪 `inorder` 來劃分左子樹和右子樹呢**？

根據定義，`preorder` 和 `inorder` 都可以劃分為三個部分。

- 前序走訪：`[ 根節點 | 左子樹 | 右子樹 ]` ，例如圖 12-5 的樹對應 `[ 3 | 9 | 2 1 7 ]` 。
- 中序走訪：`[ 左子樹 | 根節點 ｜ 右子樹 ]` ，例如圖 12-5 的樹對應 `[ 9 | 3 | 1 2 7 ]` 。

以上圖資料為例，我們可以透過圖 12-6 所示的步驟得到劃分結果。

1. 前序走訪的首元素 3 是根節點的值。
2. 查詢根節點 3 在 `inorder` 中的索引，利用該索引可將 `inorder` 劃分為 `[ 9 | 3 ｜ 1 2 7 ]` 。
3. 根據 `inorder` 的劃分結果，易得左子樹和右子樹的節點數量分別為 1 和 3 ，從而可將 `preorder` 劃分為 `[ 3 | 9 | 2 1 7 ]` 。

![在前序走訪和中序走訪中劃分子樹](build_binary_tree_problem.assets/build_tree_preorder_inorder_division.png){ class="animation-figure" }

<p align="center"> 圖 12-6 &nbsp; 在前序走訪和中序走訪中劃分子樹 </p>

### 3. &nbsp; 基於變數描述子樹區間

根據以上劃分方法，**我們已經得到根節點、左子樹、右子樹在 `preorder` 和 `inorder` 中的索引區間**。而為了描述這些索引區間，我們需要藉助幾個指標變數。

- 將當前樹的根節點在 `preorder` 中的索引記為 $i$ 。
- 將當前樹的根節點在 `inorder` 中的索引記為 $m$ 。
- 將當前樹在 `inorder` 中的索引區間記為 $[l, r]$ 。

如表 12-1 所示，透過以上變數即可表示根節點在 `preorder` 中的索引，以及子樹在 `inorder` 中的索引區間。

<p align="center"> 表 12-1 &nbsp; 根節點和子樹在前序走訪和中序走訪中的索引 </p>

<div class="center-table" markdown>

|        | 根節點在 `preorder` 中的索引 | 子樹在 `inorder` 中的索引區間 |
| ------ | ---------------------------- | ----------------------------- |
| 當前樹 | $i$                          | $[l, r]$                      |
| 左子樹 | $i + 1$                      | $[l, m-1]$                    |
| 右子樹 | $i + 1 + (m - l)$            | $[m+1, r]$                    |

</div>

請注意，右子樹根節點索引中的 $(m-l)$ 的含義是“左子樹的節點數量”，建議結合圖 12-7 理解。

![根節點和左右子樹的索引區間表示](build_binary_tree_problem.assets/build_tree_division_pointers.png){ class="animation-figure" }

<p align="center"> 圖 12-7 &nbsp; 根節點和左右子樹的索引區間表示 </p>

### 4. &nbsp; 程式碼實現

為了提升查詢 $m$ 的效率，我們藉助一個雜湊表 `hmap` 來儲存陣列 `inorder` 中元素到索引的對映：

=== "Python"

    ```python title="build_tree.py"
    def dfs(
        preorder: list[int],
        inorder_map: dict[int, int],
        i: int,
        l: int,
        r: int,
    ) -> TreeNode | None:
        """構建二元樹：分治"""
        # 子樹區間為空時終止
        if r - l < 0:
            return None
        # 初始化根節點
        root = TreeNode(preorder[i])
        # 查詢 m ，從而劃分左右子樹
        m = inorder_map[preorder[i]]
        # 子問題：構建左子樹
        root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
        # 子問題：構建右子樹
        root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)
        # 返回根節點
        return root

    def build_tree(preorder: list[int], inorder: list[int]) -> TreeNode | None:
        """構建二元樹"""
        # 初始化雜湊表，儲存 inorder 元素到索引的對映
        inorder_map = {val: i for i, val in enumerate(inorder)}
        root = dfs(preorder, inorder_map, 0, 0, len(inorder) - 1)
        return root
    ```

=== "C++"

    ```cpp title="build_tree.cpp"
    /* 構建二元樹：分治 */
    TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return NULL;
        // 初始化根節點
        TreeNode *root = new TreeNode(preorder[i]);
        // 查詢 m ，從而劃分左右子樹
        int m = inorderMap[preorder[i]];
        // 子問題：構建左子樹
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    TreeNode dfs(int[] preorder, Map<Integer, Integer> inorderMap, int i, int l, int r) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return null;
        // 初始化根節點
        TreeNode root = new TreeNode(preorder[i]);
        // 查詢 m ，從而劃分左右子樹
        int m = inorderMap.get(preorder[i]);
        // 子問題：構建左子樹
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    TreeNode buildTree(int[] preorder, int[] inorder) {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    TreeNode? DFS(int[] preorder, Dictionary<int, int> inorderMap, int i, int l, int r) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return null;
        // 初始化根節點
        TreeNode root = new(preorder[i]);
        // 查詢 m ，從而劃分左右子樹
        int m = inorderMap[preorder[i]];
        // 子問題：構建左子樹
        root.left = DFS(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root.right = DFS(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    TreeNode? BuildTree(int[] preorder, int[] inorder) {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
        // 子樹區間為空時終止
        if r-l < 0 {
            return nil
        }
        // 初始化根節點
        root := NewTreeNode(preorder[i])
        // 查詢 m ，從而劃分左右子樹
        m := inorderMap[preorder[i]]
        // 子問題：構建左子樹
        root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
        // 子問題：構建右子樹
        root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
        // 返回根節點
        return root
    }

    /* 構建二元樹 */
    func buildTree(preorder, inorder []int) *TreeNode {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    func dfs(preorder: [Int], inorderMap: [Int: Int], i: Int, l: Int, r: Int) -> TreeNode? {
        // 子樹區間為空時終止
        if r - l < 0 {
            return nil
        }
        // 初始化根節點
        let root = TreeNode(x: preorder[i])
        // 查詢 m ，從而劃分左右子樹
        let m = inorderMap[preorder[i]]!
        // 子問題：構建左子樹
        root.left = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1, l: l, r: m - 1)
        // 子問題：構建右子樹
        root.right = dfs(preorder: preorder, inorderMap: inorderMap, i: i + 1 + m - l, l: m + 1, r: r)
        // 返回根節點
        return root
    }

    /* 構建二元樹 */
    func buildTree(preorder: [Int], inorder: [Int]) -> TreeNode? {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
        let inorderMap = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
        return dfs(preorder: preorder, inorderMap: inorderMap, i: inorder.startIndex, l: inorder.startIndex, r: inorder.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="build_tree.js"
    /* 構建二元樹：分治 */
    function dfs(preorder, inorderMap, i, l, r) {
        // 子樹區間為空時終止
        if (r - l < 0) return null;
        // 初始化根節點
        const root = new TreeNode(preorder[i]);
        // 查詢 m ，從而劃分左右子樹
        const m = inorderMap.get(preorder[i]);
        // 子問題：構建左子樹
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    function buildTree(preorder, inorder) {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    function dfs(
        preorder: number[],
        inorderMap: Map<number, number>,
        i: number,
        l: number,
        r: number
    ): TreeNode | null {
        // 子樹區間為空時終止
        if (r - l < 0) return null;
        // 初始化根節點
        const root: TreeNode = new TreeNode(preorder[i]);
        // 查詢 m ，從而劃分左右子樹
        const m = inorderMap.get(preorder[i]);
        // 子問題：構建左子樹
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    TreeNode? dfs(
      List<int> preorder,
      Map<int, int> inorderMap,
      int i,
      int l,
      int r,
    ) {
      // 子樹區間為空時終止
      if (r - l < 0) {
        return null;
      }
      // 初始化根節點
      TreeNode? root = TreeNode(preorder[i]);
      // 查詢 m ，從而劃分左右子樹
      int m = inorderMap[preorder[i]]!;
      // 子問題：構建左子樹
      root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
      // 子問題：構建右子樹
      root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
      // 返回根節點
      return root;
    }

    /* 構建二元樹 */
    TreeNode? buildTree(List<int> preorder, List<int> inorder) {
      // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    fn dfs(
        preorder: &[i32],
        inorder_map: &HashMap<i32, i32>,
        i: i32,
        l: i32,
        r: i32,
    ) -> Option<Rc<RefCell<TreeNode>>> {
        // 子樹區間為空時終止
        if r - l < 0 {
            return None;
        }
        // 初始化根節點
        let root = TreeNode::new(preorder[i as usize]);
        // 查詢 m ，從而劃分左右子樹
        let m = inorder_map.get(&preorder[i as usize]).unwrap();
        // 子問題：構建左子樹
        root.borrow_mut().left = dfs(preorder, inorder_map, i + 1, l, m - 1);
        // 子問題：構建右子樹
        root.borrow_mut().right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r);
        // 返回根節點
        Some(root)
    }

    /* 構建二元樹 */
    fn build_tree(preorder: &[i32], inorder: &[i32]) -> Option<Rc<RefCell<TreeNode>>> {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
        // 子樹區間為空時終止
        if (r - l < 0)
            return NULL;
        // 初始化根節點
        TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
        root->val = preorder[i];
        root->left = NULL;
        root->right = NULL;
        // 查詢 m ，從而劃分左右子樹
        int m = inorderMap[preorder[i]];
        // 子問題：構建左子樹
        root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
        // 子問題：構建右子樹
        root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
        // 返回根節點
        return root;
    }

    /* 構建二元樹 */
    TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
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
    /* 構建二元樹：分治 */
    fun dfs(preorder: IntArray, inorderMap: Map<Int?, Int?>, i: Int, l: Int, r: Int): TreeNode? {
        // 子樹區間為空時終止
        if (r - l < 0) return null
        // 初始化根節點
        val root = TreeNode(preorder[i])
        // 查詢 m ，從而劃分左右子樹
        val m = inorderMap[preorder[i]]!!
        // 子問題：構建左子樹
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1)
        // 子問題：構建右子樹
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r)
        // 返回根節點
        return root
    }

    /* 構建二元樹 */
    fun buildTree(preorder: IntArray, inorder: IntArray): TreeNode? {
        // 初始化雜湊表，儲存 inorder 元素到索引的對映
        val inorderMap: MutableMap<Int?, Int?> = HashMap()
        for (i in inorder.indices) {
            inorderMap[inorder[i]] = i
        }
        val root = dfs(preorder, inorderMap, 0, 0, inorder.size - 1)
        return root
    }
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

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%9A%E5%88%86%E6%B2%BB%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%A0%91%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%20m%20%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%88%92%E5%88%86%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%B7%A6%E5%AD%90%E6%A0%91%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E5%AD%98%E5%82%A8%20inorder%20%E5%85%83%E7%B4%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%9A%84%E6%98%A0%E5%B0%84%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E5%AD%90%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0Adef%20dfs%28%0A%20%20%20%20preorder%3A%20list%5Bint%5D,%0A%20%20%20%20inorder_map%3A%20dict%5Bint,%20int%5D,%0A%20%20%20%20i%3A%20int,%0A%20%20%20%20l%3A%20int,%0A%20%20%20%20r%3A%20int,%0A%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%EF%BC%9A%E5%88%86%E6%B2%BB%22%22%22%0A%20%20%20%20%23%20%E5%AD%90%E6%A0%91%E5%8C%BA%E9%97%B4%E4%B8%BA%E7%A9%BA%E6%97%B6%E7%BB%88%E6%AD%A2%0A%20%20%20%20if%20r%20-%20l%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20root%20%3D%20TreeNode%28preorder%5Bi%5D%29%0A%20%20%20%20%23%20%E6%9F%A5%E8%AF%A2%20m%20%EF%BC%8C%E4%BB%8E%E8%80%8C%E5%88%92%E5%88%86%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20m%20%3D%20inorder_map%5Bpreorder%5Bi%5D%5D%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%B7%A6%E5%AD%90%E6%A0%91%0A%20%20%20%20root.left%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201,%20l,%20m%20-%201%29%0A%20%20%20%20%23%20%E5%AD%90%E9%97%AE%E9%A2%98%EF%BC%9A%E6%9E%84%E5%BB%BA%E5%8F%B3%E5%AD%90%E6%A0%91%0A%20%20%20%20root.right%20%3D%20dfs%28preorder,%20inorder_map,%20i%20%2B%201%20%2B%20m%20-%20l,%20m%20%2B%201,%20r%29%0A%20%20%20%20%23%20%E8%BF%94%E5%9B%9E%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20return%20root%0A%0A%0Adef%20build_tree%28preorder%3A%20list%5Bint%5D,%20inorder%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E6%9E%84%E5%BB%BA%E4%BA%8C%E5%8F%89%E6%A0%91%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%93%88%E5%B8%8C%E8%A1%A8%EF%BC%8C%E5%AD%98%E5%82%A8%20inorder%20%E5%85%83%E7%B4%A0%E5%88%B0%E7%B4%A2%E5%BC%95%E7%9A%84%E6%98%A0%E5%B0%84%0A%20%20%20%20inorder_map%20%3D%20%7Bval%3A%20i%20for%20i,%20val%20in%20enumerate%28inorder%29%7D%0A%20%20%20%20root%20%3D%20dfs%28preorder,%20inorder_map,%200,%200,%20len%28inorder%29%20-%201%29%0A%20%20%20%20return%20root%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20preorder%20%3D%20%5B3,%209,%202,%201,%207%5D%0A%20%20%20%20inorder%20%3D%20%5B9,%203,%201,%202,%207%5D%0A%20%20%20%20print%28f%22%E5%89%8D%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Bpreorder%7D%22%29%0A%20%20%20%20print%28f%22%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%20%3D%20%7Binorder%7D%22%29%0A%20%20%20%20root%20%3D%20build_tree%28preorder,%20inorder%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=21&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

圖 12-8 展示了構建二元樹的遞迴過程，各個節點是在向下“遞”的過程中建立的，而各條邊（引用）是在向上“迴”的過程中建立的。

=== "<1>"
    ![構建二元樹的遞迴過程](build_binary_tree_problem.assets/built_tree_step1.png){ class="animation-figure" }

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

<p align="center"> 圖 12-8 &nbsp; 構建二元樹的遞迴過程 </p>

每個遞迴函式內的前序走訪 `preorder` 和中序走訪 `inorder` 的劃分結果如圖 12-9 所示。

![每個遞迴函式中的劃分結果](build_binary_tree_problem.assets/built_tree_overall.png){ class="animation-figure" }

<p align="center"> 圖 12-9 &nbsp; 每個遞迴函式中的劃分結果 </p>

設樹的節點數量為 $n$ ，初始化每一個節點（執行一個遞迴函式 `dfs()` ）使用 $O(1)$ 時間。**因此總體時間複雜度為 $O(n)$** 。

雜湊表儲存 `inorder` 元素到索引的對映，空間複雜度為 $O(n)$ 。在最差情況下，即二元樹退化為鏈結串列時，遞迴深度達到 $n$ ，使用 $O(n)$ 的堆疊幀空間。**因此總體空間複雜度為 $O(n)$** 。
