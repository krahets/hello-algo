---
comments: true
---

# 7.4 &nbsp; 二分探索木

図 7-16 の<u>二分探索木（binary search tree）</u>は、次の条件を満たします。

1. 根について、左の部分木のすべての値 $<$ 根の値 $<$ 右の部分木のすべての値が成り立ちます。
2. どのノードの左右の部分木も二分探索木であり、同じく条件 `1.` を満たします。

![二分探索木](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> 図 7-16 &nbsp; 二分探索木 </p>

## 7.4.1 &nbsp; 二分探索木の操作

クラス `BinarySearchTree` にまとめ、根ノードを指すメンバー変数 `root` を宣言します。

### 1. &nbsp; ノードの探索

目的の値 `num` が与えられたら、二分探索木の性質を使って探せます。図 7-17 のように、ノード `cur` を宣言して根 `root` から出発し、`cur.val` と `num` の大小を繰り返し比較します。

- `cur.val < num` なら、目的のノードは右の部分木にあるので、`cur = cur.right` とします。
- `cur.val > num` なら、目的のノードは左の部分木にあるので、`cur = cur.left` とします。
- `cur.val = num` なら、見つかったのでループを抜け、そのノードを返します。

=== "<1>"
    ![二分探索木でノードを探す例](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![二分探索木での探索の手順 2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![二分探索木での探索の手順 3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![二分探索木での探索の手順 4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> 図 7-17 &nbsp; 二分探索木でノードを探す例 </p>

二分探索木の探索は、二分探索と同じく、各反復で候補の半分を除外する仕組みです。反復回数は最大で木の高さとなり、木が平衡なら $O(\log n)$ 時間です。コード例を示します。

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """ノードを探索する"""
        cur = self._root
        # 繰り返し探索し、葉ノードを越えたら終了する
        while cur is not None:
            # 目的のノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 目的のノードは cur の左部分木にある
            elif cur.val > num:
                cur = cur.left
            # 目的のノードが見つかったので、ループを終了する
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを探索する */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 目的のノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 目的のノードは cur の左部分木にある
            else if (cur->val > num)
                cur = cur->left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを探索する */
    TreeNode search(int num) {
        TreeNode cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを探索する */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur =
                cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* ノードを探索する */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // 繰り返し探索し、葉ノードを越えたら終了する
        for node != nil {
            if node.Val.(int) < num {
                // 目的のノードは cur の右部分木にある
                node = node.Right
            } else if node.Val.(int) > num {
                // 目的のノードは cur の左部分木にある
                node = node.Left
            } else {
                // 目的のノードが見つかったので、ループを終了する
                break
            }
        }
        // 目的のノードを返す
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* ノードを探索する */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 目的のノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 目的のノードは cur の左部分木にある
            else if cur!.val > num {
                cur = cur?.left
            }
            // 目的のノードが見つかったので、ループを終了する
            else {
                break
            }
        }
        // 目的のノードを返す
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* ノードを探索する */
    search(num) {
        let cur = this.root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else break;
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを探索する */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num) cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else break;
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを探索する */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // 繰り返し探索し、葉ノードを越えたら終了する
      while (cur != null) {
        // 目的のノードは cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 目的のノードは cur の左部分木にある
        else if (cur.val > _num)
          cur = cur.left;
        // 目的のノードが見つかったので、ループを終了する
        else
          break;
      }
      // 目的のノードを返す
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを探索する */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 繰り返し探索し、葉ノードを越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目的のノードは cur の右部分木にある
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目的のノードは cur の左部分木にある
                Ordering::Less => cur = node.borrow().left.clone(),
                // 目的のノードが見つかったので、ループを終了する
                Ordering::Equal => break,
            }
        }

        // 目的のノードを返す
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* ノードを探索する */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != NULL) {
            if (cur->val < num) {
                // 目的のノードは cur の右部分木にある
                cur = cur->right;
            } else if (cur->val > num) {
                // 目的のノードは cur の左部分木にある
                cur = cur->left;
            } else {
                // 目的のノードが見つかったので、ループを終了する
                break;
            }
        }
        // 目的のノードを返す
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* ノードを探索する */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 目的のノードは cur の左部分木にある
            else if (cur._val > num)
                cur.left
            // 目的のノードが見つかったので、ループを終了する
            else
                break
        }
        // 目的のノードを返す
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを探索する ###
    def search(num)
      cur = @root

      # 繰り返し探索し、葉ノードを越えたら終了する
      while !cur.nil?
        # 目的のノードは cur の右部分木にある
        if cur.val < num
          cur = cur.right
        # 目的のノードは cur の左部分木にある
        elsif cur.val > num
          cur = cur.left
        # 目的のノードが見つかったので、ループを終了する
        else
          break
        end
      end

      cur
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20self._root%20%3D%20None%0A%0A%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%83%AB%E3%83%BC%E3%83%97%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20cur%0A%0A%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%81%97%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E6%88%BB%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20for%20num%20in%20nums%3A%0A%20%20%20%20bst.insert%28num%29%0A%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%0A%20%20node%20%3D%20bst.search%287%29%0A%20%20print%28%22%5Cn%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%3A%20%7B%7D%E3%80%81%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20self._root%20%3D%20None%0A%0A%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%23%20%E7%9B%AE%E7%9A%84%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%83%AB%E3%83%BC%E3%83%97%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20return%20cur%0A%0A%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%81%97%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E6%88%BB%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20for%20num%20in%20nums%3A%0A%20%20%20%20bst.insert%28num%29%0A%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%0A%20%20node%20%3D%20bst.search%287%29%0A%20%20print%28%22%5Cn%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E3%81%AF%3A%20%7B%7D%E3%80%81%E3%83%8E%E3%83%BC%E3%83%89%E3%81%AE%E5%80%A4%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 2. &nbsp; ノードの挿入

挿入する要素 `num` に対して、「左の部分木 < 根 < 右の部分木」という性質を保つため、図 7-18 の手順で挿入します。

1. **挿入位置を探す**：探索と同じく根から出発し、現在の値と `num` を比較しながら下へ進みます。葉を越えて `None` に達したらループを抜けます。
2. **その位置に挿入する**：値 `num` のノードを初期化し、`None` の位置へ置きます。

![二分探索木へのノードの挿入](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> 図 7-18 &nbsp; 二分探索木へのノードの挿入 </p>

実装では、次の二点に注意します。

- 重複するノードは定義に反するため許しません。挿入するノードがすでに存在すれば、何もせずに戻ります。
- 挿入のため、ノード `pre` に前回の反復のノードを保存します。これにより、`None` に達したときに親を取得して挿入できます。

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """ノードを挿入する"""
        # 木が空の場合、根ノードを初期化する
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 繰り返し探索し、葉ノードを越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 重複したノードが見つかったので、そのまま戻る
            if cur.val == num:
                return
            pre = cur
            # 挿入位置は cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 挿入位置は cur の左部分木にある
            else:
                cur = cur.left
        # ノードを挿入する
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを挿入する */
    void insert(int num) {
        // 木が空の場合、根ノードを初期化する
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを挿入する */
    void insert(int num) {
        // 木が空の場合、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを挿入する */
    void Insert(int num) {
        // 木が空の場合、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 重複したノードが見つかったので、そのまま戻る
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

        // ノードを挿入する
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
    /* ノードを挿入する */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // 木が空の場合、根ノードを初期化する
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // 挿入対象ノードの直前のノードの位置
        var pre *TreeNode = nil
        // 繰り返し探索し、葉ノードを越えたら終了する
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
        // ノードを挿入する
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
    /* ノードを挿入する */
    func insert(num: Int) {
        // 木が空の場合、根ノードを初期化する
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
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
    /* ノードを挿入する */
    insert(num) {
        // 木が空の場合、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 重複したノードが見つかったので、そのまま戻る
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入する
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを挿入する */
    insert(num: number): void {
        // 木が空の場合、根ノードを初期化する
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 重複したノードが見つかったので、そのまま戻る
            if (cur.val === num) return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else cur = cur.left;
        }
        // ノードを挿入する
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを挿入する */
    void insert(int _num) {
      // 木が空の場合、根ノードを初期化する
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 繰り返し探索し、葉ノードを越えたら終了する
      while (cur != null) {
        // 重複したノードが見つかったので、そのまま戻る
        if (cur.val == _num) return;
        pre = cur;
        // 挿入位置は cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 挿入位置は cur の左部分木にある
        else
          cur = cur.left;
      }
      // ノードを挿入する
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを挿入する */
    pub fn insert(&mut self, num: i32) {
        // 木が空の場合、根ノードを初期化する
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
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
    /* ノードを挿入する */
    void insert(BinarySearchTree *bst, int num) {
        // 木が空の場合、根ノードを初期化する
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != NULL) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
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
    /* ノードを挿入する */
    fun insert(num: Int) {
        // 木が空の場合、根ノードを初期化する
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // ノードを挿入する
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを挿入する ###
    def insert(num)
      # 木が空の場合、根ノードを初期化する
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # 繰り返し探索し、葉ノードを越えたら終了する
      cur, pre = @root, nil
      while !cur.nil?
        # 重複したノードが見つかったので、そのまま戻る
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

      # ノードを挿入する
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%81%97%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E6%88%BB%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E7%A9%BA%E3%81%AE%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E6%9C%A8%E3%81%8C%E7%A9%BA%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E6%A0%B9%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E6%8E%A2%E7%B4%A2%E3%81%97%E3%80%81%E8%91%89%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E8%B6%8A%E3%81%88%E3%81%9F%E3%82%89%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%87%8D%E8%A4%87%E3%81%97%E3%81%9F%E3%83%8E%E3%83%BC%E3%83%89%E3%81%8C%E8%A6%8B%E3%81%A4%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%AE%E3%81%A7%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E6%88%BB%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%8F%B3%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8C%BF%E5%85%A5%E4%BD%8D%E7%BD%AE%E3%81%AF%20cur%20%E3%81%AE%E5%B7%A6%E9%83%A8%E5%88%86%E6%9C%A8%E3%81%AB%E3%81%82%E3%82%8B%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

探索と同じく、挿入には $O(\log n)$ 時間かかります。

### 3. &nbsp; ノードの削除

まず目的のノードを見つけてから削除します。挿入と同じく、削除後も「左の部分木 < 根 < 右の部分木」を保つ必要があります。そのため、子の数が 0、1、2 の三つの場合に分けて処理します。

図 7-19 のように、削除するノードの次数が $0$ なら葉なので、直接削除できます。

![二分探索木のノードの削除（次数 0）](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> 図 7-19 &nbsp; 二分探索木のノードの削除（次数 0） </p>

図 7-20 のように、次数が $1$ なら、そのノードを子に置き換えれば済みます。

![二分探索木のノードの削除（次数 1）](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> 図 7-20 &nbsp; 二分探索木のノードの削除（次数 1） </p>

次数が $2$ の場合は直接削除できず、別のノードで置き換える必要があります。「左の部分木 $<$ 根 $<$ 右の部分木」を保つため、**右の部分木の最小ノードか、左の部分木の最大ノードを使えます**。

右の部分木の最小ノード、つまり通りがけ順で次のノードを選ぶとすると、手順は図 7-21 のとおりです。

1. 削除するノードの次に通りがけ順で現れるノードを探し、`tmp` とします。
2. 削除するノードの値を `tmp` の値で上書きし、木から `tmp` を再帰的に削除します。

=== "<1>"
    ![二分探索木のノードの削除（次数 2）](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![次数 2 のノードの削除の手順 2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![次数 2 のノードの削除の手順 3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![次数 2 のノードの削除の手順 4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> 図 7-21 &nbsp; 二分探索木のノードの削除（次数 2） </p>

削除も $O(\log n)$ 時間です。削除対象の探索に $O(\log n)$、通りがけ順の後続ノードの取得に $O(\log n)$ 時間かかります。コード例を示します。

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """ノードを削除する"""
        # 木が空の場合、そのまま早期リターンする
        if self._root is None:
            return
        # 繰り返し探索し、葉ノードを越えたら終了する
        cur, pre = self._root, None
        while cur is not None:
            # 削除対象のノードが見つかったので、ループを終了する
            if cur.val == num:
                break
            pre = cur
            # 削除対象のノードは cur の右部分木にある
            if cur.val < num:
                cur = cur.right
            # 削除対象のノードは cur の左部分木にある
            else:
                cur = cur.left
        # 削除対象のノードが存在しない場合、そのまま戻る
        if cur is None:
            return

        # 子ノード数 = 0 または 1
        if cur.left is None or cur.right is None:
            # 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            child = cur.left or cur.right
            # ノード cur を削除する
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 削除するノードが根ノードの場合、根ノードを指定し直す
                self._root = child
        # 子ノード数 = 2
        else:
            # 通りがけ順で cur の次のノードを取得する
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # ノード tmp を再帰的に削除する
            self.remove(tmp.val)
            # tmp で cur を上書きする
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* ノードを削除する */
    void remove(int num) {
        // 木が空の場合、そのまま早期リターンする
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur->val == num)
                break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 削除対象のノードは cur の左部分木にある
            else
                cur = cur->left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == nullptr)
            return;
        // 子ノード数 = 0 または 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 子ノード数 = 0 / 1 の場合、child = nullptr / その子ノード
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child;
            }
            // メモリを解放する
            delete cur;
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除する
            remove(tmp->val);
            // tmp で cur を上書きする
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* ノードを削除する */
    void remove(int num) {
        // 木が空の場合、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == null)
            return;
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* ノードを削除する */
    void Remove(int num) {
        // 木が空の場合、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == null)
            return;
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            TreeNode? child = cur.left ?? cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            Remove(tmp.val!.Value);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* ノードを削除する */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // 木が空の場合、そのまま早期リターンする
        if cur == nil {
            return
        }
        // 削除対象ノードの直前のノードの位置
        var pre *TreeNode = nil
        // 繰り返し探索し、葉ノードを越えたら終了する
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // 削除対象のノードは右部分木にある
                cur = cur.Right
            } else {
                // 削除対象のノードは左部分木にある
                cur = cur.Left
            }
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if cur == nil {
            return
        }
        // 子ノード数は 0 または 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // 削除対象のノードの子ノードを取り出す
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
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                bst.root = child
            }
            // 子ノード数は 2
        } else {
            // 通りがけ順で削除対象ノード cur の次のノードを取得する
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // ノード tmp を再帰的に削除する
            bst.remove(tmp.Val.(int))
            // tmp で cur を上書きする
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* ノードを削除する */
    func remove(num: Int) {
        // 木が空の場合、そのまま早期リターンする
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 繰り返し探索し、葉ノードを越えたら終了する
        while cur != nil {
            // 削除対象のノードが見つかったので、ループを終了する
            if cur!.val == num {
                break
            }
            pre = cur
            // 削除対象のノードは cur の右部分木にある
            if cur!.val < num {
                cur = cur?.right
            }
            // 削除対象のノードは cur の左部分木にある
            else {
                cur = cur?.left
            }
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if cur == nil {
            return
        }
        // 子ノード数 = 0 または 1
        if cur?.left == nil || cur?.right == nil {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            let child = cur?.left ?? cur?.right
            // ノード cur を削除する
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // ノード tmp を再帰的に削除する
            remove(num: tmp!.val)
            // tmp で cur を上書きする
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* ノードを削除する */
    remove(num) {
        // 木が空の場合、そのまま早期リターンする
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val === num) break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur === null) return;
        // 子ノード数 = 0 または 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            const child = cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            this.remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* ノードを削除する */
    remove(num: number): void {
        // 木が空の場合、そのまま早期リターンする
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur !== null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val === num) break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num) cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur === null) return;
        // 子ノード数 = 0 または 1
        if (cur.left === null || cur.right === null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                this.root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // ノード tmp を再帰的に削除する
            this.remove(tmp!.val);
            // tmp で cur を上書きする
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* ノードを削除する */
    void remove(int _num) {
      // 木が空の場合、そのまま早期リターンする
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 繰り返し探索し、葉ノードを越えたら終了する
      while (cur != null) {
        // 削除対象のノードが見つかったので、ループを終了する
        if (cur.val == _num) break;
        pre = cur;
        // 削除対象のノードは cur の右部分木にある
        if (cur.val < _num)
          cur = cur.right;
        // 削除対象のノードは cur の左部分木にある
        else
          cur = cur.left;
      }
      // 削除対象のノードが存在しない場合、そのまま戻る
      if (cur == null) return;
      // 子ノード数 = 0 または 1
      if (cur.left == null || cur.right == null) {
        // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
        TreeNode? child = cur.left ?? cur.right;
        // ノード cur を削除する
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // 削除するノードが根ノードの場合、根ノードを指定し直す
          _root = child;
        }
      } else {
        // 子ノード数 = 2
        // 通りがけ順で cur の次のノードを取得する
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // ノード tmp を再帰的に削除する
        remove(tmp.val);
        // tmp で cur を上書きする
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* ノードを削除する */
    pub fn remove(&mut self, num: i32) {
        // 木が空の場合、そのまま早期リターンする
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 削除対象のノードが見つかったので、ループを終了する
                Ordering::Equal => break,
                // 削除対象のノードは cur の右部分木にある
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 削除対象のノードは cur の左部分木にある
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子ノード数 = 0 または 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 子ノード数 = 0 / 1 の場合、child = nullptr / その子ノード
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
                    // 削除するノードが根ノードの場合、根ノードを指定し直す
                    self.root = child;
                }
            }
            // 子ノード数 = 2
            (Some(_), Some(_)) => {
                // 通りがけ順で cur の次のノードを取得する
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // ノード tmp を再帰的に削除する
                self.remove(tmp_val);
                // tmp で cur を上書きする
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* ノードを削除する */
    // stdio.h を読み込んでいるため、ここでは remove という名前は使えない
    void removeItem(BinarySearchTree *bst, int num) {
        // 木が空の場合、そのまま早期リターンする
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != NULL) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // 削除対象のノードは root の右部分木にある
                cur = cur->right;
            } else {
                // 削除対象のノードは root の左部分木にある
                cur = cur->left;
            }
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == NULL)
            return;
        // 削除対象のノードに子ノードがあるかどうかを判定する
        if (cur->left == NULL || cur->right == NULL) {
            /* 子ノード数 = 0 または 1 */
            // 子ノード数 = 0 / 1 の場合、child = nullptr / その子ノード
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
            // 通りがけ順で cur の次のノードを取得する
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除する
            removeItem(bst, tmp->val);
            // tmp で cur を上書きする
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* ノードを削除する */
    fun remove(num: Int) {
        // 木が空の場合、そのまま早期リターンする
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur._val == num)
                break
            pre = cur
            // 削除対象のノードは cur の右部分木にある
            cur = if (cur._val < num)
                cur.right
            // 削除対象のノードは cur の左部分木にある
            else
                cur.left
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == null)
            return
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
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
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child
            }
            // 子ノード数 = 2
        } else {
            // 通りがけ順で cur の次のノードを取得する
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // ノード tmp を再帰的に削除する
            remove(tmp._val)
            // tmp で cur を上書きする
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### ノードを削除する ###
    def remove(num)
      # 木が空の場合、そのまま早期リターンする
      return if @root.nil?

      # 繰り返し探索し、葉ノードを越えたら終了する
      cur, pre = @root, nil
      while !cur.nil?
        # 削除対象のノードが見つかったので、ループを終了する
        break if cur.val == num

        pre = cur
        # 削除対象のノードは cur の右部分木にある
        if cur.val < num
          cur = cur.right
        # 削除対象のノードは cur の左部分木にある
        else
          cur = cur.left
        end
      end
      # 削除対象のノードが存在しない場合、そのまま戻る
      return if cur.nil?

      # 子ノード数 = 0 または 1
      if cur.left.nil? || cur.right.nil?
        # 子ノード数 = 0 / 1 の場合、child = null / その子ノード
        child = cur.left || cur.right
        # ノード cur を削除する
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # 削除するノードが根ノードの場合、根ノードを指定し直す
          @root = child
        end
      # 子ノード数 = 2
      else
        # 通りがけ順で cur の次のノードを取得する
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # ノード tmp を再帰的に削除する
        remove(tmp.val)
        # tmp で cur を上書きする
        cur.val = tmp.val
      end
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self._root%20%3D%20None%0A%0A%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20return%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20return%0A%0A%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20%E3%81%BE%E3%81%9F%E3%81%AF%201%0A%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20/%201%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81child%20%3D%20null%20/%20%E3%81%9D%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%0A%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20cur%20%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%202%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%23%20%E9%80%9A%E3%82%8A%E3%81%8C%E3%81%91%E9%A0%86%E3%81%A7%20cur%20%E3%81%AE%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20tmp%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%23%20tmp%20%E3%81%A7%20cur%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20for%20num%20in%20nums%3A%0A%20%20%20%20bst.insert%28num%29%0A%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20bst.remove%281%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%200%0A%20%20bst.remove%282%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%201%0A%20%20bst.remove%284%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%202&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%9C%A8%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%AF%E3%83%A9%E3%82%B9%22%22%22%0A%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%22%22%22%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%22%22%22%0A%0A%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%22%22%22%E3%82%B3%E3%83%B3%E3%82%B9%E3%83%88%E3%83%A9%E3%82%AF%E3%82%BF%22%22%22%0A%20%20%20%20self._root%20%3D%20None%0A%0A%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8C%BF%E5%85%A5%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20return%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E6%8E%A2%E7%B4%A2%E3%81%99%E3%82%8B%0A%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20return%0A%0A%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20%E3%81%BE%E3%81%9F%E3%81%AF%201%0A%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%200%20/%201%20%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81child%20%3D%20null%20/%20%E3%81%9D%E3%81%AE%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%0A%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20cur%20%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%23%20%E5%AD%90%E3%83%8E%E3%83%BC%E3%83%89%E6%95%B0%20%3D%202%0A%20%20%20%20else%3A%0A%20%20%20%20%20%20%23%20%E9%80%9A%E3%82%8A%E3%81%8C%E3%81%91%E9%A0%86%E3%81%A7%20cur%20%E3%81%AE%E6%AC%A1%E3%81%AE%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%8F%96%E5%BE%97%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%20tmp%20%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%23%20tmp%20%E3%81%A7%20cur%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%23%20%E4%BA%8C%E5%88%86%E6%8E%A2%E7%B4%A2%E6%9C%A8%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20for%20num%20in%20nums%3A%0A%20%20%20%20bst.insert%28num%29%0A%0A%20%20%23%20%E3%83%8E%E3%83%BC%E3%83%89%E3%82%92%E5%89%8A%E9%99%A4%E3%81%99%E3%82%8B%0A%20%20bst.remove%281%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%200%0A%20%20bst.remove%282%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%201%0A%20%20bst.remove%284%29%20%23%20%E6%AC%A1%E6%95%B0%E3%81%AF%202&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

### 4. &nbsp; 通りがけ順では整列済みになる

図 7-22 のように、通りがけ順走査は「左 $\rightarrow$ 根 $\rightarrow$ 右」の順で進み、二分探索木では「左の子 $<$ 根 $<$ 右の子」の大小関係が成り立ちます。

そのため、通りがけ順では常に次に小さいノードを優先して訪問します。ここから、**二分探索木の通りがけ順走査の列は昇順になる**という重要な性質が得られます。

この性質を利用すれば、追加のソートなしに $O(n)$ 時間で整列済みのデータを取得でき、非常に効率的です。

![二分探索木の通りがけ順走査の列](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> 図 7-22 &nbsp; 二分探索木の通りがけ順走査の列 </p>

## 7.4.2 &nbsp; 二分探索木の効率

データを配列または二分探索木で格納する場合を考えます。表 7-2 では、二分探索木の各操作の時間計算量はすべて対数時間で、安定した高い性能を示します。配列のほうが効率的なのは、追加が多く、探索と削除が少ない場合だけです。

<p align="center"> 表 7-2 &nbsp; 配列と探索木の効率の比較 </p>

<div class="center-table" markdown>

|          | 未整列配列 | 二分探索木  |
| -------- | -------- | ----------- |
| 要素の探索 | $O(n)$   | $O(\log n)$ |
| 要素の挿入 | $O(1)$   | $O(\log n)$ |
| 要素の削除 | $O(n)$   | $O(\log n)$ |

</div>

理想的には二分探索木は平衡であり、どのノードも $\log n$ 回の反復で見つけられます。

ただし、挿入と削除を続けると、図 7-23 のように連結リストへ退化する可能性があります。その場合、各操作の時間計算量も $O(n)$ に悪化します。

![二分探索木の退化](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> 図 7-23 &nbsp; 二分探索木の退化 </p>

## 7.4.3 &nbsp; 二分探索木の主な用途

- システムの多段階のインデックスとして、効率的な探索、挿入、削除を実現します。
- 一部の探索アルゴリズムの基盤となるデータ構造として使います。
- データストリームを格納し、整列状態を保ちます。
