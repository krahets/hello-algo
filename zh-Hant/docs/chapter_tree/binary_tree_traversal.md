---
comments: true
---

# 7.2 &nbsp; 二元樹走訪

從物理結構的角度來看，樹是一種基於鏈結串列的資料結構，因此其走訪方式是透過指標逐個訪問節點。然而，樹是一種非線性資料結構，這使得走訪樹比走訪鏈結串列更加複雜，需要藉助搜尋演算法來實現。

二元樹常見的走訪方式包括層序走訪、前序走訪、中序走訪和後序走訪等。

## 7.2.1 &nbsp; 層序走訪

如圖 7-9 所示，<u>層序走訪（level-order traversal）</u>從頂部到底部逐層走訪二元樹，並在每一層按照從左到右的順序訪問節點。

層序走訪本質上屬於<u>廣度優先走訪（breadth-first traversal）</u>，也稱<u>廣度優先搜尋（breadth-first search, BFS）</u>，它體現了一種“一圈一圈向外擴展”的逐層走訪方式。

![二元樹的層序走訪](binary_tree_traversal.assets/binary_tree_bfs.png){ class="animation-figure" }

<p align="center"> 圖 7-9 &nbsp; 二元樹的層序走訪 </p>

### 1. &nbsp; 程式碼實現

廣度優先走訪通常藉助“佇列”來實現。佇列遵循“先進先出”的規則，而廣度優先走訪則遵循“逐層推進”的規則，兩者背後的思想是一致的。實現程式碼如下：

=== "Python"

    ```python title="binary_tree_bfs.py"
    def level_order(root: TreeNode | None) -> list[int]:
        """層序走訪"""
        # 初始化佇列，加入根節點
        queue: deque[TreeNode] = deque()
        queue.append(root)
        # 初始化一個串列，用於儲存走訪序列
        res = []
        while queue:
            node: TreeNode = queue.popleft()  # 隊列出隊
            res.append(node.val)  # 儲存節點值
            if node.left is not None:
                queue.append(node.left)  # 左子節點入列
            if node.right is not None:
                queue.append(node.right)  # 右子節點入列
        return res
    ```

=== "C++"

    ```cpp title="binary_tree_bfs.cpp"
    /* 層序走訪 */
    vector<int> levelOrder(TreeNode *root) {
        // 初始化佇列，加入根節點
        queue<TreeNode *> queue;
        queue.push(root);
        // 初始化一個串列，用於儲存走訪序列
        vector<int> vec;
        while (!queue.empty()) {
            TreeNode *node = queue.front();
            queue.pop();              // 隊列出隊
            vec.push_back(node->val); // 儲存節點值
            if (node->left != nullptr)
                queue.push(node->left); // 左子節點入列
            if (node->right != nullptr)
                queue.push(node->right); // 右子節點入列
        }
        return vec;
    }
    ```

=== "Java"

    ```java title="binary_tree_bfs.java"
    /* 層序走訪 */
    List<Integer> levelOrder(TreeNode root) {
        // 初始化佇列，加入根節點
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 初始化一個串列，用於儲存走訪序列
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // 隊列出隊
            list.add(node.val);           // 儲存節點值
            if (node.left != null)
                queue.offer(node.left);   // 左子節點入列
            if (node.right != null)
                queue.offer(node.right);  // 右子節點入列
        }
        return list;
    }
    ```

=== "C#"

    ```csharp title="binary_tree_bfs.cs"
    /* 層序走訪 */
    List<int> LevelOrder(TreeNode root) {
        // 初始化佇列，加入根節點
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 初始化一個串列，用於儲存走訪序列
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // 隊列出隊
            list.Add(node.val!.Value);       // 儲存節點值
            if (node.left != null)
                queue.Enqueue(node.left);    // 左子節點入列
            if (node.right != null)
                queue.Enqueue(node.right);   // 右子節點入列
        }
        return list;
    }
    ```

=== "Go"

    ```go title="binary_tree_bfs.go"
    /* 層序走訪 */
    func levelOrder(root *TreeNode) []any {
        // 初始化佇列，加入根節點
        queue := list.New()
        queue.PushBack(root)
        // 初始化一個切片，用於儲存走訪序列
        nums := make([]any, 0)
        for queue.Len() > 0 {
            // 隊列出隊
            node := queue.Remove(queue.Front()).(*TreeNode)
            // 儲存節點值
            nums = append(nums, node.Val)
            if node.Left != nil {
                // 左子節點入列
                queue.PushBack(node.Left)
            }
            if node.Right != nil {
                // 右子節點入列
                queue.PushBack(node.Right)
            }
        }
        return nums
    }
    ```

=== "Swift"

    ```swift title="binary_tree_bfs.swift"
    /* 層序走訪 */
    func levelOrder(root: TreeNode) -> [Int] {
        // 初始化佇列，加入根節點
        var queue: [TreeNode] = [root]
        // 初始化一個串列，用於儲存走訪序列
        var list: [Int] = []
        while !queue.isEmpty {
            let node = queue.removeFirst() // 隊列出隊
            list.append(node.val) // 儲存節點值
            if let left = node.left {
                queue.append(left) // 左子節點入列
            }
            if let right = node.right {
                queue.append(right) // 右子節點入列
            }
        }
        return list
    }
    ```

=== "JS"

    ```javascript title="binary_tree_bfs.js"
    /* 層序走訪 */
    function levelOrder(root) {
        // 初始化佇列，加入根節點
        const queue = [root];
        // 初始化一個串列，用於儲存走訪序列
        const list = [];
        while (queue.length) {
            let node = queue.shift(); // 隊列出隊
            list.push(node.val); // 儲存節點值
            if (node.left) queue.push(node.left); // 左子節點入列
            if (node.right) queue.push(node.right); // 右子節點入列
        }
        return list;
    }
    ```

=== "TS"

    ```typescript title="binary_tree_bfs.ts"
    /* 層序走訪 */
    function levelOrder(root: TreeNode | null): number[] {
        // 初始化佇列，加入根節點
        const queue = [root];
        // 初始化一個串列，用於儲存走訪序列
        const list: number[] = [];
        while (queue.length) {
            let node = queue.shift() as TreeNode; // 隊列出隊
            list.push(node.val); // 儲存節點值
            if (node.left) {
                queue.push(node.left); // 左子節點入列
            }
            if (node.right) {
                queue.push(node.right); // 右子節點入列
            }
        }
        return list;
    }
    ```

=== "Dart"

    ```dart title="binary_tree_bfs.dart"
    /* 層序走訪 */
    List<int> levelOrder(TreeNode? root) {
      // 初始化佇列，加入根節點
      Queue<TreeNode?> queue = Queue();
      queue.add(root);
      // 初始化一個串列，用於儲存走訪序列
      List<int> res = [];
      while (queue.isNotEmpty) {
        TreeNode? node = queue.removeFirst(); // 隊列出隊
        res.add(node!.val); // 儲存節點值
        if (node.left != null) queue.add(node.left); // 左子節點入列
        if (node.right != null) queue.add(node.right); // 右子節點入列
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="binary_tree_bfs.rs"
    /* 層序走訪 */
    fn level_order(root: &Rc<RefCell<TreeNode>>) -> Vec<i32> {
        // 初始化佇列，加入根節點
        let mut que = VecDeque::new();
        que.push_back(root.clone());
        // 初始化一個串列，用於儲存走訪序列
        let mut vec = Vec::new();

        while let Some(node) = que.pop_front() {
            // 隊列出隊
            vec.push(node.borrow().val); // 儲存節點值
            if let Some(left) = node.borrow().left.as_ref() {
                que.push_back(left.clone()); // 左子節點入列
            }
            if let Some(right) = node.borrow().right.as_ref() {
                que.push_back(right.clone()); // 右子節點入列
            };
        }
        vec
    }
    ```

=== "C"

    ```c title="binary_tree_bfs.c"
    /* 層序走訪 */
    int *levelOrder(TreeNode *root, int *size) {
        /* 輔助佇列 */
        int front, rear;
        int index, *arr;
        TreeNode *node;
        TreeNode **queue;

        /* 輔助佇列 */
        queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
        // 佇列指標
        front = 0, rear = 0;
        // 加入根節點
        queue[rear++] = root;
        // 初始化一個串列，用於儲存走訪序列
        /* 輔助陣列 */
        arr = (int *)malloc(sizeof(int) * MAX_SIZE);
        // 陣列指標
        index = 0;
        while (front < rear) {
            // 隊列出隊
            node = queue[front++];
            // 儲存節點值
            arr[index++] = node->val;
            if (node->left != NULL) {
                // 左子節點入列
                queue[rear++] = node->left;
            }
            if (node->right != NULL) {
                // 右子節點入列
                queue[rear++] = node->right;
            }
        }
        // 更新陣列長度的值
        *size = index;
        arr = realloc(arr, sizeof(int) * (*size));

        // 釋放輔助陣列空間
        free(queue);
        return arr;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_bfs.kt"
    /* 層序走訪 */
    fun levelOrder(root: TreeNode?): MutableList<Int> {
        // 初始化佇列，加入根節點
        val queue = LinkedList<TreeNode?>()
        queue.add(root)
        // 初始化一個串列，用於儲存走訪序列
        val list = mutableListOf<Int>()
        while (queue.isNotEmpty()) {
            val node = queue.poll()      // 隊列出隊
            list.add(node?._val!!)       // 儲存節點值
            if (node.left != null)
                queue.offer(node.left)   // 左子節點入列
            if (node.right != null)
                queue.offer(node.right)  // 右子節點入列
        }
        return list
    }
    ```

=== "Ruby"

    ```ruby title="binary_tree_bfs.rb"
    ### 層序走訪 ###
    def level_order(root)
      # 初始化佇列，加入根節點
      queue = [root]
      # 初始化一個串列，用於儲存走訪序列
      res = []
      while !queue.empty?
        node = queue.shift # 隊列出隊
        res << node.val # 儲存節點值
        queue << node.left unless node.left.nil? # 左子節點入列
        queue << node.right unless node.right.nil? # 右子節點入列
      end
      res
    end
    ```

=== "Zig"

    ```zig title="binary_tree_bfs.zig"
    // 層序走訪
    fn levelOrder(comptime T: type, mem_allocator: std.mem.Allocator, root: *inc.TreeNode(T)) !std.ArrayList(T) {
        // 初始化佇列，加入根節點
        const L = std.TailQueue(*inc.TreeNode(T));
        var queue = L{};
        var root_node = try mem_allocator.create(L.Node);
        root_node.data = root;
        queue.append(root_node); 
        // 初始化一個串列，用於儲存走訪序列
        var list = std.ArrayList(T).init(std.heap.page_allocator);
        while (queue.len > 0) {
            var queue_node = queue.popFirst().?;    // 隊列出隊
            var node = queue_node.data;
            try list.append(node.val);              // 儲存節點值
            if (node.left != null) {
                var tmp_node = try mem_allocator.create(L.Node);
                tmp_node.data = node.left.?;
                queue.append(tmp_node);             // 左子節點入列
            }
            if (node.right != null) {
                var tmp_node = try mem_allocator.create(L.Node);
                tmp_node.data = node.right.?;
                queue.append(tmp_node);             // 右子節點入列
            }        
        }
        return list;
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%EF%BC%9A%E9%81%9E%E8%BF%B4%22%22%22%0A%20%20%20%20%23%20%E5%A6%82%E6%9E%9C%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%8C%E6%88%96%E8%80%85%E5%B0%8D%E6%87%89%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%20None%20%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%95%B6%E5%89%8D%E7%AF%80%E9%BB%9E%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E6%A7%8B%E5%BB%BA%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20level_order%28root%3A%20TreeNode%20%7C%20None%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BD%87%E5%88%97%EF%BC%8C%E5%8A%A0%E5%85%A5%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20queue%3A%20deque%5BTreeNode%5D%20%3D%20deque%28%29%0A%20%20%20%20queue.append%28root%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%80%E5%80%8B%E4%B8%B2%E5%88%97%EF%BC%8C%E7%94%A8%E6%96%BC%E5%84%B2%E5%AD%98%E8%B5%B0%E8%A8%AA%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20while%20queue%3A%0A%20%20%20%20%20%20%20%20node%3A%20TreeNode%20%3D%20queue.popleft%28%29%20%20%23%20%E9%9A%8A%E5%88%97%E5%87%BA%E9%9A%8A%0A%20%20%20%20%20%20%20%20res.append%28node.val%29%20%20%23%20%E5%84%B2%E5%AD%98%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20if%20node.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28node.left%29%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%85%A5%E5%88%97%0A%20%20%20%20%20%20%20%20if%20node.right%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28node.right%29%20%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%85%A5%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E9%80%99%E8%A3%A1%E8%97%89%E5%8A%A9%E4%BA%86%E4%B8%80%E5%80%8B%E5%BE%9E%E9%99%A3%E5%88%97%E7%9B%B4%E6%8E%A5%E7%94%9F%E6%88%90%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E5%87%BD%E5%BC%8F%0A%20%20%20%20root%20%3D%20list_to_tree%28arr%3D%5B1%2C%202%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res%20%3D%20level_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=127&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20collections%20import%20deque%0A%0Aclass%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%EF%BC%9A%E9%81%9E%E8%BF%B4%22%22%22%0A%20%20%20%20%23%20%E5%A6%82%E6%9E%9C%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%8C%E6%88%96%E8%80%85%E5%B0%8D%E6%87%89%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%20None%20%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%95%B6%E5%89%8D%E7%AF%80%E9%BB%9E%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E6%A7%8B%E5%BB%BA%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20level_order%28root%3A%20TreeNode%20%7C%20None%29%20-%3E%20list%5Bint%5D%3A%0A%20%20%20%20%22%22%22%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BD%87%E5%88%97%EF%BC%8C%E5%8A%A0%E5%85%A5%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20queue%3A%20deque%5BTreeNode%5D%20%3D%20deque%28%29%0A%20%20%20%20queue.append%28root%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%B8%80%E5%80%8B%E4%B8%B2%E5%88%97%EF%BC%8C%E7%94%A8%E6%96%BC%E5%84%B2%E5%AD%98%E8%B5%B0%E8%A8%AA%E5%BA%8F%E5%88%97%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20while%20queue%3A%0A%20%20%20%20%20%20%20%20node%3A%20TreeNode%20%3D%20queue.popleft%28%29%20%20%23%20%E9%9A%8A%E5%88%97%E5%87%BA%E9%9A%8A%0A%20%20%20%20%20%20%20%20res.append%28node.val%29%20%20%23%20%E5%84%B2%E5%AD%98%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20if%20node.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28node.left%29%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%85%A5%E5%88%97%0A%20%20%20%20%20%20%20%20if%20node.right%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20queue.append%28node.right%29%20%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%85%A5%E5%88%97%0A%20%20%20%20return%20res%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E9%80%99%E8%A3%A1%E8%97%89%E5%8A%A9%E4%BA%86%E4%B8%80%E5%80%8B%E5%BE%9E%E9%99%A3%E5%88%97%E7%9B%B4%E6%8E%A5%E7%94%9F%E6%88%90%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E5%87%BD%E5%BC%8F%0A%20%20%20%20root%20%3D%20list_to_tree%28arr%3D%5B1%2C%202%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res%20%3D%20level_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%B1%A4%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=127&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 複雜度分析

- **時間複雜度為 $O(n)$** ：所有節點被訪問一次，使用 $O(n)$ 時間，其中 $n$ 為節點數量。
- **空間複雜度為 $O(n)$** ：在最差情況下，即滿二元樹時，走訪到最底層之前，佇列中最多同時存在 $(n + 1) / 2$ 個節點，佔用 $O(n)$ 空間。

## 7.2.2 &nbsp; 前序、中序、後序走訪

相應地，前序、中序和後序走訪都屬於<u>深度優先走訪（depth-first traversal）</u>，也稱<u>深度優先搜尋（depth-first search, DFS）</u>，它體現了一種“先走到盡頭，再回溯繼續”的走訪方式。

圖 7-10 展示了對二元樹進行深度優先走訪的工作原理。**深度優先走訪就像是繞著整棵二元樹的外圍“走”一圈**，在每個節點都會遇到三個位置，分別對應前序走訪、中序走訪和後序走訪。

![二元搜尋樹的前序、中序、後序走訪](binary_tree_traversal.assets/binary_tree_dfs.png){ class="animation-figure" }

<p align="center"> 圖 7-10 &nbsp; 二元搜尋樹的前序、中序、後序走訪 </p>

### 1. &nbsp; 程式碼實現

深度優先搜尋通常基於遞迴實現：

=== "Python"

    ```python title="binary_tree_dfs.py"
    def pre_order(root: TreeNode | None):
        """前序走訪"""
        if root is None:
            return
        # 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        res.append(root.val)
        pre_order(root=root.left)
        pre_order(root=root.right)

    def in_order(root: TreeNode | None):
        """中序走訪"""
        if root is None:
            return
        # 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        in_order(root=root.left)
        res.append(root.val)
        in_order(root=root.right)

    def post_order(root: TreeNode | None):
        """後序走訪"""
        if root is None:
            return
        # 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        post_order(root=root.left)
        post_order(root=root.right)
        res.append(root.val)
    ```

=== "C++"

    ```cpp title="binary_tree_dfs.cpp"
    /* 前序走訪 */
    void preOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        vec.push_back(root->val);
        preOrder(root->left);
        preOrder(root->right);
    }

    /* 中序走訪 */
    void inOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root->left);
        vec.push_back(root->val);
        inOrder(root->right);
    }

    /* 後序走訪 */
    void postOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root->left);
        postOrder(root->right);
        vec.push_back(root->val);
    }
    ```

=== "Java"

    ```java title="binary_tree_dfs.java"
    /* 前序走訪 */
    void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中序走訪 */
    void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 後序走訪 */
    void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }
    ```

=== "C#"

    ```csharp title="binary_tree_dfs.cs"
    /* 前序走訪 */
    void PreOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.Add(root.val!.Value);
        PreOrder(root.left);
        PreOrder(root.right);
    }

    /* 中序走訪 */
    void InOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        InOrder(root.left);
        list.Add(root.val!.Value);
        InOrder(root.right);
    }

    /* 後序走訪 */
    void PostOrder(TreeNode? root) {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        PostOrder(root.left);
        PostOrder(root.right);
        list.Add(root.val!.Value);
    }
    ```

=== "Go"

    ```go title="binary_tree_dfs.go"
    /* 前序走訪 */
    func preOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        nums = append(nums, node.Val)
        preOrder(node.Left)
        preOrder(node.Right)
    }

    /* 中序走訪 */
    func inOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(node.Left)
        nums = append(nums, node.Val)
        inOrder(node.Right)
    }

    /* 後序走訪 */
    func postOrder(node *TreeNode) {
        if node == nil {
            return
        }
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(node.Left)
        postOrder(node.Right)
        nums = append(nums, node.Val)
    }
    ```

=== "Swift"

    ```swift title="binary_tree_dfs.swift"
    /* 前序走訪 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.append(root.val)
        preOrder(root: root.left)
        preOrder(root: root.right)
    }

    /* 中序走訪 */
    func inOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root: root.left)
        list.append(root.val)
        inOrder(root: root.right)
    }

    /* 後序走訪 */
    func postOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root: root.left)
        postOrder(root: root.right)
        list.append(root.val)
    }
    ```

=== "JS"

    ```javascript title="binary_tree_dfs.js"
    /* 前序走訪 */
    function preOrder(root) {
        if (root === null) return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.push(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中序走訪 */
    function inOrder(root) {
        if (root === null) return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root.left);
        list.push(root.val);
        inOrder(root.right);
    }

    /* 後序走訪 */
    function postOrder(root) {
        if (root === null) return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root.left);
        postOrder(root.right);
        list.push(root.val);
    }
    ```

=== "TS"

    ```typescript title="binary_tree_dfs.ts"
    /* 前序走訪 */
    function preOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.push(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中序走訪 */
    function inOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root.left);
        list.push(root.val);
        inOrder(root.right);
    }

    /* 後序走訪 */
    function postOrder(root: TreeNode | null): void {
        if (root === null) {
            return;
        }
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root.left);
        postOrder(root.right);
        list.push(root.val);
    }
    ```

=== "Dart"

    ```dart title="binary_tree_dfs.dart"
    /* 前序走訪 */
    void preOrder(TreeNode? node) {
      if (node == null) return;
      // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
      list.add(node.val);
      preOrder(node.left);
      preOrder(node.right);
    }

    /* 中序走訪 */
    void inOrder(TreeNode? node) {
      if (node == null) return;
      // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
      inOrder(node.left);
      list.add(node.val);
      inOrder(node.right);
    }

    /* 後序走訪 */
    void postOrder(TreeNode? node) {
      if (node == null) return;
      // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
      postOrder(node.left);
      postOrder(node.right);
      list.add(node.val);
    }
    ```

=== "Rust"

    ```rust title="binary_tree_dfs.rs"
    /* 前序走訪 */
    fn pre_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        if let Some(node) = root {
            // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
            result.push(node.borrow().val);
            result.extend(pre_order(node.borrow().left.as_ref()));
            result.extend(pre_order(node.borrow().right.as_ref()));
        }
        result
    }

    /* 中序走訪 */
    fn in_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        if let Some(node) = root {
            // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
            result.extend(in_order(node.borrow().left.as_ref()));
            result.push(node.borrow().val);
            result.extend(in_order(node.borrow().right.as_ref()));
        }
        result
    }

    /* 後序走訪 */
    fn post_order(root: Option<&Rc<RefCell<TreeNode>>>) -> Vec<i32> {
        let mut result = vec![];

        if let Some(node) = root {
            // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
            result.extend(post_order(node.borrow().left.as_ref()));
            result.extend(post_order(node.borrow().right.as_ref()));
            result.push(node.borrow().val);
        }
        result
    }
    ```

=== "C"

    ```c title="binary_tree_dfs.c"
    /* 前序走訪 */
    void preOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        arr[(*size)++] = root->val;
        preOrder(root->left, size);
        preOrder(root->right, size);
    }

    /* 中序走訪 */
    void inOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root->left, size);
        arr[(*size)++] = root->val;
        inOrder(root->right, size);
    }

    /* 後序走訪 */
    void postOrder(TreeNode *root, int *size) {
        if (root == NULL)
            return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root->left, size);
        postOrder(root->right, size);
        arr[(*size)++] = root->val;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_dfs.kt"
    /* 前序走訪 */
    fun preOrder(root: TreeNode?) {
        if (root == null) return
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        list.add(root._val)
        preOrder(root.left)
        preOrder(root.right)
    }

    /* 中序走訪 */
    fun inOrder(root: TreeNode?) {
        if (root == null) return
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        inOrder(root.left)
        list.add(root._val)
        inOrder(root.right)
    }

    /* 後序走訪 */
    fun postOrder(root: TreeNode?) {
        if (root == null) return
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        postOrder(root.left)
        postOrder(root.right)
        list.add(root._val)
    }
    ```

=== "Ruby"

    ```ruby title="binary_tree_dfs.rb"
    ### 前序走訪 ###
    def pre_order(root)
      return if root.nil?

      # 訪問優先順序：根節點 -> 左子樹 -> 右子樹
      $res << root.val
      pre_order(root.left)
      pre_order(root.right)
    end

    ### 中序走訪 ###
    def in_order(root)
      return if root.nil?

      # 訪問優先順序：左子樹 -> 根節點 -> 右子樹
      in_order(root.left)
      $res << root.val
      in_order(root.right)
    end

    ### 後序走訪 ###
    def post_order(root)
      return if root.nil?

      # 訪問優先順序：左子樹 -> 右子樹 -> 根節點
      post_order(root.left)
      post_order(root.right)
      $res << root.val
    end
    ```

=== "Zig"

    ```zig title="binary_tree_dfs.zig"
    // 前序走訪
    fn preOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
        if (root == null) return;
        // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
        try list.append(root.?.val);
        try preOrder(T, root.?.left);
        try preOrder(T, root.?.right);
    }

    // 中序走訪
    fn inOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
        try inOrder(T, root.?.left);
        try list.append(root.?.val);
        try inOrder(T, root.?.right);
    }

    // 後序走訪
    fn postOrder(comptime T: type, root: ?*inc.TreeNode(T)) !void {
        if (root == null) return;
        // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
        try postOrder(T, root.?.left);
        try postOrder(T, root.?.right);
        try list.append(root.?.val);
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%EF%BC%9A%E9%81%9E%E8%BF%B4%22%22%22%0A%20%20%20%20%23%20%E5%A6%82%E6%9E%9C%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%8C%E6%88%96%E8%80%85%E5%B0%8D%E6%87%89%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%20None%20%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%95%B6%E5%89%8D%E7%AF%80%E9%BB%9E%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E6%A7%8B%E5%BB%BA%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E6%A0%B9%E7%AF%80%E9%BB%9E%20-%3E%20%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20res.append%28root.val%29%0A%20%20%20%20pre_order%28root%3Droot.left%29%0A%20%20%20%20pre_order%28root%3Droot.right%29%0A%0Adef%20in_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E6%A0%B9%E7%AF%80%E9%BB%9E%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20in_order%28root%3Droot.left%29%0A%20%20%20%20res.append%28root.val%29%0A%20%20%20%20in_order%28root%3Droot.right%29%0A%0Adef%20post_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%20-%3E%20%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20post_order%28root%3Droot.left%29%0A%20%20%20%20post_order%28root%3Droot.right%29%0A%20%20%20%20res.append%28root.val%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E9%80%99%E8%A3%A1%E8%97%89%E5%8A%A9%E4%BA%86%E4%B8%80%E5%80%8B%E5%BE%9E%E9%99%A3%E5%88%97%E7%9B%B4%E6%8E%A5%E7%94%9F%E6%88%90%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E5%87%BD%E5%BC%8F%0A%20%20%20%20root%20%3D%20list_to_tree%28arr%3D%5B1%2C%202%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20pre_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29%0A%0A%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res.clear%28%29%0A%20%20%20%20in_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29%0A%0A%20%20%20%20%23%20%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res.clear%28%29%0A%20%20%20%20post_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=129&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%AF%80%E9%BB%9E%E5%80%BC%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%23%20%E5%8F%B3%E5%AD%90%E7%AF%80%E9%BB%9E%E5%BC%95%E7%94%A8%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D%2C%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%EF%BC%9A%E9%81%9E%E8%BF%B4%22%22%22%0A%20%20%20%20%23%20%E5%A6%82%E6%9E%9C%E7%B4%A2%E5%BC%95%E8%B6%85%E5%87%BA%E9%99%A3%E5%88%97%E9%95%B7%E5%BA%A6%EF%BC%8C%E6%88%96%E8%80%85%E5%B0%8D%E6%87%89%E7%9A%84%E5%85%83%E7%B4%A0%E7%82%BA%20None%20%EF%BC%8C%E5%89%87%E8%BF%94%E5%9B%9E%20None%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E6%A7%8B%E5%BB%BA%E7%95%B6%E5%89%8D%E7%AF%80%E9%BB%9E%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E6%A7%8B%E5%BB%BA%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr%2C%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E5%B0%87%E4%B8%B2%E5%88%97%E5%8F%8D%E5%BA%8F%E5%88%97%E5%8C%96%E7%82%BA%E4%BA%8C%E5%85%83%E6%A8%B9%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr%2C%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E6%A0%B9%E7%AF%80%E9%BB%9E%20-%3E%20%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20res.append%28root.val%29%0A%20%20%20%20pre_order%28root%3Droot.left%29%0A%20%20%20%20pre_order%28root%3Droot.right%29%0A%0Adef%20in_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E6%A0%B9%E7%AF%80%E9%BB%9E%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%0A%20%20%20%20in_order%28root%3Droot.left%29%0A%20%20%20%20res.append%28root.val%29%0A%20%20%20%20in_order%28root%3Droot.right%29%0A%0Adef%20post_order%28root%3A%20TreeNode%20%7C%20None%29%3A%0A%20%20%20%20%22%22%22%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A8%AA%E5%95%8F%E5%84%AA%E5%85%88%E9%A0%86%E5%BA%8F%EF%BC%9A%E5%B7%A6%E5%AD%90%E6%A8%B9%20-%3E%20%E5%8F%B3%E5%AD%90%E6%A8%B9%20-%3E%20%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20post_order%28root%3Droot.left%29%0A%20%20%20%20post_order%28root%3Droot.right%29%0A%20%20%20%20res.append%28root.val%29%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%A8%B9%0A%20%20%20%20%23%20%E9%80%99%E8%A3%A1%E8%97%89%E5%8A%A9%E4%BA%86%E4%B8%80%E5%80%8B%E5%BE%9E%E9%99%A3%E5%88%97%E7%9B%B4%E6%8E%A5%E7%94%9F%E6%88%90%E4%BA%8C%E5%85%83%E6%A8%B9%E7%9A%84%E5%87%BD%E5%BC%8F%0A%20%20%20%20root%20%3D%20list_to_tree%28arr%3D%5B1%2C%202%2C%203%2C%204%2C%205%2C%206%2C%207%5D%29%0A%0A%20%20%20%20%23%20%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20pre_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%89%8D%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29%0A%0A%20%20%20%20%23%20%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res.clear%28%29%0A%20%20%20%20in_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29%0A%0A%20%20%20%20%23%20%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%0A%20%20%20%20res.clear%28%29%0A%20%20%20%20post_order%28root%29%0A%20%20%20%20print%28%22%5Cn%E5%BE%8C%E5%BA%8F%E8%B5%B0%E8%A8%AA%E7%9A%84%E7%AF%80%E9%BB%9E%E5%88%97%E5%8D%B0%E5%BA%8F%E5%88%97%20%3D%20%22%2C%20res%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=129&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

!!! tip

    深度優先搜尋也可以基於迭代實現，有興趣的讀者可以自行研究。

圖 7-11 展示了前序走訪二元樹的遞迴過程，其可分為“遞”和“迴”兩個逆向的部分。

1. “遞”表示開啟新方法，程式在此過程中訪問下一個節點。
2. “迴”表示函式返回，代表當前節點已經訪問完畢。

=== "<1>"
    ![前序走訪的遞迴過程](binary_tree_traversal.assets/preorder_step1.png){ class="animation-figure" }

=== "<2>"
    ![preorder_step2](binary_tree_traversal.assets/preorder_step2.png){ class="animation-figure" }

=== "<3>"
    ![preorder_step3](binary_tree_traversal.assets/preorder_step3.png){ class="animation-figure" }

=== "<4>"
    ![preorder_step4](binary_tree_traversal.assets/preorder_step4.png){ class="animation-figure" }

=== "<5>"
    ![preorder_step5](binary_tree_traversal.assets/preorder_step5.png){ class="animation-figure" }

=== "<6>"
    ![preorder_step6](binary_tree_traversal.assets/preorder_step6.png){ class="animation-figure" }

=== "<7>"
    ![preorder_step7](binary_tree_traversal.assets/preorder_step7.png){ class="animation-figure" }

=== "<8>"
    ![preorder_step8](binary_tree_traversal.assets/preorder_step8.png){ class="animation-figure" }

=== "<9>"
    ![preorder_step9](binary_tree_traversal.assets/preorder_step9.png){ class="animation-figure" }

=== "<10>"
    ![preorder_step10](binary_tree_traversal.assets/preorder_step10.png){ class="animation-figure" }

=== "<11>"
    ![preorder_step11](binary_tree_traversal.assets/preorder_step11.png){ class="animation-figure" }

<p align="center"> 圖 7-11 &nbsp; 前序走訪的遞迴過程 </p>

### 2. &nbsp; 複雜度分析

- **時間複雜度為 $O(n)$** ：所有節點被訪問一次，使用 $O(n)$ 時間。
- **空間複雜度為 $O(n)$** ：在最差情況下，即樹退化為鏈結串列時，遞迴深度達到 $n$ ，系統佔用 $O(n)$ 堆疊幀空間。
