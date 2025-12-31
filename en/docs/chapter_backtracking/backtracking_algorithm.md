---
comments: true
---

# 13.1 &nbsp; Backtracking Algorithm

<u>The backtracking algorithm</u> is a method for solving problems through exhaustive search. Its core idea is to start from an initial state and exhaustively search all possible solutions. When a correct solution is found, it is recorded. This process continues until a solution is found or all possible choices have been tried without finding a solution.

The backtracking algorithm typically employs "depth-first search" to traverse the solution space. In the "Binary Tree" chapter, we mentioned that preorder, inorder, and postorder traversals all belong to depth-first search. Next, we will construct a backtracking problem using preorder traversal to progressively understand how the backtracking algorithm works.

!!! question "Example 1"

    Given a binary tree, search and record all nodes with value $7$, and return a list of these nodes.

For this problem, we perform a preorder traversal of the tree and check whether the current node's value is $7$. If it is, we add the node to the result list `res`. The relevant implementation is shown in the following figure and code:

=== "Python"

    ```python title="preorder_traversal_i_compact.py"
    def pre_order(root: TreeNode):
        """Preorder traversal: Example 1"""
        if root is None:
            return
        if root.val == 7:
            # Record solution
            res.append(root)
        pre_order(root.left)
        pre_order(root.right)
    ```

=== "C++"

    ```cpp title="preorder_traversal_i_compact.cpp"
    /* Preorder traversal: Example 1 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        if (root->val == 7) {
            // Record solution
            res.push_back(root);
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Java"

    ```java title="preorder_traversal_i_compact.java"
    /* Preorder traversal: Example 1 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Record solution
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_i_compact.cs"
    /* Preorder traversal: Example 1 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Record solution
            res.Add(root);
        }
        PreOrder(root.left);
        PreOrder(root.right);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_i_compact.go"
    /* Preorder traversal: Example 1 */
    func preOrderI(root *TreeNode, res *[]*TreeNode) {
        if root == nil {
            return
        }
        if (root.Val).(int) == 7 {
            // Record solution
            *res = append(*res, root)
        }
        preOrderI(root.Left, res)
        preOrderI(root.Right, res)
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_i_compact.swift"
    /* Preorder traversal: Example 1 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        if root.val == 7 {
            // Record solution
            res.append(root)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_i_compact.js"
    /* Preorder traversal: Example 1 */
    function preOrder(root, res) {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // Record solution
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_i_compact.ts"
    /* Preorder traversal: Example 1 */
    function preOrder(root: TreeNode | null, res: TreeNode[]): void {
        if (root === null) {
            return;
        }
        if (root.val === 7) {
            // Record solution
            res.push(root);
        }
        preOrder(root.left, res);
        preOrder(root.right, res);
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_i_compact.dart"
    /* Preorder traversal: Example 1 */
    void preOrder(TreeNode? root, List<TreeNode> res) {
      if (root == null) {
        return;
      }
      if (root.val == 7) {
        // Record solution
        res.add(root);
      }
      preOrder(root.left, res);
      preOrder(root.right, res);
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_i_compact.rs"
    /* Preorder traversal: Example 1 */
    fn pre_order(res: &mut Vec<Rc<RefCell<TreeNode>>>, root: Option<&Rc<RefCell<TreeNode>>>) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            if node.borrow().val == 7 {
                // Record solution
                res.push(node.clone());
            }
            pre_order(res, node.borrow().left.as_ref());
            pre_order(res, node.borrow().right.as_ref());
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_i_compact.c"
    /* Preorder traversal: Example 1 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        if (root->val == 7) {
            // Record solution
            res[resSize++] = root;
        }
        preOrder(root->left);
        preOrder(root->right);
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_i_compact.kt"
    /* Preorder traversal: Example 1 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        if (root._val == 7) {
            // Record solution
            res!!.add(root)
        }
        preOrder(root.left)
        preOrder(root.right)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_i_compact.rb"
    ### Pre-order traversal: example 1 ###
    def pre_order(root)
      return unless root

      # Record solution
      $res << root if root.val == 7

      pre_order(root.left)
      pre_order(root.right)
    end
    ```

![Search for nodes in preorder traversal](backtracking_algorithm.assets/preorder_find_nodes.png){ class="animation-figure" }

<p align="center"> Figure 13-1 &nbsp; Search for nodes in preorder traversal </p>

## 13.1.1 &nbsp; Attempt and Backtrack

**The reason it is called a backtracking algorithm is that it employs "attempt" and "backtrack" strategies when searching the solution space**. When the algorithm encounters a state where it cannot continue forward or cannot find a solution that satisfies the constraints, it will undo the previous choice, return to a previous state, and try other possible choices.

For Example 1, visiting each node represents an "attempt", while skipping over a leaf node or a function `return` from the parent node represents a "backtrack".

It is worth noting that **backtracking is not limited to function returns alone**. To illustrate this, let's extend Example 1 slightly.

!!! question "Example 2"

    In a binary tree, search all nodes with value $7$, **and return the paths from the root node to these nodes**.

Based on the code from Example 1, we need to use a list `path` to record the visited node path. When we reach a node with value $7$, we copy `path` and add it to the result list `res`. After traversal is complete, `res` contains all the solutions. The code is as follows:

=== "Python"

    ```python title="preorder_traversal_ii_compact.py"
    def pre_order(root: TreeNode):
        """Preorder traversal: Example 2"""
        if root is None:
            return
        # Attempt
        path.append(root)
        if root.val == 7:
            # Record solution
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # Backtrack
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_ii_compact.cpp"
    /* Preorder traversal: Example 2 */
    void preOrder(TreeNode *root) {
        if (root == nullptr) {
            return;
        }
        // Attempt
        path.push_back(root);
        if (root->val == 7) {
            // Record solution
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // Backtrack
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_ii_compact.java"
    /* Preorder traversal: Example 2 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // Attempt
        path.add(root);
        if (root.val == 7) {
            // Record solution
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Backtrack
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_ii_compact.cs"
    /* Preorder traversal: Example 2 */
    void PreOrder(TreeNode? root) {
        if (root == null) {
            return;
        }
        // Attempt
        path.Add(root);
        if (root.val == 7) {
            // Record solution
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Backtrack
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_ii_compact.go"
    /* Preorder traversal: Example 2 */
    func preOrderII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        if root == nil {
            return
        }
        // Attempt
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // Record solution
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderII(root.Left, res, path)
        preOrderII(root.Right, res, path)
        // Backtrack
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_ii_compact.swift"
    /* Preorder traversal: Example 2 */
    func preOrder(root: TreeNode?) {
        guard let root = root else {
            return
        }
        // Attempt
        path.append(root)
        if root.val == 7 {
            // Record solution
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // Backtrack
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_ii_compact.js"
    /* Preorder traversal: Example 2 */
    function preOrder(root, path, res) {
        if (root === null) {
            return;
        }
        // Attempt
        path.push(root);
        if (root.val === 7) {
            // Record solution
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Backtrack
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_ii_compact.ts"
    /* Preorder traversal: Example 2 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        if (root === null) {
            return;
        }
        // Attempt
        path.push(root);
        if (root.val === 7) {
            // Record solution
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Backtrack
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_ii_compact.dart"
    /* Preorder traversal: Example 2 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null) {
        return;
      }

      // Attempt
      path.add(root);
      if (root.val == 7) {
        // Record solution
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // Backtrack
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_ii_compact.rs"
    /* Preorder traversal: Example 2 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        if root.is_none() {
            return;
        }
        if let Some(node) = root {
            // Attempt
            path.push(node.clone());
            if node.borrow().val == 7 {
                // Record solution
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // Backtrack
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_ii_compact.c"
    /* Preorder traversal: Example 2 */
    void preOrder(TreeNode *root) {
        if (root == NULL) {
            return;
        }
        // Attempt
        path[pathSize++] = root;
        if (root->val == 7) {
            // Record solution
            for (int i = 0; i < pathSize; ++i) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // Backtrack
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_ii_compact.kt"
    /* Preorder traversal: Example 2 */
    fun preOrder(root: TreeNode?) {
        if (root == null) {
            return
        }
        // Attempt
        path!!.add(root)
        if (root._val == 7) {
            // Record solution
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // Backtrack
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_ii_compact.rb"
    ### Pre-order traversal: example 2 ###
    def pre_order(root)
      return unless root

      # Attempt
      $path << root

      # Record solution
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # Backtrack
      $path.pop
    end
    ```

In each "attempt", we record the path by adding the current node to `path`; before "backtracking", we need to remove the node from `path`, **to restore the state before this attempt**.

Observing the process shown in the following figure, **we can understand attempt and backtrack as "advance" and "undo"**, two operations that are the reverse of each other.

=== "<1>"
    ![Attempt and backtrack](backtracking_algorithm.assets/preorder_find_paths_step1.png){ class="animation-figure" }

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png){ class="animation-figure" }

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png){ class="animation-figure" }

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png){ class="animation-figure" }

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png){ class="animation-figure" }

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png){ class="animation-figure" }

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png){ class="animation-figure" }

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png){ class="animation-figure" }

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png){ class="animation-figure" }

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png){ class="animation-figure" }

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png){ class="animation-figure" }

<p align="center"> Figure 13-2 &nbsp; Attempt and backtrack </p>

## 13.1.2 &nbsp; Pruning

Complex backtracking problems usually contain one or more constraints. **Constraints can typically be used for "pruning"**.

!!! question "Example 3"

    In a binary tree, search all nodes with value $7$ and return the paths from the root node to these nodes, **but require that the paths do not contain nodes with value $3$**.

To satisfy the above constraints, **we need to add pruning operations**: during the search process, if we encounter a node with value $3$, we return early and do not continue searching. The code is as follows:

=== "Python"

    ```python title="preorder_traversal_iii_compact.py"
    def pre_order(root: TreeNode):
        """Preorder traversal: Example 3"""
        # Pruning
        if root is None or root.val == 3:
            return
        # Attempt
        path.append(root)
        if root.val == 7:
            # Record solution
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # Backtrack
        path.pop()
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_compact.cpp"
    /* Preorder traversal: Example 3 */
    void preOrder(TreeNode *root) {
        // Pruning
        if (root == nullptr || root->val == 3) {
            return;
        }
        // Attempt
        path.push_back(root);
        if (root->val == 7) {
            // Record solution
            res.push_back(path);
        }
        preOrder(root->left);
        preOrder(root->right);
        // Backtrack
        path.pop_back();
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_compact.java"
    /* Preorder traversal: Example 3 */
    void preOrder(TreeNode root) {
        // Pruning
        if (root == null || root.val == 3) {
            return;
        }
        // Attempt
        path.add(root);
        if (root.val == 7) {
            // Record solution
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // Backtrack
        path.remove(path.size() - 1);
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_compact.cs"
    /* Preorder traversal: Example 3 */
    void PreOrder(TreeNode? root) {
        // Pruning
        if (root == null || root.val == 3) {
            return;
        }
        // Attempt
        path.Add(root);
        if (root.val == 7) {
            // Record solution
            res.Add(new List<TreeNode>(path));
        }
        PreOrder(root.left);
        PreOrder(root.right);
        // Backtrack
        path.RemoveAt(path.Count - 1);
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_compact.go"
    /* Preorder traversal: Example 3 */
    func preOrderIII(root *TreeNode, res *[][]*TreeNode, path *[]*TreeNode) {
        // Pruning
        if root == nil || root.Val == 3 {
            return
        }
        // Attempt
        *path = append(*path, root)
        if root.Val.(int) == 7 {
            // Record solution
            *res = append(*res, append([]*TreeNode{}, *path...))
        }
        preOrderIII(root.Left, res, path)
        preOrderIII(root.Right, res, path)
        // Backtrack
        *path = (*path)[:len(*path)-1]
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_compact.swift"
    /* Preorder traversal: Example 3 */
    func preOrder(root: TreeNode?) {
        // Pruning
        guard let root = root, root.val != 3 else {
            return
        }
        // Attempt
        path.append(root)
        if root.val == 7 {
            // Record solution
            res.append(path)
        }
        preOrder(root: root.left)
        preOrder(root: root.right)
        // Backtrack
        path.removeLast()
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_compact.js"
    /* Preorder traversal: Example 3 */
    function preOrder(root, path, res) {
        // Pruning
        if (root === null || root.val === 3) {
            return;
        }
        // Attempt
        path.push(root);
        if (root.val === 7) {
            // Record solution
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Backtrack
        path.pop();
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_compact.ts"
    /* Preorder traversal: Example 3 */
    function preOrder(
        root: TreeNode | null,
        path: TreeNode[],
        res: TreeNode[][]
    ): void {
        // Pruning
        if (root === null || root.val === 3) {
            return;
        }
        // Attempt
        path.push(root);
        if (root.val === 7) {
            // Record solution
            res.push([...path]);
        }
        preOrder(root.left, path, res);
        preOrder(root.right, path, res);
        // Backtrack
        path.pop();
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_compact.dart"
    /* Preorder traversal: Example 3 */
    void preOrder(
      TreeNode? root,
      List<TreeNode> path,
      List<List<TreeNode>> res,
    ) {
      if (root == null || root.val == 3) {
        return;
      }

      // Attempt
      path.add(root);
      if (root.val == 7) {
        // Record solution
        res.add(List.from(path));
      }
      preOrder(root.left, path, res);
      preOrder(root.right, path, res);
      // Backtrack
      path.removeLast();
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_compact.rs"
    /* Preorder traversal: Example 3 */
    fn pre_order(
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
        path: &mut Vec<Rc<RefCell<TreeNode>>>,
        root: Option<&Rc<RefCell<TreeNode>>>,
    ) {
        // Pruning
        if root.is_none() || root.as_ref().unwrap().borrow().val == 3 {
            return;
        }
        if let Some(node) = root {
            // Attempt
            path.push(node.clone());
            if node.borrow().val == 7 {
                // Record solution
                res.push(path.clone());
            }
            pre_order(res, path, node.borrow().left.as_ref());
            pre_order(res, path, node.borrow().right.as_ref());
            // Backtrack
            path.pop();
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_compact.c"
    /* Preorder traversal: Example 3 */
    void preOrder(TreeNode *root) {
        // Pruning
        if (root == NULL || root->val == 3) {
            return;
        }
        // Attempt
        path[pathSize++] = root;
        if (root->val == 7) {
            // Record solution
            for (int i = 0; i < pathSize; i++) {
                res[resSize][i] = path[i];
            }
            resSize++;
        }
        preOrder(root->left);
        preOrder(root->right);
        // Backtrack
        pathSize--;
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_compact.kt"
    /* Preorder traversal: Example 3 */
    fun preOrder(root: TreeNode?) {
        // Pruning
        if (root == null || root._val == 3) {
            return
        }
        // Attempt
        path!!.add(root)
        if (root._val == 7) {
            // Record solution
            res!!.add(path!!.toMutableList())
        }
        preOrder(root.left)
        preOrder(root.right)
        // Backtrack
        path!!.removeAt(path!!.size - 1)
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_compact.rb"
    ### Pre-order traversal: example 3 ###
    def pre_order(root)
      # Pruning
      return if !root || root.val == 3

      # Attempt
      $path.append(root)

      # Record solution
      $res << $path.dup if root.val == 7

      pre_order(root.left)
      pre_order(root.right)

      # Backtrack
      $path.pop
    end
    ```

"Pruning" is a vivid term. As shown in the following figure, during the search process, **we "prune" search branches that do not satisfy the constraints**, avoiding many meaningless attempts and thus improving search efficiency.

![Pruning according to constraints](backtracking_algorithm.assets/preorder_find_constrained_paths.png){ class="animation-figure" }

<p align="center"> Figure 13-3 &nbsp; Pruning according to constraints </p>

## 13.1.3 &nbsp; Framework Code

Next, we attempt to extract the main framework of backtracking's "attempt, backtrack, and pruning", to improve code generality.

In the following framework code, `state` represents the current state of the problem, and `choices` represents the choices available in the current state:

=== "Python"

    ```python title=""
    def backtrack(state: State, choices: list[choice], res: list[state]):
        """Backtracking algorithm framework"""
        # Check if it is a solution
        if is_solution(state):
            # Record the solution
            record_solution(state, res)
            # Stop searching
            return
        # Traverse all choices
        for choice in choices:
            # Pruning: check if the choice is valid
            if is_valid(state, choice):
                # Attempt: make a choice and update the state
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title=""
    /* Backtracking algorithm framework */
    void backtrack(State *state, vector<Choice *> &choices, vector<State *> &res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (Choice choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title=""
    /* Backtracking algorithm framework */
    void backtrack(State state, List<Choice> choices, List<State> res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (Choice choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title=""
    /* Backtracking algorithm framework */
    void Backtrack(State state, List<Choice> choices, List<State> res) {
        // Check if it is a solution
        if (IsSolution(state)) {
            // Record the solution
            RecordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        foreach (Choice choice in choices) {
            // Pruning: check if the choice is valid
            if (IsValid(state, choice)) {
                // Attempt: make a choice and update the state
                MakeChoice(state, choice);
                Backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title=""
    /* Backtracking algorithm framework */
    func backtrack(state *State, choices []Choice, res *[]State) {
        // Check if it is a solution
        if isSolution(state) {
            // Record the solution
            recordSolution(state, res)
            // Stop searching
            return
        }
        // Traverse all choices
        for _, choice := range choices {
            // Pruning: check if the choice is valid
            if isValid(state, choice) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Backtracking algorithm framework */
    func backtrack(state: inout State, choices: [Choice], res: inout [State]) {
        // Check if it is a solution
        if isSolution(state: state) {
            // Record the solution
            recordSolution(state: state, res: &res)
            // Stop searching
            return
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: check if the choice is valid
            if isValid(state: state, choice: choice) {
                // Attempt: make a choice and update the state
                makeChoice(state: &state, choice: choice)
                backtrack(state: &state, choices: choices, res: &res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Backtracking algorithm framework */
    function backtrack(state, choices, res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (let choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Backtracking algorithm framework */
    function backtrack(state: State, choices: Choice[], res: State[]): void {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (let choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Backtracking algorithm framework */
    void backtrack(State state, List<Choice>, List<State> res) {
      // Check if it is a solution
      if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
        // Stop searching
        return;
      }
      // Traverse all choices
      for (Choice choice in choices) {
        // Pruning: check if the choice is valid
        if (isValid(state, choice)) {
          // Attempt: make a choice and update the state
          makeChoice(state, choice);
          backtrack(state, choices, res);
          // Backtrack: undo the choice and restore to the previous state
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title=""
    /* Backtracking algorithm framework */
    fn backtrack(state: &mut State, choices: &Vec<Choice>, res: &mut Vec<State>) {
        // Check if it is a solution
        if is_solution(state) {
            // Record the solution
            record_solution(state, res);
            // Stop searching
            return;
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: check if the choice is valid
            if is_valid(state, choice) {
                // Attempt: make a choice and update the state
                make_choice(state, choice);
                backtrack(state, choices, res);
                // Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice);
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* Backtracking algorithm framework */
    void backtrack(State *state, Choice *choices, int numChoices, State *res, int numRes) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res, numRes);
            // Stop searching
            return;
        }
        // Traverse all choices
        for (int i = 0; i < numChoices; i++) {
            // Pruning: check if the choice is valid
            if (isValid(state, &choices[i])) {
                // Attempt: make a choice and update the state
                makeChoice(state, &choices[i]);
                backtrack(state, choices, numChoices, res, numRes);
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, &choices[i]);
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Backtracking algorithm framework */
    fun backtrack(state: State?, choices: List<Choice?>, res: List<State?>?) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record the solution
            recordSolution(state, res)
            // Stop searching
            return
        }
        // Traverse all choices
        for (choice in choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make a choice and update the state
                makeChoice(state, choice)
                backtrack(state, choices, res)
                // Backtrack: undo the choice and restore to the previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title=""
    ### Backtracking algorithm framework ###
    def backtrack(state, choices, res)
        # Check if it is a solution
        if is_solution?(state)
            # Record the solution
            record_solution(state, res)
            return
        end

        # Traverse all choices
        for choice in choices
            # Pruning: check if the choice is valid
            if is_valid?(state, choice)
                # Attempt: make a choice and update the state
                make_choice(state, choice)
                backtrack(state, choices, res)
                # Backtrack: undo the choice and restore to the previous state
                undo_choice(state, choice)
            end
        end
    end
    ```

Next, we solve Example 3 based on the framework code. The state `state` is the node traversal path, the choices `choices` are the left and right child nodes of the current node, and the result `res` is a list of paths:

=== "Python"

    ```python title="preorder_traversal_iii_template.py"
    def is_solution(state: list[TreeNode]) -> bool:
        """Check if the current state is a solution"""
        return state and state[-1].val == 7

    def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
        """Record solution"""
        res.append(list(state))

    def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
        """Check if the choice is valid under the current state"""
        return choice is not None and choice.val != 3

    def make_choice(state: list[TreeNode], choice: TreeNode):
        """Update state"""
        state.append(choice)

    def undo_choice(state: list[TreeNode], choice: TreeNode):
        """Restore state"""
        state.pop()

    def backtrack(
        state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
    ):
        """Backtracking algorithm: Example 3"""
        # Check if it is a solution
        if is_solution(state):
            # Record solution
            record_solution(state, res)
        # Traverse all choices
        for choice in choices:
            # Pruning: check if the choice is valid
            if is_valid(state, choice):
                # Attempt: make choice, update state
                make_choice(state, choice)
                # Proceed to the next round of selection
                backtrack(state, [choice.left, choice.right], res)
                # Backtrack: undo choice, restore to previous state
                undo_choice(state, choice)
    ```

=== "C++"

    ```cpp title="preorder_traversal_iii_template.cpp"
    /* Check if the current state is a solution */
    bool isSolution(vector<TreeNode *> &state) {
        return !state.empty() && state.back()->val == 7;
    }

    /* Record solution */
    void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
        res.push_back(state);
    }

    /* Check if the choice is valid under the current state */
    bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
        return choice != nullptr && choice->val != 3;
    }

    /* Update state */
    void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.push_back(choice);
    }

    /* Restore state */
    void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
        state.pop_back();
    }

    /* Backtracking algorithm: Example 3 */
    void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res);
        }
        // Traverse all choices
        for (TreeNode *choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make choice, update state
                makeChoice(state, choice);
                // Proceed to the next round of selection
                vector<TreeNode *> nextChoices{choice->left, choice->right};
                backtrack(state, nextChoices, res);
                // Backtrack: undo choice, restore to previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "Java"

    ```java title="preorder_traversal_iii_template.java"
    /* Check if the current state is a solution */
    boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* Record solution */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* Check if the choice is valid under the current state */
    boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Update state */
    void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* Restore state */
    void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* Backtracking algorithm: Example 3 */
    void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res);
        }
        // Traverse all choices
        for (TreeNode choice : choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make choice, update state
                makeChoice(state, choice);
                // Proceed to the next round of selection
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // Backtrack: undo choice, restore to previous state
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C#"

    ```csharp title="preorder_traversal_iii_template.cs"
    /* Check if the current state is a solution */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Record solution */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Check if the choice is valid under the current state */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Update state */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Restore state */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Backtracking algorithm: Example 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Check if it is a solution
        if (IsSolution(state)) {
            // Record solution
            RecordSolution(state, res);
        }
        // Traverse all choices
        foreach (TreeNode choice in choices) {
            // Pruning: check if the choice is valid
            if (IsValid(state, choice)) {
                // Attempt: make choice, update state
                MakeChoice(state, choice);
                // Proceed to the next round of selection
                Backtrack(state, [choice.left!, choice.right!], res);
                // Backtrack: undo choice, restore to previous state
                UndoChoice(state, choice);
            }
        }
    }
    ```

=== "Go"

    ```go title="preorder_traversal_iii_template.go"
    /* Check if the current state is a solution */
    func isSolution(state *[]*TreeNode) bool {
        return len(*state) != 0 && (*state)[len(*state)-1].Val == 7
    }

    /* Record solution */
    func recordSolution(state *[]*TreeNode, res *[][]*TreeNode) {
        *res = append(*res, append([]*TreeNode{}, *state...))
    }

    /* Check if the choice is valid under the current state */
    func isValid(state *[]*TreeNode, choice *TreeNode) bool {
        return choice != nil && choice.Val != 3
    }

    /* Update state */
    func makeChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = append(*state, choice)
    }

    /* Restore state */
    func undoChoice(state *[]*TreeNode, choice *TreeNode) {
        *state = (*state)[:len(*state)-1]
    }

    /* Backtracking algorithm: Example 3 */
    func backtrackIII(state *[]*TreeNode, choices *[]*TreeNode, res *[][]*TreeNode) {
        // Check if it is a solution
        if isSolution(state) {
            // Record solution
            recordSolution(state, res)
        }
        // Traverse all choices
        for _, choice := range *choices {
            // Pruning: check if the choice is valid
            if isValid(state, choice) {
                // Attempt: make choice, update state
                makeChoice(state, choice)
                // Proceed to the next round of selection
                temp := make([]*TreeNode, 0)
                temp = append(temp, choice.Left, choice.Right)
                backtrackIII(state, &temp, res)
                // Backtrack: undo choice, restore to previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Swift"

    ```swift title="preorder_traversal_iii_template.swift"
    /* Check if the current state is a solution */
    func isSolution(state: [TreeNode]) -> Bool {
        !state.isEmpty && state.last!.val == 7
    }

    /* Record solution */
    func recordSolution(state: [TreeNode], res: inout [[TreeNode]]) {
        res.append(state)
    }

    /* Check if the choice is valid under the current state */
    func isValid(state: [TreeNode], choice: TreeNode?) -> Bool {
        choice != nil && choice!.val != 3
    }

    /* Update state */
    func makeChoice(state: inout [TreeNode], choice: TreeNode) {
        state.append(choice)
    }

    /* Restore state */
    func undoChoice(state: inout [TreeNode], choice: TreeNode) {
        state.removeLast()
    }

    /* Backtracking algorithm: Example 3 */
    func backtrack(state: inout [TreeNode], choices: [TreeNode], res: inout [[TreeNode]]) {
        // Check if it is a solution
        if isSolution(state: state) {
            recordSolution(state: state, res: &res)
        }
        // Traverse all choices
        for choice in choices {
            // Pruning: check if the choice is valid
            if isValid(state: state, choice: choice) {
                // Attempt: make choice, update state
                makeChoice(state: &state, choice: choice)
                // Proceed to the next round of selection
                backtrack(state: &state, choices: [choice.left, choice.right].compactMap { $0 }, res: &res)
                // Backtrack: undo choice, restore to previous state
                undoChoice(state: &state, choice: choice)
            }
        }
    }
    ```

=== "JS"

    ```javascript title="preorder_traversal_iii_template.js"
    /* Check if the current state is a solution */
    function isSolution(state) {
        return state && state[state.length - 1]?.val === 7;
    }

    /* Record solution */
    function recordSolution(state, res) {
        res.push([...state]);
    }

    /* Check if the choice is valid under the current state */
    function isValid(state, choice) {
        return choice !== null && choice.val !== 3;
    }

    /* Update state */
    function makeChoice(state, choice) {
        state.push(choice);
    }

    /* Restore state */
    function undoChoice(state) {
        state.pop();
    }

    /* Backtracking algorithm: Example 3 */
    function backtrack(state, choices, res) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res);
        }
        // Traverse all choices
        for (const choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make choice, update state
                makeChoice(state, choice);
                // Proceed to the next round of selection
                backtrack(state, [choice.left, choice.right], res);
                // Backtrack: undo choice, restore to previous state
                undoChoice(state);
            }
        }
    }
    ```

=== "TS"

    ```typescript title="preorder_traversal_iii_template.ts"
    /* Check if the current state is a solution */
    function isSolution(state: TreeNode[]): boolean {
        return state && state[state.length - 1]?.val === 7;
    }

    /* Record solution */
    function recordSolution(state: TreeNode[], res: TreeNode[][]): void {
        res.push([...state]);
    }

    /* Check if the choice is valid under the current state */
    function isValid(state: TreeNode[], choice: TreeNode): boolean {
        return choice !== null && choice.val !== 3;
    }

    /* Update state */
    function makeChoice(state: TreeNode[], choice: TreeNode): void {
        state.push(choice);
    }

    /* Restore state */
    function undoChoice(state: TreeNode[]): void {
        state.pop();
    }

    /* Backtracking algorithm: Example 3 */
    function backtrack(
        state: TreeNode[],
        choices: TreeNode[],
        res: TreeNode[][]
    ): void {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res);
        }
        // Traverse all choices
        for (const choice of choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make choice, update state
                makeChoice(state, choice);
                // Proceed to the next round of selection
                backtrack(state, [choice.left, choice.right], res);
                // Backtrack: undo choice, restore to previous state
                undoChoice(state);
            }
        }
    }
    ```

=== "Dart"

    ```dart title="preorder_traversal_iii_template.dart"
    /* Check if the current state is a solution */
    bool isSolution(List<TreeNode> state) {
      return state.isNotEmpty && state.last.val == 7;
    }

    /* Record solution */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
      res.add(List.from(state));
    }

    /* Check if the choice is valid under the current state */
    bool isValid(List<TreeNode> state, TreeNode? choice) {
      return choice != null && choice.val != 3;
    }

    /* Update state */
    void makeChoice(List<TreeNode> state, TreeNode? choice) {
      state.add(choice!);
    }

    /* Restore state */
    void undoChoice(List<TreeNode> state, TreeNode? choice) {
      state.removeLast();
    }

    /* Backtracking algorithm: Example 3 */
    void backtrack(
      List<TreeNode> state,
      List<TreeNode?> choices,
      List<List<TreeNode>> res,
    ) {
      // Check if it is a solution
      if (isSolution(state)) {
        // Record solution
        recordSolution(state, res);
      }
      // Traverse all choices
      for (TreeNode? choice in choices) {
        // Pruning: check if the choice is valid
        if (isValid(state, choice)) {
          // Attempt: make choice, update state
          makeChoice(state, choice);
          // Proceed to the next round of selection
          backtrack(state, [choice!.left, choice.right], res);
          // Backtrack: undo choice, restore to previous state
          undoChoice(state, choice);
        }
      }
    }
    ```

=== "Rust"

    ```rust title="preorder_traversal_iii_template.rs"
    /* Check if the current state is a solution */
    fn is_solution(state: &mut Vec<Rc<RefCell<TreeNode>>>) -> bool {
        return !state.is_empty() && state.last().unwrap().borrow().val == 7;
    }

    /* Record solution */
    fn record_solution(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        res.push(state.clone());
    }

    /* Check if the choice is valid under the current state */
    fn is_valid(_: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Option<&Rc<RefCell<TreeNode>>>) -> bool {
        return choice.is_some() && choice.unwrap().borrow().val != 3;
    }

    /* Update state */
    fn make_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, choice: Rc<RefCell<TreeNode>>) {
        state.push(choice);
    }

    /* Restore state */
    fn undo_choice(state: &mut Vec<Rc<RefCell<TreeNode>>>, _: Rc<RefCell<TreeNode>>) {
        state.pop();
    }

    /* Backtracking algorithm: Example 3 */
    fn backtrack(
        state: &mut Vec<Rc<RefCell<TreeNode>>>,
        choices: &Vec<Option<&Rc<RefCell<TreeNode>>>>,
        res: &mut Vec<Vec<Rc<RefCell<TreeNode>>>>,
    ) {
        // Check if it is a solution
        if is_solution(state) {
            // Record solution
            record_solution(state, res);
        }
        // Traverse all choices
        for &choice in choices.iter() {
            // Pruning: check if the choice is valid
            if is_valid(state, choice) {
                // Attempt: make choice, update state
                make_choice(state, choice.unwrap().clone());
                // Proceed to the next round of selection
                backtrack(
                    state,
                    &vec![
                        choice.unwrap().borrow().left.as_ref(),
                        choice.unwrap().borrow().right.as_ref(),
                    ],
                    res,
                );
                // Backtrack: undo choice, restore to previous state
                undo_choice(state, choice.unwrap().clone());
            }
        }
    }
    ```

=== "C"

    ```c title="preorder_traversal_iii_template.c"
    /* Check if the current state is a solution */
    bool isSolution(void) {
        return pathSize > 0 && path[pathSize - 1]->val == 7;
    }

    /* Record solution */
    void recordSolution(void) {
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }

    /* Check if the choice is valid under the current state */
    bool isValid(TreeNode *choice) {
        return choice != NULL && choice->val != 3;
    }

    /* Update state */
    void makeChoice(TreeNode *choice) {
        path[pathSize++] = choice;
    }

    /* Restore state */
    void undoChoice(void) {
        pathSize--;
    }

    /* Backtracking algorithm: Example 3 */
    void backtrack(TreeNode *choices[2]) {
        // Check if it is a solution
        if (isSolution()) {
            // Record solution
            recordSolution();
        }
        // Traverse all choices
        for (int i = 0; i < 2; i++) {
            TreeNode *choice = choices[i];
            // Pruning: check if the choice is valid
            if (isValid(choice)) {
                // Attempt: make choice, update state
                makeChoice(choice);
                // Proceed to the next round of selection
                TreeNode *nextChoices[2] = {choice->left, choice->right};
                backtrack(nextChoices);
                // Backtrack: undo choice, restore to previous state
                undoChoice();
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="preorder_traversal_iii_template.kt"
    /* Check if the current state is a solution */
    fun isSolution(state: MutableList<TreeNode?>): Boolean {
        return state.isNotEmpty() && state[state.size - 1]?._val == 7
    }

    /* Record solution */
    fun recordSolution(state: MutableList<TreeNode?>?, res: MutableList<MutableList<TreeNode?>?>) {
        res.add(state!!.toMutableList())
    }

    /* Check if the choice is valid under the current state */
    fun isValid(state: MutableList<TreeNode?>?, choice: TreeNode?): Boolean {
        return choice != null && choice._val != 3
    }

    /* Update state */
    fun makeChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.add(choice)
    }

    /* Restore state */
    fun undoChoice(state: MutableList<TreeNode?>, choice: TreeNode?) {
        state.removeLast()
    }

    /* Backtracking algorithm: Example 3 */
    fun backtrack(
        state: MutableList<TreeNode?>,
        choices: MutableList<TreeNode?>,
        res: MutableList<MutableList<TreeNode?>?>
    ) {
        // Check if it is a solution
        if (isSolution(state)) {
            // Record solution
            recordSolution(state, res)
        }
        // Traverse all choices
        for (choice in choices) {
            // Pruning: check if the choice is valid
            if (isValid(state, choice)) {
                // Attempt: make choice, update state
                makeChoice(state, choice)
                // Proceed to the next round of selection
                backtrack(state, mutableListOf(choice!!.left, choice.right), res)
                // Backtrack: undo choice, restore to previous state
                undoChoice(state, choice)
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="preorder_traversal_iii_template.rb"
    ### Check if current state is solution ###
    def is_solution?(state)
      !state.empty? && state.last.val == 7
    end

    ### Record solution ###
    def record_solution(state, res)
      res << state.dup
    end

    ### Check if choice is valid in current state ###
    def is_valid?(state, choice)
      choice && choice.val != 3
    end

    ### Update state ###
    def make_choice(state, choice)
      state << choice
    end

    ### Restore state ###
    def undo_choice(state, choice)
      state.pop
    end

    ### Backtracking: example 3 ###
    def backtrack(state, choices, res)
      # Check if it is a solution
      record_solution(state, res) if is_solution?(state)

      # Traverse all choices
      for choice in choices
        # Pruning: check if the choice is valid
        if is_valid?(state, choice)
          # Attempt: make choice, update state
          make_choice(state, choice)
          # Proceed to the next round of selection
          backtrack(state, [choice.left, choice.right], res)
          # Backtrack: undo choice, restore to previous state
          undo_choice(state, choice)
        end
      end
    end
    ```

As per the problem statement, we should continue searching after finding a node with value $7$. **Therefore, we need to remove the `return` statement after recording the solution**. The following figure compares the search process with and without the `return` statement.

![Comparison of search process with and without return statement](backtracking_algorithm.assets/backtrack_remove_return_or_not.png){ class="animation-figure" }

<p align="center"> Figure 13-4 &nbsp; Comparison of search process with and without return statement </p>

Compared to code based on preorder traversal, code based on the backtracking algorithm framework appears more verbose, but has better generality. In fact, **many backtracking problems can be solved within this framework**. We only need to define `state` and `choices` for the specific problem and implement each method in the framework.

## 13.1.4 &nbsp; Common Terminology

To analyze algorithmic problems more clearly, we summarize the meanings of common terminology used in backtracking algorithms and provide corresponding examples from Example 3, as shown in the following table.

<p align="center"> Table 13-1 &nbsp; Common Backtracking Algorithm Terminology </p>

<div class="center-table" markdown>

| Term                      | Definition                                                                                                                   | Example 3                                                                          |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Solution (solution)       | A solution is an answer that satisfies the specific conditions of a problem; there may be one or more solutions             | All paths from root to nodes with value $7$ that satisfy the constraint            |
| Constraint (constraint)   | A constraint is a condition in the problem that limits the feasibility of solutions, typically used for pruning              | Paths do not contain nodes with value $3$                                          |
| State (state)             | State represents the situation of a problem at a certain moment, including the choices already made                           | The currently visited node path, i.e., the `path` list of nodes                    |
| Attempt (attempt)         | An attempt is the process of exploring the solution space according to available choices, including making choices, updating state, and checking if it is a solution | Recursively visit left (right) child nodes, add nodes to `path`, check if node value is $7$ |
| Backtrack (backtracking)  | Backtracking refers to undoing previous choices and returning to a previous state when encountering a state that does not satisfy constraints | Stop searching when passing over leaf nodes, ending node visits, or encountering nodes with value $3$; function returns |
| Pruning (pruning)         | Pruning is a method of avoiding meaningless search paths according to problem characteristics and constraints, which can improve search efficiency | When encountering a node with value $3$, do not continue searching                 |

</div>

!!! tip

    The concepts of problem, solution, state, etc. are universal and are involved in divide-and-conquer, backtracking, dynamic programming, greedy and other algorithms.

## 13.1.5 &nbsp; Advantages and Limitations

The backtracking algorithm is essentially a depth-first search algorithm that tries all possible solutions until it finds one that satisfies the conditions. The advantage of this approach is that it can find all possible solutions, and with reasonable pruning operations, it achieves high efficiency.

However, when dealing with large-scale or complex problems, **the running efficiency of the backtracking algorithm may be unacceptable**.

- **Time**: The backtracking algorithm usually needs to traverse all possibilities in the solution space, and the time complexity can reach exponential or factorial order.
- **Space**: During recursive calls, the current state needs to be saved (such as paths, auxiliary variables used for pruning, etc.), and when the depth is large, the space requirement can become very large.

Nevertheless, **the backtracking algorithm is still the best solution for certain search problems and constraint satisfaction problems**. For these problems, since we cannot predict which choices will generate valid solutions, we must traverse all possible choices. In this case, **the key is how to optimize efficiency**. There are two common efficiency optimization methods.

- **Pruning**: Avoid searching paths that are guaranteed not to produce solutions, thereby saving time and space.
- **Heuristic search**: Introduce certain strategies or estimation values during the search process to prioritize searching paths that are most likely to produce valid solutions.

## 13.1.6 &nbsp; Typical Backtracking Examples

The backtracking algorithm can be used to solve many search problems, constraint satisfaction problems, and combinatorial optimization problems.

**Search problems**: The goal of these problems is to find solutions that satisfy specific conditions.

- Permutation problem: Given a set, find all possible permutations and combinations.
- Subset sum problem: Given a set and a target sum, find all subsets in the set whose elements sum to the target.
- Tower of Hanoi: Given three pegs and a series of disks of different sizes, move all disks from one peg to another, moving only one disk at a time, and never placing a larger disk on a smaller disk.

**Constraint satisfaction problems**: The goal of these problems is to find solutions that satisfy all constraints.

- N-Queens: Place $n$ queens on an $n \times n$ chessboard such that they do not attack each other.
- Sudoku: Fill numbers $1$ to $9$ in a $9 \times 9$ grid such that each row, column, and $3 \times 3$ subgrid contains no repeated digits.
- Graph coloring: Given an undirected graph, color each vertex with the minimum number of colors such that adjacent vertices have different colors.

**Combinatorial optimization problems**: The goal of these problems is to find an optimal solution that satisfies certain conditions in a combinatorial space.

- 0-1 Knapsack: Given a set of items and a knapsack, each item has a value and weight. Under the knapsack capacity constraint, select items to maximize total value.
- Traveling Salesman Problem: Starting from a point in a graph, visit all other points exactly once and return to the starting point, finding the shortest path.
- Maximum Clique: Given an undirected graph, find the largest complete subgraph, i.e., a subgraph where any two vertices are connected by an edge.

Note that for many combinatorial optimization problems, backtracking is not the optimal solution.

- The 0-1 Knapsack problem is usually solved using dynamic programming to achieve higher time efficiency.
- The Traveling Salesman Problem is a famous NP-Hard problem; common solutions include genetic algorithms and ant colony algorithms.
- The Maximum Clique problem is a classical problem in graph theory and can be solved using heuristic algorithms such as greedy algorithms.
