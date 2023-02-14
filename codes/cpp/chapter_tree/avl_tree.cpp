/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../include/include.hpp"

/* AVL 树 */
class AVLTree {
public:
    TreeNode* root;  // 根结点
private:
    /* 更新结点高度 */
    void updateHeight(TreeNode* node) {
        // 结点高度等于最高子树高度 + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* 右旋操作 */
    TreeNode* rightRotate(TreeNode* node) {
        TreeNode* child = node->left;
        TreeNode* grandChild = child->right;
        // 以 child 为原点，将 node 向右旋转
        child->right = node;
        node->left = grandChild;
        // 更新结点高度
        updateHeight(node);
        updateHeight(child);
        // 返回旋转后子树的根结点
        return child;
    }

    /* 左旋操作 */
    TreeNode* leftRotate(TreeNode* node) {
        TreeNode* child = node->right;
        TreeNode* grandChild = child->left;
        // 以 child 为原点，将 node 向左旋转
        child->left = node;
        node->right = grandChild;
        // 更新结点高度
        updateHeight(node);
        updateHeight(child);
        // 返回旋转后子树的根结点
        return child;
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    TreeNode* rotate(TreeNode* node) {
        // 获取结点 node 的平衡因子
        int _balanceFactor = balanceFactor(node);
        // 左偏树
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // 右旋
                return rightRotate(node);
            } else {
                // 先左旋后右旋
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // 右偏树
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // 左旋
                return leftRotate(node);
            } else {
                // 先右旋后左旋
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 平衡树，无需旋转，直接返回
        return node;
    }

    /* 递归插入结点（辅助方法） */
    TreeNode* insertHelper(TreeNode* node, int val) {
        if (node == nullptr) return new TreeNode(val);
        /* 1. 查找插入位置，并插入结点 */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;     // 重复结点不插入，直接返回
        updateHeight(node);  // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node);
        // 返回子树的根结点
        return node;
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    TreeNode* getInOrderNext(TreeNode* node) {
        if (node == nullptr) return node;
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while (node->left != nullptr) {
            node = node->left;
        }
        return node;
    }

    /* 递归删除结点（辅助方法） */
    TreeNode* removeHelper(TreeNode* node, int val) {
        if (node == nullptr) return nullptr;
        /* 1. 查找结点，并删除之 */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode* child = node->left != nullptr ? node->left : node->right;
                // 子结点数量 = 0 ，直接删除 node 并返回
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 子结点数量 = 1 ，直接删除 node
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
                TreeNode* temp = getInOrderNext(node->right);
                node->right = removeHelper(node->right, temp->val);
                node->val = temp->val;
            }
        }
        updateHeight(node);  // 更新结点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = rotate(node);
        // 返回子树的根结点
        return node;
    }

public:
    /* 获取结点高度 */
    int height(TreeNode* node) {
        // 空结点高度为 -1 ，叶结点高度为 0
        return node == nullptr ? -1 : node->height;
    }

    /* 获取平衡因子 */
    int balanceFactor(TreeNode* node) {
        // 空结点平衡因子为 0
        if (node == nullptr) return 0;
        // 结点平衡因子 = 左子树高度 - 右子树高度
        return height(node->left) - height(node->right);
    }

    /* 插入结点 */
    TreeNode* insert(int val) {
        root = insertHelper(root, val);
        return root;
    }

    /* 删除结点 */
    TreeNode* remove(int val) {
        root = removeHelper(root, val);
        return root;
    }

    /* 查找结点 */
    TreeNode* search(int val) {
        TreeNode* cur = root;
        // 循环查找，越过叶结点后跳出
        while (cur != nullptr) {
            // 目标结点在 cur 的右子树中
            if (cur->val < val)
                cur = cur->right;
            // 目标结点在 cur 的左子树中
            else if (cur->val > val)
                cur = cur->left;
            // 找到目标结点，跳出循环
            else
                break;
        }
        // 返回目标结点
        return cur;
    }

    /*构造方法*/
    AVLTree() : root(nullptr) {}

    /*析构方法*/
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree& tree, int val) {
    tree.insert(val);
    cout << "\n插入结点 " << val << " 后，AVL 树为" << endl;
    PrintUtil::printTree(tree.root);
}

void testRemove(AVLTree& tree, int val) {
    tree.remove(val);
    cout << "\n删除结点 " << val << " 后，AVL 树为" << endl;
    PrintUtil::printTree(tree.root);
}
int main() {
    /* 初始化空 AVL 树 */
    AVLTree avlTree;

    /* 插入结点 */
    // 请关注插入结点后，AVL 树是如何保持平衡的
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* 插入重复结点 */
    testInsert(avlTree, 7);

    /* 删除结点 */
    // 请关注删除结点后，AVL 树是如何保持平衡的
    testRemove(avlTree, 8);  // 删除度为 0 的结点
    testRemove(avlTree, 5);  // 删除度为 1 的结点
    testRemove(avlTree, 4);  // 删除度为 2 的结点

    /* 查询结点 */
    TreeNode* node = avlTree.search(7);
    cout << "\n查找到的结点对象为 " << node << "，结点值 = " << node->val << endl;
}