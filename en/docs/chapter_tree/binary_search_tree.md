---
comments: true
---

# 7.4 &nbsp; Binary Search Tree

As shown in Figure 7-16, a <u>binary search tree</u> satisfies the following conditions.

1. For the root node, the value of all nodes in the left subtree $<$ the value of the root node $<$ the value of all nodes in the right subtree.
2. The left and right subtrees of any node are also binary search trees, i.e., they satisfy condition `1.` as well.

![Binary search tree](binary_search_tree.assets/binary_search_tree.png){ class="animation-figure" }

<p align="center"> Figure 7-16 &nbsp; Binary search tree </p>

## 7.4.1 &nbsp; Operations on a Binary Search Tree

We encapsulate the binary search tree as a class `BinarySearchTree` and declare a member variable `root` pointing to the tree's root node.

### 1. &nbsp; Searching for a Node

Given a target node value `num`, we can search according to the properties of the binary search tree. As shown in Figure 7-17, we declare a node `cur` and start from the binary tree's root node `root`, looping to compare the node value `cur.val` with `num`.

- If `cur.val < num`, it means the target node is in `cur`'s right subtree, thus execute `cur = cur.right`.
- If `cur.val > num`, it means the target node is in `cur`'s left subtree, thus execute `cur = cur.left`.
- If `cur.val = num`, it means the target node is found, exit the loop, and return the node.

=== "<1>"
    ![Example of searching for a node in a binary search tree](binary_search_tree.assets/bst_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_search_step2](binary_search_tree.assets/bst_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_search_step3](binary_search_tree.assets/bst_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_search_step4](binary_search_tree.assets/bst_search_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-17 &nbsp; Example of searching for a node in a binary search tree </p>

The search operation in a binary search tree works on the same principle as the binary search algorithm, both eliminating half of the cases in each round. The number of loop iterations is at most the height of the binary tree. When the binary tree is balanced, it uses $O(\log n)$ time. The example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def search(self, num: int) -> TreeNode | None:
        """Search node"""
        cur = self._root
        # Loop search, exit after passing leaf node
        while cur is not None:
            # Target node is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Target node is in cur's left subtree
            elif cur.val > num:
                cur = cur.left
            # Found target node, exit loop
            else:
                break
        return cur
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Search node */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Target node is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Target node is in cur's left subtree
            else if (cur->val > num)
                cur = cur->left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Search node */
    TreeNode search(int num) {
        TreeNode cur = root;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num)
                cur = cur.left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Search node */
    TreeNode? Search(int num) {
        TreeNode? cur = root;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur =
                cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num)
                cur = cur.left;
            // Found target node, exit loop
            else
                break;
        }
        // Return target node
        return cur;
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Search node */
    func (bst *binarySearchTree) search(num int) *TreeNode {
        node := bst.root
        // Loop search, exit after passing leaf node
        for node != nil {
            if node.Val.(int) < num {
                // Target node is in cur's right subtree
                node = node.Right
            } else if node.Val.(int) > num {
                // Target node is in cur's left subtree
                node = node.Left
            } else {
                // Found target node, exit loop
                break
            }
        }
        // Return target node
        return node
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Search node */
    func search(num: Int) -> TreeNode? {
        var cur = root
        // Loop search, exit after passing leaf node
        while cur != nil {
            // Target node is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Target node is in cur's left subtree
            else if cur!.val > num {
                cur = cur?.left
            }
            // Found target node, exit loop
            else {
                break
            }
        }
        // Return target node
        return cur
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Search node */
    search(num) {
        let cur = this.root;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num) cur = cur.left;
            // Found target node, exit loop
            else break;
        }
        // Return target node
        return cur;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Search node */
    search(num: number): TreeNode | null {
        let cur = this.root;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Target node is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Target node is in cur's left subtree
            else if (cur.val > num) cur = cur.left;
            // Found target node, exit loop
            else break;
        }
        // Return target node
        return cur;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Search node */
    TreeNode? search(int _num) {
      TreeNode? cur = _root;
      // Loop search, exit after passing leaf node
      while (cur != null) {
        // Target node is in cur's right subtree
        if (cur.val < _num)
          cur = cur.right;
        // Target node is in cur's left subtree
        else if (cur.val > _num)
          cur = cur.left;
        // Found target node, exit loop
        else
          break;
      }
      // Return target node
      return cur;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Search node */
    pub fn search(&self, num: i32) -> OptionTreeNodeRc {
        let mut cur = self.root.clone();
        // Loop search, exit after passing leaf node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Target node is in cur's right subtree
                Ordering::Greater => cur = node.borrow().right.clone(),
                // Target node is in cur's left subtree
                Ordering::Less => cur = node.borrow().left.clone(),
                // Found target node, exit loop
                Ordering::Equal => break,
            }
        }

        // Return target node
        cur
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Search node */
    TreeNode *search(BinarySearchTree *bst, int num) {
        TreeNode *cur = bst->root;
        // Loop search, exit after passing leaf node
        while (cur != NULL) {
            if (cur->val < num) {
                // Target node is in cur's right subtree
                cur = cur->right;
            } else if (cur->val > num) {
                // Target node is in cur's left subtree
                cur = cur->left;
            } else {
                // Found target node, exit loop
                break;
            }
        }
        // Return target node
        return cur;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Search node */
    fun search(num: Int): TreeNode? {
        var cur = root
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Target node is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Target node is in cur's left subtree
            else if (cur._val > num)
                cur.left
            // Found target node, exit loop
            else
                break
        }
        // Return target node
        return cur
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Search node ###
    def search(num)
      cur = @root

      # Loop search, exit after passing leaf node
      while !cur.nil?
        # Target node is in cur's right subtree
        if cur.val < num
          cur = cur.right
        # Target node is in cur's left subtree
        elsif cur.val > num
          cur = cur.left
        # Found target node, exit loop
        else
          break
        end
      end

      cur
    end
    ```

### 2. &nbsp; Inserting a Node

Given an element `num` to be inserted, in order to maintain the property of the binary search tree "left subtree < root node < right subtree," the insertion process is as shown in Figure 7-18.

1. **Finding the insertion position**: Similar to the search operation, start from the root node and loop downward searching according to the size relationship between the current node value and `num`, until passing the leaf node (traversing to `None`) and then exit the loop.
2. **Insert the node at that position**: Initialize node `num` and place it at the `None` position.

![Inserting a node into a binary search tree](binary_search_tree.assets/bst_insert.png){ class="animation-figure" }

<p align="center"> Figure 7-18 &nbsp; Inserting a node into a binary search tree </p>

In the code implementation, note the following two points:

- Binary search trees do not allow duplicate nodes; otherwise, it would violate its definition. Therefore, if the node to be inserted already exists in the tree, the insertion is not performed and it returns directly.
- To implement the node insertion, we need to use node `pre` to save the node from the previous loop iteration. This way, when traversing to `None`, we can obtain its parent node, thereby completing the node insertion operation.

=== "Python"

    ```python title="binary_search_tree.py"
    def insert(self, num: int):
        """Insert node"""
        # If tree is empty, initialize root node
        if self._root is None:
            self._root = TreeNode(num)
            return
        # Loop search, exit after passing leaf node
        cur, pre = self._root, None
        while cur is not None:
            # Found duplicate node, return directly
            if cur.val == num:
                return
            pre = cur
            # Insertion position is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Insertion position is in cur's left subtree
            else:
                cur = cur.left
        # Insert node
        node = TreeNode(num)
        if pre.val < num:
            pre.right = node
        else:
            pre.left = node
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Insert node */
    void insert(int num) {
        // If tree is empty, initialize root node
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Found duplicate node, return directly
            if (cur->val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Insertion position is in cur's left subtree
            else
                cur = cur->left;
        }
        // Insert node
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Insert node */
    void insert(int num) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found duplicate node, return directly
            if (cur.val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Insertion position is in cur's left subtree
            else
                cur = cur.left;
        }
        // Insert node
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Insert node */
    void Insert(int num) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found duplicate node, return directly
            if (cur.val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Insertion position is in cur's left subtree
            else
                cur = cur.left;
        }

        // Insert node
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
    /* Insert node */
    func (bst *binarySearchTree) insert(num int) {
        cur := bst.root
        // If tree is empty, initialize root node
        if cur == nil {
            bst.root = NewTreeNode(num)
            return
        }
        // Node position before the node to be inserted
        var pre *TreeNode = nil
        // Loop search, exit after passing leaf node
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
        // Insert node
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
    /* Insert node */
    func insert(num: Int) {
        // If tree is empty, initialize root node
        if root == nil {
            root = TreeNode(x: num)
            return
        }
        var cur = root
        var pre: TreeNode?
        // Loop search, exit after passing leaf node
        while cur != nil {
            // Found duplicate node, return directly
            if cur!.val == num {
                return
            }
            pre = cur
            // Insertion position is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Insertion position is in cur's left subtree
            else {
                cur = cur?.left
            }
        }
        // Insert node
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
    /* Insert node */
    insert(num) {
        // If tree is empty, initialize root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur = this.root,
            pre = null;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found duplicate node, return directly
            if (cur.val === num) return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Insertion position is in cur's left subtree
            else cur = cur.left;
        }
        // Insert node
        const node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Insert node */
    insert(num: number): void {
        // If tree is empty, initialize root node
        if (this.root === null) {
            this.root = new TreeNode(num);
            return;
        }
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found duplicate node, return directly
            if (cur.val === num) return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Insertion position is in cur's left subtree
            else cur = cur.left;
        }
        // Insert node
        const node = new TreeNode(num);
        if (pre!.val < num) pre!.right = node;
        else pre!.left = node;
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Insert node */
    void insert(int _num) {
      // If tree is empty, initialize root node
      if (_root == null) {
        _root = TreeNode(_num);
        return;
      }
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Loop search, exit after passing leaf node
      while (cur != null) {
        // Found duplicate node, return directly
        if (cur.val == _num) return;
        pre = cur;
        // Insertion position is in cur's right subtree
        if (cur.val < _num)
          cur = cur.right;
        // Insertion position is in cur's left subtree
        else
          cur = cur.left;
      }
      // Insert node
      TreeNode? node = TreeNode(_num);
      if (pre!.val < _num)
        pre.right = node;
      else
        pre.left = node;
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Insert node */
    pub fn insert(&mut self, num: i32) {
        // If tree is empty, initialize root node
        if self.root.is_none() {
            self.root = Some(TreeNode::new(num));
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Loop search, exit after passing leaf node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Found duplicate node, return directly
                Ordering::Equal => return,
                // Insertion position is in cur's right subtree
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Insertion position is in cur's left subtree
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // Insert node
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
    /* Insert node */
    void insert(BinarySearchTree *bst, int num) {
        // If tree is empty, initialize root node
        if (bst->root == NULL) {
            bst->root = newTreeNode(num);
            return;
        }
        TreeNode *cur = bst->root, *pre = NULL;
        // Loop search, exit after passing leaf node
        while (cur != NULL) {
            // Found duplicate node, return directly
            if (cur->val == num) {
                return;
            }
            pre = cur;
            if (cur->val < num) {
                // Insertion position is in cur's right subtree
                cur = cur->right;
            } else {
                // Insertion position is in cur's left subtree
                cur = cur->left;
            }
        }
        // Insert node
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
    /* Insert node */
    fun insert(num: Int) {
        // If tree is empty, initialize root node
        if (root == null) {
            root = TreeNode(num)
            return
        }
        var cur = root
        var pre: TreeNode? = null
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found duplicate node, return directly
            if (cur._val == num)
                return
            pre = cur
            // Insertion position is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Insertion position is in cur's left subtree
            else
                cur.left
        }
        // Insert node
        val node = TreeNode(num)
        if (pre?._val!! < num)
            pre.right = node
        else
            pre.left = node
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Insert node ###
    def insert(num)
      # If tree is empty, initialize root node
      if @root.nil?
        @root = TreeNode.new(num)
        return
      end

      # Loop search, exit after passing leaf node
      cur, pre = @root, nil
      while !cur.nil?
        # Found duplicate node, return directly
        return if cur.val == num

        pre = cur
        # Insertion position is in cur's right subtree
        if cur.val < num
          cur = cur.right
        # Insertion position is in cur's left subtree
        else
          cur = cur.left
        end
      end

      # Insert node
      node = TreeNode.new(num)
      if pre.val < num
        pre.right = node
      else
        pre.left = node
      end
    end
    ```

Similar to searching for a node, inserting a node uses $O(\log n)$ time.

### 3. &nbsp; Removing a Node

First, find the target node in the binary tree, then remove it. Similar to node insertion, we need to ensure that after the removal operation is completed, the binary search tree's property of "left subtree $<$ root node $<$ right subtree" is still maintained. Therefore, depending on the number of child nodes the target node has, we divide it into 0, 1, and 2 three cases, and execute the corresponding node removal operations.

As shown in Figure 7-19, when the degree of the node to be removed is $0$, it means the node is a leaf node and can be directly removed.

![Removing a node in a binary search tree (degree 0)](binary_search_tree.assets/bst_remove_case1.png){ class="animation-figure" }

<p align="center"> Figure 7-19 &nbsp; Removing a node in a binary search tree (degree 0) </p>

As shown in Figure 7-20, when the degree of the node to be removed is $1$, replacing the node to be removed with its child node is sufficient.

![Removing a node in a binary search tree (degree 1)](binary_search_tree.assets/bst_remove_case2.png){ class="animation-figure" }

<p align="center"> Figure 7-20 &nbsp; Removing a node in a binary search tree (degree 1) </p>

When the degree of the node to be removed is $2$, we cannot directly remove it; instead, we need to use a node to replace it. To maintain the binary search tree's property of "left subtree $<$ root node $<$ right subtree," **this node can be either the smallest node in the right subtree or the largest node in the left subtree**.

Assuming we choose the smallest node in the right subtree (the next node in the inorder traversal), the removal process is as shown in Figure 7-21.

1. Find the next node of the node to be removed in the "inorder traversal sequence," denoted as `tmp`.
2. Replace the value of the node to be removed with the value of `tmp`, and recursively remove node `tmp` in the tree.

=== "<1>"
    ![Removing a node in a binary search tree (degree 2)](binary_search_tree.assets/bst_remove_case3_step1.png){ class="animation-figure" }

=== "<2>"
    ![bst_remove_case3_step2](binary_search_tree.assets/bst_remove_case3_step2.png){ class="animation-figure" }

=== "<3>"
    ![bst_remove_case3_step3](binary_search_tree.assets/bst_remove_case3_step3.png){ class="animation-figure" }

=== "<4>"
    ![bst_remove_case3_step4](binary_search_tree.assets/bst_remove_case3_step4.png){ class="animation-figure" }

<p align="center"> Figure 7-21 &nbsp; Removing a node in a binary search tree (degree 2) </p>

The node removal operation also uses $O(\log n)$ time, where finding the node to be removed requires $O(\log n)$ time, and obtaining the inorder successor node requires $O(\log n)$ time. Example code is as follows:

=== "Python"

    ```python title="binary_search_tree.py"
    def remove(self, num: int):
        """Delete node"""
        # If tree is empty, return directly
        if self._root is None:
            return
        # Loop search, exit after passing leaf node
        cur, pre = self._root, None
        while cur is not None:
            # Found node to delete, exit loop
            if cur.val == num:
                break
            pre = cur
            # Node to delete is in cur's right subtree
            if cur.val < num:
                cur = cur.right
            # Node to delete is in cur's left subtree
            else:
                cur = cur.left
        # If no node to delete, return directly
        if cur is None:
            return

        # Number of child nodes = 0 or 1
        if cur.left is None or cur.right is None:
            # When number of child nodes = 0 / 1, child = null / that child node
            child = cur.left or cur.right
            # Delete node cur
            if cur != self._root:
                if pre.left == cur:
                    pre.left = child
                else:
                    pre.right = child
            else:
                # If deleted node is root node, reassign root node
                self._root = child
        # Number of child nodes = 2
        else:
            # Get next node of cur in inorder traversal
            tmp: TreeNode = cur.right
            while tmp.left is not None:
                tmp = tmp.left
            # Recursively delete node tmp
            self.remove(tmp.val)
            # Replace cur with tmp
            cur.val = tmp.val
    ```

=== "C++"

    ```cpp title="binary_search_tree.cpp"
    /* Remove node */
    void remove(int num) {
        // If tree is empty, return directly
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Found node to delete, exit loop
            if (cur->val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Node to delete is in cur's left subtree
            else
                cur = cur->left;
        }
        // If no node to delete, return directly
        if (cur == nullptr)
            return;
        // Number of child nodes = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // When number of child nodes = 0 / 1, child = nullptr / that child node
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Delete node cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
            // Free memory
            delete cur;
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively delete node tmp
            remove(tmp->val);
            // Replace cur with tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Java"

    ```java title="binary_search_tree.java"
    /* Remove node */
    void remove(int num) {
        // If tree is empty, return directly
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found node to delete, exit loop
            if (cur.val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Node to delete is in cur's left subtree
            else
                cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur == null)
            return;
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // Delete node cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            remove(tmp.val);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "C#"

    ```csharp title="binary_search_tree.cs"
    /* Remove node */
    void Remove(int num) {
        // If tree is empty, return directly
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found node to delete, exit loop
            if (cur.val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num)
                cur = cur.right;
            // Node to delete is in cur's left subtree
            else
                cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur == null)
            return;
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            TreeNode? child = cur.left ?? cur.right;
            // Delete node cur
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            Remove(tmp.val!.Value);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "Go"

    ```go title="binary_search_tree.go"
    /* Remove node */
    func (bst *binarySearchTree) remove(num int) {
        cur := bst.root
        // If tree is empty, return directly
        if cur == nil {
            return
        }
        // Node position before the node to be removed
        var pre *TreeNode = nil
        // Loop search, exit after passing leaf node
        for cur != nil {
            if cur.Val == num {
                break
            }
            pre = cur
            if cur.Val.(int) < num {
                // Node to be removed is in right subtree
                cur = cur.Right
            } else {
                // Node to be removed is in left subtree
                cur = cur.Left
            }
        }
        // If no node to delete, return directly
        if cur == nil {
            return
        }
        // Number of child nodes is 0 or 1
        if cur.Left == nil || cur.Right == nil {
            var child *TreeNode = nil
            // Get child node of node to be removed
            if cur.Left != nil {
                child = cur.Left
            } else {
                child = cur.Right
            }
            // Delete node cur
            if cur != bst.root {
                if pre.Left == cur {
                    pre.Left = child
                } else {
                    pre.Right = child
                }
            } else {
                // If deleted node is root node, reassign root node
                bst.root = child
            }
            // Number of child nodes is 2
        } else {
            // Get next node of node cur to be removed in in-order traversal
            tmp := cur.Right
            for tmp.Left != nil {
                tmp = tmp.Left
            }
            // Recursively delete node tmp
            bst.remove(tmp.Val.(int))
            // Replace cur with tmp
            cur.Val = tmp.Val
        }
    }
    ```

=== "Swift"

    ```swift title="binary_search_tree.swift"
    /* Remove node */
    func remove(num: Int) {
        // If tree is empty, return directly
        if root == nil {
            return
        }
        var cur = root
        var pre: TreeNode?
        // Loop search, exit after passing leaf node
        while cur != nil {
            // Found node to delete, exit loop
            if cur!.val == num {
                break
            }
            pre = cur
            // Node to delete is in cur's right subtree
            if cur!.val < num {
                cur = cur?.right
            }
            // Node to delete is in cur's left subtree
            else {
                cur = cur?.left
            }
        }
        // If no node to delete, return directly
        if cur == nil {
            return
        }
        // Number of child nodes = 0 or 1
        if cur?.left == nil || cur?.right == nil {
            // When number of child nodes = 0 / 1, child = null / that child node
            let child = cur?.left ?? cur?.right
            // Delete node cur
            if cur !== root {
                if pre?.left === cur {
                    pre?.left = child
                } else {
                    pre?.right = child
                }
            } else {
                // If deleted node is root node, reassign root node
                root = child
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            var tmp = cur?.right
            while tmp?.left != nil {
                tmp = tmp?.left
            }
            // Recursively delete node tmp
            remove(num: tmp!.val)
            // Replace cur with tmp
            cur?.val = tmp!.val
        }
    }
    ```

=== "JS"

    ```javascript title="binary_search_tree.js"
    /* Remove node */
    remove(num) {
        // If tree is empty, return directly
        if (this.root === null) return;
        let cur = this.root,
            pre = null;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found node to delete, exit loop
            if (cur.val === num) break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Node to delete is in cur's left subtree
            else cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur === null) return;
        // Number of child nodes = 0 or 1
        if (cur.left === null || cur.right === null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            const child = cur.left !== null ? cur.left : cur.right;
            // Delete node cur
            if (cur !== this.root) {
                if (pre.left === cur) pre.left = child;
                else pre.right = child;
            } else {
                // If deleted node is root node, reassign root node
                this.root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            let tmp = cur.right;
            while (tmp.left !== null) {
                tmp = tmp.left;
            }
            // Recursively delete node tmp
            this.remove(tmp.val);
            // Replace cur with tmp
            cur.val = tmp.val;
        }
    }
    ```

=== "TS"

    ```typescript title="binary_search_tree.ts"
    /* Remove node */
    remove(num: number): void {
        // If tree is empty, return directly
        if (this.root === null) return;
        let cur: TreeNode | null = this.root,
            pre: TreeNode | null = null;
        // Loop search, exit after passing leaf node
        while (cur !== null) {
            // Found node to delete, exit loop
            if (cur.val === num) break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur.val < num) cur = cur.right;
            // Node to delete is in cur's left subtree
            else cur = cur.left;
        }
        // If no node to delete, return directly
        if (cur === null) return;
        // Number of child nodes = 0 or 1
        if (cur.left === null || cur.right === null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            const child: TreeNode | null =
                cur.left !== null ? cur.left : cur.right;
            // Delete node cur
            if (cur !== this.root) {
                if (pre!.left === cur) pre!.left = child;
                else pre!.right = child;
            } else {
                // If deleted node is root node, reassign root node
                this.root = child;
            }
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            let tmp: TreeNode | null = cur.right;
            while (tmp!.left !== null) {
                tmp = tmp!.left;
            }
            // Recursively delete node tmp
            this.remove(tmp!.val);
            // Replace cur with tmp
            cur.val = tmp!.val;
        }
    }
    ```

=== "Dart"

    ```dart title="binary_search_tree.dart"
    /* Remove node */
    void remove(int _num) {
      // If tree is empty, return directly
      if (_root == null) return;
      TreeNode? cur = _root;
      TreeNode? pre = null;
      // Loop search, exit after passing leaf node
      while (cur != null) {
        // Found node to delete, exit loop
        if (cur.val == _num) break;
        pre = cur;
        // Node to delete is in cur's right subtree
        if (cur.val < _num)
          cur = cur.right;
        // Node to delete is in cur's left subtree
        else
          cur = cur.left;
      }
      // If no node to delete, return directly
      if (cur == null) return;
      // Number of child nodes = 0 or 1
      if (cur.left == null || cur.right == null) {
        // When number of child nodes = 0 / 1, child = null / that child node
        TreeNode? child = cur.left ?? cur.right;
        // Delete node cur
        if (cur != _root) {
          if (pre!.left == cur)
            pre.left = child;
          else
            pre.right = child;
        } else {
          // If deleted node is root node, reassign root node
          _root = child;
        }
      } else {
        // Number of child nodes = 2
        // Get next node of cur in inorder traversal
        TreeNode? tmp = cur.right;
        while (tmp!.left != null) {
          tmp = tmp.left;
        }
        // Recursively delete node tmp
        remove(tmp.val);
        // Replace cur with tmp
        cur.val = tmp.val;
      }
    }
    ```

=== "Rust"

    ```rust title="binary_search_tree.rs"
    /* Remove node */
    pub fn remove(&mut self, num: i32) {
        // If tree is empty, return directly
        if self.root.is_none() {
            return;
        }
        let mut cur = self.root.clone();
        let mut pre = None;
        // Loop search, exit after passing leaf node
        while let Some(node) = cur.clone() {
            match num.cmp(&node.borrow().val) {
                // Found node to delete, exit loop
                Ordering::Equal => break,
                // Node to delete is in cur's right subtree
                Ordering::Greater => {
                    pre = cur.clone();
                    cur = node.borrow().right.clone();
                }
                // Node to delete is in cur's left subtree
                Ordering::Less => {
                    pre = cur.clone();
                    cur = node.borrow().left.clone();
                }
            }
        }
        // If no node to delete, return directly
        if cur.is_none() {
            return;
        }
        let cur = cur.unwrap();
        let (left_child, right_child) = (cur.borrow().left.clone(), cur.borrow().right.clone());
        match (left_child.clone(), right_child.clone()) {
            // Number of child nodes = 0 or 1
            (None, None) | (Some(_), None) | (None, Some(_)) => {
                // When number of child nodes = 0 / 1, child = nullptr / that child node
                let child = left_child.or(right_child);
                let pre = pre.unwrap();
                // Delete node cur
                if !Rc::ptr_eq(&cur, self.root.as_ref().unwrap()) {
                    let left = pre.borrow().left.clone();
                    if left.is_some() && Rc::ptr_eq(left.as_ref().unwrap(), &cur) {
                        pre.borrow_mut().left = child;
                    } else {
                        pre.borrow_mut().right = child;
                    }
                } else {
                    // If deleted node is root node, reassign root node
                    self.root = child;
                }
            }
            // Number of child nodes = 2
            (Some(_), Some(_)) => {
                // Get next node of cur in inorder traversal
                let mut tmp = cur.borrow().right.clone();
                while let Some(node) = tmp.clone() {
                    if node.borrow().left.is_some() {
                        tmp = node.borrow().left.clone();
                    } else {
                        break;
                    }
                }
                let tmp_val = tmp.unwrap().borrow().val;
                // Recursively delete node tmp
                self.remove(tmp_val);
                // Replace cur with tmp
                cur.borrow_mut().val = tmp_val;
            }
        }
    }
    ```

=== "C"

    ```c title="binary_search_tree.c"
    /* Remove node */
    // Cannot use remove keyword here due to stdio.h inclusion
    void removeItem(BinarySearchTree *bst, int num) {
        // If tree is empty, return directly
        if (bst->root == NULL)
            return;
        TreeNode *cur = bst->root, *pre = NULL;
        // Loop search, exit after passing leaf node
        while (cur != NULL) {
            // Found node to delete, exit loop
            if (cur->val == num)
                break;
            pre = cur;
            if (cur->val < num) {
                // Node to delete is in right subtree of root
                cur = cur->right;
            } else {
                // Node to delete is in left subtree of root
                cur = cur->left;
            }
        }
        // If no node to delete, return directly
        if (cur == NULL)
            return;
        // Check if node to delete has children
        if (cur->left == NULL || cur->right == NULL) {
            /* Number of child nodes = 0 or 1 */
            // When number of child nodes = 0 / 1, child = nullptr / that child node
            TreeNode *child = cur->left != NULL ? cur->left : cur->right;
            // Delete node cur
            if (pre->left == cur) {
                pre->left = child;
            } else {
                pre->right = child;
            }
            // Free memory
            free(cur);
        } else {
            /* Number of child nodes = 2 */
            // Get next node of cur in inorder traversal
            TreeNode *tmp = cur->right;
            while (tmp->left != NULL) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively delete node tmp
            removeItem(bst, tmp->val);
            // Replace cur with tmp
            cur->val = tmpVal;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_tree.kt"
    /* Remove node */
    fun remove(num: Int) {
        // If tree is empty, return directly
        if (root == null)
            return
        var cur = root
        var pre: TreeNode? = null
        // Loop search, exit after passing leaf node
        while (cur != null) {
            // Found node to delete, exit loop
            if (cur._val == num)
                break
            pre = cur
            // Node to delete is in cur's right subtree
            cur = if (cur._val < num)
                cur.right
            // Node to delete is in cur's left subtree
            else
                cur.left
        }
        // If no node to delete, return directly
        if (cur == null)
            return
        // Number of child nodes = 0 or 1
        if (cur.left == null || cur.right == null) {
            // When number of child nodes = 0 / 1, child = null / that child node
            val child = if (cur.left != null)
                cur.left
            else
                cur.right
            // Delete node cur
            if (cur != root) {
                if (pre!!.left == cur)
                    pre.left = child
                else
                    pre.right = child
            } else {
                // If deleted node is root node, reassign root node
                root = child
            }
            // Number of child nodes = 2
        } else {
            // Get next node of cur in inorder traversal
            var tmp = cur.right
            while (tmp!!.left != null) {
                tmp = tmp.left
            }
            // Recursively delete node tmp
            remove(tmp._val)
            // Replace cur with tmp
            cur._val = tmp._val
        }
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_tree.rb"
    ### Delete node ###
    def remove(num)
      # If tree is empty, return directly
      return if @root.nil?

      # Loop search, exit after passing leaf node
      cur, pre = @root, nil
      while !cur.nil?
        # Found node to delete, exit loop
        break if cur.val == num

        pre = cur
        # Node to delete is in cur's right subtree
        if cur.val < num
          cur = cur.right
        # Node to delete is in cur's left subtree
        else
          cur = cur.left
        end
      end
      # If no node to delete, return directly
      return if cur.nil?

      # Number of child nodes = 0 or 1
      if cur.left.nil? || cur.right.nil?
        # When number of child nodes = 0 / 1, child = null / that child node
        child = cur.left || cur.right
        # Delete node cur
        if cur != @root
          if pre.left == cur
            pre.left = child
          else
            pre.right = child
          end
        else
          # If deleted node is root node, reassign root node
          @root = child
        end
      # Number of child nodes = 2
      else
        # Get next node of cur in inorder traversal
        tmp = cur.right
        while !tmp.left.nil?
          tmp = tmp.left
        end
        # Recursively delete node tmp
        remove(tmp.val)
        # Replace cur with tmp
        cur.val = tmp.val
      end
    end
    ```

### 4. &nbsp; Inorder Traversal Is Ordered

As shown in Figure 7-22, the inorder traversal of a binary tree follows the "left $\rightarrow$ root $\rightarrow$ right" traversal order, while the binary search tree satisfies the "left child node $<$ root node $<$ right child node" size relationship.

This means that when performing an inorder traversal in a binary search tree, the next smallest node is always traversed first, thus yielding an important property: **The inorder traversal sequence of a binary search tree is ascending**.

Using the property of inorder traversal being ascending, we can obtain ordered data in a binary search tree in only $O(n)$ time, without the need for additional sorting operations, which is very efficient.

![Inorder traversal sequence of a binary search tree](binary_search_tree.assets/bst_inorder_traversal.png){ class="animation-figure" }

<p align="center"> Figure 7-22 &nbsp; Inorder traversal sequence of a binary search tree </p>

## 7.4.2 &nbsp; Efficiency of Binary Search Trees

Given a set of data, we consider using an array or a binary search tree for storage. Observing Table 7-2, all operations in a binary search tree have logarithmic time complexity, providing stable and efficient performance. Arrays are more efficient than binary search trees only in scenarios with high-frequency additions and low-frequency searches and deletions.

<p align="center"> Table 7-2 &nbsp; Efficiency comparison between arrays and search trees </p>

<div class="center-table" markdown>

|                | Unsorted array | Binary search tree |
| -------------- | -------------- | ------------------ |
| Search element | $O(n)$         | $O(\log n)$        |
| Insert element | $O(1)$         | $O(\log n)$        |
| Remove element | $O(n)$         | $O(\log n)$        |

</div>

In the ideal case, a binary search tree is "balanced," such that any node can be found within $\log n$ loop iterations.

However, if we continuously insert and remove nodes in a binary search tree, it may degenerate into a linked list as shown in Figure 7-23, where the time complexity of various operations also degrades to $O(n)$.

![Degradation of a binary search tree](binary_search_tree.assets/bst_degradation.png){ class="animation-figure" }

<p align="center"> Figure 7-23 &nbsp; Degradation of a binary search tree </p>

## 7.4.3 &nbsp; Common Applications of Binary Search Trees

- Used as multi-level indexes in systems to implement efficient search, insertion, and removal operations.
- Serves as the underlying data structure for certain search algorithms.
- Used to store data streams to maintain their ordered state.
