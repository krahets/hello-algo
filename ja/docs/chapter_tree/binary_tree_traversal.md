---
comments: true
---

# 7.2 &nbsp; 二分木の走査

物理的構造の観点から見ると、木は連結リストに基づくデータ構造です。したがって、その走査方法はポインタを通してノードに一つずつアクセスすることを含みます。しかし、木は非線形データ構造であるため、木の走査は連結リストの走査よりも複雑で、検索アルゴリズムの支援が必要です。

二分木の一般的な走査方法には、レベル順走査、前順走査、中順走査、後順走査があります。

## 7.2.1 &nbsp; レベル順走査

下図に示すように、<u>レベル順走査</u>は二分木を上から下へ、層ごとに走査します。各レベル内では、左から右へノードを訪問します。

レベル順走査は本質的に<u>幅優先走査</u>の一種で、<u>幅優先探索（BFS）</u>とも呼ばれ、「周囲に向かって外向きに拡張する」層ごとの走査方法を体現しています。

![二分木のレベル順走査](binary_tree_traversal.assets/binary_tree_bfs.png){ class="animation-figure" }

<p align="center"> 図 7-9 &nbsp; 二分木のレベル順走査 </p>

### 1. &nbsp; コード実装

幅優先走査は通常「キュー」の助けを借りて実装されます。キューは「先入れ先出し」の規則に従い、幅優先走査は「層ごとの進行」規則に従います。両者の基本的な考え方は一致しています。実装コードは以下の通りです：

=== "Python"

    ```python title="binary_tree_bfs.py"
    def level_order(root: TreeNode | None) -> list[int]:
        """レベル順走査"""
        # キューを初期化し、ルートノードを追加
        queue: deque[TreeNode] = deque()
        queue.append(root)
        # 走査シーケンスを格納するリストを初期化
        res = []
        while queue:
            node: TreeNode = queue.popleft()  # キューからデキュー
            res.append(node.val)  # ノードの値を保存
            if node.left is not None:
                queue.append(node.left)  # 左の子ノードをエンキュー
            if node.right is not None:
                queue.append(node.right)  # 右の子ノードをエンキュー
        return res
    ```

=== "C++"

    ```cpp title="binary_tree_bfs.cpp"
    /* レベル順走査 */
    vector<int> levelOrder(TreeNode *root) {
        // キューを初期化、ルートノードを追加
        queue<TreeNode *> queue;
        queue.push(root);
        // 走査順序を保存するリストを初期化
        vector<int> vec;
        while (!queue.empty()) {
            TreeNode *node = queue.front();
            queue.pop();              // キューからデキュー
            vec.push_back(node->val); // ノード値を保存
            if (node->left != nullptr)
                queue.push(node->left); // 左の子ノードをエンキュー
            if (node->right != nullptr)
                queue.push(node->right); // 右の子ノードをエンキュー
        }
        return vec;
    }
    ```

=== "Java"

    ```java title="binary_tree_bfs.java"
    /* レベル順走査 */
    List<Integer> levelOrder(TreeNode root) {
        // キューを初期化し、根ノードを追加
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        // 走査順序を格納するリストを初期化
        List<Integer> list = new ArrayList<>();
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll(); // キューのデキュー
            list.add(node.val);           // ノードの値を保存
            if (node.left != null)
                queue.offer(node.left);   // 左の子ノードをエンキュー
            if (node.right != null)
                queue.offer(node.right);  // 右の子ノードをエンキュー
        }
        return list;
    }
    ```

=== "C#"

    ```csharp title="binary_tree_bfs.cs"
    [class]{binary_tree_bfs}-[func]{LevelOrder}
    ```

=== "Go"

    ```go title="binary_tree_bfs.go"
    [class]{}-[func]{levelOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_bfs.swift"
    [class]{}-[func]{levelOrder}
    ```

=== "JS"

    ```javascript title="binary_tree_bfs.js"
    [class]{}-[func]{levelOrder}
    ```

=== "TS"

    ```typescript title="binary_tree_bfs.ts"
    [class]{}-[func]{levelOrder}
    ```

=== "Dart"

    ```dart title="binary_tree_bfs.dart"
    [class]{}-[func]{levelOrder}
    ```

=== "Rust"

    ```rust title="binary_tree_bfs.rs"
    [class]{}-[func]{level_order}
    ```

=== "C"

    ```c title="binary_tree_bfs.c"
    [class]{}-[func]{levelOrder}
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_bfs.kt"
    [class]{}-[func]{levelOrder}
    ```

=== "Ruby"

    ```ruby title="binary_tree_bfs.rb"
    [class]{}-[func]{level_order}
    ```

### 2. &nbsp; 計算量分析

- **時間計算量は$O(n)$**: すべてのノードが一度ずつ訪問され、$O(n)$の時間がかかります。ここで$n$はノード数です。
- **空間計算量は$O(n)$**: 最悪の場合、つまり完全二分木の場合、最下位レベルに走査する前に、キューは最大$(n + 1) / 2$個のノードを同時に含むことができ、$O(n)$の空間を占有します。

## 7.2.2 &nbsp; 前順、中順、後順走査

対応して、前順、中順、後順走査はすべて<u>深度優先走査</u>に属し、<u>深度優先探索（DFS）</u>とも呼ばれ、「まず最後まで進み、その後バックトラックして続行する」走査方法を体現しています。

下図は二分木に対して深度優先走査を実行する動作原理を示しています。**深度優先走査は二分木全体を「歩き回る」ようなもので**、各ノードで3つの位置に遭遇し、それらは前順、中順、後順走査に対応しています。

![二分探索木の前順、中順、後順走査](binary_tree_traversal.assets/binary_tree_dfs.png){ class="animation-figure" }

<p align="center"> 図 7-10 &nbsp; 二分探索木の前順、中順、後順走査 </p>

### 1. &nbsp; コード実装

深度優先探索は通常再帰に基づいて実装されます：

=== "Python"

    ```python title="binary_tree_dfs.py"
    def pre_order(root: TreeNode | None):
        """前順走査"""
        if root is None:
            return
        # 訪問順序: ルートノード -> 左部分木 -> 右部分木
        res.append(root.val)
        pre_order(root=root.left)
        pre_order(root=root.right)

    def in_order(root: TreeNode | None):
        """中順走査"""
        if root is None:
            return
        # 訪問順序: 左部分木 -> ルートノード -> 右部分木
        in_order(root=root.left)
        res.append(root.val)
        in_order(root=root.right)

    def post_order(root: TreeNode | None):
        """後順走査"""
        if root is None:
            return
        # 訪問順序: 左部分木 -> 右部分木 -> ルートノード
        post_order(root=root.left)
        post_order(root=root.right)
        res.append(root.val)
    ```

=== "C++"

    ```cpp title="binary_tree_dfs.cpp"
    /* 前順走査 */
    void preOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先度：ルートノード -> 左部分木 -> 右部分木
        vec.push_back(root->val);
        preOrder(root->left);
        preOrder(root->right);
    }

    /* 中順走査 */
    void inOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先度：左部分木 -> ルートノード -> 右部分木
        inOrder(root->left);
        vec.push_back(root->val);
        inOrder(root->right);
    }

    /* 後順走査 */
    void postOrder(TreeNode *root) {
        if (root == nullptr)
            return;
        // 訪問優先度：左部分木 -> 右部分木 -> ルートノード
        postOrder(root->left);
        postOrder(root->right);
        vec.push_back(root->val);
    }
    ```

=== "Java"

    ```java title="binary_tree_dfs.java"
    /* 前順走査 */
    void preOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 根ノード -> 左部分木 -> 右部分木
        list.add(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /* 中順走査 */
    void inOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 左部分木 -> 根ノード -> 右部分木
        inOrder(root.left);
        list.add(root.val);
        inOrder(root.right);
    }

    /* 後順走査 */
    void postOrder(TreeNode root) {
        if (root == null)
            return;
        // 訪問優先度: 左部分木 -> 右部分木 -> 根ノード
        postOrder(root.left);
        postOrder(root.right);
        list.add(root.val);
    }
    ```

=== "C#"

    ```csharp title="binary_tree_dfs.cs"
    [class]{binary_tree_dfs}-[func]{PreOrder}

    [class]{binary_tree_dfs}-[func]{InOrder}

    [class]{binary_tree_dfs}-[func]{PostOrder}
    ```

=== "Go"

    ```go title="binary_tree_dfs.go"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Swift"

    ```swift title="binary_tree_dfs.swift"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "JS"

    ```javascript title="binary_tree_dfs.js"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "TS"

    ```typescript title="binary_tree_dfs.ts"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Dart"

    ```dart title="binary_tree_dfs.dart"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Rust"

    ```rust title="binary_tree_dfs.rs"
    [class]{}-[func]{pre_order}

    [class]{}-[func]{in_order}

    [class]{}-[func]{post_order}
    ```

=== "C"

    ```c title="binary_tree_dfs.c"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Kotlin"

    ```kotlin title="binary_tree_dfs.kt"
    [class]{}-[func]{preOrder}

    [class]{}-[func]{inOrder}

    [class]{}-[func]{postOrder}
    ```

=== "Ruby"

    ```ruby title="binary_tree_dfs.rb"
    [class]{}-[func]{pre_order}

    [class]{}-[func]{in_order}

    [class]{}-[func]{post_order}
    ```

!!! tip

    深度優先探索は反復に基づいても実装できます。興味のある読者は自分で学習してください。

下図は二分木の前順走査の再帰プロセスを示しており、これは「再帰」と「復帰」という2つの反対の部分に分けることができます。

1. 「再帰」は新しいメソッドを開始することを意味し、プログラムはこのプロセスで次のノードにアクセスします。
2. 「復帰」は関数が戻ることを意味し、現在のノードが完全にアクセスされたことを示します。

=== "<1>"
    ![前順走査の再帰プロセス](binary_tree_traversal.assets/preorder_step1.png){ class="animation-figure" }

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

<p align="center"> 図 7-11 &nbsp; 前順走査の再帰プロセス </p>

### 2. &nbsp; 計算量分析

- **時間計算量は$O(n)$**: すべてのノードが一度ずつ訪問され、$O(n)$の時間を使用します。
- **空間計算量は$O(n)$**: 最悪の場合、つまり木が連結リストに退化した場合、再帰の深さは$n$に達し、システムは$O(n)$のスタックフレーム空間を占有します。
