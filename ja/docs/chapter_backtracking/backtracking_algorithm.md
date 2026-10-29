---
comments: true
---

# 13.1 &nbsp; バックトラッキングアルゴリズム

<u>バックトラッキングアルゴリズム（backtracking algorithm）</u>は、総当たりで問題を解く方法です。初期状態から出発し、可能な解をすべて探索して、条件に合う解が見つかれば記録します。解が見つかるか、すべての選択肢を試しても解がないとわかるまで続けることが、その基本的な考え方です。

通常は「深さ優先探索」で解の空間を走査します。「二分木」の章では、行きがけ順、通りがけ順、帰りがけ順の走査が、いずれも深さ優先探索に属すると説明しました。ここでは行きがけ順走査を使ってバックトラッキングの問題を作り、仕組みを段階的に理解していきます。

!!! question "例題 1"

    二分木が与えられます。値が $7$ のノードをすべて探して記録し、ノードのリストを返してください。

この問題では、木を行きがけ順に走査し、現在のノードの値が $7$ かを調べます。そうなら、そのノードの値を結果リスト `res` に追加します。処理の流れと実装を、図 13-1 と次のコードに示します。

=== "Python"

    ```python title="preorder_traversal_i_compact.py"
    def pre_order(root: TreeNode):
        """行きがけ順走査：例題 1"""
        if root is None:
            return
        if root.val == 7:
            # 解を記録する
            res.append(root)
        pre_order(root.left)
        pre_order(root.right)
    ```

=== "C++"

    ```cpp title="preorder_traversal_i_compact.cpp"
    /* 行きがけ順走査：例題 1 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        if (root->val == 7) {
            // 解を記録する
            res.push_back(root);
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Java"

    ```java title="preorder_traversal_i_compact.java"
    /* 行きがけ順走査：例題 1 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 解を記録する
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_i_compact.cs"
    /* 行きがけ順走査：例題 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // 解を記録する
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_i_compact.go"
    /* 行きがけ順走査：例題 1 */
    func preOrderI(root *TreeNode, res *[]*TreeNode) {
        if root == nil {
            return
        }
        if (root.Val).(int) == 7 {
            // 解を記録する
            *res = append(*res, root)
        }
        preOrderI(root.Left, res)
        preOrderI(root.Right, res)
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_i_compact.swift"
    /* 行きがけ順走査：例題 1 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        if root.val == 7 {
            // 解を記録する
            res.append(root)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_i_compact.js"
    /* 行きがけ順走査：例題 1 */
    function preOrder(root, res) {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // 解を記録する
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_i_compact.ts"
    /* 行きがけ順走査：例題 1 */
    function preOrder(root: TreeNode | null, res: TreeNode[]): void {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // 解を記録する
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_i_compact.dart"
    /* 行きがけ順走査：例題 1 */
    void preOrder(TreeNode? root, List<TreeNode> res) {
      if (root == null) {
        return;
      }
      if (root.val == 7) {
        // 解を記録する
        res.add(root);
      }
      preOrder(root.left, res);
      preOrder(root.right, res);
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_i_compact.rs"
    /* 行きがけ順走査：例題 1 */
    fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: Option<&Rc<RefCell<TreeNode>>>) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            if node.borrow().val == 7 {
                // 解を記録する
                res.push(node.clone());
            }
            pre_order(res, node.borrow().left.as_ref());
            pre_order(res, node.borrow().right.as_ref());
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_i_compact.c"
    /* 行きがけ順走査：例題 1 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        if (root->val == 7) {
            // 解を記録する
            res[resSize++] = root;
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_i_compact.kt"
    /* 行きがけ順走査：例題 1 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        if (root._val == 7) {
            // 解を記録する
            res!!.add(root)
        }
        preOrder(root.left)
        preOrder(root.right)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_i_compact.rb"
    ### 行きがけ順走査：例題 1 ###
    def pre_order(root)
      return unless root

      # 解を記録する
      $res << root if root.val == 7

      pre_order(root.left)
      pre_order(root.right)
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E5%80%A4%E3%81%8C%207%20%E3%81%A7%E3%81%82%E3%82%8B%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%201%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28root%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20res%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E5%80%A4%E3%81%8C%207%20%E3%81%A7%E3%81%82%E3%82%8B%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20res%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

![行きがけ順走査でノードを探す](backtracking_algorithm.assets/preorder_find_nodes.png){ class="animation-figure" }

<p align="center"> 図 13-1 &nbsp; 行きがけ順走査でノードを探す </p>

## 13.1.1 &nbsp; 試行と後戻り

**バックトラッキングと呼ぶのは、解の空間を探す際に「試行」と「後戻り」を行うためです**。探索中に、それ以上進めない状態や、条件を満たす解が得られない状態に出会うと、直前の選択を取り消して元の状態に戻り、ほかの可能な選択肢を試します。

例題 1 では、各ノードへの訪問が一つの「試行」に対応し、葉ノードの先へ進んだときや、親ノードへ戻るときの `return` が「後戻り」に対応します。

ただし、**後戻りは単に関数から戻ることだけではありません**。これを説明するため、例題 1 を少し拡張します。

!!! question "例題 2"

    二分木で値が $7$ のノードをすべて探し、**根ノードからそれらのノードまでの経路を返してください**。

例題 1 のコードに加え、リスト `path` で訪問したノードの経路を記録します。値が $7$ のノードに到達したら、`path` をコピーして結果リスト `res` に追加します。走査が終わると、`res` にすべての解が保存されています。コードは次のとおりです。

=== "Python"

    ```python title="preorder_traversal_ii_compact.py"
    def pre_order(root: TreeNode):
        """行きがけ順走査：例題 2"""
        if root is None:
            return
        # 試行
        path.append(root)
        if root.val == 7:
            # 解を記録する
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 復元
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_ii_compact.cpp"
    /* 行きがけ順走査：例題 2 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        // 試行
        path.push_back(root);
        if (root->val == 7) {
            // 解を記録する
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // 復元
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_ii_compact.java"
    /* 行きがけ順走査：例題 2 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 試行
        path.add(root);
        if (root.val == 7) {
            // 解を記録する
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 復元
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_ii_compact.cs"
    /* 行きがけ順走査：例題 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // 試行
        path.Add(root);
        if (root.val == 7) {
            // 解を記録する
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 復元
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_ii_compact.go"
    /* 行きがけ順走査：例題 2 */
    func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        if root == nil {
            return
        }
        // 試行
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // 解を記録する
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderII(root.Left, res, path)
        preOrderII(root.Right, res, path)
        // 復元
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_ii_compact.swift"
    /* 行きがけ順走査：例題 2 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // 試行
        path.append(root)
        if root.val == 7 {
            // 解を記録する
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // 復元
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_ii_compact.js"
    /* 行きがけ順走査：例題 2 */
    function preOrder(root, path, res) {
        if (root === null) {
            return;
        }
        // 試行
        path.push(root);
        if (root.val === 7) {
            // 解を記録する
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 復元
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_ii_compact.ts"
    /* 行きがけ順走査：例題 2 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        if (root === null) {
            return;
        }
        // 試行
        path.push(root);
        if (root.val === 7) {
            // 解を記録する
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 復元
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_ii_compact.dart"
    /* 行きがけ順走査：例題 2 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null) {
        return;
      }

      // 試行
      path.add(root);
      if (root.val == 7) {
        // 解を記録する
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // 復元
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_ii_compact.rs"
    /* 行きがけ順走査：例題 2 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            // 試行
            path.push(node.clone());
            if node.borrow().val == 7 {
                // 解を記録する
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // 復元
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_ii_compact.c"
    /* 行きがけ順走査：例題 2 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        // 試行
        path[pathSize++] = root;
        if (root->val == 7) {
            // 解を記録する
            for (int i = 0; i < pathSize; ++i) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // 復元
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_ii_compact.kt"
    /* 行きがけ順走査：例題 2 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        // 試行
        path!!.add(root)
        if (root._val == 7) {
            // 解を記録する
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // 復元
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_ii_compact.rb"
    ### 行きがけ順走査：例題 2 ###
    def pre_order(root)
      return unless root

      # 試行
      $path << root

      # 解を記録する
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # 復元
      $path.pop
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%E5%BE%A9%E5%85%83%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8B%E3%82%89%E3%83%8E%E3%83%BC%E3%83%89%207%20%E3%81%BE%E3%81%A7%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%202%22%22%22%0A%20%20%20%20if%20root%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%E5%BE%A9%E5%85%83%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8B%E3%82%89%E3%83%8E%E3%83%BC%E3%83%89%207%20%E3%81%BE%E3%81%A7%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

各「試行」では、現在のノードを `path` に追加して経路を記録します。「後戻り」の前には、そのノードを `path` から取り出し、**今回の試行前の状態を復元する**必要があります。

図 13-2 の流れを見ると、**試行と後戻りは「前進」と「取り消し」と考えられ**、互いに逆の操作だとわかります。

=== "<1>"
    ![試行と後戻り](backtracking_algorithm.assets/preorder_find_paths_step1.png){ class="animation-figure" }

=== "<2>"
    ![行きがけ順走査による経路の探索：手順 2](backtracking_algorithm.assets/preorder_find_paths_step2.png){ class="animation-figure" }

=== "<3>"
    ![行きがけ順走査による経路の探索：手順 3](backtracking_algorithm.assets/preorder_find_paths_step3.png){ class="animation-figure" }

=== "<4>"
    ![行きがけ順走査による経路の探索：手順 4](backtracking_algorithm.assets/preorder_find_paths_step4.png){ class="animation-figure" }

=== "<5>"
    ![行きがけ順走査による経路の探索：手順 5](backtracking_algorithm.assets/preorder_find_paths_step5.png){ class="animation-figure" }

=== "<6>"
    ![行きがけ順走査による経路の探索：手順 6](backtracking_algorithm.assets/preorder_find_paths_step6.png){ class="animation-figure" }

=== "<7>"
    ![行きがけ順走査による経路の探索：手順 7](backtracking_algorithm.assets/preorder_find_paths_step7.png){ class="animation-figure" }

=== "<8>"
    ![行きがけ順走査による経路の探索：手順 8](backtracking_algorithm.assets/preorder_find_paths_step8.png){ class="animation-figure" }

=== "<9>"
    ![行きがけ順走査による経路の探索：手順 9](backtracking_algorithm.assets/preorder_find_paths_step9.png){ class="animation-figure" }

=== "<10>"
    ![行きがけ順走査による経路の探索：手順 10](backtracking_algorithm.assets/preorder_find_paths_step10.png){ class="animation-figure" }

=== "<11>"
    ![行きがけ順走査による経路の探索：手順 11](backtracking_algorithm.assets/preorder_find_paths_step11.png){ class="animation-figure" }

<p align="center"> 図 13-2 &nbsp; 試行と後戻り </p>

## 13.1.2 &nbsp; 枝刈り

複雑なバックトラッキングの問題には、一つ以上の制約条件があります。**制約条件は通常、「枝刈り」に使えます**。

!!! question "例題 3"

    二分木で値が $7$ のノードをすべて探し、根ノードからそれらまでの経路を返してください。ただし、**経路に値が $3$ のノードを含めてはいけません**。

この制約を満たすため、**枝刈りの操作を加えます**。探索中に値が $3$ のノードに出会ったら、そこで戻り、それ以上探索しません。コードは次のとおりです。

=== "Python"

    ```python title="preorder_traversal_iii_compact.py"
    def pre_order(root: TreeNode):
        """行きがけ順走査：例題 3"""
        # 枝刈り
        if root is None or root.val == 3:
            return
        # 試行
        path.append(root)
        if root.val == 7:
            # 解を記録する
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 復元
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_compact.cpp"
    /* 行きがけ順走査：例題 3 */
    void preOrder(TreeNode *root) {
        // 枝刈り
        if (root == nullptr || root->val == 3) {
            return;
        }
        // 試行
        path.push_back(root);
        if (root->val == 7) {
            // 解を記録する
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // 復元
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_compact.java"
    /* 行きがけ順走査：例題 3 */
    void preOrder(TreeNode root) {
        // 枝刈り
        if (root == null || root.val == 3) {
            return;
        }
        // 試行
        path.add(root);
        if (root.val == 7) {
            // 解を記録する
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 復元
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_compact.cs"
    /* 行きがけ順走査：例題 3 */
    void PreOrder(TreeNode? root) {
        // 枝刈り
        if (root == null || root.val == 3) {
            return;
        }
        // 試行
        path.Add(root);
        if (root.val == 7) {
            // 解を記録する
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // 復元
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_compact.go"
    /* 行きがけ順走査：例題 3 */
    func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        // 枝刈り
        if root == nil || root.Val == 3 {
            return
        }
        // 試行
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // 解を記録する
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderIII(root.Left, res, path)
        preOrderIII(root.Right, res, path)
        // 復元
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_compact.swift"
    /* 行きがけ順走査：例題 3 */
    func preOrder(root: TreeNode?) {
        // 枝刈り
        guard let root = root, root.val != 3 else {
            return
        }
        // 試行
        path.append(root)
        if root.val == 7 {
            // 解を記録する
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // 復元
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_compact.js"
    /* 行きがけ順走査：例題 3 */
    function preOrder(root, path, res) {
        // 枝刈り
        if (root === null || root.val === 3) {
            return;
        }
        // 試行
        path.push(root);
        if (root.val === 7) {
            // 解を記録する
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 復元
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_compact.ts"
    /* 行きがけ順走査：例題 3 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        // 枝刈り
        if (root === null || root.val === 3) {
            return;
        }
        // 試行
        path.push(root);
        if (root.val === 7) {
            // 解を記録する
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // 復元
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_compact.dart"
    /* 行きがけ順走査：例題 3 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null || root.val == 3) {
        return;
      }

      // 試行
      path.add(root);
      if (root.val == 7) {
        // 解を記録する
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // 復元
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_compact.rs"
    /* 行きがけ順走査：例題 3 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        // 枝刈り
        if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
            return;
        }
        if let Some(node) = root {
            // 試行
            path.push(node.clone());
            if node.borrow().val == 7 {
                // 解を記録する
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // 復元
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_compact.c"
    /* 行きがけ順走査：例題 3 */
    void preOrder(TreeNode *root) {
        // 枝刈り
        if (root == NULL || root->val == 3) {
            return;
        }
        // 試行
        path[pathSize++] = root;
        if (root->val == 7) {
            // 解を記録する
            for (int i = 0; i < pathSize; i++) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // 復元
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_compact.kt"
    /* 行きがけ順走査：例題 3 */
    fun preOrder(root: TreeNode?) {
        // 枝刈り
        if (root == null || root._val == 3) {
            return
        }
        // 試行
        path!!.add(root)
        if (root._val == 7) {
            // 解を記録する
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // 復元
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_compact.rb"
    ### 行きがけ順走査：例題 3 ###
    def pre_order(root)
      # 枝刈り
      return if !root || root.val == 3

      # 試行
      $path.append(root)

      # 解を記録する
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # 復元
      $path.pop
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%203%22%22%22%0A%20%20%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%E5%BE%A9%E5%85%83%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E5%80%A4%E3%81%8C%203%20%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%90%AB%E3%81%BE%E3%81%AA%E3%81%84%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8B%E3%82%89%E3%83%8E%E3%83%BC%E3%83%89%207%20%E3%81%BE%E3%81%A7%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20%20%20%20%20%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20%20%20%20%20%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20%20%20%20%20%20%20return%20None%0A%20%20%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20%20%20%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20%20%20%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20%20%20%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20%20%20%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20pre_order%28root%3A%20TreeNode%29%3A%0A%20%20%20%20%22%22%22%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%EF%BC%9A%E4%BE%8B%E9%A1%8C%203%22%22%22%0A%20%20%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%0A%20%20%20%20if%20root%20is%20None%20or%20root.val%20%3D%3D%203%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E8%A9%A6%E8%A1%8C%0A%20%20%20%20path.append%28root%29%0A%20%20%20%20if%20root.val%20%3D%3D%207%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res.append%28list%28path%29%29%0A%20%20%20%20pre_order%28root.left%29%0A%20%20%20%20pre_order%28root.right%29%0A%20%20%20%20%23%20%E5%BE%A9%E5%85%83%0A%20%20%20%20path.pop%28%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%8D%E3%81%8C%E3%81%91%E9%A0%86%E8%B5%B0%E6%9F%BB%0A%20%20%20%20path%20%3D%20list%5BTreeNode%5D%28%29%0A%20%20%20%20res%20%3D%20list%5Blist%5BTreeNode%5D%5D%28%29%0A%20%20%20%20pre_order%28root%29%0A%0A%20%20%20%20print%28%22%5Cn%E5%80%A4%E3%81%8C%203%20%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%90%AB%E3%81%BE%E3%81%AA%E3%81%84%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8B%E3%82%89%E3%83%8E%E3%83%BC%E3%83%89%207%20%E3%81%BE%E3%81%A7%E3%81%AE%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20%20%20%20for%20path%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=126&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

「枝刈り」は仕組みをよく表す名前です。図 13-3 のように、**制約を満たさない探索の枝を「刈り取る」ことで**、無意味な試行を多く避け、探索効率を高めます。

![制約条件による枝刈り](backtracking_algorithm.assets/preorder_find_constrained_paths.png){ class="animation-figure" }

<p align="center"> 図 13-3 &nbsp; 制約条件による枝刈り </p>

## 13.1.3 &nbsp; 基本形のコード

ここからは、「試行・後戻り・枝刈り」という中心となる構造を取り出し、より汎用的なコードにしてみましょう。

次の基本形では、`state` が問題の現在の状態を、`choices` がその状態で取れる選択肢を表します。

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """バックトラッキングの基本形"""
        # 解かどうかを判定
        if is_solution(state):
            # 解を記録
            record_solution(state, res)
            # これ以上探索しない
            return
        # すべての選択肢を調べる
        for choice in choices:
            # 枝刈り：選択が有効かを判定
            if is_valid(state, choice):
                # 試行：選択して状態を更新
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 後戻り：選択を取り消し、前の状態に戻す
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* バックトラッキングの基本形 */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for (Choice choice : choices) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, choice)) {
                // 試行：選択して状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* バックトラッキングの基本形 */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for (Choice choice : choices) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, choice)) {
                // 試行：選択して状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* バックトラッキングの基本形 */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // 解かどうかを判定
        if (IsSolution(state)) {
            // 解を記録
            RecordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        foreach (Choice choice in choices) {
            // 枝刈り：選択が有効かを判定
            if (IsValid(state, choice)) {
                // 試行：選択して状態を更新
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* バックトラッキングの基本形 */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // 解かどうかを判定
        if isSolution(state) {
            // 解を記録
            recordSolution(state, res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を調べる
        for _, choice := range choices {
            // 枝刈り：選択が有効かを判定
            if isValid(state, choice) {
                // 試行：選択して状態を更新
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* バックトラッキングの基本形 */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // 解かどうかを判定
        if isSolution(state: state) {
            // 解を記録
            recordSolution(state: state, res: &res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を調べる
        for choice in choices {
            // 枝刈り：選択が有効かを判定
            if isValid(state: state, choice: choice) {
                // 試行：選択して状態を更新
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* バックトラッキングの基本形 */
    function backtrack(state, choices, res) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for (let choice of choices) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, choice)) {
                // 試行：選択して状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* バックトラッキングの基本形 */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for (let choice of choices) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, choice)) {
                // 試行：選択して状態を更新
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* バックトラッキングの基本形 */
    void backtrack(State state, List<Choice>, List<State> res) {
      // 解かどうかを判定
      if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res);
        // これ以上探索しない
        return;
      }
      // すべての選択肢を調べる
      for (Choice choice in choices) {
        // 枝刈り：選択が有効かを判定
        if (isValid(state, choice)) {
          // 試行：選択して状態を更新
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // 後戻り：選択を取り消し、前の状態に戻す
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* バックトラッキングの基本形 */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // 解かどうかを判定
        if is_solution(state) {
            // 解を記録
            record_solution(state, res);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for choice in choices {
            // 枝刈り：選択が有効かを判定
            if is_valid(state, choice) {
                // 試行：選択して状態を更新
                make_choice(state, choice);
                backtrack(state, choices, res);
                // 後戻り：選択を取り消し、前の状態に戻す
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* バックトラッキングの基本形 */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res, numRes);
            // これ以上探索しない
            return;
        }
        // すべての選択肢を調べる
        for (int i = 0; i < numChoices; i++) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, &choices[i])) {
                // 試行：選択して状態を更新
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* バックトラッキングの基本形 */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // 解かどうかを判定
        if (isSolution(state)) {
            // 解を記録
            recordSolution(state, res)
            // これ以上探索しない
            return
        }
        // すべての選択肢を調べる
        for (choice in choices) {
            // 枝刈り：選択が有効かを判定
            if (isValid(state, choice)) {
                // 試行：選択して状態を更新
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // 後戻り：選択を取り消し、前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### バックトラッキングの基本形 ###
    def backtrack(state, choices, res)
        # 解かどうかを判定
        if is_solution?(state)
            # 解を記録
            record_solution(state, res)
            return
        end

        # すべての選択肢を調べる
        for choice in choices
            # 枝刈り：選択が有効かを判定
            if is_valid?(state, choice)
                # 試行：選択して状態を更新
                make_choice(state, choice)
                backtrack(state, choices, res)
                # 後戻り：選択を取り消し、前の状態に戻す
                undo_choice(state, choice)
            end
        end
    end
    ```

次に、この基本形を使って例題 3 を解きます。状態 `state` はノードをたどった経路、選択肢 `choices` は現在のノードの左右の子ノード、結果 `res` は経路のリストです。

=== "Python"

    ```python title="preorder_traversal_iii_template.py"
    def is_solution(state: list[TreeNode]) -> bool:
        """現在の状態が解かを判定"""
        return state and state[-1].val == 7

    def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
        """解を記録する"""
        res.append(list(state))

    def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
        """現在の状態でこの選択が有効か判定"""
        return choice is not None and choice.val != 3

    def make_choice(state: list[TreeNode], choice: TreeNode):
        """状態を更新する"""
        state.append(choice)

    def undo_choice(state: list[TreeNode], choice: TreeNode):
        """状態を復元する"""
        state.pop()

    def backtrack(
        state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
    ):
        """バックトラッキング：例題 3"""
        # 解かを確認
        if is_solution(state):
            # 解を記録する
            record_solution(state, res)
        # すべての選択肢を走査する
        for choice in choices:
            # 枝刈り：選択が有効か確認
            if is_valid(state, choice):
                # 試行：選択を行い、状態を更新する
                make_choice(state, choice)
                # 次の選択に進む
                backtrack(state, [choice.left, choice.right], res)
                # 復元：選択を取り消し、以前の状態に戻す
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_template.cpp"
    /* 現在の状態が解かを判定 */
    bool isSolution(vector<TreeNode *> &state) {
        return !state.empty() && state.back()->val == 7;
    }

    /* 解を記録する */
    void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
        res.push_back(state);
    }

    /* 現在の状態でこの選択が有効か判定 */
    bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
        return choice != nullptr && choice->val != 3;
    }

    /* 状態を更新する */
    void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.push_back(choice);
    }

    /* 状態を復元する */
    void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.pop_back();
    }

    /* バックトラッキング：例題 3 */
    void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res);
        }
        // すべての選択肢を走査する
        for (TreeNode *choice : choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice);
                // 次の選択に進む
                vector<TreeNode *> nextChoices{choice->left, choice->right};
                backtrack(state, nextChoices, res);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_template.java"
    /* 現在の状態が解かを判定 */
    boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 解を記録する */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 現在の状態でこの選択が有効か判定 */
    boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新する */
    void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 状態を復元する */
    void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* バックトラッキング：例題 3 */
    void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res);
        }
        // すべての選択肢を走査する
        for (TreeNode choice : choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice);
                // 次の選択に進む
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_template.cs"
    /* 現在の状態が解かを判定 */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* 解を記録する */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* 現在の状態でこの選択が有効か判定 */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 状態を更新する */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* 状態を復元する */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* バックトラッキング：例題 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 解かを確認
        if (IsSolution(state)) {
            // 解を記録する
            RecordSolution(state, res);
        }
        // すべての選択肢を走査する
        foreach (TreeNode choice in choices) {
            // 枝刈り：選択が有効か確認
            if (IsValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                MakeChoice(state, choice);
                // 次の選択に進む
                Backtrack(state, [choice.left!, choice.right!], res);
                // 復元：選択を取り消し、以前の状態に戻す
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_template.go"
    /* 現在の状態が解かを判定 */
    func isSolution(state *[]*TreeNode) bool {
        return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
    }

    /* 解を記録する */
    func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
        *res = append(*res, append([]*TreeNode{}, *state...))
    }

    /* 現在の状態でこの選択が有効か判定 */
    func isValid(state *[]*TreeNode, choice *TreeNode) bool {
        return choice != nil && choice.Val != 3
    }

    /* 状態を更新する */
    func makeChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = append(*state, choice)
    }

    /* 状態を復元する */
    func undoChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = (*state)[:len(*state)-1]
    }

    /* バックトラッキング：例題 3 */
    func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
        // 解かを確認
        if isSolution(state) {
            // 解を記録する
            recordSolution(state, res)
        }
        // すべての選択肢を走査する
        for _, choice := range *choices {
            // 枝刈り：選択が有効か確認
            if isValid(state, choice) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice)
                // 次の選択に進む
                temp := make([]*TreeNode, 0)
                temp = append(temp, choice.Left, choice.Right)
                backtrackIII(state, &temp, res)
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_template.swift"
    /* 現在の状態が解かを判定 */
    func isSolution(state: [TreeNode]) -> Bool {
        !state.isEmpty && state.last!.val == 7
    }

    /* 解を記録する */
    func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
        res.append(state)
    }

    /* 現在の状態でこの選択が有効か判定 */
    func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
        choice != nil && choice!.val != 3
    }

    /* 状態を更新する */
    func makeChoice(state: inout [TreeNode], choice: TreeNode) {
        state.append(choice)
    }

    /* 状態を復元する */
    func undoChoice(state: inout [TreeNode], choice: TreeNode) {
        state.removeLast()
    }

    /* バックトラッキング：例題 3 */
    func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
        // 解かを確認
        if isSolution(state: state) {
            recordSolution(state: state, res: &res)
        }
        // すべての選択肢を走査する
        for choice in choices {
            // 枝刈り：選択が有効か確認
            if isValid(state: state, choice: choice) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state: &state, choice: choice)
                // 次の選択に進む
                backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_template.js"
    /* 現在の状態が解かを判定 */
    function isSolution(state) {
        return state && state[state.length - 1]?.val === 7;
    }

    /* 解を記録する */
    function recordSolution(state, res) {
        res.push([...state]);
    }

    /* 現在の状態でこの選択が有効か判定 */
    function isValid(state, choice) {
        return choice !== null && choice.val !== 3;
    }

    /* 状態を更新する */
    function makeChoice(state, choice) {
        state.push(choice);
    }

    /* 状態を復元する */
    function undoChoice(state) {
        state.pop();
    }

    /* バックトラッキング：例題 3 */
    function backtrack(state, choices, res) {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res);
        }
        // すべての選択肢を走査する
        for (const choice of choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice);
                // 次の選択に進む
                backtrack(state, [choice.left, choice.right], res);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_template.ts"
    /* 現在の状態が解かを判定 */
    function isSolution(state: TreeNode[]): boolean {
        return state && state[state.length - 1]?.val === 7;
    }

    /* 解を記録する */
    function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
        res.push([...state]);
    }

    /* 現在の状態でこの選択が有効か判定 */
    function isValid(state: TreeNode[], choice: TreeNode): boolean {
        return choice !== null && choice.val !== 3;
    }

    /* 状態を更新する */
    function makeChoice(state: TreeNode[], choice: TreeNode): void {
        state.push(choice);
    }

    /* 状態を復元する */
    function undoChoice(state: TreeNode[]): void {
        state.pop();
    }

    /* バックトラッキング：例題 3 */
    function backtrack(
        state: TreeNode[],
        choices: TreeNode[],
        res: TreeNode[][]
    ): void {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res);
        }
        // すべての選択肢を走査する
        for (const choice of choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice);
                // 次の選択に進む
                backtrack(state, [choice.left, choice.right], res);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_template.dart"
    /* 現在の状態が解かを判定 */
    bool isSolution(List<TreeNode> state) {
      return state.isNotEmpty && state.last.val == 7;
    }

    /* 解を記録する */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
      res.add(List.from(state));
    }

    /* 現在の状態でこの選択が有効か判定 */
    bool isValid(List<TreeNode> state, TreeNode? choice) {
      return choice != null && choice.val != 3;
    }

    /* 状態を更新する */
    void makeChoice(List<TreeNode> state, TreeNode? choice) {
      state.add(choice!);
    }

    /* 状態を復元する */
    void undoChoice(List<TreeNode> state, TreeNode? choice) {
      state.removeLast();
    }

    /* バックトラッキング：例題 3 */
    void backtrack(
      List<TreeNode> state,
      List<TreeNode?> choices,
      List<List<TreeNode>> res,
    ) {
      // 解かを確認
      if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
      }
      // すべての選択肢を走査する
      for (TreeNode? choice in choices) {
        // 枝刈り：選択が有効か確認
        if (isValid(state, choice)) {
          // 試行：選択を行い、状態を更新する
          makeChoice(state, choice);
          // 次の選択に進む
          backtrack(state, [choice!.left, choice.right], res);
          // 復元：選択を取り消し、以前の状態に戻す
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_template.rs"
    /* 現在の状態が解かを判定 */
    fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
        return !state.is_empty() && state.last().unwrap().borrow().val == 7;
    }

    /* 解を記録する */
    fn record_solution(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        res.push(state.clone());
    }

    /* 現在の状態でこの選択が有効か判定 */
    fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
        return choice.is_some() && choice.unwrap().borrow().val != 3;
    }

    /* 状態を更新する */
    fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
        state.push(choice);
    }

    /* 状態を復元する */
    fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
        state.pop();
    }

    /* バックトラッキング：例題 3 */
    fn backtrack(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        // 解かを確認
        if is_solution(state) {
            // 解を記録する
            record_solution(state, res);
        }
        // すべての選択肢を走査する
        for &choice in choices.iter() {
            // 枝刈り：選択が有効か確認
            if is_valid(state, choice) {
                // 試行：選択を行い、状態を更新する
                make_choice(state, choice.unwrap().clone());
                // 次の選択に進む
                backtrack(
                    state,
                    &vec![
                        choice.unwrap().borrow().left.as_ref(),
                        choice.unwrap().borrow().right.as_ref(),
                    ],
                    res,
                );
                // 復元：選択を取り消し、以前の状態に戻す
                undo_choice(state, choice.unwrap().clone());
            }
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_template.c"
    /* 現在の状態が解かを判定 */
    bool isSolution(void) {
        return pathSize > 0 && path[pathSize - 1]->val == 7;
    }

    /* 解を記録する */
    void recordSolution(void) {
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }

    /* 現在の状態でこの選択が有効か判定 */
    bool isValid(TreeNode *choice) {
        return choice != NULL && choice->val != 3;
    }

    /* 状態を更新する */
    void makeChoice(TreeNode *choice) {
        path[pathSize++] = choice;
    }

    /* 状態を復元する */
    void undoChoice(void) {
        pathSize--;
    }

    /* バックトラッキング：例題 3 */
    void backtrack(TreeNode *choices[2]) {
        // 解かを確認
        if (isSolution()) {
            // 解を記録する
            recordSolution();
        }
        // すべての選択肢を走査する
        for (int i = 0; i < 2; i++) {
            TreeNode *choice = choices[i];
            // 枝刈り：選択が有効か確認
            if (isValid(choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(choice);
                // 次の選択に進む
                TreeNode *nextChoices[2] = {choice->left, choice->right};
                backtrack(nextChoices);
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice();
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_template.kt"
    /* 現在の状態が解かを判定 */
    fun isSolution(state: MutableList<TreeNode?>): Boolean {
        return state.isNotEmpty() && state[state.size - 1]?._val == 7
    }

    /* 解を記録する */
    fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
        res.add(state!!.toMutableList())
    }

    /* 現在の状態でこの選択が有効か判定 */
    fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
        return choice != null && choice._val != 3
    }

    /* 状態を更新する */
    fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.add(choice)
    }

    /* 状態を復元する */
    fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.removeLast()
    }

    /* バックトラッキング：例題 3 */
    fun backtrack(
        state: MutableList<TreeNode?>,
        choices: MutableList<TreeNode?>,
        res: MutableList<MutableList<TreeNode?>?>
    ) {
        // 解かを確認
        if (isSolution(state)) {
            // 解を記録する
            recordSolution(state, res)
        }
        // すべての選択肢を走査する
        for (choice in choices) {
            // 枝刈り：選択が有効か確認
            if (isValid(state, choice)) {
                // 試行：選択を行い、状態を更新する
                makeChoice(state, choice)
                // 次の選択に進む
                backtrack(state, mutableListOf(choice!!.left, choice.right), res)
                // 復元：選択を取り消し、以前の状態に戻す
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_template.rb"
    ### 現在の状態が解かを判定 ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    ### 解を記録する ###
    def record_solution(state, res)
      res << state.dup
    end

    ### 現在の状態でこの選択が有効か判定 ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    ### 状態を更新する ###
    def make_choice(state, choice)
      state << choice
    end

    ### 状態を復元する ###
    def undo_choice(state, choice)
      state.pop
    end

    ### バックトラッキング：例題 3 ###
    def backtrack(state, choices, res)
      # 解かを確認
      record_solution(state, res) if is_solution?(state)

      # すべての選択肢を走査する
      for choice in choices
        # 枝刈り：選択が有効か確認
        if is_valid?(state, choice)
          # 試行：選択を行い、状態を更新する
          make_choice(state, choice)
          # 次の選択に進む
          backtrack(state, [choice.left, choice.right], res)
          # 復元：選択を取り消し、以前の状態に戻す
          undo_choice(state, choice)
        end
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20return%20None%0A%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%22%22%22%E7%8F%BE%E5%9C%A8%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%8C%E8%A7%A3%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%22%22%22%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%22%22%22%0A%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%22%22%22%E7%8F%BE%E5%9C%A8%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%A7%E3%81%93%E3%81%AE%E9%81%B8%E6%8A%9E%E3%81%8C%E6%9C%89%E5%8A%B9%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%22%22%22%0A%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%E7%8A%B6%E6%85%8B%E3%82%92%E5%BE%A9%E5%85%83%E3%81%99%E3%82%8B%22%22%22%0A%20state.pop%28%29%0A%0Adef%20backtrack%28%0A%20state%3A%20list%5BTreeNode%5D,%20choices%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%0A%29%3A%0A%20%22%22%22%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%EF%BC%9A%E4%BE%8B%E9%A1%8C%203%22%22%22%0A%20%23%20%E8%A7%A3%E3%81%8B%E3%82%92%E7%A2%BA%E8%AA%8D%0A%20if%20is_solution%28state%29%3A%0A%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20record_solution%28state,%20res%29%0A%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20for%20choice%20in%20choices%3A%0A%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%81%8C%E6%9C%89%E5%8A%B9%E3%81%8B%E7%A2%BA%E8%AA%8D%0A%20%20if%20is_valid%28state,%20choice%29%3A%0A%20%20%20%23%20%E8%A9%A6%E8%A1%8C%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%82%92%E8%A1%8C%E3%81%84%E3%80%81%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20make_choice%28state,%20choice%29%0A%20%20%20%23%20%E6%AC%A1%E3%81%AE%E9%81%B8%E6%8A%9E%E3%81%AB%E9%80%B2%E3%82%80%0A%20%20%20backtrack%28state,%20%5Bchoice.left,%20choice.right%5D,%20res%29%0A%20%20%20%23%20%E5%BE%A9%E5%85%83%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%82%92%E5%8F%96%E3%82%8A%E6%B6%88%E3%81%97%E3%80%81%E4%BB%A5%E5%89%8D%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%AB%E6%88%BB%E3%81%99%0A%20%20%20undo_choice%28state,%20choice%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%23%20%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%0A%20res%20%3D%20%5B%5D%0A%20backtrack%28state%3D%5B%5D,%20choices%3D%5Broot%5D,%20res%3Dres%29%0A%20print%28%22%5Cn%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20for%20path%20in%20res%3A%0A%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%0A%20def%20__init__%28self,%20val%3A%20int%20%3D%200%29%3A%0A%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%0A%20%20self.left%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%B7%A6%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%20%20self.right%3A%20TreeNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%8F%B3%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E3%81%B8%E3%81%AE%E5%8F%82%E7%85%A7%0A%0Adef%20list_to_tree_dfs%28arr%3A%20list%5Bint%5D,%20i%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%23%20%E6%B7%BB%E5%AD%97%E3%81%8C%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%82%92%E8%B6%85%E3%81%88%E3%82%8B%E3%81%8B%E3%80%81%E5%AF%BE%E5%BF%9C%E8%A6%81%E7%B4%A0%E3%81%8C%20None%20%E3%81%AA%E3%82%89%20None%20%E3%82%92%E8%BF%94%E3%81%99%0A%20if%20i%20%3C%200%20or%20i%20%3E%3D%20len%28arr%29%20or%20arr%5Bi%5D%20is%20None%3A%0A%20%20return%20None%0A%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20root%20%3D%20TreeNode%28arr%5Bi%5D%29%0A%20%23%20%E5%B7%A6%E5%8F%B3%E3%81%AE%E9%83%A8%E5%88%86%E6%9C%A8%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E6%A7%8B%E7%AF%89%E3%81%99%E3%82%8B%0A%20root.left%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%201%29%0A%20root.right%20%3D%20list_to_tree_dfs%28arr,%202%20%2A%20i%20%2B%202%29%0A%20return%20root%0A%0Adef%20list_to_tree%28arr%3A%20list%5Bint%5D%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%22%22%22%E3%83%AA%E3%82%B9%E3%83%88%E3%81%8B%E3%82%89%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%B8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%22%22%22%0A%20return%20list_to_tree_dfs%28arr,%200%29%0A%0A%0Adef%20is_solution%28state%3A%20list%5BTreeNode%5D%29%20-%3E%20bool%3A%0A%20%22%22%22%E7%8F%BE%E5%9C%A8%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%8C%E8%A7%A3%E3%81%8B%E3%82%92%E5%88%A4%E5%AE%9A%22%22%22%0A%20return%20state%20and%20state%5B-1%5D.val%20%3D%3D%207%0A%0Adef%20record_solution%28state%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%29%3A%0A%20%22%22%22%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%22%22%22%0A%20res.append%28list%28state%29%29%0A%0Adef%20is_valid%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%20-%3E%20bool%3A%0A%20%22%22%22%E7%8F%BE%E5%9C%A8%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%A7%E3%81%93%E3%81%AE%E9%81%B8%E6%8A%9E%E3%81%8C%E6%9C%89%E5%8A%B9%E3%81%8B%E5%88%A4%E5%AE%9A%22%22%22%0A%20return%20choice%20is%20not%20None%20and%20choice.val%20%21%3D%203%0A%0Adef%20make_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%22%22%22%0A%20state.append%28choice%29%0A%0Adef%20undo_choice%28state%3A%20list%5BTreeNode%5D,%20choice%3A%20TreeNode%29%3A%0A%20%22%22%22%E7%8A%B6%E6%85%8B%E3%82%92%E5%BE%A9%E5%85%83%E3%81%99%E3%82%8B%22%22%22%0A%20state.pop%28%29%0A%0Adef%20backtrack%28%0A%20state%3A%20list%5BTreeNode%5D,%20choices%3A%20list%5BTreeNode%5D,%20res%3A%20list%5Blist%5BTreeNode%5D%5D%0A%29%3A%0A%20%22%22%22%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%EF%BC%9A%E4%BE%8B%E9%A1%8C%203%22%22%22%0A%20%23%20%E8%A7%A3%E3%81%8B%E3%82%92%E7%A2%BA%E8%AA%8D%0A%20if%20is_solution%28state%29%3A%0A%20%20%23%20%E8%A7%A3%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%99%E3%82%8B%0A%20%20record_solution%28state,%20res%29%0A%20%23%20%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E9%81%B8%E6%8A%9E%E8%82%A2%E3%82%92%E8%B5%B0%E6%9F%BB%E3%81%99%E3%82%8B%0A%20for%20choice%20in%20choices%3A%0A%20%20%23%20%E6%9E%9D%E5%88%88%E3%82%8A%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%81%8C%E6%9C%89%E5%8A%B9%E3%81%8B%E7%A2%BA%E8%AA%8D%0A%20%20if%20is_valid%28state,%20choice%29%3A%0A%20%20%20%23%20%E8%A9%A6%E8%A1%8C%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%82%92%E8%A1%8C%E3%81%84%E3%80%81%E7%8A%B6%E6%85%8B%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20make_choice%28state,%20choice%29%0A%20%20%20%23%20%E6%AC%A1%E3%81%AE%E9%81%B8%E6%8A%9E%E3%81%AB%E9%80%B2%E3%82%80%0A%20%20%20backtrack%28state,%20%5Bchoice.left,%20choice.right%5D,%20res%29%0A%20%20%20%23%20%E5%BE%A9%E5%85%83%EF%BC%9A%E9%81%B8%E6%8A%9E%E3%82%92%E5%8F%96%E3%82%8A%E6%B6%88%E3%81%97%E3%80%81%E4%BB%A5%E5%89%8D%E3%81%AE%E7%8A%B6%E6%85%8B%E3%81%AB%E6%88%BB%E3%81%99%0A%20%20%20undo_choice%28state,%20choice%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20root%20%3D%20list_to_tree%28%5B1,%207,%203,%204,%205,%206,%207%5D%29%0A%0A%20%23%20%E3%83%90%E3%83%83%E3%82%AF%E3%83%88%E3%83%A9%E3%83%83%E3%82%AD%E3%83%B3%E3%82%B0%0A%20res%20%3D%20%5B%5D%0A%20backtrack%28state%3D%5B%5D,%20choices%3D%5Broot%5D,%20res%3Dres%29%0A%20print%28%22%5Cn%E3%81%99%E3%81%B9%E3%81%A6%E3%81%AE%E7%B5%8C%E8%B7%AF%E3%82%92%E5%87%BA%E5%8A%9B%E3%81%99%E3%82%8B%22%29%0A%20for%20path%20in%20res%3A%0A%20%20print%28%5Bnode.val%20for%20node%20in%20path%5D%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=138&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

問題の条件から、値が $7$ のノードが見つかっても探索を続ける必要があります。**そのため、解を記録した直後の `return` 文を削除します**。図 13-4 に、`return` を残す場合と削除する場合の探索の違いを示します。

![return を残す場合と削除する場合の探索の比較](backtracking_algorithm.assets/backtrack_remove_return_or_not.png){ class="animation-figure" }

<p align="center"> 図 13-4 &nbsp; return を残す場合と削除する場合の探索の比較 </p>

行きがけ順走査を使った実装に比べると、基本形に沿ったコードは冗長に見えますが、汎用性に優れています。実際、**多くのバックトラッキングの問題はこの基本形で解けます**。問題に応じて `state` と `choices` を定義し、各メソッドを実装すればよいのです。

## 13.1.4 &nbsp; 主な用語

問題をより明確に分析できるよう、バックトラッキングの主な用語を整理します。表 13-1 に、例題 3 での対応も示します。

<p align="center"> 表 13-1 &nbsp; バックトラッキングの主な用語 </p>

<div class="center-table" markdown>

| 用語                   | 定義                                                                       | 例題 3                                                               |
| ---------------------- | -------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| 解（solution）         | 問題の特定の条件を満たす答え。一つの場合も複数の場合もある                               | 根ノードからノード $7$ までの、制約を満たすすべての経路                            |
| 制約条件（constraint） | 解が実行可能であるための条件。通常は枝刈りに使う                         | 経路にノード $3$ を含めない                                                 |
| 状態（state）          | それまでの選択を含む、ある時点での問題の状況                           | 現在までに訪問した経路、すなわちノードのリスト `path`                             |
| 試行（attempt）        | 利用可能な選択肢で解の空間を探索する過程。選択、状態更新、解の判定を含む | 左（右）の子ノードを再帰的に訪問し、`path` に追加して、値が $7$ かを調べる |
| 後戻り（backtracking）   | 制約を満たさない状態に出会ったとき、前の選択を取り消して一つ前の状態へ戻ること       | 葉ノードの先へ進んだとき、訪問を終えたとき、値が $3$ のノードに出会ったときに探索を終えて関数から戻る  |
| 枝刈り（pruning）        | 問題の性質や制約を使って無意味な探索経路を避け、効率を高める方法     | 値が $3$ のノードに出会ったら、それ以上探索しない                              |

</div>

!!! tip "ヒント"

    問題、解、状態などの概念は共通のもので、分割統治、バックトラッキング、動的計画法、貪欲法などにも登場します。

## 13.1.5 &nbsp; 利点と制約

バックトラッキングは本質的に深さ優先探索であり、条件を満たす解が見つかるまで、可能な候補をすべて試します。すべての解を見つけられることが利点であり、適切な枝刈りをすれば高い効率を得られます。

ただし、大規模または複雑な問題では、**実行時間が許容できないほど長くなる可能性があります**。

- **時間**：状態空間のすべての可能性を調べる必要があることが多く、時間計算量は指数や階乗のオーダーになる場合があります。
- **空間**：再帰呼び出しでは現在の状態（経路や枝刈り用の補助変数など）を保持するため、深さが大きいと必要な空間も大きくなる場合があります。

それでも、**一部の探索問題や制約充足問題には、バックトラッキングが最も適した解法です**。どの選択が有効な解につながるか予測できないため、すべての選択肢を調べる必要があるからです。この場合、**重要なのは効率をどう高めるか**であり、代表的な方法には二つあります。

- **枝刈り**：解が得られないと確実にわかる経路を探索せず、時間と空間を節約します。
- **ヒューリスティック探索**：戦略や推定値を取り入れ、有効な解が得られそうな経路を優先して探索します。

## 13.1.6 &nbsp; バックトラッキングの代表的な問題

バックトラッキングは、多くの探索問題、制約充足問題、組合せ最適化問題に使えます。

**探索問題**：特定の条件を満たす解を見つけることが目標です。

- 順列列挙問題：集合が与えられ、その要素の可能な並べ方をすべて求めます。
- 部分集合和問題：集合と目標の和が与えられ、和が目標に一致するすべての部分集合を求めます。
- ハノイの塔の問題：3 本の柱と大きさの異なる円盤があり、すべての円盤を一つの柱から別の柱へ移します。一度に動かせるのは 1 枚だけで、小さな円盤の上に大きな円盤を置いてはいけません。

**制約充足問題**：すべての制約条件を満たす解を見つけることが目標です。

- $n$ クイーン：$n \times n$ の盤面に $n$ 個のクイーンを、互いに攻撃できないように配置します。
- 数独：$9 \times 9$ のマスに $1$ ~ $9$ を入れ、各行、各列、各 $3 \times 3$ の領域で数字が重複しないようにします。
- グラフ彩色問題：無向グラフの各頂点を、隣接する頂点が同じ色にならないよう、最少の色数で塗ります。

**組合せ最適化問題**：組合せの空間から、条件を満たす最適解を見つけることが目標です。

- 0-1 ナップサック問題：価値と重さを持つ品物の集合とナップサックが与えられ、容量の制限内で総価値が最大になるよう品物を選びます。
- 巡回セールスマン問題：グラフのある頂点から出発し、ほかのすべての頂点をちょうど 1 回ずつ訪問して出発点に戻る、最短の経路を求めます。
- 最大クリーク問題：無向グラフから、任意の 2 頂点の間に辺がある完全部分グラフのうち、最大のものを求めます。

ただし、多くの組合せ最適化問題では、バックトラッキングが最良の解法とは限りません。

- 0-1 ナップサック問題は通常、時間効率の高い動的計画法で解きます。
- 巡回セールスマン問題は有名な NP-Hard 問題で、遺伝的アルゴリズムや蟻コロニー最適化などがよく使われます。
- 最大クリーク問題はグラフ理論の古典的な問題で、貪欲法などのヒューリスティックアルゴリズムで解けます。
