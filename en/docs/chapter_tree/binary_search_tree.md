---
comments: true
---

# 7.4 &nbsp; Binary search tree

As shown in the Figure 7-16 , a "binary search tree" satisfies the following conditions.

1. For the root node, the value of all nodes in the left subtree < the value of the root node < the value of all nodes in the right subtree.
2. The left and right subtrees of any node are also binary search trees, i.e., they satisfy condition `1.` as well.

![Binary search tree](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-16 &nbsp; Binary search tree </p>

## 7.4.1 &nbsp; Operations on a binary search tree

We encapsulate the binary search tree as a class `BinarySearchTree` and declare a member variable `root`, pointing to the tree's root node.

### 1. &nbsp; Searching for a node

Given a target node value `num`, one can search according to the properties of the binary search tree. As shown in the Figure 7-17 , we declare a node `cur` and start from the binary tree's root node `root`, looping to compare the size relationship between the node value `cur.val` and `num`.

- If `cur.val < num`, it means the target node is in `cur`'s right subtree, thus execute `cur = cur.right`.
- If `cur.val > num`, it means the target node is in `cur`'s left subtree, thus execute `cur = cur.left`.
- If `cur.val = num`, it means the target node is found, exit the loop and return the node.

=== "<1>"
    ![Example of searching for a node in a binary search tree](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-17 &nbsp; Example of searching for a node in a binary search tree </p>

The search operation in a binary search tree works on the same principle as the binary search algorithm, eliminating half of the possibilities in each round. The number of loops is at most the height of the binary tree. When the binary tree is balanced, it uses $O(\log n)$ time. Example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """查找节点"""
        cur = self._root
        # 循环查找，越过叶节点后跳出
        while cur is not None:
            # 目标节点在 cur 的右子树中
            if cur.val < num:
                cur = cur.right
            # 目标节点在 cur 的左子树中
            elif cur.val > num:
                cur = cur.left
            # 找到目标节点，跳出循环
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 查找节点 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 目标节点在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 目标节点在 cur 的左子树中
            else if (cur->val > num)
                cur = cur->left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 查找节点 */
    TreeNode search(int num) {
        TreeNode cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 查找节点 */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num) cur =
                cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* 查找节点 */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // 循环查找，越过叶节点后跳出
        for node != nil {
            if node.Val.(int) < num {
                // 目标节点在 cur 的右子树中
                node = node.Right
            } else if node.Val.(int) > num {
                // 目标节点在 cur 的左子树中
                node = node.Left
            } else {
                // 找到目标节点，跳出循环
                break
            }
        }
        // 返回目标节点
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* 查找节点 */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 目标节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 目标节点在 cur 的左子树中
            else if cur!.val > num {
                cur = cur?.left
            }
            // 找到目标节点，跳出循环
            else {
                break
            }
        }
        // 返回目标节点
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* 查找节点 */
    search(num) {
        let cur = this.root;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num) cur = cur.left;
            // 找到目标节点，跳出循环
            else break;
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 查找节点 */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num) cur = cur.left;
            // 找到目标节点，跳出循环
            else break;
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 查找节点 */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // 循环查找，越过叶节点后跳出
      while (cur != null) {
        // 目标节点在 cur 的右子树中
        if (cur.val < _num)
          cur = cur.right;
        // 目标节点在 cur 的左子树中
        else if (cur.val > _num)
          cur = cur.left;
        // 找到目标节点，跳出循环
        else
          break;
      }
      // 返回目标节点
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 查找节点 */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 目标节点在 cur 的右子树中
                Ordering::Greater => cur = node.borrow().right.clone(),
                // 目标节点在 cur 的左子树中
                Ordering::Less => cur = node.borrow().left.clone(),
                // 找到目标节点，跳出循环
                Ordering::Equal => break,
            }
        }

        // 返回目标节点
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* 查找节点 */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // 循环查找，越过叶节点后跳出
        while (cur != NULL) {
            if (cur->val < num) {
                // 目标节点在 cur 的右子树中
                cur = cur->right;
            } else if (cur->val > num) {
                // 目标节点在 cur 的左子树中
                cur = cur->left;
            } else {
                // 找到目标节点，跳出循环
                break;
            }
        }
        // 返回目标节点
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* 查找节点 */
    fun search(num: Int): TreeNode? {
        var cur = root
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            cur = if (cur.value < num)
                cur.right
            // 目标节点在 cur 的左子树中
            else if (cur.value > num)
                cur.left
            // 找到目标节点，跳出循环
            else
                break
        }
        // 返回目标节点
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{search}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 查找节点
    fn search(self: *Self, num: T) ?*inc.TreeNode(T) {
        var cur = self.root;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 目标节点在 cur 的左子树中
            } else if (cur.?.val > num) {
                cur = cur.?.left;
            // 找到目标节点，跳出循环
            } else {
                break;
            }
        }
        // 返回目标节点
        return cur;
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A0%91%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%EF%BC%8C%E8%B7%B3%E5%87%BA%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A0%91%E4%B8%BA%E7%A9%BA%EF%BC%8C%E5%88%99%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E5%A4%8D%E8%8A%82%E7%82%B9%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E6%9F%A5%E6%89%BE%E5%88%B0%E7%9A%84%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%E4%B8%BA%3A%20%7B%7D%EF%BC%8C%E8%8A%82%E7%82%B9%E5%80%BC%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A0%91%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E7%9B%AE%E6%A0%87%E8%8A%82%E7%82%B9%EF%BC%8C%E8%B7%B3%E5%87%BA%E5%BE%AA%E7%8E%AF%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A0%91%E4%B8%BA%E7%A9%BA%EF%BC%8C%E5%88%99%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E5%A4%8D%E8%8A%82%E7%82%B9%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5Cn%E6%9F%A5%E6%89%BE%E5%88%B0%E7%9A%84%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%E4%B8%BA%3A%20%7B%7D%EF%BC%8C%E8%8A%82%E7%82%B9%E5%80%BC%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 2. &nbsp; Inserting a node

Given an element `num` to be inserted, to maintain the property of the binary search tree "left subtree < root node < right subtree," the insertion operation proceeds as shown in the Figure 7-18 .

1. **Finding the insertion position**: Similar to the search operation, start from the root node and loop downwards according to the size relationship between the current node value and `num` until passing through the leaf node (traversing to `None`) then exit the loop.
2. **Insert the node at that position**: Initialize the node `num` and place it where `None` was.

![Inserting a node into a binary search tree](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> Figure 7-18 &nbsp; Inserting a node into a binary search tree </p>

In the code implementation, note the following two points.

- The binary search tree does not allow duplicate nodes; otherwise, it will violate its definition. Therefore, if the node to be inserted already exists in the tree, the insertion is not performed, and it directly returns.
- To perform the insertion operation, we need to use the node `pre` to save the node from the last loop. This way, when traversing to `None`, we can get its parent node, thus completing the node insertion operation.

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """插入节点"""
        # 若树为空，则初始化根节点
        if self._root is None:
            self._root = TreeNode(num)
            return
        # 循环查找，越过叶节点后跳出
        cur, pre = self._root, None
        while cur is not None:
            # 找到重复节点，直接返回
            if cur.val == num:
                return
            pre = cur
            # 插入位置在 cur 的右子树中
            if cur.val < num:
                cur = cur.right
            # 插入位置在 cur 的左子树中
            else:
                cur = cur.left
        # 插入节点
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 插入节点 */
    void insert(int num) {
        // 若树为空，则初始化根节点
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 找到重复节点，直接返回
            if (cur->val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur->left;
        }
        // 插入节点
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 插入节点 */
    void insert(int num) {
        // 若树为空，则初始化根节点
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 插入节点
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 插入节点 */
    void Insert(int num) {
        // 若树为空，则初始化根节点
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur.left;
        }

        // 插入节点
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
    /* 插入节点 */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // 若树为空，则初始化根节点
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // 待插入节点之前的节点位置
        var pre *TreeNode = nil
        // 循环查找，越过叶节点后跳出
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
        // 插入节点
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
    /* 插入节点 */
    func insert(num: Int) {
        // 若树为空，则初始化根节点
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 找到重复节点，直接返回
            if cur!.val == num {
                return
            }
            pre = cur
            // 插入位置在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 插入位置在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 插入节点
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
    /* 插入节点 */
    insert(num) {
        // 若树为空，则初始化根节点
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到重复节点，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子树中
            else cur = cur.left;
        }
        // 插入节点
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 插入节点 */
    insert(num: number): void {
        // 若树为空，则初始化根节点
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到重复节点，直接返回
            if (cur.val === num) return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 插入位置在 cur 的左子树中
            else cur = cur.left;
        }
        // 插入节点
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 插入节点 */
    void insert(int _num) {
      // 若树为空，则初始化根节点
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 循环查找，越过叶节点后跳出
      while (cur != null) {
        // 找到重复节点，直接返回
        if (cur.val == _num) return;
        pre = cur;
        // 插入位置在 cur 的右子树中
        if (cur.val < _num)
          cur = cur.right;
        // 插入位置在 cur 的左子树中
        else
          cur = cur.left;
      }
      // 插入节点
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 插入节点 */
    pub fn insert(&mut self, num: i32) {
        // 若树为空，则初始化根节点
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到重复节点，直接返回
                Ordering::Equal => return,
                // 插入位置在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 插入位置在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 插入节点
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
    /* 插入节点 */
    void insert(BinarySearchTree *bst, int num) {
        // 若树为空，则初始化根节点
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // 循环查找，越过叶节点后跳出
        while (cur != NULL) {
            // 找到重复节点，直接返回
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // 插入位置在 cur 的右子树中
                cur = cur->right;
            } else {
                // 插入位置在 cur 的左子树中
                cur = cur->left;
            }
        }
        // 插入节点
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
    /* 插入节点 */
    fun insert(num: Int) {
        // 若树为空，则初始化根节点
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.value == num)
                return
            pre = cur
            // 插入位置在 cur 的右子树中
            cur = if (cur.value < num)
                cur.right
            // 插入位置在 cur 的左子树中
            else
                cur.left
        }
        // 插入节点
        val node = TreeNode(num)
        if (pre?.value!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{insert}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 插入节点
    fn insert(self: *Self, num: T) !void {
        // 若树为空，则初始化根节点
        if (self.root == null) {
            self.root = try self.mem_allocator.create(inc.TreeNode(T));
            return;
        }
        var cur = self.root;
        var pre: ?*inc.TreeNode(T) = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.?.val == num) return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 插入位置在 cur 的左子树中
            } else {
                cur = cur.?.left;
            }
        }
        // 插入节点
        var node = try self.mem_allocator.create(inc.TreeNode(T));
        node.init(num);
        if (pre.?.val < num) {
            pre.?.right = node;
        } else {
            pre.?.left = node;
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A0%91%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A0%91%E4%B8%BA%E7%A9%BA%EF%BC%8C%E5%88%99%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E5%A4%8D%E8%8A%82%E7%82%B9%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E7%A9%BA%E6%A0%91%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20%23%20%E8%8B%A5%E6%A0%91%E4%B8%BA%E7%A9%BA%EF%BC%8C%E5%88%99%E5%88%9D%E5%A7%8B%E5%8C%96%E6%A0%B9%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E5%BE%AA%E7%8E%AF%E6%9F%A5%E6%89%BE%EF%BC%8C%E8%B6%8A%E8%BF%87%E5%8F%B6%E8%8A%82%E7%82%B9%E5%90%8E%E8%B7%B3%E5%87%BA%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%89%BE%E5%88%B0%E9%87%8D%E5%A4%8D%E8%8A%82%E7%82%B9%EF%BC%8C%E7%9B%B4%E6%8E%A5%E8%BF%94%E5%9B%9E%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%8F%B3%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E4%BD%8D%E7%BD%AE%E5%9C%A8%20cur%20%E7%9A%84%E5%B7%A6%E5%AD%90%E6%A0%91%E4%B8%AD%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Similar to searching for a node, inserting a node uses $O(\log n)$ time.

### 3. &nbsp; Removing a node

First, find the target node in the binary tree, then remove it. Similar to inserting a node, we need to ensure that after the removal operation is completed, the property of the binary search tree "left subtree < root node < right subtree" is still satisfied. Therefore, based on the number of child nodes of the target node, we divide it into 0, 1, and 2 cases, performing the corresponding node removal operations.

As shown in the Figure 7-19 , when the degree of the node to be removed is $0$, it means the node is a leaf node, and it can be directly removed.

![Removing a node in a binary search tree (degree 0)](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> Figure 7-19 &nbsp; Removing a node in a binary search tree (degree 0) </p>

As shown in the Figure 7-20 , when the degree of the node to be removed is $1$, replacing the node to be removed with its child node is sufficient.

![Removing a node in a binary search tree (degree 1)](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> Figure 7-20 &nbsp; Removing a node in a binary search tree (degree 1) </p>

When the degree of the node to be removed is $2$, we cannot remove it directly, but need to use a node to replace it. To maintain the property of the binary search tree "left subtree < root node < right subtree," **this node can be either the smallest node of the right subtree or the largest node of the left subtree**.

Assuming we choose the smallest node of the right subtree (the next node in in-order traversal), then the removal operation proceeds as shown in the Figure 7-21 .

1. Find the next node in the "in-order traversal sequence" of the node to be removed, denoted as `tmp`.
2. Replace the value of the node to be removed with `tmp`'s value, and recursively remove the node `tmp` in the tree.

=== "<1>"
    ![Removing a node in a binary search tree (degree 2)](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-21 &nbsp; Removing a node in a binary search tree (degree 2) </p>

The operation of removing a node also uses $O(\log n)$ time, where finding the node to be removed requires $O(\log n)$ time, and obtaining the in-order traversal successor node requires $O(\log n)$ time. Example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """删除节点"""
        # 若树为空，直接提前返回
        if self._root is None:
            return
        # 循环查找，越过叶节点后跳出
        cur, pre = self._root, None
        while cur is not None:
            # 找到待删除节点，跳出循环
            if cur.val == num:
                break
            pre = cur
            # 待删除节点在 cur 的右子树中
            if cur.val < num:
                cur = cur.right
            # 待删除节点在 cur 的左子树中
            else:
                cur = cur.left
        # 若无待删除节点，则直接返回
        if cur is None:
            return

        # 子节点数量 = 0 or 1
        if cur.left is None or cur.right is None:
            # 当子节点数量 = 0 / 1 时， child = null / 该子节点
            child = cur.left or cur.right
            # 删除节点 cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # 若删除节点为根节点，则重新指定根节点
                self._root = child
        # 子节点数量 = 2
        else:
            # 获取中序遍历中 cur 的下一个节点
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # 递归删除节点 tmp
            self.remove(tmp.val)
            # 用 tmp 覆盖 cur
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* 删除节点 */
    void remove(int num) {
        // 若树为空，直接提前返回
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 找到待删除节点，跳出循环
            if (cur->val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur->left;
        }
        // 若无待删除节点，则直接返回
        if (cur == nullptr)
            return;
        // 子节点数量 = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // 删除节点 cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
            // 释放内存
            delete cur;
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 递归删除节点 tmp
            remove(tmp->val);
            // 用 tmp 覆盖 cur
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* 删除节点 */
    void remove(int num) {
        // 若树为空，直接提前返回
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur == null)
            return;
        // 子节点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            remove(tmp.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* 删除节点 */
    void Remove(int num) {
        // 若树为空，直接提前返回
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur == null)
            return;
        // 子节点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            TreeNode? child = cur.left ?? cur.right;
            // 删除节点 cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            Remove(tmp.val!.Value);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* 删除节点 */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // 若树为空，直接提前返回
        if cur == nil {
            return
        }
        // 待删除节点之前的节点位置
        var pre *TreeNode = nil
        // 循环查找，越过叶节点后跳出
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // 待删除节点在右子树中
                cur = cur.Right
            } else {
                // 待删除节点在左子树中
                cur = cur.Left
            }
        }
        // 若无待删除节点，则直接返回
        if cur == nil {
            return
        }
        // 子节点数为 0 或 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // 取出待删除节点的子节点
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // 删除节点 cur
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // 若删除节点为根节点，则重新指定根节点
                bst.root = child
            }
            // 子节点数为 2
        } else {
            // 获取中序遍历中待删除节点 cur 的下一个节点
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // 递归删除节点 tmp
            bst.remove(tmp.Val.(int))
            // 用 tmp 覆盖 cur
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* 删除节点 */
    func remove(num: Int) {
        // 若树为空，直接提前返回
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // 循环查找，越过叶节点后跳出
        while cur != nil {
            // 找到待删除节点，跳出循环
            if cur!.val == num {
                break
            }
            pre = cur
            // 待删除节点在 cur 的右子树中
            if cur!.val < num {
                cur = cur?.right
            }
            // 待删除节点在 cur 的左子树中
            else {
                cur = cur?.left
            }
        }
        // 若无待删除节点，则直接返回
        if cur == nil {
            return
        }
        // 子节点数量 = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            let child = cur?.left ?? cur?.right
            // 删除节点 cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // 递归删除节点 tmp
            remove(num: tmp!.val)
            // 用 tmp 覆盖 cur
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* 删除节点 */
    remove(num) {
        // 若树为空，直接提前返回
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到待删除节点，跳出循环
            if (cur.val === num) break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur === null) return;
        // 子节点数量 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            const child = cur.left !== null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                this.root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            this.remove(tmp.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* 删除节点 */
    remove(num: number): void {
        // 若树为空，直接提前返回
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // 循环查找，越过叶节点后跳出
        while (cur !== null) {
            // 找到待删除节点，跳出循环
            if (cur.val === num) break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num) cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur === null) return;
        // 子节点数量 = 0 or 1
        if (cur.left === null || cur.right === null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                this.root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // 递归删除节点 tmp
            this.remove(tmp!.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* 删除节点 */
    void remove(int _num) {
      // 若树为空，直接提前返回
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // 循环查找，越过叶节点后跳出
      while (cur != null) {
        // 找到待删除节点，跳出循环
        if (cur.val == _num) break;
        pre = cur;
        // 待删除节点在 cur 的右子树中
        if (cur.val < _num)
          cur = cur.right;
        // 待删除节点在 cur 的左子树中
        else
          cur = cur.left;
      }
      // 若无待删除节点，直接返回
      if (cur == null) return;
      // 子节点数量 = 0 or 1
      if (cur.left == null || cur.right == null) {
        // 当子节点数量 = 0 / 1 时， child = null / 该子节点
        TreeNode? child = cur.left ?? cur.right;
        // 删除节点 cur
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // 若删除节点为根节点，则重新指定根节点
          _root = child;
        }
      } else {
        // 子节点数量 = 2
        // 获取中序遍历中 cur 的下一个节点
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // 递归删除节点 tmp
        remove(tmp.val);
        // 用 tmp 覆盖 cur
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* 删除节点 */
    pub fn remove(&mut self, num: i32) {
        // 若树为空，直接提前返回
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // 循环查找，越过叶节点后跳出
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // 找到待删除节点，跳出循环
                Ordering::Equal => break,
                // 待删除节点在 cur 的右子树中
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // 待删除节点在 cur 的左子树中
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // 若无待删除节点，则直接返回
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // 子节点数量 = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // 删除节点 cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(&left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // 若删除节点为根节点，则重新指定根节点
                    self.root = child;
                }
            }
            // 子节点数量 = 2
            (Some(_), Some(_)) => {
                // 获取中序遍历中 cur 的下一个节点
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmpval = tmp.unwrap().borrow().val;
                // 递归删除节点 tmp
                self.remove(tmpval);
                // 用 tmp 覆盖 cur
                cur.borrow_mut().val = tmpval;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* 删除节点 */
    // 由于引入了 stdio.h ，此处无法使用 remove 关键词
    void removeItem(BinarySearchTree *bst, int num) {
        // 若树为空，直接提前返回
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // 循环查找，越过叶节点后跳出
        while (cur != NULL) {
            // 找到待删除节点，跳出循环
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // 待删除节点在 root 的右子树中
                cur = cur->right;
            } else {
                // 待删除节点在 root 的左子树中
                cur = cur->left;
            }
        }
        // 若无待删除节点，则直接返回
        if (cur == NULL)
            return;
        // 判断待删除节点是否存在子节点
        if (cur->left == NULL || cur->right == NULL) {
            /* 子节点数量 = 0 or 1 */
            // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // 删除节点 cur
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // 释放内存
            free(cur);
        } else {
            /* 子节点数量 = 2 */
            // 获取中序遍历中 cur 的下一个节点
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 递归删除节点 tmp
            removeItem(bst, tmp->val);
            // 用 tmp 覆盖 cur
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* 删除节点 */
    fun remove(num: Int) {
        // 若树为空，直接提前返回
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.value == num)
                break
            pre = cur
            // 待删除节点在 cur 的右子树中
            cur = if (cur.value < num)
                cur.right
            // 待删除节点在 cur 的左子树中
            else
                cur.left
        }
        // 若无待删除节点，则直接返回
        if (cur == null)
            return
        // 子节点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // 删除节点 cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child
            }
            // 子节点数量 = 2
        } else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // 递归删除节点 tmp
            remove(tmp.value)
            // 用 tmp 覆盖 cur
            cur.value = tmp.value
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    [class]{BinarySearchTree}-[func]{remove}
    ```

=== "Zig"

    ```zig title="binary_search_tree.zig"
    // 删除节点
    fn remove(self: *Self, num: T) void {
        // 若树为空，直接提前返回
        if (self.root == null) return;
        var cur = self.root;
        var pre: ?*inc.TreeNode(T) = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.?.val == num) break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.?.val < num) {
                cur = cur.?.right;
            // 待删除节点在 cur 的左子树中
            } else {
                cur = cur.?.left;
            }
        }
        // 若无待删除节点，则直接返回
        if (cur == null) return;
        // 子节点数量 = 0 or 1
        if (cur.?.left == null or cur.?.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            var child = if (cur.?.left != null) cur.?.left else cur.?.right;
            // 删除节点 cur
            if (pre.?.left == cur) {
                pre.?.left = child;
            } else {
                pre.?.right = child;
            }
        // 子节点数量 = 2
        } else {
            // 获取中序遍历中 cur 的下一个节点
            var tmp = cur.?.right;
            while (tmp.?.left != null) {
                tmp = tmp.?.left;
            }
            var tmp_val = tmp.?.val;
            // 递归删除节点 tmp
            self.remove(tmp.?.val);
            // 用 tmp 覆盖 cur
            cur.?.val = tmp_val;
        }
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%200%20/%201%20%E6%97%B6%EF%BC%8C%20child%20%3D%20null%20/%20%E8%AF%A5%E5%AD%90%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20!%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%E4%B8%AD%20cur%20%E7%9A%84%E4%B8%8B%E4%B8%80%E4%B8%AA%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%94%A8%20tmp%20%E8%A6%86%E7%9B%96%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%0A%20%20%20%20bst.remove%281%29%20%23%20%E5%BA%A6%E4%B8%BA%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E5%BA%A6%E4%B8%BA%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E5%BA%A6%E4%B8%BA%202&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%A0%91%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%9E%84%E9%80%A0%E6%96%B9%E6%B3%95%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E6%8F%92%E5%85%A5%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20%E6%9F%A5%E6%89%BE%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%BD%93%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%200%20/%201%20%E6%97%B6%EF%BC%8C%20child%20%3D%20null%20/%20%E8%AF%A5%E5%AD%90%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20!%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20%E5%AD%90%E8%8A%82%E7%82%B9%E6%95%B0%E9%87%8F%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E4%B8%AD%E5%BA%8F%E9%81%8D%E5%8E%86%E4%B8%AD%20cur%20%E7%9A%84%E4%B8%8B%E4%B8%80%E4%B8%AA%E8%8A%82%E7%82%B9%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E9%80%92%E5%BD%92%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E7%94%A8%20tmp%20%E8%A6%86%E7%9B%96%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E4%BA%8C%E5%8F%89%E6%90%9C%E7%B4%A2%E6%A0%91%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20%E5%88%A0%E9%99%A4%E8%8A%82%E7%82%B9%0A%20%20%20%20bst.remove%281%29%20%23%20%E5%BA%A6%E4%B8%BA%200%0A%20%20%20%20bst.remove%282%29%20%23%20%E5%BA%A6%E4%B8%BA%201%0A%20%20%20%20bst.remove%284%29%20%23%20%E5%BA%A6%E4%B8%BA%202&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

### 4. &nbsp; In-order traversal is ordered

As shown in the Figure 7-22 , the in-order traversal of a binary tree follows the "left $\rightarrow$ root $\rightarrow$ right" traversal order, and a binary search tree satisfies the size relationship "left child node < root node < right child node".

This means that in-order traversal in a binary search tree always traverses the next smallest node first, thus deriving an important property: **The in-order traversal sequence of a binary search tree is ascending**.

Using the ascending property of in-order traversal, obtaining ordered data in a binary search tree requires only $O(n)$ time, without the need for additional sorting operations, which is very efficient.

![In-order traversal sequence of a binary search tree](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> Figure 7-22 &nbsp; In-order traversal sequence of a binary search tree </p>

## 7.4.2 &nbsp; Efficiency of binary search trees

Given a set of data, we consider using an array or a binary search tree for storage. Observing the Table 7-2 , the operations on a binary search tree all have logarithmic time complexity, which is stable and efficient. Only in scenarios of high-frequency addition and low-frequency search and removal, arrays are more efficient than binary search trees.

<p align="center"> Table 7-2 &nbsp; Efficiency comparison between arrays and search trees </p>

<div class="center-table" markdown>

|                | Unsorted array | Binary search tree |
| -------------- | -------------- | ------------------ |
| Search element | $O(n)$         | $O(\log n)$        |
| Insert element | $O(1)$         | $O(\log n)$        |
| Remove element | $O(n)$         | $O(\log n)$        |

</div>

In ideal conditions, the binary search tree is "balanced," thus any node can be found within $\log n$ loops.

However, continuously inserting and removing nodes in a binary search tree may lead to the binary tree degenerating into a chain list as shown in the Figure 7-23 , at which point the time complexity of various operations also degrades to $O(n)$.

![Degradation of a binary search tree](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> Figure 7-23 &nbsp; Degradation of a binary search tree </p>

## 7.4.3 &nbsp; Common applications of binary search trees

- Used as multi-level indexes in systems to implement efficient search, insertion, and removal operations.
- Serves as the underlying data structure for certain search algorithms.
- Used to store data streams to maintain their ordered state.
