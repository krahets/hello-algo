# 练习

## 知识巩固

### 完全、完满与完美二叉树

下面两个数组按层序表示二叉树，`None` 表示空位：

- 树 A：`[1, 2, 3, 4, 5, 6]`
- 树 B：`[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. 哪一棵是完全二叉树？
2. 哪一棵是完满二叉树，即每个非叶节点都有两个子节点？
3. 两棵树中是否有完美二叉树？分别说明理由。

??? success "参考答案"

    1. 树 A 是完全二叉树。它只有最底层未填满，并且节点从左到右连续排列。
        树 B 不是完全二叉树，因为最底层左侧已有空位，右侧却仍有节点。

    2. 树 B 是完满二叉树：节点 1 和节点 3 各有两个子节点，其余节点都是叶节点。
        树 A 不是完满二叉树，因为节点 3 只有左子节点 6。

    3. 两棵都不是完美二叉树，因为它们的最底层都没有完全填满。

### 同一棵树的三种遍历顺序

将数组 `[1, 2, 3, 4, 5, 6, 7]` 按层序存入一棵完全二叉树。

<!-- numbered-subquestions -->

1. 画出这棵树。
2. 写出它的前序、中序、后序遍历序列。
3. 在中序序列中，根节点 1 左侧和右侧的两段序列，分别对应树的哪一部分？

??? success "参考答案"

    1. 这棵树为：

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. 前序遍历为 `1, 2, 4, 5, 3, 6, 7`；
        中序遍历为 `4, 2, 5, 1, 6, 3, 7`；
        后序遍历为 `4, 5, 2, 6, 7, 3, 1`。

    3. 根节点 1 左侧的 `4, 2, 5` 是左子树的中序遍历序列；
        右侧的 `6, 3, 7` 是右子树的中序遍历序列。

### 比较两棵二叉搜索树

将下面两组序列从左到右依次插入空的二叉搜索树：

- 序列 A：`[4, 2, 6, 1, 3, 5, 7]`
- 序列 B：`[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. 分别写出查找数字 7 时经过的节点。
2. 若高度按根节点到最远叶节点经过的边数计算，两棵树的高度分别是多少？
3. 根据前两问，你认为两棵树查找数字 7 时的效率是否相同？请结合两棵树的形状和查找路径说明理由。

??? success "参考答案"

    1. 序列 A 建成的树中，查找路径为 `4 → 6 → 7`；
        序列 B 建成的树中，查找路径为 `1 → 2 → 3 → 4 → 5 → 6 → 7`。

    2. 第一棵树的每一层都填满，高度为 2；第二棵树只有右孩子，高度为 6。

    3. 两棵树查找 7 时的效率不同。插入顺序改变了二叉搜索树的形状和高度。查找 7 时，第一棵树只经过 3 个节点，
        第二棵树则要依次经过 7 个节点；树越高，最坏情况下需要沿路径比较的节点就越多。

## 编程练习

### 二叉树的最大深度

给定一棵二叉树的根节点 `root`。每个节点都包含一个整数值，以及指向左、右子节点的引用。

把从根节点到最远叶节点经过的**节点数**称为二叉树的最大深度。请返回这棵树的最大深度；空树的最大深度为 0。
请使用递归完成。

??? tip "解题提示"

    1. 本题按节点数计算深度：只有一个根节点时，最大深度为 1
    2. 让递归函数返回以当前节点为根的子树的最大深度
    3. 空节点返回 0，非空节点返回 max(depth(left), depth(right)) + 1

[LeetCode](https://leetcode.cn/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/maximum-depth-of-binary-tree/solutions/2361697/104-er-cha-shu-de-zui-da-shen-du-hou-xu-txzrx/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 按层遍历二叉树

给定一棵二叉树的根节点 `root`。请使用队列从上到下逐层访问所有节点，同一层内按照从左到右的顺序访问。

返回一个二维数组：第一个子数组保存根节点所在层的节点值，第二个子数组保存下一层的节点值，依此类推。
若二叉树为空，返回空数组。

??? tip "解题提示"

    1. 层序遍历需要先进入的节点先访问，因此使用队列
    2. 一轮开始时队列中的节点正好属于同一层
    3. 先记录队列长度，再弹出这么多个节点并加入它们的孩子

[LeetCode](https://leetcode.cn/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/binary-tree-level-order-traversal/solutions/2361604/102-er-cha-shu-de-ceng-xu-bian-li-yan-du-dyf7/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### 二叉搜索树中的第 k 小元素

一棵二叉搜索树共有 `n` 个节点，各节点值互不相同。
将所有节点值从小到大排列后，位置从 1 开始编号。

给定根节点 `root` 和满足 `1 <= k <= n` 的整数 `k`，请返回排在第 `k` 位的节点值。
请在中序遍历过程中直接寻找答案，不先收集全部节点值。

??? tip "解题提示"

    1. 二叉搜索树的中序遍历会按从小到大的顺序访问节点值
    2. 中序遍历依次处理左子树、当前节点和右子树；访问当前节点时把计数加 1
    3. 当计数第一次等于 k 时，当前节点值就是答案，此后无须继续遍历

[LeetCode](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" } [题目解析](https://leetcode.cn/problems/kth-smallest-element-in-a-bst/solutions/2361685/230-er-cha-sou-suo-shu-zhong-di-k-xiao-d-n3he/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
