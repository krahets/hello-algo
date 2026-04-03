---
comments: true
---

# 7.4 &nbsp; 二分探索木

以下の図に示すように、<u>二分探索木（binary search tree）</u>は次の条件を満たします。

1. 根ノードについて、左部分木のすべてのノードの値 $<$ 根ノードの値 $<$ 右部分木のすべてのノードの値。
2. 任意のノードの左部分木と右部分木も二分探索木であり、すなわち条件 `1.` も満たします。

![二分探索木](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> 図 7-16 &nbsp; 二分探索木 </p>

## 7.4.1 &nbsp; 二分探索木の操作

二分探索木をクラス `BinarySearchTree` としてカプセル化し、木の根ノードを指すメンバ変数 `root` を宣言します。

### 1. &nbsp; ノードの探索

目標ノードの値 `num` が与えられたら、二分探索木の性質に基づいて探索できます。以下の図に示すように、ノード `cur` を宣言し、二分木の根ノード `root` から出発して、ノード値 `cur.val` と `num` の大小関係を繰り返し比較します。

- `cur.val < num` の場合、目標ノードは `cur` の右部分木にあるため、`cur = cur.right` を実行します。
- `cur.val > num` の場合、目標ノードは `cur` の左部分木にあるため、`cur = cur.left` を実行します。
- `cur.val = num` の場合、目標ノードが見つかったことを表し、ループを抜けてそのノードを返します。

=== "<1>"
    ![二分探索木のノード探索例](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> 図 7-17 &nbsp; 二分探索木のノード探索例 </p>

二分探索木の探索操作は二分探索アルゴリズムと同じ原理で動作し、各ラウンドで半分の候補を除外します。ループ回数の上限は二分木の高さであり、二分木が平衡であれば $O(\log n)$ 時間です。コード例は次のとおりです。

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """ノードを探索"""
        cur = self._root
        # ループで探索し、葉ノードを越えたら抜ける
        while cur is not None:
            # 目標ノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 目標ノードは cur の左部分木にある
            elif cur.val > num:
                cur = cur.left
            # 目標ノードが見つかったらループを抜ける
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを探索 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != nullptr) {
            // 目標ノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 目標ノードは cur の左部分木にある
            else if (cur->val > num)
                cur = cur->left;
            // 目標ノードが見つかったらループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを探索 */
    TreeNode search(int num) {
        TreeNode cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを探索 */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num) cur =
                cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* ノードを探索 */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // ループで探索し、葉ノードを越えたら抜ける
        for node != nil {
            if node.Val.(int) < num {
                // 目標ノードは cur の右部分木にある
                node = node.Right
            } else if node.Val.(int) > num {
                // 目標ノードは cur の左部分木にある
                node = node.Left
            } else {
                // 目標ノードが見つかったらループを抜ける
                break
            }
        }
        // 目標ノードを返す
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* ノードを探索 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 目標ノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 目標ノードは cur の左部分木にある
            else if cur!.val > num {
                cur = cur?.left
            }
            // 目標ノードが見つかったらループを抜ける
            else {
                break
            }
        }
        // 目標ノードを返す
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* ノードを探索 */
    search(num) {
        let cur = this.root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else break;
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを探索 */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else break;
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを探索 */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // ループで探索し、葉ノードを越えたら抜ける
      while (cur != null) {
        // 目標ノードは cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 目標ノードは cur の左部分木にある
        else if (cur.val > _num)
          cur = cur.left;
        // 目標ノードが見つかったらループを抜ける
        else
          break;
      }
      // 目標ノードを返す
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを探索 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目標ノードは cur の右部分木にある
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目標ノードは cur の左部分木にある
                Ordering::Less => cur = node.borrow().left.clone(),
                // 目標ノードが見つかったらループを抜ける
                Ordering::Equal => break,
            }
        }

        // 目標ノードを返す
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* ノードを探索 */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != NULL) {
            if (cur->val < num) {
                // 目標ノードは cur の右部分木にある
                cur = cur->right;
            } else if (cur->val > num) {
                // 目標ノードは cur の左部分木にある
                cur = cur->left;
            } else {
                // 目標ノードが見つかったらループを抜ける
                break;
            }
        }
        // 目標ノードを返す
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* ノードを探索 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 目標ノードは cur の左部分木にある
            else if (cur._val > num)
                cur.left
            // 目標ノードが見つかったらループを抜ける
            else
                break
        }
        // 目標ノードを返す
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを検索 ###
    def search(num)
      cur = @root

      # ループで探索し、葉ノードを越えたら抜ける
      while !cur.nil?
        # 目標ノードは cur の右部分木にある
        if cur.val < num
          cur = cur.right
        # 目標ノードは cur の左部分木にある
        elsif cur.val > num
          cur = cur.left
        # 目標ノードが見つかったらループを抜ける
        else
          break
        end
      end

      cur
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%83%AB%E3%83%BC%E3%83%97%E3%82%92%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E7%9B%B4%E3%81%A1%E3%81%AB%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%3A%20%7B%7D%E3%80%81%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%20%3D%20%7B%7D%22.format%28node%2C%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%83%AB%E3%83%BC%E3%83%97%E3%82%92%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E7%9B%B4%E3%81%A1%E3%81%AB%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%3A%20%7B%7D%E3%80%81%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%20%3D%20%7B%7D%22.format%28node%2C%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 2. &nbsp; ノードの挿入

挿入する要素 `num` が与えられたとき、二分探索木の「左部分木 < 根ノード < 右部分木」という性質を保つため、挿入操作の流れは以下の図のようになります。

1. **挿入位置を探索する**：探索操作と同様に、根ノードから出発し、現在のノード値と `num` の大小関係に基づいて下方向へ探索を繰り返し、葉ノードを越えて（`None` まで到達して）ループを抜けます。
2. **その位置にノードを挿入する**：ノード `num` を初期化し、そのノードを `None` の位置に置きます。

![二分探索木にノードを挿入する](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> 図 7-18 &nbsp; 二分探索木にノードを挿入する </p>

コード実装では、次の 2 点に注意が必要です。

- 二分探索木では重複ノードを許可しません。そうでないと定義に反するためです。したがって、挿入対象のノードが木内にすでに存在する場合は、挿入を行わずそのまま返します。
- ノード挿入を実現するために、ノード `pre` を用いて前回のループのノードを保持する必要があります。これにより、`None` までたどり着いたときにその親ノードを取得でき、ノード挿入を完了できます。

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """ノードを挿入"""
        # 木が空なら、根ノードを初期化する
        if self._root is None:
            self._root = TreeNode(num)
            return
        # ループで探索し、葉ノードを越えたら抜ける
        cur, pre = self._root, None
        while cur is not None:
            # 重複ノードが見つかったら、直ちに返す
            if cur.val == num:
                return
            pre = cur
            # 挿入位置は cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 挿入位置は cur の左部分木にある
            else:
                cur = cur.left
        # ノードを挿入
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを挿入 */
    void insert(int num) {
        // 木が空なら、根ノードを初期化する
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != nullptr) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur->val == num)
                return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 挿入位置は cur の左部分木にある
            else
                cur = cur->left;
        }
        // ノードを挿入
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを挿入 */
    void insert(int num) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val == num)
                return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else
                cur = cur.left;
        }
        // ノードを挿入
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを挿入 */
    void Insert(int num) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val == num)
                return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else
                cur = cur.left;
        }

        // ノードを挿入
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* ノードを挿入 */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // 木が空なら、根ノードを初期化する
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // 挿入対象ノードの直前のノード位置
        var pre *TreeNode = nil
        // ループで探索し、葉ノードを越えたら抜ける
        for cur != nil {
            if cur.Val == num {
                return
            }
            pre = cur
            if cur.Val.(int) < num {
                cur = cur.Right
            } else {
                cur = cur.Left
            }
        }
        // ノードを挿入
        node := NewTreeNode(num)
        if pre.Val.(int) < num {
            pre.Right = node
        } else {
            pre.Left = node
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* ノードを挿入 */
    func insert(num: Int) {
        // 木が空なら、根ノードを初期化する
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 重複ノードが見つかったら、直ちに返す
            if cur!.val == num {
                return
            }
            pre = cur
            // 挿入位置は cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 挿入位置は cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // ノードを挿入
        let node = TreeNode(x: num)
        if pre!.val < num {
            pre?.right = node
        } else {
            pre?.left = node
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* ノードを挿入 */
    insert(num) {
        // 木が空なら、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを挿入 */
    insert(num: number): void {
        // 木が空なら、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを挿入 */
    void insert(int _num) {
      // 木が空なら、根ノードを初期化する
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // ループで探索し、葉ノードを越えたら抜ける
      while (cur != null) {
        // 重複ノードが見つかったら、直ちに返す
        if (cur.val == _num) return;
        pre = cur;
        // 挿入位置は cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 挿入位置は cur の左部分木にある
        else
          cur = cur.left;
      }
      // ノードを挿入
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを挿入 */
    pub fn insert(&mut self, num: i32) {
        // 木が空なら、根ノードを初期化する
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 重複ノードが見つかったら、直ちに返す
                Ordering::Equal => return,
                // 挿入位置は cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 挿入位置は cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // ノードを挿入
        let pre = pre.unwrap();
        let node = Some(TreeNode::new(num));
        if num > pre.borrow().val {
            pre.borrow_mut().right = node;
        } else {
            pre.borrow_mut().left = node;
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* ノードを挿入 */
    void insert(BinarySearchTree *bst, int num) {
        // 木が空なら、根ノードを初期化する
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != NULL) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // 挿入位置は cur の右部分木にある
                cur = cur->right;
            } else {
                // 挿入位置は cur の左部分木にある
                cur = cur->left;
            }
        }
        // ノードを挿入
        TreeNode *node = newTreeNode(num);
        if (pre->val < num) {
            pre->right = node;
        } else {
            pre->left = node;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* ノードを挿入 */
    fun insert(num: Int) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur._val == num)
                return
            pre = cur
            // 挿入位置は cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 挿入位置は cur の左部分木にある
            else
                cur.left
        }
        // ノードを挿入
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを挿入 ###
    def insert(num)
      # 木が空なら、根ノードを初期化する
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # ループで探索し、葉ノードを越えたら抜ける
      cur, pre = @root, nil
      while !cur.nil?
        # 重複ノードが見つかったら、直ちに返す
        return if cur.val == num

        pre = cur
        # 挿入位置は cur の右部分木にある
        if cur.val < num
          cur = cur.right
        # 挿入位置は cur の左部分木にある
        else
          cur = cur.left
        end
      end

      # ノードを挿入
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E7%9B%B4%E3%81%A1%E3%81%AB%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AA%E3%82%89%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E6%8A%9C%E3%81%91%E3%82%8B%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%82%89%E3%80%81%E7%9B%B4%E3%81%A1%E3%81%AB%E8%BF%94%E3%81%99%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

ノード探索と同様に、ノード挿入には $O(\log n)$ 時間を要します。

### 3. &nbsp; ノードの削除

まず二分木内で目標ノードを見つけ、その後で削除します。ノード挿入と同様に、削除操作の完了後も二分探索木の「左部分木 < 根ノード < 右部分木」という性質が保たれる必要があります。そのため、目標ノードの子ノード数に応じて、0、1、2 の 3 つのケースに分けて対応する削除操作を行います。

以下の図に示すように、削除対象ノードの次数が $0$ のとき、そのノードは葉ノードであり、直接削除できます。

![二分探索木でノードを削除する（次数 0 ）](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> 図 7-19 &nbsp; 二分探索木でノードを削除する（次数 0 ） </p>

以下の図に示すように、削除対象ノードの次数が $1$ のとき、削除対象ノードをその子ノードで置き換えれば十分です。

![二分探索木でノードを削除する（次数 1 ）](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> 図 7-20 &nbsp; 二分探索木でノードを削除する（次数 1 ） </p>

削除対象ノードの次数が $2$ のときは、直接削除できず、別のノードでそのノードを置き換える必要があります。二分探索木の「左部分木 $<$ 根ノード $<$ 右部分木」という性質を保つ必要があるため、**このノードには右部分木の最小ノードまたは左部分木の最大ノードを使えます**。

右部分木の最小ノード（中順走査で次のノード）を選ぶと仮定すると、削除操作の流れは以下の図のようになります。

1. 削除対象ノードの「中順走査列」における次のノードを見つけ、`tmp` と記します。
2. `tmp` の値で削除対象ノードの値を上書きし、木の中でノード `tmp` を再帰的に削除します。

=== "<1>"
    ![二分探索木でノードを削除する（次数 2 ）](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> 図 7-21 &nbsp; 二分探索木でノードを削除する（次数 2 ） </p>

ノード削除操作も同様に $O(\log n)$ 時間を要します。削除対象ノードの探索に $O(\log n)$ 時間、中順走査の後続ノードの取得に $O(\log n)$ 時間が必要です。コード例は次のとおりです。

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """ノードを削除"""
        # 木が空なら、そのまま早期リターンする
        if self._root is None:
            return
        # ループで探索し、葉ノードを越えたら抜ける
        cur, pre = self._root, None
        while cur is not None:
            # 削除対象のノードが見つかったら、ループを抜ける
            if cur.val == num:
                break
            pre = cur
            # 削除対象ノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 削除対象ノードは cur の左部分木にある
            else:
                cur = cur.left
        # 削除対象ノードがなければそのまま返す
        if cur is None:
            return

        # 子ノード数 = 0 or 1
        if cur.left is None or cur.right is None:
            # 子ノード数が 0 / 1 のとき、child = null / その子ノード
            child = cur.left or cur.right
            # ノード cur を削除する
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 削除ノードが根ノードなら、根ノードを再設定
                self._root = child
        # 子ノード数 = 2
        else:
            # 中順走査における cur の次ノードを取得
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # ノード tmp を再帰的に削除
            self.remove(tmp.val)
            # tmp で cur を上書きする
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを削除 */
    void remove(int num) {
        // 木が空なら、そのまま早期リターンする
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != nullptr) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur->val == num)
                break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 削除対象ノードは cur の左部分木にある
            else
                cur = cur->left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == nullptr)
            return;
        // 子ノード数 = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 子ノード数 = 0 / 1 のとき、child = nullptr / その子ノード
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child;
            }
            // メモリを解放する
            delete cur;
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除
            remove(tmp->val);
            // tmp で cur を上書きする
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを削除 */
    void remove(int num) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == null)
            return;
        // 子ノード数 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除
            remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを削除 */
    void Remove(int num) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == null)
            return;
        // 子ノード数 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            TreeNode? child = cur.left ?? cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除
            Remove(tmp.val!.Value);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* ノードを削除 */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // 木が空なら、そのまま早期リターンする
        if cur == nil {
            return
        }
        // 削除対象ノードの直前のノード位置
        var pre *TreeNode = nil
        // ループで探索し、葉ノードを越えたら抜ける
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // 削除対象ノードは右部分木にある
                cur = cur.Right
            } else {
                // 削除対象ノードは左部分木にある
                cur = cur.Left
            }
        }
        // 削除対象ノードがなければそのまま返す
        if cur == nil {
            return
        }
        // 子ノード数は 0 または 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // 削除対象ノードの子ノードを取り出す
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // ノード cur を削除する
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                bst.root = child
            }
            // 子ノード数は 2
        } else {
            // 中順走査で削除対象ノード `cur` の次のノードを取得する
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // ノード tmp を再帰的に削除
            bst.remove(tmp.Val.(int))
            // tmp で cur を上書きする
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* ノードを削除 */
    func remove(num: Int) {
        // 木が空なら、そのまま早期リターンする
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // ループで探索し、葉ノードを越えたら抜ける
        while cur != nil {
            // 削除対象のノードが見つかったら、ループを抜ける
            if cur!.val == num {
                break
            }
            pre = cur
            // 削除対象ノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 削除対象ノードは cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // 削除対象ノードがなければそのまま返す
        if cur == nil {
            return
        }
        // 子ノード数 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            let child = cur?.left ?? cur?.right
            // ノード cur を削除する
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // ノード tmp を再帰的に削除
            remove(num: tmp!.val)
            // tmp で cur を上書きする
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* ノードを削除 */
    remove(num) {
        // 木が空なら、そのまま早期リターンする
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val === num) break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur === null) return;
        // 子ノード数 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            const child = cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除
            this.remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを削除 */
    remove(num: number): void {
        // 木が空なら、そのまま早期リターンする
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur !== null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val === num) break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur === null) return;
        // 子ノード数 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // ノード tmp を再帰的に削除
            this.remove(tmp!.val);
            // tmp で cur を上書きする
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを削除 */
    void remove(int _num) {
      // 木が空なら、そのまま早期リターンする
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // ループで探索し、葉ノードを越えたら抜ける
      while (cur != null) {
        // 削除対象のノードが見つかったら、ループを抜ける
        if (cur.val == _num) break;
        pre = cur;
        // 削除対象ノードは cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 削除対象ノードは cur の左部分木にある
        else
          cur = cur.left;
      }
      // 削除対象ノードがない場合は、そのまま返す
      if (cur == null) return;
      // 子ノード数 = 0 or 1
      if (cur.left == null || cur.right == null) {
        // 子ノード数が 0 / 1 のとき、child = null / その子ノード
        TreeNode? child = cur.left ?? cur.right;
        // ノード cur を削除する
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // 削除ノードが根ノードなら、根ノードを再設定
          _root = child;
        }
      } else {
        // 子ノード数 = 2
        // 中順走査における cur の次のノードを取得
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // ノード tmp を再帰的に削除
        remove(tmp.val);
        // tmp で cur を上書きする
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを削除 */
    pub fn remove(&mut self, num: i32) {
        // 木が空なら、そのまま早期リターンする
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // ループで探索し、葉ノードを越えたら抜ける
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 削除対象のノードが見つかったら、ループを抜ける
                Ordering::Equal => break,
                // 削除対象ノードは cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 削除対象ノードは cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 削除対象ノードがなければそのまま返す
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子ノード数 = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 子ノード数 = 0 / 1 のとき、child = nullptr / その子ノード
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // ノード cur を削除する
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 削除ノードが根ノードなら、根ノードを再設定
                    self.root = child;
                }
            }
            // 子ノード数 = 2
            (Some(_), Some(_)) => {
                // 中順走査における cur の次ノードを取得
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // ノード tmp を再帰的に削除
                self.remove(tmp_val);
                // tmp で cur を上書きする
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* ノードを削除 */
    // stdio.h を導入しているため、ここでは remove 識別子を使えない
    void removeItem(BinarySearchTree *bst, int num) {
        // 木が空なら、そのまま早期リターンする
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != NULL) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // 削除対象ノードは root の右部分木にある
                cur = cur->right;
            } else {
                // 削除対象ノードは root の左部分木にある
                cur = cur->left;
            }
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == NULL)
            return;
        // 削除対象ノードに子ノードがあるかを判定する
        if (cur->left == NULL || cur->right == NULL) {
            /* 子ノード数 = 0 or 1 */
            // 子ノード数 = 0 / 1 のとき、child = nullptr / その子ノード
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // ノード cur を削除する
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // メモリを解放する
            free(cur);
        } else {
            /* 子ノード数 = 2 */
            // 中順走査における cur の次ノードを取得
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除
            removeItem(bst, tmp->val);
            // tmp で cur を上書きする
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* ノードを削除 */
    fun remove(num: Int) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur._val == num)
                break
            pre = cur
            // 削除対象ノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 削除対象ノードは cur の左部分木にある
            else
                cur.left
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == null)
            return
        // 子ノード数 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // ノード cur を削除する
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child
            }
            // 子ノード数 = 2
        } else {
            // 中順走査における cur の次ノードを取得
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // ノード tmp を再帰的に削除
            remove(tmp._val)
            // tmp で cur を上書きする
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを削除 ###
    def remove(num)
      # 木が空なら、そのまま早期リターンする
      return if @root.nil?

      # ループで探索し、葉ノードを越えたら抜ける
      cur, pre = @root, nil
      while !cur.nil?
        # 削除対象のノードが見つかったら、ループを抜ける
        break if cur.val == num

        pre = cur
        # 削除対象ノードは cur の右部分木にある
        if cur.val < num
          cur = cur.right
        # 削除対象ノードは cur の左部分木にある
        else
          cur = cur.left
        end
      end
      # 削除対象ノードがなければそのまま返す
      return if cur.nil?

      # 子ノード数 = 0 or 1
      if cur.left.nil? || cur.right.nil?
        # 子ノード数が 0 / 1 のとき、child = null / その子ノード
        child = cur.left || cur.right
        # ノード cur を削除する
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # 削除ノードが根ノードなら、根ノードを再設定
          @root = child
        end
      # 子ノード数 = 2
      else
        # 中順走査における cur の次ノードを取得
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # ノード tmp を再帰的に削除
        remove(tmp.val)
        # tmp で cur を上書きする
        cur.val = tmp.val
      end
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%E3%81%8C%200%20%2F%201%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%80%81child%20%3D%20null%20%2F%20%E3%81%9D%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20cur%20%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E9%A0%86%E8%B5%B0%E6%9F%BB%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%20cur%20%E3%81%AE%E6%AC%A1%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20tmp%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%89%8A%E9%99%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20tmp%20%E3%81%A7%20cur%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20bst.remove%281%29%20%23%20%E6%AC%A1%E6%95%B0%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E6%AC%A1%E6%95%B0%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E6%AC%A1%E6%95%B0%202&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%E3%81%8C%200%20%2F%201%20%E3%81%AE%E3%81%A8%E3%81%8D%E3%80%81child%20%3D%20null%20%2F%20%E3%81%9D%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20cur%20%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E4%B8%AD%E9%A0%86%E8%B5%B0%E6%9F%BB%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%20cur%20%E3%81%AE%E6%AC%A1%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20tmp%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%89%8A%E9%99%A4%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20tmp%20%E3%81%A7%20cur%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%0A%20%20%20%20bst.remove%281%29%20%23%20%E6%AC%A1%E6%95%B0%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E6%AC%A1%E6%95%B0%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E6%AC%A1%E6%95%B0%202&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

### 4. &nbsp; 中順走査は昇順

以下の図に示すように、二分木の中順走査は「左 $\rightarrow$ 根 $\rightarrow$ 右」という順序に従い、二分探索木は「左子ノード $<$ 根ノード $<$ 右子ノード」という大小関係を満たします。

これは、二分探索木で中順走査を行うと常に次の最小ノードが優先して走査されることを意味し、そこから重要な性質が導かれます。**二分探索木の中順走査列は昇順です**。

中順走査が昇順になる性質を利用すれば、二分探索木から整列済みデータを取得するのに必要な時間は $O(n)$ のみで、追加のソート操作は不要です。非常に効率的です。

![二分探索木の中順走査列](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> 図 7-22 &nbsp; 二分探索木の中順走査列 </p>

## 7.4.2 &nbsp; 二分探索木の効率

あるデータ集合が与えられたとき、配列または二分探索木で格納する場合を考えます。次の表を見ると、二分探索木の各操作の時間計算量はいずれも対数オーダーであり、安定して高効率です。高頻度の追加と低頻度の探索・削除という場面でのみ、配列のほうが二分探索木より効率的です。

<p align="center"> 表 7-2 &nbsp; 配列と探索木の効率比較 </p>

<div class="center-table" markdown>

|          | 無秩序配列 | 二分探索木  |
| -------- | -------- | ----------- |
| 要素の探索 | $O(n)$   | $O(\log n)$ |
| 要素の挿入 | $O(1)$   | $O(\log n)$ |
| 要素の削除 | $O(n)$   | $O(\log n)$ |

</div>

理想的な状況では、二分探索木は「平衡」しており、その場合は $\log n$ 回のループ内で任意のノードを探索できます。

しかし、二分探索木でノードの挿入と削除を繰り返すと、二分木が以下の図のような連結リストへ退化する可能性があり、このとき各操作の時間計算量も $O(n)$ に退化します。

![二分探索木の退化](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> 図 7-23 &nbsp; 二分探索木の退化 </p>

## 7.4.3 &nbsp; 二分探索木の代表的な応用

- システム内の多段インデックスとして用いられ、効率的な探索、挿入、削除操作を実現します。
- 一部の探索アルゴリズムの基盤データ構造として使われます。
- データストリームを格納し、その順序状態を保つために使われます。
