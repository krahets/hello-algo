---
comments: true
---

# 7.4 &nbsp; 二元搜尋樹

如圖 7-16 所示，<u>二元搜尋樹（binary search tree）</u>滿足以下條件。

1. 對於根節點，左子樹中所有節點的值 $<$ 根節點的值 $<$ 右子樹中所有節點的值。
2. 任意節點的左、右子樹也是二元搜尋樹，即同樣滿足條件 `1.` 。

![二元搜尋樹](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> 圖 7-16 &nbsp; 二元搜尋樹 </p>

## 7.4.1 &nbsp; 二元搜尋樹的操作

我們將二元搜尋樹封裝為一個類別 `BinarySearchTree` ，並宣告一個成員變數 `root` ，指向樹的根節點。

### 1. &nbsp; 查詢節點

給定目標節點值 `num` ，可以根據二元搜尋樹的性質來查詢。如圖 7-17 所示，我們宣告一個節點 `cur` ，從二元樹的根節點 `root` 出發，迴圈比較節點值 `cur.val` 和 `num` 之間的大小關係。

- 若 `cur.val < num` ，說明目標節點在 `cur` 的右子樹中，因此執行 `cur = cur.right` 。
- 若 `cur.val > num` ，說明目標節點在 `cur` 的左子樹中，因此執行 `cur = cur.left` 。
- 若 `cur.val = num` ，說明找到目標節點，跳出迴圈並返回該節點。

=== "<1>"
    ![二元搜尋樹查詢節點示例](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> 圖 7-17 &nbsp; 二元搜尋樹查詢節點示例 </p>

二元搜尋樹的查詢操作與二分搜尋演算法的工作原理一致，都是每輪排除一半情況。迴圈次數最多為二元樹的高度，當二元樹平衡時，使用 $O(\log n)$ 時間。示例程式碼如下：

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """查詢節點"""
        cur = self._root
        # 迴圈查詢，越過葉節點後跳出
        while cur is not None:
            # 目標節點在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 目標節點在 cur 的左子樹中
            elif cur.val > num:
                cur = cur.left
            # 找到目標節點，跳出迴圈
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 查詢節點 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != nullptr) {
            // 目標節點在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 目標節點在 cur 的左子樹中
            else if (cur->val > num)
                cur = cur->left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 查詢節點 */
    TreeNode search(int num) {
        TreeNode cur = root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 查詢節點 */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num) cur =
                cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* 查詢節點 */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // 迴圈查詢，越過葉節點後跳出
        for node != nil {
            if node.Val.(int) < num {
                // 目標節點在 cur 的右子樹中
                node = node.Right
            } else if node.Val.(int) > num {
                // 目標節點在 cur 的左子樹中
                node = node.Left
            } else {
                // 找到目標節點，跳出迴圈
                break
            }
        }
        // 返回目標節點
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* 查詢節點 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 目標節點在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目標節點在 cur 的左子樹中
            else if cur!.val > num {
                cur = cur?.left
            }
            // 找到目標節點，跳出迴圈
            else {
                break
            }
        }
        // 返回目標節點
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* 查詢節點 */
    search(num) {
        let cur = this.root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num) cur = cur.left;
            // 找到目標節點，跳出迴圈
            else break;
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 查詢節點 */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 目標節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 目標節點在 cur 的左子樹中
            else if (cur.val > num) cur = cur.left;
            // 找到目標節點，跳出迴圈
            else break;
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 查詢節點 */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // 迴圈查詢，越過葉節點後跳出
      while (cur != null) {
        // 目標節點在 cur 的右子樹中
        if (cur.val < _num)
          cur = cur.right;
        // 目標節點在 cur 的左子樹中
        else if (cur.val > _num)
          cur = cur.left;
        // 找到目標節點，跳出迴圈
        else
          break;
      }
      // 返回目標節點
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 查詢節點 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 迴圈查詢，越過葉節點後跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目標節點在 cur 的右子樹中
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目標節點在 cur 的左子樹中
                Ordering::Less => cur = node.borrow().left.clone(),
                // 找到目標節點，跳出迴圈
                Ordering::Equal => break,
            }
        }

        // 返回目標節點
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* 查詢節點 */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != NULL) {
            if (cur->val < num) {
                // 目標節點在 cur 的右子樹中
                cur = cur->right;
            } else if (cur->val > num) {
                // 目標節點在 cur 的左子樹中
                cur = cur->left;
            } else {
                // 找到目標節點，跳出迴圈
                break;
            }
        }
        // 返回目標節點
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* 查詢節點 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 目標節點在 cur 的左子樹中
            else if (cur._val > num)
                cur.left
            // 找到目標節點，跳出迴圈
            else
                break
        }
        // 返回目標節點
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### 查詢節點 ###
    def search(num)
      cur = @root

      # 迴圈查詢，越過葉節點後跳出
      while !cur.nil?
        # 目標節點在 cur 的右子樹中
        if cur.val < num
          cur = cur.right
        # 目標節點在 cur 的左子樹中
        elsif cur.val > num
          cur = cur.left
        # 找到目標節點，跳出迴圈
        else
          break
        end
      end

      cur
    end
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 查詢節點
    fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
        var cur = self.root;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 目標節點在 cur 的右子樹中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 目標節點在 cur 的左子樹中
            } else if (cur.?.val > num) {
                cur = cur.?.left;
            // 找到目標節點，跳出迴圈
            } else {
                break;
            }
        }
        // 返回目標節點
        return cur;
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A8%B9%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%EF%BC%8C%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A8%B9%E7%82%BA%E7%A9%BA%EF%BC%8C%E5%89%87%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E8%A4%87%E7%AF%80%E9%BB%9E%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E6%9F%A5%E8%A9%A2%E5%88%B0%E7%9A%84%E7%AF%80%E9%BB%9E%E7%89%A9%E4%BB%B6%E7%82%BA%3A%20%7B%7D%EF%BC%8C%E7%AF%80%E9%BB%9E%E5%80%BC%20%3D%20%7B%7D%22.format%28node%2C%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A8%B9%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self%2C%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A8%99%E7%AF%80%E9%BB%9E%EF%BC%8C%E8%B7%B3%E5%87%BA%E8%BF%B4%E5%9C%88%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A8%B9%E7%82%BA%E7%A9%BA%EF%BC%8C%E5%89%87%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E8%A4%87%E7%AF%80%E9%BB%9E%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E6%9F%A5%E8%A9%A2%E5%88%B0%E7%9A%84%E7%AF%80%E9%BB%9E%E7%89%A9%E4%BB%B6%E7%82%BA%3A%20%7B%7D%EF%BC%8C%E7%AF%80%E9%BB%9E%E5%80%BC%20%3D%20%7B%7D%22.format%28node%2C%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 2. &nbsp; 插入節點

給定一個待插入元素 `num` ，為了保持二元搜尋樹“左子樹 < 根節點 < 右子樹”的性質，插入操作流程如圖 7-18 所示。

1. **查詢插入位置**：與查詢操作相似，從根節點出發，根據當前節點值和 `num` 的大小關係迴圈向下搜尋，直到越過葉節點（走訪至 `None` ）時跳出迴圈。
2. **在該位置插入節點**：初始化節點 `num` ，將該節點置於 `None` 的位置。

![在二元搜尋樹中插入節點](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> 圖 7-18 &nbsp; 在二元搜尋樹中插入節點 </p>

在程式碼實現中，需要注意以下兩點。

- 二元搜尋樹不允許存在重複節點，否則將違反其定義。因此，若待插入節點在樹中已存在，則不執行插入，直接返回。
- 為了實現插入節點，我們需要藉助節點 `pre` 儲存上一輪迴圈的節點。這樣在走訪至 `None` 時，我們可以獲取到其父節點，從而完成節點插入操作。

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """插入節點"""
        # 若樹為空，則初始化根節點
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 迴圈查詢，越過葉節點後跳出
        cur, pre = self._root, None
        while cur is not None:
            # 找到重複節點，直接返回
            if cur.val == num:
                return
            pre = cur
            # 插入位置在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 插入位置在 cur 的左子樹中
            else:
                cur = cur.left
        # 插入節點
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 插入節點 */
    void insert(int num) {
        // 若樹為空，則初始化根節點
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != nullptr) {
            // 找到重複節點，直接返回
            if (cur->val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 插入位置在 cur 的左子樹中
            else
                cur = cur->left;
        }
        // 插入節點
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 插入節點 */
    void insert(int num) {
        // 若樹為空，則初始化根節點
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else
                cur = cur.left;
        }
        // 插入節點
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 插入節點 */
    void Insert(int num) {
        // 若樹為空，則初始化根節點
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else
                cur = cur.left;
        }

        // 插入節點
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
    /* 插入節點 */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // 若樹為空，則初始化根節點
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // 待插入節點之前的節點位置
        var pre *TreeNode = nil
        // 迴圈查詢，越過葉節點後跳出
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
        // 插入節點
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
    /* 插入節點 */
    func insert(num: Int) {
        // 若樹為空，則初始化根節點
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 找到重複節點，直接返回
            if cur!.val == num {
                return
            }
            pre = cur
            // 插入位置在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子樹中
            else {
                cur = cur?.left
            }
        }
        // 插入節點
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
    /* 插入節點 */
    insert(num) {
        // 若樹為空，則初始化根節點
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 找到重複節點，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else cur = cur.left;
        }
        // 插入節點
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 插入節點 */
    insert(num: number): void {
        // 若樹為空，則初始化根節點
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 找到重複節點，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子樹中
            else cur = cur.left;
        }
        // 插入節點
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 插入節點 */
    void insert(int _num) {
      // 若樹為空，則初始化根節點
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 迴圈查詢，越過葉節點後跳出
      while (cur != null) {
        // 找到重複節點，直接返回
        if (cur.val == _num) return;
        pre = cur;
        // 插入位置在 cur 的右子樹中
        if (cur.val < _num)
          cur = cur.right;
        // 插入位置在 cur 的左子樹中
        else
          cur = cur.left;
      }
      // 插入節點
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 插入節點 */
    pub fn insert(&mut self, num: i32) {
        // 若樹為空，則初始化根節點
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 迴圈查詢，越過葉節點後跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到重複節點，直接返回
                Ordering::Equal => return,
                // 插入位置在 cur 的右子樹中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 插入位置在 cur 的左子樹中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 插入節點
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
    /* 插入節點 */
    void insert(BinarySearchTree *bst, int num) {
        // 若樹為空，則初始化根節點
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != NULL) {
            // 找到重複節點，直接返回
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // 插入位置在 cur 的右子樹中
                cur = cur->right;
            } else {
                // 插入位置在 cur 的左子樹中
                cur = cur->left;
            }
        }
        // 插入節點
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
    /* 插入節點 */
    fun insert(num: Int) {
        // 若樹為空，則初始化根節點
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur._val == num)
                return
            pre = cur
            // 插入位置在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 插入位置在 cur 的左子樹中
            else
                cur.left
        }
        // 插入節點
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### 插入節點 ###
    def insert(num)
      # 若樹為空，則初始化根節點
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # 迴圈查詢，越過葉節點後跳出
      cur, pre = @root, nil
      while !cur.nil?
        # 找到重複節點，直接返回
        return if cur.val == num

        pre = cur
        # 插入位置在 cur 的右子樹中
        if cur.val < num
          cur = cur.right
        # 插入位置在 cur 的左子樹中
        else
          cur = cur.left
        end
      end

      # 插入節點
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 插入節點
    fn insert(self: *Self, num: T) !void {
        // 若樹為空，則初始化根節點
        if (self.root == null) {
            self.root = try self.mem_allocator.create(inc.TreeNode(T));
            return;
        }
        var cur = self.root;
        var pre: ?*inc.TreeNode(T) = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到重複節點，直接返回
            if (cur.?.val == num) return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 插入位置在 cur 的左子樹中
            } else {
                cur = cur.?.left;
            }
        }
        // 插入節點
        var node = try self.mem_allocator.create(inc.TreeNode(T));
        node.init(num);
        if (pre.?.val < num) {
            pre.?.right = node;
        } else {
            pre.?.left = node;
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A8%B9%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A8%B9%E7%82%BA%E7%A9%BA%EF%BC%8C%E5%89%87%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E8%A4%87%E7%AF%80%E9%BB%9E%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A8%B9%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A8%B9%E7%82%BA%E7%A9%BA%EF%BC%8C%E5%89%87%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E8%BF%B4%E5%9C%88%E6%9F%A5%E8%A9%A2%EF%BC%8C%E8%B6%8A%E9%81%8E%E8%91%89%E7%AF%80%E9%BB%9E%E5%BE%8C%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E8%A4%87%E7%AF%80%E9%BB%9E%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A8%B9%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

與查詢節點相同，插入節點使用 $O(\log n)$ 時間。

### 3. &nbsp; 刪除節點

先在二元樹中查詢到目標節點，再將其刪除。與插入節點類似，我們需要保證在刪除操作完成後，二元搜尋樹的“左子樹 < 根節點 < 右子樹”的性質仍然滿足。因此，我們根據目標節點的子節點數量，分 0、1 和 2 三種情況，執行對應的刪除節點操作。

如圖 7-19 所示，當待刪除節點的度為 $0$ 時，表示該節點是葉節點，可以直接刪除。

![在二元搜尋樹中刪除節點（度為 0 ）](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> 圖 7-19 &nbsp; 在二元搜尋樹中刪除節點（度為 0 ） </p>

如圖 7-20 所示，當待刪除節點的度為 $1$ 時，將待刪除節點替換為其子節點即可。

![在二元搜尋樹中刪除節點（度為 1 ）](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> 圖 7-20 &nbsp; 在二元搜尋樹中刪除節點（度為 1 ） </p>

當待刪除節點的度為 $2$ 時，我們無法直接刪除它，而需要使用一個節點替換該節點。由於要保持二元搜尋樹“左子樹 $<$ 根節點 $<$ 右子樹”的性質，**因此這個節點可以是右子樹的最小節點或左子樹的最大節點**。

假設我們選擇右子樹的最小節點（中序走訪的下一個節點），則刪除操作流程如圖 7-21 所示。

1. 找到待刪除節點在“中序走訪序列”中的下一個節點，記為 `tmp` 。
2. 用 `tmp` 的值覆蓋待刪除節點的值，並在樹中遞迴刪除節點 `tmp` 。

=== "<1>"
    ![在二元搜尋樹中刪除節點（度為 2 ）](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> 圖 7-21 &nbsp; 在二元搜尋樹中刪除節點（度為 2 ） </p>

刪除節點操作同樣使用 $O(\log n)$ 時間，其中查詢待刪除節點需要 $O(\log n)$ 時間，獲取中序走訪後繼節點需要 $O(\log n)$ 時間。示例程式碼如下：

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """刪除節點"""
        # 若樹為空，直接提前返回
        if self._root is None:
            return
        # 迴圈查詢，越過葉節點後跳出
        cur, pre = self._root, None
        while cur is not None:
            # 找到待刪除節點，跳出迴圈
            if cur.val == num:
                break
            pre = cur
            # 待刪除節點在 cur 的右子樹中
            if cur.val < num:
                cur = cur.right
            # 待刪除節點在 cur 的左子樹中
            else:
                cur = cur.left
        # 若無待刪除節點，則直接返回
        if cur is None:
            return

        # 子節點數量 = 0 or 1
        if cur.left is None or cur.right is None:
            # 當子節點數量 = 0 / 1 時， child = null / 該子節點
            child = cur.left or cur.right
            # 刪除節點 cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 若刪除節點為根節點，則重新指定根節點
                self._root = child
        # 子節點數量 = 2
        else:
            # 獲取中序走訪中 cur 的下一個節點
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 遞迴刪除節點 tmp
            self.remove(tmp.val)
            # 用 tmp 覆蓋 cur
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 刪除節點 */
    void remove(int num) {
        // 若樹為空，直接提前返回
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != nullptr) {
            // 找到待刪除節點，跳出迴圈
            if (cur->val == num)
                break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 待刪除節點在 cur 的左子樹中
            else
                cur = cur->left;
        }
        // 若無待刪除節點，則直接返回
        if (cur == nullptr)
            return;
        // 子節點數量 = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 當子節點數量 = 0 / 1 時， child = nullptr / 該子節點
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // 刪除節點 cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child;
            }
            // 釋放記憶體
            delete cur;
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 遞迴刪除節點 tmp
            remove(tmp->val);
            // 用 tmp 覆蓋 cur
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 刪除節點 */
    void remove(int num) {
        // 若樹為空，直接提前返回
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.val == num)
                break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 待刪除節點在 cur 的左子樹中
            else
                cur = cur.left;
        }
        // 若無待刪除節點，則直接返回
        if (cur == null)
            return;
        // 子節點數量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // 刪除節點 cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child;
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 遞迴刪除節點 tmp
            remove(tmp.val);
            // 用 tmp 覆蓋 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 刪除節點 */
    void Remove(int num) {
        // 若樹為空，直接提前返回
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.val == num)
                break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.val < num)
                cur = cur.right;
            // 待刪除節點在 cur 的左子樹中
            else
                cur = cur.left;
        }
        // 若無待刪除節點，則直接返回
        if (cur == null)
            return;
        // 子節點數量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            TreeNode? child = cur.left ?? cur.right;
            // 刪除節點 cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child;
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 遞迴刪除節點 tmp
            Remove(tmp.val!.Value);
            // 用 tmp 覆蓋 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* 刪除節點 */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // 若樹為空，直接提前返回
        if cur == nil {
            return
        }
        // 待刪除節點之前的節點位置
        var pre *TreeNode = nil
        // 迴圈查詢，越過葉節點後跳出
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // 待刪除節點在右子樹中
                cur = cur.Right
            } else {
                // 待刪除節點在左子樹中
                cur = cur.Left
            }
        }
        // 若無待刪除節點，則直接返回
        if cur == nil {
            return
        }
        // 子節點數為 0 或 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // 取出待刪除節點的子節點
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // 刪除節點 cur
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                bst.root = child
            }
            // 子節點數為 2
        } else {
            // 獲取中序走訪中待刪除節點 cur 的下一個節點
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // 遞迴刪除節點 tmp
            bst.remove(tmp.Val.(int))
            // 用 tmp 覆蓋 cur
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* 刪除節點 */
    func remove(num: Int) {
        // 若樹為空，直接提前返回
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 迴圈查詢，越過葉節點後跳出
        while cur != nil {
            // 找到待刪除節點，跳出迴圈
            if cur!.val == num {
                break
            }
            pre = cur
            // 待刪除節點在 cur 的右子樹中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待刪除節點在 cur 的左子樹中
            else {
                cur = cur?.left
            }
        }
        // 若無待刪除節點，則直接返回
        if cur == nil {
            return
        }
        // 子節點數量 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            let child = cur?.left ?? cur?.right
            // 刪除節點 cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 遞迴刪除節點 tmp
            remove(num: tmp!.val)
            // 用 tmp 覆蓋 cur
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* 刪除節點 */
    remove(num) {
        // 若樹為空，直接提前返回
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.val === num) break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 待刪除節點在 cur 的左子樹中
            else cur = cur.left;
        }
        // 若無待刪除節點，則直接返回
        if (cur === null) return;
        // 子節點數量 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            const child = cur.left !== null ? cur.left : cur.right;
            // 刪除節點 cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                this.root = child;
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // 遞迴刪除節點 tmp
            this.remove(tmp.val);
            // 用 tmp 覆蓋 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 刪除節點 */
    remove(num: number): void {
        // 若樹為空，直接提前返回
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur !== null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.val === num) break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.val < num) cur = cur.right;
            // 待刪除節點在 cur 的左子樹中
            else cur = cur.left;
        }
        // 若無待刪除節點，則直接返回
        if (cur === null) return;
        // 子節點數量 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // 刪除節點 cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                this.root = child;
            }
        }
        // 子節點數量 = 2
        else {
            // 獲取中序走訪中 cur 的下一個節點
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // 遞迴刪除節點 tmp
            this.remove(tmp!.val);
            // 用 tmp 覆蓋 cur
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 刪除節點 */
    void remove(int _num) {
      // 若樹為空，直接提前返回
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 迴圈查詢，越過葉節點後跳出
      while (cur != null) {
        // 找到待刪除節點，跳出迴圈
        if (cur.val == _num) break;
        pre = cur;
        // 待刪除節點在 cur 的右子樹中
        if (cur.val < _num)
          cur = cur.right;
        // 待刪除節點在 cur 的左子樹中
        else
          cur = cur.left;
      }
      // 若無待刪除節點，直接返回
      if (cur == null) return;
      // 子節點數量 = 0 or 1
      if (cur.left == null || cur.right == null) {
        // 當子節點數量 = 0 / 1 時， child = null / 該子節點
        TreeNode? child = cur.left ?? cur.right;
        // 刪除節點 cur
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // 若刪除節點為根節點，則重新指定根節點
          _root = child;
        }
      } else {
        // 子節點數量 = 2
        // 獲取中序走訪中 cur 的下一個節點
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // 遞迴刪除節點 tmp
        remove(tmp.val);
        // 用 tmp 覆蓋 cur
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 刪除節點 */
    pub fn remove(&mut self, num: i32) {
        // 若樹為空，直接提前返回
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 迴圈查詢，越過葉節點後跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到待刪除節點，跳出迴圈
                Ordering::Equal => break,
                // 待刪除節點在 cur 的右子樹中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 待刪除節點在 cur 的左子樹中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 若無待刪除節點，則直接返回
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子節點數量 = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 當子節點數量 = 0 / 1 時， child = nullptr / 該子節點
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // 刪除節點 cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 若刪除節點為根節點，則重新指定根節點
                    self.root = child;
                }
            }
            // 子節點數量 = 2
            (Some(_), Some(_)) => {
                // 獲取中序走訪中 cur 的下一個節點
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // 遞迴刪除節點 tmp
                self.remove(tmp_val);
                // 用 tmp 覆蓋 cur
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* 刪除節點 */
    // 由於引入了 stdio.h ，此處無法使用 remove 關鍵詞
    void removeItem(BinarySearchTree *bst, int num) {
        // 若樹為空，直接提前返回
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != NULL) {
            // 找到待刪除節點，跳出迴圈
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // 待刪除節點在 root 的右子樹中
                cur = cur->right;
            } else {
                // 待刪除節點在 root 的左子樹中
                cur = cur->left;
            }
        }
        // 若無待刪除節點，則直接返回
        if (cur == NULL)
            return;
        // 判斷待刪除節點是否存在子節點
        if (cur->left == NULL || cur->right == NULL) {
            /* 子節點數量 = 0 or 1 */
            // 當子節點數量 = 0 / 1 時， child = nullptr / 該子節點
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // 刪除節點 cur
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // 釋放記憶體
            free(cur);
        } else {
            /* 子節點數量 = 2 */
            // 獲取中序走訪中 cur 的下一個節點
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 遞迴刪除節點 tmp
            removeItem(bst, tmp->val);
            // 用 tmp 覆蓋 cur
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* 刪除節點 */
    fun remove(num: Int) {
        // 若樹為空，直接提前返回
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur._val == num)
                break
            pre = cur
            // 待刪除節點在 cur 的右子樹中
            cur = if (cur._val < num)
                cur.right
            // 待刪除節點在 cur 的左子樹中
            else
                cur.left
        }
        // 若無待刪除節點，則直接返回
        if (cur == null)
            return
        // 子節點數量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // 刪除節點 cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 若刪除節點為根節點，則重新指定根節點
                root = child
            }
            // 子節點數量 = 2
        } else {
            // 獲取中序走訪中 cur 的下一個節點
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // 遞迴刪除節點 tmp
            remove(tmp._val)
            // 用 tmp 覆蓋 cur
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### 刪除節點 ###
    def remove(num)
      # 若樹為空，直接提前返回
      return if @root.nil?

      # 迴圈查詢，越過葉節點後跳出
      cur, pre = @root, nil
      while !cur.nil?
        # 找到待刪除節點，跳出迴圈
        break if cur.val == num

        pre = cur
        # 待刪除節點在 cur 的右子樹中
        if cur.val < num
          cur = cur.right
        # 待刪除節點在 cur 的左子樹中
        else
          cur = cur.left
        end
      end
      # 若無待刪除節點，則直接返回
      return if cur.nil?

      # 子節點數量 = 0 or 1
      if cur.left.nil? || cur.right.nil?
        # 當子節點數量 = 0 / 1 時， child = null / 該子節點
        child = cur.left || cur.right
        # 刪除節點 cur
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # 若刪除節點為根節點，則重新指定根節點
          @root = child
        end
      # 子節點數量 = 2
      else
        # 獲取中序走訪中 cur 的下一個節點
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # 遞迴刪除節點 tmp
        remove(tmp.val)
        # 用 tmp 覆蓋 cur
        cur.val = tmp.val
      end
    end
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 刪除節點
    fn remove(self: *Self, num: T) void {
        // 若樹為空，直接提前返回
        if (self.root == null) return;
        var cur = self.root;
        var pre: ?*inc.TreeNode(T) = null;
        // 迴圈查詢，越過葉節點後跳出
        while (cur != null) {
            // 找到待刪除節點，跳出迴圈
            if (cur.?.val == num) break;
            pre = cur;
            // 待刪除節點在 cur 的右子樹中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 待刪除節點在 cur 的左子樹中
            } else {
                cur = cur.?.left;
            }
        }
        // 若無待刪除節點，則直接返回
        if (cur == null) return;
        // 子節點數量 = 0 or 1
        if (cur.?.left == null or cur.?.right == null) {
            // 當子節點數量 = 0 / 1 時， child = null / 該子節點
            var child = if (cur.?.left != null) cur.?.left else cur.?.right;
            // 刪除節點 cur
            if (pre.?.left == cur) {
                pre.?.left = child;
            } else {
                pre.?.right = child;
            }
        // 子節點數量 = 2
        } else {
            // 獲取中序走訪中 cur 的下一個節點
            var tmp = cur.?.right;
            while (tmp.?.left != null) {
                tmp = tmp.?.left;
            }
            var tmp_val = tmp.?.val;
            // 遞迴刪除節點 tmp
            self.remove(tmp.?.val);
            // 用 tmp 覆蓋 cur
            cur.?.val = tmp_val;
        }
    }
    ```

??? pythontutor "視覺化執行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%95%B6%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%200%20/%201%20%E6%99%82%EF%BC%8C%20child%20%3D%20null%20/%20%E8%A9%B2%E5%AD%90%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%E4%B8%AD%20cur%20%E7%9A%84%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%94%A8%20tmp%20%E8%A6%86%E8%93%8B%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20bst.remove%281%29%20%23%20%E5%BA%A6%E7%82%BA%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E5%BA%A6%E7%82%BA%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E5%BA%A6%E7%82%BA%202&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%A8%B9%E7%AF%80%E9%BB%9E%E9%A1%9E%E5%88%A5%22%22%22%0A%20%20%20%20def%20__init__%28self%2C%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%BB%BA%E6%A7%8B%E5%AD%90%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self%2C%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E6%9F%A5%E8%A9%A2%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20cur%2C%20pre%20%3D%20self._root%2C%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%95%B6%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%200%20/%201%20%E6%99%82%EF%BC%8C%20child%20%3D%20null%20/%20%E8%A9%B2%E5%AD%90%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E7%AF%80%E9%BB%9E%E6%95%B8%E9%87%8F%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%8D%B2%E5%8F%96%E4%B8%AD%E5%BA%8F%E8%B5%B0%E8%A8%AA%E4%B8%AD%20cur%20%E7%9A%84%E4%B8%8B%E4%B8%80%E5%80%8B%E7%AF%80%E9%BB%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%81%9E%E8%BF%B4%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%94%A8%20tmp%20%E8%A6%86%E8%93%8B%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%85%83%E6%90%9C%E5%B0%8B%E6%A8%B9%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4%2C%202%2C%206%2C%201%2C%203%2C%205%2C%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E5%88%AA%E9%99%A4%E7%AF%80%E9%BB%9E%0A%20%20%20%20bst.remove%281%29%20%23%20%E5%BA%A6%E7%82%BA%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E5%BA%A6%E7%82%BA%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E5%BA%A6%E7%82%BA%202&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

### 4. &nbsp; 中序走訪有序

如圖 7-22 所示，二元樹的中序走訪遵循“左 $\rightarrow$ 根 $\rightarrow$ 右”的走訪順序，而二元搜尋樹滿足“左子節點 $<$ 根節點 $<$ 右子節點”的大小關係。

這意味著在二元搜尋樹中進行中序走訪時，總是會優先走訪下一個最小節點，從而得出一個重要性質：**二元搜尋樹的中序走訪序列是升序的**。

利用中序走訪升序的性質，我們在二元搜尋樹中獲取有序資料僅需 $O(n)$ 時間，無須進行額外的排序操作，非常高效。

![二元搜尋樹的中序走訪序列](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> 圖 7-22 &nbsp; 二元搜尋樹的中序走訪序列 </p>

## 7.4.2 &nbsp; 二元搜尋樹的效率

給定一組資料，我們考慮使用陣列或二元搜尋樹儲存。觀察表 7-2 ，二元搜尋樹的各項操作的時間複雜度都是對數階，具有穩定且高效的效能。只有在高頻新增、低頻查詢刪除資料的場景下，陣列比二元搜尋樹的效率更高。

<p align="center"> 表 7-2 &nbsp; 陣列與搜尋樹的效率對比 </p>

<div class="center-table" markdown>

|          | 無序陣列 | 二元搜尋樹  |
| -------- | -------- | ----------- |
| 查詢元素 | $O(n)$   | $O(\log n)$ |
| 插入元素 | $O(1)$   | $O(\log n)$ |
| 刪除元素 | $O(n)$   | $O(\log n)$ |

</div>

在理想情況下，二元搜尋樹是“平衡”的，這樣就可以在 $\log n$ 輪迴圈內查詢任意節點。

然而，如果我們在二元搜尋樹中不斷地插入和刪除節點，可能導致二元樹退化為圖 7-23 所示的鏈結串列，這時各種操作的時間複雜度也會退化為 $O(n)$ 。

![二元搜尋樹退化](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> 圖 7-23 &nbsp; 二元搜尋樹退化 </p>

## 7.4.3 &nbsp; 二元搜尋樹常見應用

- 用作系統中的多級索引，實現高效的查詢、插入、刪除操作。
- 作為某些搜尋演算法的底層資料結構。
- 用於儲存資料流，以保持其有序狀態。
