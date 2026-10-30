---
comments: true
---

# 7.4 &nbsp; Binary search trees

A <u>binary search tree</u> satisfies the following conditions, as shown below.

1. Every value in the left subtree is $<$ the root value, which is $<$ every value in the right subtree.
2. The left and right subtrees of every node are also binary search trees and satisfy condition `1.`.

![A binary search tree](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-16 &nbsp; A binary search tree </p>

## 7.4.1 &nbsp; Binary search tree operations

We encapsulate the tree in a `BinarySearchTree` class with a member variable `root` pointing to its root node.

### 1. &nbsp; Finding a node

To find a target value `num`, use the tree's ordering property. As shown below, initialize a node reference `cur` at `root` and repeatedly compare `cur.val` with `num`.

- If `cur.val < num`, the target lies in the right subtree, so set `cur = cur.right`.
- If `cur.val > num`, the target lies in the left subtree, so set `cur = cur.left`.
- If `cur.val = num`, the target has been found; exit the loop and return the node.

=== "<1>"
    ![Finding a node in a binary search tree](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-17 &nbsp; Finding a node in a binary search tree </p>

Searching a binary search tree follows the same principle as binary search: each round eliminates half the possibilities. The number of iterations is at most the tree's height, giving $O(\log n)$ time when the tree is balanced. An implementation follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """Find a node"""
        cur = self._root
        # Search in a loop, stopping if cur becomes None
        while cur is not None:
            # If present, the target node is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # If present, the target node is in the left subtree of cur
            elif cur.val > num:
                cur = cur.left
            # The target node was found; exit the loop
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Find a node */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // The target node lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The target node lies in the left subtree of cur
            else if (cur->val > num)
                cur = cur->left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node, or nullptr if it was not found
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Find a node */
    TreeNode search(int num) {
        TreeNode cur = root;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num)
                cur = cur.left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Find a node */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num) cur =
                cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num)
                cur = cur.left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Find a node */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // Continue searching while the current node is not nil
        for node != nil {
            if node.Val.(int) < num {
                // If the target node exists, it lies in the right subtree of node
                node = node.Right
            } else if node.Val.(int) > num {
                // If the target node exists, it lies in the left subtree of node
                node = node.Left
            } else {
                // The target node was found; exit the loop
                break
            }
        }
        // Return the target node, or nil if it was not found
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Find a node */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // If present, the target node lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // If present, the target node lies in the left subtree of cur
            else if cur!.val > num {
                cur = cur?.left
            }
            // The target node was found; exit the loop
            else {
                break
            }
        }
        // Return the target node, or nil if it was not found
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Find a node */
    search(num) {
        let cur = this.root;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur !== null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num) cur = cur.left;
            // The target node was found; exit the loop
            else break;
        }
        // Return the target node
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Find a node */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // The target node lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The target node lies in the left subtree of cur
            else if (cur.val > num) cur = cur.left;
            // The target node was found; exit the loop
            else break;
        }
        // Return the target node
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Find a node */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // Search in a loop, stopping if a null reference is reached
      while (cur != null) {
        // The target node lies in the right subtree of cur
        if (cur.val < _num)
          cur = cur.right;
        // The target node lies in the left subtree of cur
        else if (cur.val > _num)
          cur = cur.left;
        // The target node was found; exit the loop
        else
          break;
      }
      // Return the target node
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Find a node */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The target node lies in the right subtree of cur
                Ordering::Greater => cur = node.borrow().right.clone(),
                // The target node lies in the left subtree of cur
                Ordering::Less => cur = node.borrow().left.clone(),
                // The target node was found; exit the loop
                Ordering::Equal => break,
            }
        }

        // Return the matching node, or None if no match was found
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Find a node */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != NULL) {
            if (cur->val < num) {
                // The target node lies in the right subtree of cur
                cur = cur->right;
            } else if (cur->val > num) {
                // The target node lies in the left subtree of cur
                cur = cur->left;
            } else {
                // The target node was found; exit the loop
                break;
            }
        }
        // Return the target node
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Find a node */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Continue searching while cur is not null
        while (cur != null) {
            // The target node lies in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The target node lies in the left subtree of cur
            else if (cur._val > num)
                cur.left
            // The target node was found; exit the loop
            else
                break
        }
        // Return the target node
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Find a node ###
    def search(num)
      cur = @root

      # Search in a loop, stopping if cur becomes nil
      while !cur.nil?
        # The target node lies in the right subtree of cur
        if cur.val < num
          cur = cur.right
        # The target node lies in the left subtree of cur
        elsif cur.val > num
          cur = cur.left
        # The target node was found; exit the loop
        else
          break
        end
      end

      cur
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Initialize%20an%20empty%20tree%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Find%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20present,%20the%20target%20node%20is%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20present,%20the%20target%20node%20is%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20target%20node%20was%20found%3B%20exit%20the%20loop%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20%23%20If%20the%20tree%20is%20empty,%20initialize%20the%20root%20node%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Return%20immediately%20if%20a%20duplicate%20node%20is%20found%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Find%20a%20node%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5CnFound%20node%20object%3A%20%7B%7D,%20node%20value%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Initialize%20an%20empty%20tree%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20search%28self,%20num%3A%20int%29%20-%3E%20TreeNode%20%7C%20None%3A%0A%20%20%20%20%20%20%20%20%22%22%22Find%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20cur%20%3D%20self._root%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20present,%20the%20target%20node%20is%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20If%20present,%20the%20target%20node%20is%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20elif%20cur.val%20%3E%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20target%20node%20was%20found%3B%20exit%20the%20loop%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20return%20cur%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20%23%20If%20the%20tree%20is%20empty,%20initialize%20the%20root%20node%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Return%20immediately%20if%20a%20duplicate%20node%20is%20found%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Find%20a%20node%0A%20%20%20%20node%20%3D%20bst.search%287%29%0A%20%20%20%20print%28%22%5CnFound%20node%20object%3A%20%7B%7D,%20node%20value%20%3D%20%7B%7D%22.format%28node,%20node.val%29%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Inserting a node

To insert `num` while preserving the ordering “left subtree < root < right subtree,” follow the process below.

1. **Find the insertion position**: as in a search, start at the root and move down according to comparisons with `num`. Stop when the traversal passes a leaf and reaches `None`.
2. **Insert at that position**: create a node containing `num` and place it at the `None` position.

![Inserting a node into a binary search tree](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> Figure 7-18 &nbsp; Inserting a node into a binary search tree </p>

Keep two details in mind when implementing this.

- Duplicate values are not allowed under this definition. If the value already exists, return without inserting it.
- Keep a reference `pre` to the node from the previous iteration. When the traversal reaches `None`, `pre` gives its parent so that the new node can be attached.

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """Insert a node"""
        # If the tree is empty, initialize the root node
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Search in a loop, stopping if cur becomes None
        cur, pre = self._root, None
        while cur is not None:
            # Return immediately if a duplicate node is found
            if cur.val == num:
                return
            pre = cur
            # The insertion position lies in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # The insertion position lies in the left subtree of cur
            else:
                cur = cur.left
        # Insert a node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Insert a node */
    void insert(int num) {
        // If the tree is empty, initialize the root node
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // Return immediately if a duplicate node is found
            if (cur->val == num)
                return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The insertion position lies in the left subtree of cur
            else
                cur = cur->left;
        }
        // Insert a node
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Insert a node */
    void insert(int num) {
        // If the tree is empty, initialize the root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != null) {
            // Return immediately if a duplicate node is found
            if (cur.val == num)
                return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The insertion position lies in the left subtree of cur
            else
                cur = cur.left;
        }
        // Insert a node
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Insert a node */
    void Insert(int num) {
        // If the tree is empty, initialize the root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // Return immediately if a duplicate node is found
            if (cur.val == num)
                return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The insertion position lies in the left subtree of cur
            else
                cur = cur.left;
        }

        // Insert a node
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
    /* Insert a node */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // If the tree is empty, initialize the root node
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // Track the parent of the node to insert
        var pre *TreeNode = nil
        // Continue searching while the current node is not nil
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
        // Insert a node
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
    /* Insert a node */
    func insert(num: Int) {
        // If the tree is empty, initialize the root node
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // Return immediately if a duplicate node is found
            if cur!.val == num {
                return
            }
            pre = cur
            // The insertion position lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // The insertion position lies in the left subtree of cur
            else {
                cur = cur?.left
            }
        }
        // Insert a node
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
    /* Insert a node */
    insert(num) {
        // If the tree is empty, initialize the root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur !== null) {
            // Return immediately if a duplicate node is found
            if (cur.val === num) return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The insertion position lies in the left subtree of cur
            else cur = cur.left;
        }
        // Insert a node
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Insert a node */
    insert(num: number): void {
        // If the tree is empty, initialize the root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // Return immediately if a duplicate node is found
            if (cur.val === num) return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The insertion position lies in the left subtree of cur
            else cur = cur.left;
        }
        // Insert a node
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Insert a node */
    void insert(int _num) {
      // If the tree is empty, initialize the root node
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Search in a loop, stopping if a null reference is reached
      while (cur != null) {
        // Return immediately if a duplicate node is found
        if (cur.val == _num) return;
        pre = cur;
        // The insertion position lies in the right subtree of cur
        if (cur.val < _num)
          cur = cur.right;
        // The insertion position lies in the left subtree of cur
        else
          cur = cur.left;
      }
      // Insert a node
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Insert a node */
    pub fn insert(&mut self, num: i32) {
        // If the tree is empty, initialize the root node
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Return immediately if a duplicate node is found
                Ordering::Equal => return,
                // The insertion position lies in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The insertion position lies in the left subtree of cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Insert a node
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
    /* Insert a node */
    void insert(BinarySearchTree *bst, int num) {
        // If the tree is empty, initialize the root node
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != NULL) {
            // Return immediately if a duplicate node is found
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // The insertion position lies in the right subtree of cur
                cur = cur->right;
            } else {
                // The insertion position lies in the left subtree of cur
                cur = cur->left;
            }
        }
        // Insert a node
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
    /* Insert a node */
    fun insert(num: Int) {
        // If the tree is empty, initialize the root node
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Continue searching while cur is not null
        while (cur != null) {
            // Return immediately if a duplicate node is found
            if (cur._val == num)
                return
            pre = cur
            // The insertion position lies in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The insertion position lies in the left subtree of cur
            else
                cur.left
        }
        // Insert a node
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Insert a node ###
    def insert(num)
      # If the tree is empty, initialize the root node
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # Search in a loop, stopping if cur becomes nil
      cur, pre = @root, nil
      while !cur.nil?
        # Return immediately if a duplicate node is found
        return if cur.val == num

        pre = cur
        # The insertion position lies in the right subtree of cur
        if cur.val < num
          cur = cur.right
        # The insertion position lies in the left subtree of cur
        else
          cur = cur.left
        end
      end

      # Insert a node
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Initialize%20an%20empty%20tree%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20%23%20If%20the%20tree%20is%20empty,%20initialize%20the%20root%20node%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Return%20immediately%20if%20a%20duplicate%20node%20is%20found%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20%23%20Initialize%20an%20empty%20tree%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20%23%20If%20the%20tree%20is%20empty,%20initialize%20the%20root%20node%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Search%20in%20a%20loop,%20stopping%20if%20cur%20becomes%20None%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Return%20immediately%20if%20a%20duplicate%20node%20is%20found%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20right%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20The%20insertion%20position%20lies%20in%20the%20left%20subtree%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Insert%20a%20node%0A%20%20%20%20bst.insert%2816%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

Like lookup, insertion takes $O(\log n)$ time.

### 3. &nbsp; Deleting a node

First locate the target node, then remove it while preserving “left subtree < root < right subtree.” The procedure depends on whether the target has 0, 1, or 2 children.

As shown below, a node of degree $0$ is a leaf and can be removed directly.

![Deleting a node of degree 0](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> Figure 7-19 &nbsp; Deleting a node of degree 0 </p>

As shown below, replace a node of degree $1$ with its only child.

![Deleting a node of degree 1](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> Figure 7-20 &nbsp; Deleting a node of degree 1 </p>

A node of degree $2$ cannot simply be removed; another node must replace it. To preserve “left subtree $<$ root $<$ right subtree,” **use either the smallest node in the right subtree or the largest node in the left subtree**.

Suppose we choose the smallest node in the right subtree, the next node in inorder traversal. The process is shown below.

1. Find the target node's successor in inorder traversal and call it `tmp`.
2. Replace the target node's value with `tmp`'s value, then recursively delete `tmp` from the tree.

=== "<1>"
    ![Deleting a node of degree 2](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-21 &nbsp; Deleting a node of degree 2 </p>

Deletion also takes $O(\log n)$ time: locating the target takes $O(\log n)$, and finding its inorder successor takes $O(\log n)$. An implementation follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """Remove a node"""
        # Return immediately if the tree is empty
        if self._root is None:
            return
        # Search in a loop, stopping if cur becomes None
        cur, pre = self._root, None
        while cur is not None:
            # The node to remove was found; exit the loop
            if cur.val == num:
                break
            pre = cur
            # If present, the node to remove is in the right subtree of cur
            if cur.val < num:
                cur = cur.right
            # If present, the node to remove is in the left subtree of cur
            else:
                cur = cur.left
        # Return immediately if the node to remove does not exist
        if cur is None:
            return

        # Number of children = 0 or 1
        if cur.left is None or cur.right is None:
            # With 0 or 1 child, child is None or that child, respectively
            child = cur.left or cur.right
            # Remove node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If the removed node is the root, assign the new root
                self._root = child
        # Number of children = 2
        else:
            # Get the inorder successor of cur
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively remove node tmp
            self.remove(tmp.val)
            # Replace the value of cur with the value of tmp
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Remove a node */
    void remove(int num) {
        // Return immediately if the tree is empty
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // The node to remove was found; exit the loop
            if (cur->val == num)
                break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The node to remove lies in the left subtree of cur
            else
                cur = cur->left;
        }
        // Return immediately if the node to remove does not exist
        if (cur == nullptr)
            return;
        // Number of children = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // With 0 or 1 child, child is nullptr or that child, respectively
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Remove node cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // If the removed node is the root, assign the new root
                root = child;
            }
            // Free memory
            delete cur;
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively remove node tmp
            remove(tmp->val);
            // Replace the value of cur with the value of tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Remove a node */
    void remove(int num) {
        // Return immediately if the tree is empty
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != null) {
            // The node to remove was found; exit the loop
            if (cur.val == num)
                break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else
                cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur == null)
            return;
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With 0 / 1 children, child is null / the child node, respectively
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Remove node cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If the removed node is the root, assign the new root
                root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively remove node tmp
            remove(tmp.val);
            // Replace the value of cur with the value of tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Remove a node */
    void Remove(int num) {
        // Return immediately if the tree is empty
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur != null) {
            // The node to remove was found; exit the loop
            if (cur.val == num)
                break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num)
                cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else
                cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur == null)
            return;
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With 0 / 1 children, child is null / the child node, respectively
            TreeNode? child = cur.left ?? cur.right;
            // Remove node cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If the removed node is the root, assign the new root
                root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively remove node tmp
            Remove(tmp.val!.Value);
            // Replace the value of cur with the value of tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Remove a node */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // Return immediately if the tree is empty
        if cur == nil {
            return
        }
        // Track the parent of the node to remove
        var pre *TreeNode = nil
        // Continue searching while the current node is not nil
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // The node to remove is in the right subtree
                cur = cur.Right
            } else {
                // The node to remove is in the left subtree
                cur = cur.Left
            }
        }
        // Return immediately if the node to remove does not exist
        if cur == nil {
            return
        }
        // The node has 0 or 1 child
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // Get the child of the node to remove
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // Remove node cur
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // If the removed node is the root, assign the new root
                bst.root = child
            }
            // The node has 2 children
        } else {
            // Get the inorder successor of cur, the node to remove
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // Recursively remove node tmp
            bst.remove(tmp.Val.(int))
            // Replace the value of cur with the value of tmp
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Remove a node */
    func remove(num: Int) {
        // Return immediately if the tree is empty
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Search in a loop, stopping if cur becomes nil
        while cur != nil {
            // The node to remove was found; exit the loop
            if cur!.val == num {
                break
            }
            pre = cur
            // If present, the node to remove lies in the right subtree of cur
            if cur!.val < num {
                cur = cur?.right
            }
            // If present, the node to remove lies in the left subtree of cur
            else {
                cur = cur?.left
            }
        }
        // Return immediately if the node to remove does not exist
        if cur == nil {
            return
        }
        // Number of children = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // With 0 / 1 children, child is nil / the child node, respectively
            let child = cur?.left ?? cur?.right
            // Remove node cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // If the removed node is the root, assign the new root
                root = child
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Recursively remove node tmp
            remove(num: tmp!.val)
            // Replace the value of cur with the value of tmp
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Remove a node */
    remove(num) {
        // Return immediately if the tree is empty
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur !== null) {
            // The node to remove was found; exit the loop
            if (cur.val === num) break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur === null) return;
        // Number of children = 0 or 1
        if (cur.left === null || cur.right === null) {
            // With 0 / 1 children, child is null / the child node, respectively
            const child = cur.left !== null ? cur.left : cur.right;
            // Remove node cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // If the removed node is the root, assign the new root
                this.root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Recursively remove node tmp
            this.remove(tmp.val);
            // Replace the value of cur with the value of tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Remove a node */
    remove(num: number): void {
        // Return immediately if the tree is empty
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Search in a loop, stopping if a null reference is reached
        while (cur !== null) {
            // The node to remove was found; exit the loop
            if (cur.val === num) break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur.val < num) cur = cur.right;
            // The node to remove lies in the left subtree of cur
            else cur = cur.left;
        }
        // Return immediately if the node to remove does not exist
        if (cur === null) return;
        // Number of children = 0 or 1
        if (cur.left === null || cur.right === null) {
            // With 0 / 1 children, child is null / the child node, respectively
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Remove node cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // If the removed node is the root, assign the new root
                this.root = child;
            }
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Recursively remove node tmp
            this.remove(tmp!.val);
            // Replace the value of cur with the value of tmp
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Remove a node */
    void remove(int _num) {
      // Return immediately if the tree is empty
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Search in a loop, stopping if a null reference is reached
      while (cur != null) {
        // The node to remove was found; exit the loop
        if (cur.val == _num) break;
        pre = cur;
        // The node to remove lies in the right subtree of cur
        if (cur.val < _num)
          cur = cur.right;
        // The node to remove lies in the left subtree of cur
        else
          cur = cur.left;
      }
      // Return if the node to remove does not exist
      if (cur == null) return;
      // Number of children = 0 or 1
      if (cur.left == null || cur.right == null) {
        // With 0 / 1 children, child is null / the child node, respectively
        TreeNode? child = cur.left ?? cur.right;
        // Remove node cur
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // If the removed node is the root, assign the new root
          _root = child;
        }
      } else {
        // Number of children = 2
        // Get the inorder successor of cur
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // Recursively remove node tmp
        remove(tmp.val);
        // Replace the value of cur with the value of tmp
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Remove a node */
    pub fn remove(&mut self, num: i32) {
        // Return immediately if the tree is empty
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Search while cur refers to a node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // The node to remove was found; exit the loop
                Ordering::Equal => break,
                // The node to remove lies in the right subtree of cur
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // The node to remove lies in the left subtree of cur
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Return immediately if the node to remove does not exist
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Number of children = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // With 0 or 1 child, child is None or that child, respectively
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Remove node cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // If the removed node is the root, assign the new root
                    self.root = child;
                }
            }
            // Number of children = 2
            (Some(_), Some(_)) => {
                // Get the inorder successor of cur
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // Recursively remove node tmp
                self.remove(tmp_val);
                // Replace the value of cur with the value of tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Remove a node */
    // The name remove conflicts with the function declared in stdio.h
    void removeItem(BinarySearchTree *bst, int num) {
        // Return immediately if the tree is empty
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // Search in a loop until reaching a null reference beyond a leaf
        while (cur != NULL) {
            // The node to remove was found; exit the loop
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // The node to remove is in cur's right subtree
                cur = cur->right;
            } else {
                // The node to remove is in cur's left subtree
                cur = cur->left;
            }
        }
        // Return immediately if the node to remove does not exist
        if (cur == NULL)
            return;
        // Check whether the node to remove has children
        if (cur->left == NULL || cur->right == NULL) {
            /* Number of children = 0 or 1 */
            // With 0 or 1 child, child is NULL or that child, respectively
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // Remove node cur
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // Free memory
            free(cur);
        } else {
            /* Number of children = 2 */
            // Get the inorder successor of cur
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively remove node tmp
            removeItem(bst, tmp->val);
            // Replace the value of cur with the value of tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Remove a node */
    fun remove(num: Int) {
        // Return immediately if the tree is empty
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Continue searching while cur is not null
        while (cur != null) {
            // The node to remove was found; exit the loop
            if (cur._val == num)
                break
            pre = cur
            // The node to remove lies in the right subtree of cur
            cur = if (cur._val < num)
                cur.right
            // The node to remove lies in the left subtree of cur
            else
                cur.left
        }
        // Return immediately if the node to remove does not exist
        if (cur == null)
            return
        // Number of children = 0 or 1
        if (cur.left == null || cur.right == null) {
            // With 0 / 1 children, child is null / the child node, respectively
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Remove node cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // If the removed node is the root, assign the new root
                root = child
            }
            // Number of children = 2
        } else {
            // Get the inorder successor of cur
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Recursively remove node tmp
            remove(tmp._val)
            // Replace the value of cur with the value of tmp
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Remove a node ###
    def remove(num)
      # Return immediately if the tree is empty
      return if @root.nil?

      # Search in a loop, stopping if cur becomes nil
      cur, pre = @root, nil
      while !cur.nil?
        # The node to remove was found; exit the loop
        break if cur.val == num

        pre = cur
        # The node to remove lies in the right subtree of cur
        if cur.val < num
          cur = cur.right
        # The node to remove lies in the left subtree of cur
        else
          cur = cur.left
        end
      end
      # Return immediately if the node to remove does not exist
      return if cur.nil?

      # Number of children = 0 or 1
      if cur.left.nil? || cur.right.nil?
        # With 0 / 1 children, child is nil / the child node, respectively
        child = cur.left || cur.right
        # Remove node cur
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # If the removed node is the root, assign the new root
          @root = child
        end
      # Number of children = 2
      else
        # Get the inorder successor of cur
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # Recursively remove node tmp
        remove(tmp.val)
        # Replace the value of cur with the value of tmp
        cur.val = tmp.val
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Find%20a%20node%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20Number%20of%20children%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20With%200%20or%201%20child,%20child%20is%20None%20or%20that%20child,%20respectively%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Remove%20node%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20Number%20of%20children%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Get%20the%20inorder%20successor%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Recursively%20remove%20node%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Replace%20the%20value%20of%20cur%20with%20the%20value%20of%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Remove%20a%20node%0A%20%20%20%20bst.remove%281%29%20%23%20Degree%200%0A%20%20%20%20bst.remove%282%29%20%23%20Degree%201%0A%20%20%20%20bst.remove%284%29%20%23%20Degree%202&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=class%20TreeNode%3A%0A%20%20%20%20%22%22%22Binary%20tree%20node%20class%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%29%3A%0A%20%20%20%20%20%20%20%20self.val%20%3D%20val%0A%20%20%20%20%20%20%20%20self.left%20%3D%20None%0A%20%20%20%20%20%20%20%20self.right%20%3D%20None%0A%0Aclass%20BinarySearchTree%3A%0A%20%20%20%20%22%22%22Binary%20search%20tree%22%22%22%0A%0A%20%20%20%20def%20__init__%28self%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Constructor%22%22%22%0A%20%20%20%20%20%20%20%20self._root%20%3D%20None%0A%0A%20%20%20%20def%20insert%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Insert%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20node%20%3D%20TreeNode%28num%29%0A%20%20%20%20%20%20%20%20if%20pre.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20node%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20node%0A%0A%20%20%20%20def%20remove%28self,%20num%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20%22%22%22Remove%20a%20node%22%22%22%0A%20%20%20%20%20%20%20%20if%20self._root%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%20%20%20%20%20%20%20%20%23%20Find%20a%20node%0A%20%20%20%20%20%20%20%20cur,%20pre%20%3D%20self._root,%20None%0A%20%20%20%20%20%20%20%20while%20cur%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3D%3D%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20break%0A%20%20%20%20%20%20%20%20%20%20%20%20pre%20%3D%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur.val%20%3C%20num%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20cur%20%3D%20cur.left%0A%20%20%20%20%20%20%20%20if%20cur%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20return%0A%0A%20%20%20%20%20%20%20%20%23%20Number%20of%20children%20%3D%200%20or%201%0A%20%20%20%20%20%20%20%20if%20cur.left%20is%20None%20or%20cur.right%20is%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20With%200%20or%201%20child,%20child%20is%20None%20or%20that%20child,%20respectively%0A%20%20%20%20%20%20%20%20%20%20%20%20child%20%3D%20cur.left%20or%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Remove%20node%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20cur%20%21%3D%20self._root%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20if%20pre.left%20%3D%3D%20cur%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.left%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20pre.right%20%3D%20child%0A%20%20%20%20%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20self._root%20%3D%20child%0A%20%20%20%20%20%20%20%20%23%20Number%20of%20children%20%3D%202%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Get%20the%20inorder%20successor%20of%20cur%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%3A%20TreeNode%20%3D%20cur.right%0A%20%20%20%20%20%20%20%20%20%20%20%20while%20tmp.left%20is%20not%20None%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20tmp%20%3D%20tmp.left%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Recursively%20remove%20node%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20self.remove%28tmp.val%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Replace%20the%20value%20of%20cur%20with%20the%20value%20of%20tmp%0A%20%20%20%20%20%20%20%20%20%20%20%20cur.val%20%3D%20tmp.val%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Initialize%20the%20binary%20search%20tree%0A%20%20%20%20bst%20%3D%20BinarySearchTree%28%29%0A%20%20%20%20nums%20%3D%20%5B4,%202,%206,%201,%203,%205,%207%5D%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20bst.insert%28num%29%0A%0A%20%20%20%20%23%20Remove%20a%20node%0A%20%20%20%20bst.remove%281%29%20%23%20Degree%200%0A%20%20%20%20bst.remove%282%29%20%23%20Degree%201%0A%20%20%20%20bst.remove%284%29%20%23%20Degree%202&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=162&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 4. &nbsp; Inorder traversal produces sorted data

As shown below, inorder traversal visits “left $\rightarrow$ root $\rightarrow$ right,” while a binary search tree obeys “left child $<$ root $<$ right child.”

Thus, inorder traversal always visits the next smallest node, giving an important property: **the inorder traversal of a binary search tree is in ascending order**.

This lets us retrieve sorted data from the tree in just $O(n)$ time, with no additional sorting.

![Inorder traversal of a binary search tree](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> Figure 7-22 &nbsp; Inorder traversal of a binary search tree </p>

## 7.4.2 &nbsp; Efficiency

Suppose we want to store a dataset in an array or a binary search tree. As Table 7-2 shows, the tree's operations take logarithmic time, offering consistent and efficient performance. An array is faster only when insertions are frequent but lookups and deletions are infrequent.

<p align="center"> Table 7-2 &nbsp; Efficiency of arrays and search trees </p>

<div class="center-table" markdown>

|          | Unsorted array | Binary search tree  |
| -------- | -------- | ----------- |
| Find an element | $O(n)$   | $O(\log n)$ |
| Insert an element | $O(1)$   | $O(\log n)$ |
| Delete an element | $O(n)$   | $O(\log n)$ |

</div>

Ideally, the tree is balanced, allowing any node to be found within $\log n$ iterations.

However, repeated insertions and deletions may cause it to degenerate into a linked list, as shown below. The time complexity of its operations then degrades to $O(n)$.

![Degeneration of a binary search tree](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> Figure 7-23 &nbsp; Degeneration of a binary search tree </p>

## 7.4.3 &nbsp; Common applications

- Multilevel indexes in systems, supporting efficient lookup, insertion, and deletion.
- The underlying data structure for certain search algorithms.
- Storing a data stream while maintaining its order.
