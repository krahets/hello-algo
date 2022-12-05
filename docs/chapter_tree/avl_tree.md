# AVL 树

## AVL 树起源

在「二叉搜索树」章节中提到，在进行多次插入与删除操作后，二叉搜索树可能会退化为链表。此时所有操作的时间复杂度都会由 $O(\log n)$ 劣化至 $O(n)$ 。如下图所示，执行两步删除结点后，该二叉搜索树就会退化为链表。

=== "删除前"
    ![binary search tree1](avl_tree.assets/binary_search_tree1.png)
=== "删除后"
    ![binary search tree2](avl_tree.assets/binary_search_tree2.png)

为了解决这一问题，G. M. Adelson-Velsky 和 E. M. Landis 在其 1962 年发表的论文 "An algorithm for the organization of information" 中提出了「平衡二叉搜索树」，并以两位作者命名，常被称为「AVL 树」。

## AVL 树性质

「AVL 树」既是「二叉搜索树」又是「平衡二叉树」，同时满足这两种二叉树的所有性质。「平衡二叉树」规定树中任意结点左右子树的高度差的绝对值不能超过 1 。本文定义：

- 「平衡因子 Balance Factor」为 **左子树的高度减右子树的高度** 。
- 空树的高度定义为 -1 ，叶结点的高度定义为 0 。

!!! tip

    设「平衡因子」为 $f$ ，则一棵 AVL 树的任意结点的平衡因子满足 $-1 \le f \le 1$

## AVL 树优势

提出 AVL 树的两位大佬的厉害之处在于，**他们设计了一系列操作，使得 AVL 树在不断添加与删除结点后，仍然不会发生退化**，进而使得各种操作的时间复杂度均能保持在 $O(\log n)$ 级别。

## AVL 树操作

### 查找结点

「 AVL 树」的结点查找操作与「二叉搜索树」一致，在此不再赘述。

### 插入结点

**插入结点可能会造成平衡二叉树失衡。** 例如下图（括号内数值为结点的平衡因子），插入后结点 2 和 结点 3 已经不满足平衡二叉树的性质，我们将这一现象称为「失衡」。

=== "插入前"
    ![avl tree 1](avl_tree.assets/avl_tree1.png)
=== "插入后"
    ![avl tree 2](avl_tree.assets/avl_tree2.png)

为了解决失衡问题，首先需要 **分析哪些结点会出现失衡**，经过观察可得两条规律：

- 出现失衡的结点都必然出现在新插入结点与根结点的路径上；
- 在此路径上，出现失衡的结点必然是新插入结点的父结点之上的结点；

!!! tip "证明"

    由于新插入结点必然是叶结点，因此其父结点之前只有 0 个或 1 个孩子结点，
    
    - 当父结点有 0 个孩子结点，那么插入结点后，父结点的平衡因子等于 -1 或 1；
    - 当父结点有 1 个孩子结点，那么由于插入之前满足 AVL 树性质，那么这个孩子结点形成子树高度等于 $1$ ，插入结点后，父结点的平衡因子等于 $0$ ；
    
    因此父结点一定不会失衡，证毕。

**接下来考虑如何将一个失衡点恢复为平衡点。** 我们知道二叉搜索树的中序遍历序列一定是严格升序的，而在论文中，作者定义了一种「旋转 Rotation」的操作，其可 **在不影响二叉树中序遍历序列的情况下，降低失衡点左右子树的高度差** 。

!!! note
    换言之，「旋转」操作可以保持树为「二叉搜索树」，并且可让树逐渐变为平衡二叉树。

#### 右旋

以上文中提到的发生失衡的 AVL 树为例，首个失衡点是 **结点 2** 。将该结点记为 `node` ，其左子节点记为 `node.left` ，「右旋」就好像将这两个结点进行 “顺时针旋转” ，操作流程为：

1. 令 `node.left` 的右指针指向 `node` ；
2. 令 `node` 的左指针指向 `node.left` 的右子树。
3. 令 `node` 的父结点指向 `node.left` ，替代原来 `node` 的位置。

以上流程比较晦涩难记，实际上，右旋就像是把 `node.left` “拎起来” 顺时针旋转了一下，可以使用这个动画辅助理解。

观察得知，经过右旋后，整棵二叉树已经恢复平衡，并且仍然为二叉搜索树。

=== "Step 1"
    ![avl tree3](avl_tree.assets/avl_tree2.png)
=== "Step 2"
    ![rotate right1](avl_tree.assets/rotate_right1.png)
=== "Step 3"
    ![rotate right2](avl_tree.assets/rotate_right2.png)

#### 左旋

类似地，下图中首个失衡点是 **结点 3** ，将失衡结点记为 `node` ，其右子节点记为 `node.right` ，「左旋」就好像将这两个结点进行 “逆时针旋转” ，操作流程为：

1. 令 `node.right` 的左指针指向 `node` ；
2. 令 `node` 的右指针指向 `node.right` 的左子树。
3. 令 `node` 的父结点指向 `node.right` ，替代原来 `node` 的位置。

观察发现，**「左旋」和「右旋」操作是镜像对称的**，因此我们只需记住一个操作即可，另一个可以直接推导出来。

=== "Step 1"
    ![rotate left1](avl_tree.assets/rotate_left1.png)
=== "Step 2"
    ![rotate left2](avl_tree.assets/rotate_left2.png)
=== "Step 3"
    ![rotate left3](avl_tree.assets/rotate_left3.png)

#### 双旋

「双旋」是左旋和右旋的组合，一种是「先左旋后右旋」，另一种是「先右旋后左旋」。

比如对于下图的失衡结点 3 ，单一使用左旋或右旋无法使该结点恢复平衡，需要「先左旋后右旋」。设结点 3 为 `node` ，其左子结点为 `node.left` ，则分为两步：

1. 对 `node.left` 执行「左旋」。
2. 对 `node` 执行「右旋」。

=== "Step 1"
    ![rotate left right3](avl_tree.assets/rotate_left_right1.png)
=== "Step 2"
    ![rotate left right4](avl_tree.assets/rotate_left_right3.png)
=== "Step 3"
    ![rotate left right5](avl_tree.assets/rotate_left_right4.png)

同理，「先右旋后左旋」是先对 `node.right` 执行右旋，然后对 `node` 执行左旋。

（图）

#### 旋转选择

下面我们来看看，如何根据失衡的情形来选择对应的旋转方法。旋转方法的选择是由失衡点的平衡因子以及其较高一侧子树的平衡因子决定的，分为以下四种情形：

| 失衡结点的平衡因子 | 结点的较高子树 | 较高子树的平衡因子 | 应采用的旋转方法 |
| ------------------ | -------------- | ------------------ | ---------------- |
| $>0$               | 左子树         | $>0$               | 右旋             |
| $>0$               | 左子树         | $<0$               | 双旋（先左后右） |
| $<0$               | 右子树         | $<0$               | 左旋             |
| $<0$               | 右子树         | $>0$               | 双旋（先右后左） |

为了方便起见，将 AVL 树修复失衡点封装为一个函数，具体实现如下：

=== "C++"

    ```cpp title="fix_balance.cpp"
    // 用于返回结点node的父结点指向该结点的引用
    TreeNode *&fromParentTo(TreeNode *node) {
        if (isLeftChild(node)) { return node->parent->left; } // 若node为其父结点的左孩子，返回父结点的左指针
        else { return node->parent->right; } // 否则，返回父结点的右指针
    }
    
    // 修复失衡结点p
    void fixBalance(TreeNode *p) {
        // 左旋函数，采用lambda形式
        auto rotate_left = [&](TreeNode *node) -> TreeNode * {
            TreeNode *temp = node->right; // 获取失衡点的右孩子
            temp->parent = p->parent; // 将右孩子的父指针指向失衡点的父亲
            node->right = temp->left; // 失衡点的右指针指向其右孩子的左子树
            if (temp->left != nullptr) { // 如果失衡点右孩子的左子树非空，将失衡点设置为该左子树的父亲
                temp->left->parent = node;
            }
            temp->left = node; // 将失衡点右孩子的左子树指向失衡点
            node->parent = temp; // 失衡点的父亲指向其右孩子
            updateHeight(node); // 更新失衡点高度
            updateHeight(temp); // 更新原失衡点右孩子高度（顺序不可颠倒，因为在旋转后原本的失衡点实质上已经成为了其右孩子的子树）
            return temp; // 返回旋转后该子树的根结点，以便原父结点与其连接
        };
        // 右旋函数，采用lambda形式
        auto rotate_right = [&](TreeNode *node) -> TreeNode * {
            TreeNode *temp = node->left; // 获取失衡点的左孩子
            temp->parent = p->parent; // 将左孩子的父指针指向失衡点的父亲
            node->left = temp->right; // 失衡点的左指针指向其左孩子的右子树
            if (temp->right != nullptr) { // 如果失衡点左孩子的右子树非空，将失衡点设置为该右子树的父亲
                temp->right->parent = node;
            }
            temp->right = node; // 将失衡点左孩子的右子树指向失衡点
            node->parent = temp; // 失衡点的父亲指向其左孩子
            updateHeight(node); // 更新失衡点高度
            updateHeight(temp); / 更新原失衡点左孩子高度（顺序不可颠倒，因为在旋转后原本的失衡点实质上已经成为了其左孩子的子树）
            return temp;
        };
    
        // 根据四种情形选择对应的旋转方式
        if (getBalanceFactor(p) > 1) {
            if (getBalanceFactor(p->left) > 0) {
                if (p->parent == nullptr) { root = rotate_right(p); } // 失衡点为根结点时，其没有父亲，故直接将根节点重置为旋转后的根结点
                else { fromParentTo(p) = rotate_right(p); } // 否则，将失衡点的父亲指向旋转后的根结点
            } else {
                p->left = rotate_left(p->left);
                if (p->parent == nullptr) { root = rotate_right(p); }
                else { fromParentTo(p) = rotate_right(p); }
            }
        } else {
            if (getBalanceFactor(p->right) < 0) {
                if (p->parent == nullptr) { root = rotate_left(p); }
                else { fromParentTo(p) = rotate_left(p); }
            } else {
                p->right = rotate_right(p->right);
                if (p->parent == nullptr) { root = rotate_left(p); }
                else { fromParentTo(p) = rotate_left(p); }
            }
        }
    }
    ```

有了上文中修复失衡点的函数，平衡二叉树的插入代码也就不难写出了。

=== "C++"

    ```cpp title="avl_tree_insert.cpp"
    
    bool AvlTree::insert(int val) {
        TreeNode *p = root;
        // 若根结点为空，直接插入到根结点
        if (p == nullptr) {
            root = new TreeNode(val);
            return true;
        }
        // 寻找插入位置并插入，与二叉搜索树的插入相同
        for (;;) {
            if (p->val == val) { return false; }
            else if (p->val > val) {
                if (p->left == nullptr) {
                    p->left = new TreeNode(val, p);
                    break;
                } else {
                    p = p->left;
                }
            } else {
                if (p->right == nullptr) {
                    p->right = new TreeNode(val, p);
                    break;
                } else {
                    p = p->right;
                }
            }
        }
        // 自下向上寻找第一个失衡点并修复
        for (; p != nullptr; p = p->parent) {
            if (!isBalance(p)) {
                fixBalance(p);
                break;
            } else { 
                updateHeight(p); // 对路径上的未失衡点进行高度复原
            }
        }
        return true;
    }
    ```

#### 高度复原

插入结点后，从该结点至根结点的路径上的结点的高度有可能发生变化。因此在向上搜寻失衡点的过程中，需要不断地更新路径上结点的高度。

=== "C++"

    ```cpp title="updateHeight.cpp"
    // 对结点进行高度复原
    void updateHeight(TreeNode *p) {
        // 若左右子树都为空，则该点为叶子结点，高度为0
        if (p->left == nullptr && p->right == nullptr) { p->height = 0; }
        // 若左子树为空，则该点高度为右子树高度加一
        else if (p->left == nullptr) { p->height = p->right->height + 1; }
        // 若右子树为空，则该点高度为左子树加一
        else if (p->right == nullptr) { p->height = p->left->height + 1; }
        // 左右子树都不为空，该点高度为左右子树中较高者的高度加一
        else { p->height = std::max(p->left->height, p->right->height) + 1; }
    }
    ```

但可以证明的是，插入操作所造成的结点高度变化最多只会影响到第一个失衡点以下的部分。这也正是上述插入操作的代码中修复第一个失衡点后直接跳出循环的原因。

!!! tip "证明"

    以第一个失衡结点为根，设非新插入结点所在子树的高度为 $h$ 。
    
    通过插入前后子树高度的变化可以得出，将第一个失衡结点的平衡因子修复后，该结点的高度与插入前相等。因此，高度变化只会传播到第一个失衡点下方的结点。

### 删除结点

「AVL 树」删除结点操作与「二叉搜索树」删除结点操作总体相同。在此基础上，「AVL树」在删除结点后，需要从删除结点的父结点开始进行失衡点修复与高度复原，直到树的根节点。

=== "C++"

    ```cpp title="avl_tree_remove.cpp"
    bool AvlTree::remove(int val) {
        // 若根结点为空，则直接返回
        TreeNode *p = root;
        if (p == nullptr) { return false; }
        // 删除结点，与二叉搜索树的删除操作相同
        while (p != nullptr) {
            if (p->val == val) {
                TreeNode *real_delete_node = p;
                TreeNode *next_node;
                // 被删除结点左子树为空时，直接将被删除结点的父结点指向被删除结点的右子树
                if (p->left == nullptr) {
                    next_node = p->right;
                    if (p->parent == nullptr) { root = next_node; }
                    else { fromParentTo(p) = next_node; }
                } else if (p->right == nullptr) { // 被删除结点右子树为空时，直接将被删除结点的父结点指向被删除结点的左子树
                    next_node = p->left;
                    if (p->parent == nullptr) { root = next_node; }
                    else { fromParentTo(p) = next_node; }
                } else {
                    // 用直接后继代替该点
                    while (real_delete_node->left != nullptr) {
                        real_delete_node = real_delete_node->left;
                    }
                    std::swap(p->val, real_delete_node->val);
                    next_node = real_delete_node->right;
                    // 根据实际被删除点与删除点的关系，确定删除结点后重新连接的方式
                    if (real_delete_node->parent == p) { p->right = next_node; }
                    else { real_delete_node->parent->left = next_node; }
                }
                // 如果实际被删除点的后继非空，则将其指向实际被删除点的父亲
                if (next_node != nullptr) {
                    next_node->parent = real_delete_node->parent;
                }
                // 自下向上寻找失衡点，并进行高度复原
                for (p = real_delete_node; p != nullptr; p = p->parent) {
                    if (!isBalance(p)) { fixBalance(p); }
                    updateHeight(p);
                }
                delete real_delete_node;
                return true;
            } else if (p->val > val) {
                p = p->left;
            } else {
                p = p->right;
            }
        }
        return false;
    }
    ```
