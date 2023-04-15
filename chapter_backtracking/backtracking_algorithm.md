---
comments: true
---

# 12.1. &nbsp; 回溯算法

「回溯算法 Backtracking Algorithm」是一种通过穷举来解决问题的方法，它的核心思想是从一个初始状态出发，暴力搜索所有可能的解决方案，当遇到正确的解则将其记录，直到找到解或者尝试了所有可能的选择都无法找到解为止。

回溯算法通常采用「深度优先搜索」来遍历解空间。在二叉树章节中，我们提到前序、中序和后序遍历都属于深度优先搜索。下面，我们从二叉树的前序遍历入手，逐步了解回溯算法的工作原理。

!!! question "例题一：在二叉树中搜索并返回所有值为 $7$ 的节点"

**解题思路**：前序遍历这颗树，并判断当前节点的值是否为 $7$ ，若是则将该节点的值加入到结果列表 `res` 之中。

=== "Java"

    ```java title="preorder_find_nodes.java"
    /* 前序遍历 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 尝试
        if (root.val == 7) {
            // 记录解
            res.add(root);
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        return;
    }
    ```

=== "C++"

    ```cpp title="preorder_find_nodes.cpp"
    [class]{}-[func]{preOrder}
    ```

=== "Python"

    ```python title="preorder_find_nodes.py"
    def pre_order(root: TreeNode) -> None:
        """前序遍历"""
        if root is None:
            return
        if root.val == 7:
            # 记录解
            res.append(root)
        pre_order(root.left)
        pre_order(root.right)
    ```

=== "Go"

    ```go title="preorder_find_nodes.go"
    [class]{}-[func]{preOrder}
    ```

=== "JavaScript"

    ```javascript title="preorder_find_nodes.js"
    [class]{}-[func]{preOrder}
    ```

=== "TypeScript"

    ```typescript title="preorder_find_nodes.ts"
    [class]{}-[func]{preOrder}
    ```

=== "C"

    ```c title="preorder_find_nodes.c"
    [class]{}-[func]{preOrder}
    ```

=== "C#"

    ```csharp title="preorder_find_nodes.cs"
    [class]{preorder_find_nodes}-[func]{preOrder}
    ```

=== "Swift"

    ```swift title="preorder_find_nodes.swift"
    [class]{}-[func]{preOrder}
    ```

=== "Zig"

    ```zig title="preorder_find_nodes.zig"
    [class]{}-[func]{preOrder}
    ```

![在前序遍历中搜索节点](backtracking_algorithm.assets/preorder_find_nodes.png)

<p align="center"> Fig. 在前序遍历中搜索节点 </p>

## 12.1.1. &nbsp; 尝试与回退

**之所以称之为回溯算法，是因为该算法在搜索解空间时会采用“尝试”与“回退”的策略**。当算法在搜索过程中遇到某个状态无法继续前进或无法得到满足条件的解时，它会撤销上一步的选择，退回到之前的状态，并尝试其他可能的选择。

对于例题一，访问每个节点都代表一次“尝试”，而越过叶结点或返回父节点的 `return` 则表示“回退”。

值得说明的是，**回退并不等价于函数返回**。为解释这一点，我们对例题一稍作拓展。

!!! question "在二叉树中搜索所有值为 $7$ 的节点，**返回根节点到这些节点的路径**"

**解题思路**：在例题一代码的基础上，我们需要借助一个列表 `path` 记录访问过的节点路径。当访问到值为 $7$ 的节点时，则复制 `path` 并添加进结果列表 `res` 。遍历完成后，`res` 中保存的就是所有的解。

=== "Java"

    ```java title="preorder_find_paths.java"
    /* 前序遍历 */
    void preOrder(TreeNode root) {
        if (root == null) {
            return;
        }
        // 尝试
        path.add(root);
        if (root.val == 7) {
            // 记录解
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        path.remove(path.size() - 1);
    }
    ```

=== "C++"

    ```cpp title="preorder_find_paths.cpp"
    [class]{}-[func]{preOrder}
    ```

=== "Python"

    ```python title="preorder_find_paths.py"
    def pre_order(root: TreeNode) -> None:
        """前序遍历"""
        if root is None:
            return
        # 尝试
        path.append(root)
        if root.val == 7:
            # 记录解
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 回退
        path.pop()
        return
    ```

=== "Go"

    ```go title="preorder_find_paths.go"
    [class]{}-[func]{preOrder}
    ```

=== "JavaScript"

    ```javascript title="preorder_find_paths.js"
    [class]{}-[func]{preOrder}
    ```

=== "TypeScript"

    ```typescript title="preorder_find_paths.ts"
    [class]{}-[func]{preOrder}
    ```

=== "C"

    ```c title="preorder_find_paths.c"
    [class]{}-[func]{preOrder}
    ```

=== "C#"

    ```csharp title="preorder_find_paths.cs"
    [class]{preorder_find_paths}-[func]{preOrder}
    ```

=== "Swift"

    ```swift title="preorder_find_paths.swift"
    [class]{}-[func]{preOrder}
    ```

=== "Zig"

    ```zig title="preorder_find_paths.zig"
    [class]{}-[func]{preOrder}
    ```

在每次“尝试”中，我们通过将当前节点添加进 `path` 来记录路径；而在“回退”前，我们需要将该节点从 `path` 中弹出，**以恢复本次尝试之前的状态**。换句话说，**我们可以将尝试和回退理解为“前进”与“撤销”**，两个操作是互为相反的。

=== "<1>"
    ![preorder_find_paths_step1](backtracking_algorithm.assets/preorder_find_paths_step1.png)

=== "<2>"
    ![preorder_find_paths_step2](backtracking_algorithm.assets/preorder_find_paths_step2.png)

=== "<3>"
    ![preorder_find_paths_step3](backtracking_algorithm.assets/preorder_find_paths_step3.png)

=== "<4>"
    ![preorder_find_paths_step4](backtracking_algorithm.assets/preorder_find_paths_step4.png)

=== "<5>"
    ![preorder_find_paths_step5](backtracking_algorithm.assets/preorder_find_paths_step5.png)

=== "<6>"
    ![preorder_find_paths_step6](backtracking_algorithm.assets/preorder_find_paths_step6.png)

=== "<7>"
    ![preorder_find_paths_step7](backtracking_algorithm.assets/preorder_find_paths_step7.png)

=== "<8>"
    ![preorder_find_paths_step8](backtracking_algorithm.assets/preorder_find_paths_step8.png)

=== "<9>"
    ![preorder_find_paths_step9](backtracking_algorithm.assets/preorder_find_paths_step9.png)

=== "<10>"
    ![preorder_find_paths_step10](backtracking_algorithm.assets/preorder_find_paths_step10.png)

=== "<11>"
    ![preorder_find_paths_step11](backtracking_algorithm.assets/preorder_find_paths_step11.png)

## 12.1.2. &nbsp; 剪枝

复杂的回溯问题通常包含一个或多个约束条件，**约束条件通常可用于“剪枝”**。

!!! question "例题三：在二叉树中搜索所有值为 $7$ 的节点，返回根节点到这些节点的路径，**路径中不能包含值为 $3$ 的节点**"

**解题思路**：在例题二的基础上添加剪枝操作，当遇到值为 $3$ 的节点时，则终止继续搜索。

=== "Java"

    ```java title="preorder_find_constrained_paths.java"
    /* 前序遍历 */
    void preOrder(TreeNode root) {
        // 剪枝
        if (root == null || root.val == 3) {
            return;
        }
        // 尝试
        path.add(root);
        if (root.val == 7) {
            // 记录解
            res.add(new ArrayList<>(path));
        }
        preOrder(root.left);
        preOrder(root.right);
        // 回退
        path.remove(path.size() - 1);
    }
    ```

=== "C++"

    ```cpp title="preorder_find_constrained_paths.cpp"
    [class]{}-[func]{preOrder}
    ```

=== "Python"

    ```python title="preorder_find_constrained_paths.py"
    def pre_order(root: TreeNode) -> None:
        """前序遍历"""
        # 剪枝
        if root is None or root.val == 3:
            return
        # 尝试
        path.append(root)
        if root.val == 7:
            # 记录解
            res.append(list(path))
        pre_order(root.left)
        pre_order(root.right)
        # 回退
        path.pop()
        return
    ```

=== "Go"

    ```go title="preorder_find_constrained_paths.go"
    [class]{}-[func]{preOrder}
    ```

=== "JavaScript"

    ```javascript title="preorder_find_constrained_paths.js"
    [class]{}-[func]{preOrder}
    ```

=== "TypeScript"

    ```typescript title="preorder_find_constrained_paths.ts"
    [class]{}-[func]{preOrder}
    ```

=== "C"

    ```c title="preorder_find_constrained_paths.c"
    [class]{}-[func]{preOrder}
    ```

=== "C#"

    ```csharp title="preorder_find_constrained_paths.cs"
    [class]{preorder_find_constrained_paths}-[func]{preOrder}
    ```

=== "Swift"

    ```swift title="preorder_find_constrained_paths.swift"
    [class]{}-[func]{preOrder}
    ```

=== "Zig"

    ```zig title="preorder_find_constrained_paths.zig"
    [class]{}-[func]{preOrder}
    ```

剪枝是一个非常形象的名词。在搜索过程中，**我们利用约束条件“剪掉”了不满足约束条件的搜索分支**，避免许多无意义的尝试，从而提升搜索效率。

![根据约束条件剪枝](backtracking_algorithm.assets/preorder_find_constrained_paths.png)

<p align="center"> Fig. 根据约束条件剪枝 </p>

## 12.1.3. &nbsp; 常用术语

为了更清晰地分析算法问题，我们总结一下回溯算法中常用术语的含义，并对照例题三给出对应示例。

| 名词                | 定义                                                         | 例题三                                                   |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 解 Solution         | 解是满足问题特定条件的答案。回溯算法的目标是找到一个或多个满足条件的解 | 根节点到节点 $7$ 的所有路径，且路径中不包含值为 $3$ 的节点   |
| 状态 State          | 状态表示问题在某一时刻的情况，包括已经做出的选择             | 当前已访问的节点路径，即 `path` 节点列表                     |
| 约束条件 Constraint | 约束条件是问题中限制解的可行性的条件，通常用于剪枝           | 要求路径中不能包含值为 $3$ 的节点                            |
| 尝试 Attempt        | 尝试是在搜索过程中，根据当前状态和可用选择来探索解空间的过程。尝试包括做出选择，更新状态，检查是否为解 | 递归访问左（右）子节点，将节点添加进 `path` ，判断节点的值是否为 $7$ |
| 回退 Backtracking   | 回退指在搜索中遇到到不满足约束条件或无法继续搜索的状态时，撤销前面做出的选择，回到上一个状态 | 当越过叶结点、结束结点访问、遇到值为 $3$ 的节点时终止搜索，函数返回 |
| 剪枝 Pruning        | 剪枝是根据问题特性和约束条件避免无意义的搜索路径的方法，可提高搜索效率 | 当遇到值为 $3$ 的节点时，则终止继续搜索                      |

!!! tip

    解、状态、约束条件等术语是通用的，适用于回溯算法、动态规划、贪心算法等。

## 12.1.4. &nbsp; 框架代码

回溯算法可用于解决许多搜索问题、约束满足问题和组合优化问题。为提升代码通用性，我们希望将回溯算法的“尝试、回退、剪枝”的主体框架提炼出来。

设 `state` 为问题的当前状态，`choices` 表示当前状态下可以做出的选择，则可得到以下回溯算法的框架代码。

```python
def backtrack(state, choices, res):
    """回溯算法框架"""
    # 判断是否为解
    if is_solution(state):
        # 记录解
        record_solution(state, res)
        return
    # 遍历所有选择
    for choice in choices:
        # 剪枝：判断选择是否合法
        if is_valid(state, choice):
            # 尝试：做出选择，更新状态
            make_choice(state, choice)
            backtrack(state, choices, res)
            # 回退：撤销选择，恢复到之前的状态
            undo_choice(state, choice)
```

下面，我们尝试基于此框架来解决例题三。在例题三中，状态 `state` 是节点遍历路径，选择 `choices` 是当前节点的左子节点和右子节点，结果 `res` 是路径列表，实现代码如下所示。

=== "Java"

    ```java title="backtrack_find_constrained_paths.java"
    /* 判断当前状态是否为解 */
    boolean isSolution(List<TreeNode> state) {
        return !state.isEmpty() && state.get(state.size() - 1).val == 7;
    }

    /* 记录解 */
    void recordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.add(new ArrayList<>(state));
    }

    /* 判断在当前状态下，该选择是否合法 */
    boolean isValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* 更新状态 */
    void makeChoice(List<TreeNode> state, TreeNode choice) {
        state.add(choice);
    }

    /* 恢复状态 */
    void undoChoice(List<TreeNode> state, TreeNode choice) {
        state.remove(state.size() - 1);
    }

    /* 回溯算法 */
    void backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // 检查是否为解
        if (isSolution(state)) {
            // 记录解
            recordSolution(state, res);
            return;
        }
        // 遍历所有选择
        for (TreeNode choice : choices) {
            // 剪枝：检查选择是否合法
            if (isValid(state, choice)) {
                // 尝试：做出选择，更新状态
                makeChoice(state, choice);
                backtrack(state, Arrays.asList(choice.left, choice.right), res);
                // 回退：撤销选择，恢复到之前的状态
                undoChoice(state, choice);
            }
        }
    }
    ```

=== "C++"

    ```cpp title="backtrack_find_constrained_paths.cpp"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "Python"

    ```python title="backtrack_find_constrained_paths.py"
    def is_solution(state: list[TreeNode]) -> bool:
        """判断当前状态是否为解"""
        return state and state[-1].val == 7

    def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
        """记录解"""
        res.append(list(state))

    def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
        """判断在当前状态下，该选择是否合法"""
        return choice is not None and choice.val != 3

    def make_choice(state: list[TreeNode], choice: TreeNode):
        """更新状态"""
        state.append(choice)

    def undo_choice(state: list[TreeNode], choice: TreeNode):
        """恢复状态"""
        state.pop()

    def backtrack(state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]):
        """回溯算法"""
        # 检查是否为解
        if is_solution(state):
            # 记录解
            record_solution(state, res)
            return
        # 遍历所有选择
        for choice in choices:
            # 剪枝：检查选择是否合法
            if is_valid(state, choice):
                # 尝试：做出选择，更新状态
                make_choice(state, choice)
                backtrack(state, [choice.left, choice.right], res)
                # 回退：撤销选择，恢复到之前的状态
                undo_choice(state, choice)
    ```

=== "Go"

    ```go title="backtrack_find_constrained_paths.go"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "JavaScript"

    ```javascript title="backtrack_find_constrained_paths.js"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "TypeScript"

    ```typescript title="backtrack_find_constrained_paths.ts"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "C"

    ```c title="backtrack_find_constrained_paths.c"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "C#"

    ```csharp title="backtrack_find_constrained_paths.cs"
    [class]{backtrack_find_constrained_paths}-[func]{isSolution}

    [class]{backtrack_find_constrained_paths}-[func]{recordSolution}

    [class]{backtrack_find_constrained_paths}-[func]{isValid}

    [class]{backtrack_find_constrained_paths}-[func]{makeChoice}

    [class]{backtrack_find_constrained_paths}-[func]{undoChoice}

    [class]{backtrack_find_constrained_paths}-[func]{backtrack}
    ```

=== "Swift"

    ```swift title="backtrack_find_constrained_paths.swift"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

=== "Zig"

    ```zig title="backtrack_find_constrained_paths.zig"
    [class]{}-[func]{isSolution}

    [class]{}-[func]{recordSolution}

    [class]{}-[func]{isValid}

    [class]{}-[func]{makeChoice}

    [class]{}-[func]{undoChoice}

    [class]{}-[func]{backtrack}
    ```

相较于基于前序遍历的实现代码，基于回溯算法框架的实现代码虽然显得啰嗦，但通用性更好，适用于各种不同的回溯算法问题。实际上，**所有回溯问题都可以在该框架下解决**。我们只需要根据问题特点来定义框架中的各个变量，实现各个方法即可。

## 12.1.5. &nbsp; 典型例题

**搜索问题**：这类问题的目标是找到满足特定条件的解决方案。

- 全排列问题：给定一个集合，求出其所有可能的排列组合。
- 子集和问题：给定一个集合和一个目标和，找到集合中所有和为目标和的子集。
- 汉诺塔问题：给定三个柱子和一系列大小不同的圆盘，要求将所有圆盘从一个柱子移动到另一个柱子，每次只能移动一个圆盘，且不能将大圆盘放在小圆盘上。

**约束满足问题**：这类问题的目标是找到满足所有约束条件的解。

- $n$ 皇后：在 $n \times n$ 的棋盘上放置 $n$ 个皇后，使得它们互不攻击。
- 数独：在 $9 \times 9$ 的网格中填入数字 $1$ ~ $9$ ，使得每行、每列和每个 $3 \times 3$ 子网格中的数字不重复。
- 图着色问题：给定一个无向图，用最少的颜色给图的每个顶点着色，使得相邻顶点颜色不同。

**组合优化问题**：这类问题的目标是在一个组合空间中找到满足某些条件的最优解。

- 0-1 背包问题：给定一组物品和一个背包，每个物品有一定的价值和重量，要求在背包容量限制内，选择物品使得总价值最大。
- 旅行商问题：在一个图中，从一个点出发，访问所有其他点恰好一次后返回起点，求最短路径。
- 最大团问题：给定一个无向图，找到最大的完全子图，即子图中的任意两个顶点之间都有边相连。

在接下来的章节中，我们将一起攻克几个经典的回溯算法问题。
