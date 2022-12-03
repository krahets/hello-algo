# 平衡二叉搜索树
在[二叉搜索树](binary_tree.md)中提到，如果二叉搜索树在进行多次插入、删除操作后，二叉搜索树可能会退化为链表。此时所有操作的
时间复杂度都会由$O(\log n)$降至$O(n)$。
例如，将该二叉搜索树树中值为4的点删除后，二叉搜索树就会退化为链表。

<div align="center" markdown>
![binary search tree1](avl_tree.assets/binary_search_tree1.png)
![binary search tree2](avl_tree.assets/binary_search_tree2.png)
</div>

为了解决这一问题，G. M. Adelson-Velsky和E. M. Landis在其1962年发表的论文《An algorithm for the organization of info
rmation》中提出了「**AVL树**」也就是「**平衡二叉搜索树**」这一数据结构。

## 平衡二叉搜索树的性质
顾名思义，平衡二叉搜索树也是一棵二叉搜索树，所以它满足二叉搜索树的所有性质。**另外，平衡二叉搜索树规定，
树中任意结点左右子树的高度差的绝对值不能超过1。**

平衡二叉搜索树的平衡因子有很多种定义方式，本文中规定：
1. **平衡二叉搜索树的平衡因子(balance_factor)定义为左子树的高度减右子树的高度。**
2. **空树的高度定义为0，叶子结点的高度定义为1。**

根据平衡二叉搜索树的性质可知，一棵合法的平衡二叉搜索树，其任意结点的平衡因子$f$满足$-1 \le f \le 1$。

平衡二叉搜索树对其平衡因子的限制保证了平衡二叉搜索树不会发生类似于二叉搜索树的退化行为，也就保证了其各种操作的时间复杂度均能保持在
$O(\log n)$这一级别。

## 平衡二叉搜索树的操作
### 查找结点
平衡二叉搜索树查找结点的操作与二叉搜索树一致，在此不再赘述。
### 插入结点
由于平衡二叉树需要保证其任意结点的平衡因子满足限制，所以在插入结点后可能会造成平衡二叉搜索树的失衡。例如，在插入结点前平衡二叉树如下
(括号内表示当前结点的平衡因子)：

<div align="center" markdown>![avl tree 1](avl_tree.assets/avl_tree1.png)</div>

此时在树中插入值为0的结点，插入后二叉搜索树如下：

<div align="center" markdown>![avl tree 2](avl_tree.assets/avl_tree2.png)</div>

很明显，值为2和3的结点已经不满足平衡二叉树的性质，这一现象称为 **失衡**。

为了解决这一现象，首先需要观察哪些结点会出现失衡。不难发现的是，**出现失衡的结点都必然出现在新插入结点与根节点的路径上**。
并且，**从新结点出发直到根结点的这一方向上，首先出现的失衡点的高度必然不低于新插入结点的祖父**。

!!! note

    可以利用反证法来证明这一结论。
    
    假设新插入结点为x，插入x后x的父亲p发生失衡。

    首先，二叉搜索树中新插入的结点必然是叶子结点，即
    x的高度为1。由于p发生失衡，所以p的另一孩子高度h必然大于2。因此在x插入之前，p的平衡因子$-h \le -2$不满足平衡二叉树的性质。
    故发生失衡的结点必然不低于新插入结点的祖父。

现在考虑如何将一个失衡的点重新调整为平衡点。

首先对于一棵二叉搜索树，其中序遍历序列一定是严格升序的。因此，可以考虑 **在不影响整棵二叉树的中序遍历序列的情况下，
通过一定的操作尽可能地降低失衡点左右子树的高度差。** 

根据论文中对这一问题的描述，可以定义一种称为「**旋转**」的操作，其可以在不影响二叉树中序遍历序列的情况下，降低失衡点左右子树的高度差。

#### 右旋

以上文中提到的发生失衡的平衡二叉搜索树为例：
1. 首先可以找到第一个发生失衡的点是值为2的结点。
2. 以该点为轴顺时针旋转，使该点左孩子的右子树指向该点，该点的左子树指向其左孩子的右子树。
3. 将原本的左孩子连接至该点的父节点。具体操作如下：

<div align="center" markdown>
![avl tree3](avl_tree.assets/avl_tree2.png)
![rotate right1](avl_tree.assets/rotate_right1.png)
![rotate right2](avl_tree.assets/rotate_right2.png)
</div>

可以看出，经过旋转后整棵平衡二叉树已经重新平衡，并且中序遍历序列并未发生改变。

这种以某一结点为轴，顺时针旋转的操作称之为「**右旋**」。

#### 左旋
上文中提到了右旋操作，下面来看与之对应的「**左旋**」。需要使用左旋的情况与右旋相似，下面以例子来说明左旋的过程：

<div align="center" markdown>
![rotate left1](avl_tree.assets/rotate_left1.png)
![rotate left2](avl_tree.assets/rotate_left2.png)
![rotate left3](avl_tree.assets/rotate_left3.png)
</div>

与右旋相同，左旋也可以让失衡的结点恢复平衡，同时不会改变中序遍历序列。
#### 双旋（先左后右/先右后左）
以先左后右为例，下图中失衡的二叉树如果直接对失衡点进行右旋，会发现并不能使失衡点恢复平衡：

<div align="center" markdown>
![rotate left right1](avl_tree.assets/rotate_left_right1.png)
![rotate left right2](avl_tree.assets/rotate_left_right2.png)
</div>

这种情况的解决办法为：
1. 将失衡点的左孩子进行左旋。
2. 对失衡点进行右旋。也就是「先左后右」。

<div align="center" markdown>
![rotate left right3](avl_tree.assets/rotate_left_right1.png)
![rotate left right4](avl_tree.assets/rotate_left_right3.png)
![rotate left right5](avl_tree.assets/rotate_left_right4.png)
</div>

同理，「先右后左」是先将失衡点的左孩子进行右旋，然后对失衡点进行左旋。

#### 各类旋转对应的使用条件
上文提到的四种旋转方式涵盖了所有失衡的情形，那么该如何选择旋转方法呢？

旋转方法的选择是由失衡点的平衡因子以及其较高一侧子树的平衡因子决定的，具体可分为以下四种情形：

* 失衡点平衡因子大于0，且左子树平衡因子大于0时，使用右旋。
* 失衡点平衡因子大于0，且左子树平衡因子小于0时，使用先左后右双旋。
* 失衡点平衡因子小于0，且右子树平衡因子小于0时，使用左旋。
* 失衡点平衡因子小于0，且右子树平衡因子大于0时，使用先右后左双旋。

为了方便起见，将平衡二叉搜索树修复失衡点封装为一个函数，具体实现如下：

=== "c++"

    ```cpp title="fix_balance.cpp"
    
    TreeNode *&fromParentTo(TreeNode *node) {
        if (isLeftChild(node)) { return node->parent->left; }
        else { return node->parent->right; }
    }

    void fixBalance(TreeNode *p) {
        auto rotate_left = [&](TreeNode *node) -> TreeNode * {
            TreeNode *temp = node->right;
            temp->parent = p->parent;
            node->right = temp->left;
            if (temp->left != nullptr) {
                temp->left->parent = node;
            }
            temp->left = node;
            node->parent = temp;
            updateHeight(node);
            updateHeight(temp);
            return temp;
        };
        auto rotate_right = [&](TreeNode *node) -> TreeNode * {
            TreeNode *temp = node->left;
            temp->parent = p->parent;
            node->left = temp->right;
            if (temp->right != nullptr) {
                temp->right->parent = node;
            }
            temp->right = node;
            node->parent = temp;
            updateHeight(node);
            updateHeight(temp);
            return temp;
        };
    
        if (getBalanceFactor(p) > 1) {
            if (getBalanceFactor(p->left) > 0) {
                if (p->parent == nullptr) { root = rotate_right(p); }
                else { fromParentTo(p) = rotate_right(p); }
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
=== "c++"
    
    ```cpp title="avl_tree_insert.cpp"
    bool AvlTree::insert(int val) {
        TreeNode *p = root;
        if (p == nullptr) {
            root = new TreeNode(val);
            return true;
        }
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
        for (; p != nullptr; p = p->parent) {
            if (!isBalance(p)) {
                fixBalance(p);
                break;
            } else { 
                updateHeight(p);
            }
        }
        return true;
    }
    ```

#### 高度复原
插入结点后，从该节点至根节点这条路径上的结点的高度有可能发生变化，
所以我们需要在从新插入结点向上搜寻失衡点的过程中不断更新该路径上结点的高度。

=== "c++"
    
    ```cpp title="updateHeight.cpp"
    void updateHeight(TreeNode *p) {
        if (p->left == nullptr && p->right == nullptr) { p->height = 1; }
        else if (p->left == nullptr) { p->height = p->right->height + 1; }
        else if (p->right == nullptr) { p->height = p->left->height + 1; }
        else { p->height = std::max(p->left->height, p->right->height) + 1; }
    }
    ```

但可以证明的是，插入操作所造成的结点高度变化最多只会影响到第一个失衡点以下的部分。

!!! tips

    以第一个失衡结点为根，设非新插入结点所在子树的高度为$h$，通过插入前后子树高度的变化可以得出，
    将第一个失衡结点的平衡因子修复后，该点的高度与插入前相比不发生变化。因此，
    高度变化只会传播到第一个失衡点下方的结点。

这也就是插入操作中

=== "c++"
    
    ```cpp
    for (; p != nullptr; p = p->parent) {
        if (!isBalance(p)) {
            fixBalance(p);
            break;
        } else { 
            updateHeight(p);
        }
    }
    ```

修复第一个失衡点后直接跳出循环的原因。

### 删除节点
删除结点与二叉搜索树删除结点的操作基本相同。不同的是，在删除节点后需要自删除结点的父节点开始进行失衡点修复以及高度复原，
直到到达树的根节点。

=== "cpp"

    ```cpp title="avl_tree_remove.cpp"
    bool AvlTree::remove(int val) {
        TreeNode *p = root;
        if (p == nullptr) { return false; }
        while (p != nullptr) {
            if (p->val == val) {
                TreeNode *real_delete_node = p;
                TreeNode *next_node;
                if (p->left == nullptr) {
                    next_node = p->right;
                    if (p->parent == nullptr) { root = next_node; }
                    else { fromParentTo(p) = next_node; }
                } else if (p->right == nullptr) {
                    next_node = p->left;
                    if (p->parent == nullptr) { root = next_node; }
                    else { fromParentTo(p) = next_node; }
                } else {
                    while (real_delete_node->left != nullptr) {
                        real_delete_node = real_delete_node->left;
                    }
                    std::swap(p->val, real_delete_node->val);
                    next_node = real_delete_node->right;
                    if (real_delete_node->parent == p) { p->right = next_node; }
                    else { real_delete_node->parent->left = next_node; }
                }
                if (next_node != nullptr) {
                    next_node->parent = real_delete_node->parent;
                }
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