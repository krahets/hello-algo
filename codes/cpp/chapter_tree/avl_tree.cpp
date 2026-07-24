/**
 * File: avl_tree.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++ 规范、const 正确性、鲁棒性、代码整洁
 */

#include "../utils/common.hpp"
#include <algorithm> // std::max

/* AVL 树 */
class AVLTree {
private:
    /* 更新节点高度 */
    void updateHeight(TreeNode* node) {
        // 节点高度 = 最高子树高度 + 1
        node->height = std::max(height(node->left), height(node->right)) + 1;
    }

    /* 右旋操作 */
    TreeNode* rightRotate(TreeNode* node) {
        TreeNode* child = node->left;
        TreeNode* grandChild = child->right;
        // 以 child 为中心右旋
        child->right = node;
        node->left = grandChild;
        // 更新高度
        updateHeight(node);
        updateHeight(child);
        return child;
    }

    /* 左旋操作 */
    TreeNode* leftRotate(TreeNode* node) {
        TreeNode* child = node->right;
        TreeNode* grandChild = child->left;
        // 以 child 为中心左旋
        child->left = node;
        node->right = grandChild;
        // 更新高度
        updateHeight(node);
        updateHeight(child);
        return child;
    }

    /* 执行旋转，恢复平衡 */
    TreeNode* rotate(TreeNode* node) {
        const int bf = balanceFactor(node);
        // === 左偏树 ===
        if (bf > 1) {
            if (balanceFactor(node->left) >= 0) {
                // LL 型：右旋
                return rightRotate(node);
            } else {
                // LR 型：先左旋左子树，再右旋
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // === 右偏树 ===
        if (bf < -1) {
            if (balanceFactor(node->right) <= 0) {
                // RR 型：左旋
                return leftRotate(node);
            } else {
                // RL 型：先右旋右子树，再左旋
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 无需旋转
        return node;
    }

    /* 递归插入（辅助） */
    TreeNode* insertHelper(TreeNode* node, int val) {
        if (node == nullptr)
            return new TreeNode(val);

        // 二叉搜索树插入规则
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node; // 重复值不插入

        updateHeight(node);
        return rotate(node); // 自动平衡
    }

    /* 递归删除（辅助） */
    TreeNode* removeHelper(TreeNode* node, int val) {
        if (node == nullptr)
            return nullptr;

        // 查找节点
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            // 情况 1/2：0 个或 1 个子节点
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode* child = node->left ? node->left : node->right;
                delete node;
                return child;
            }
            // 情况 3：2 个子节点，用后继节点替换
            TreeNode* temp = node->right;
            while (temp->left != nullptr)
                temp = temp->left;

            node->val = temp->val;
            node->right = removeHelper(node->right, temp->val);
        }

        updateHeight(node);
        return rotate(node); // 自动平衡
    }

public:
    TreeNode* root = nullptr; // 类内初始化

    /* 获取节点高度（空节点高度 -1）*/
    int height(const TreeNode* node) const {
        return node ? node->height : -1;
    }

    /* 获取平衡因子 */
    int balanceFactor(const TreeNode* node) const {
        return node ? height(node->left) - height(node->right) : 0;
    }

    /* 插入节点 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* 删除节点 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* 查找节点 */
    TreeNode* search(int val) const {
        TreeNode* cur = root;
        while (cur != nullptr) {
            if (val < cur->val)
                cur = cur->left;
            else if (val > cur->val)
                cur = cur->right;
            else
                break;
        }
        return cur;
    }

    /* 析构函数：自动释放内存 */
    ~AVLTree() {
        freeMemoryTree(root);
    }

    // 禁用拷贝构造 & 赋值运算符（避免浅拷贝 double free 崩溃）
    AVLTree(const AVLTree&) = delete;
    AVLTree& operator=(const AVLTree&) = delete;
};

/* 测试工具函数 */
void testInsert(AVLTree& tree, int val) {
    tree.insert(val);
    std::cout << "\n插入节点 " << val << " 后，AVL 树为：\n";
    printTree(tree.root);
}

void testRemove(AVLTree& tree, int val) {
    tree.remove(val);
    std::cout << "\n删除节点 " << val << " 后，AVL 树为：\n";
    printTree(tree.root);
}

/* Driver Code */
int main() {
    AVLTree avlTree;

    // 插入节点
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

    // 插入重复节点
    testInsert(avlTree, 7);

    // 删除节点
    testRemove(avlTree, 8);
    testRemove(avlTree, 5);
    testRemove(avlTree, 4);

    // 查询
    if (TreeNode* node = avlTree.search(7)) {
        std::cout << "\n查找到节点，值 = " << node->val << std::endl;
    }

    return 0;
}
