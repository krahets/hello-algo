/**
 * File: binary_search_tree.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++ 规范、const 正确性、鲁棒性、代码整洁
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 二叉搜索树 */
class BinarySearchTree {
private:
    TreeNode* root = nullptr;  // 类内初始化，更安全

public:
    /* 构造方法 */
    BinarySearchTree() = default;  // 默认构造

    /* 析构方法 */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    // 禁用拷贝构造 & 赋值运算符（防止浅拷贝、重复释放内存）
    BinarySearchTree(const BinarySearchTree&) = delete;
    BinarySearchTree& operator=(const BinarySearchTree&) = delete;

    /* 获取根节点 */
    TreeNode* getRoot() {
        return root;
    }
    /* const 版本：只读时使用 */
    const TreeNode* getRoot() const {
        return root;
    }

    /* 查找节点（const：不修改树） */
    TreeNode* search(int num) const {
        TreeNode* cur = root;
        while (cur != nullptr) {
            if (num < cur->val)
                cur = cur->left;
            else if (num > cur->val)
                cur = cur->right;
            else
                return cur;  // 找到直接返回
        }
        return nullptr;
    }

    /* 插入节点 */
    void insert(int num) {
        // 空树直接创建根节点
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }

        TreeNode* cur = root;
        TreeNode* pre = nullptr;
        while (cur != nullptr) {
            // 重复值不插入
            if (cur->val == num)
                return;

            pre = cur;
            if (num < cur->val)
                cur = cur->left;
            else
                cur = cur->right;
        }

        // 挂载新节点
        TreeNode* node = new TreeNode(num);
        if (num < pre->val)
            pre->left = node;
        else
            pre->right = node;
    }

    /* 删除节点 */
    void remove(int num) {
        if (root == nullptr)
            return;

        TreeNode* cur = root;
        TreeNode* pre = nullptr;

        // 1. 查找待删除节点
        while (cur != nullptr && cur->val != num) {
            pre = cur;
            if (num < cur->val)
                cur = cur->left;
            else
                cur = cur->right;
        }

        // 没找到，直接返回
        if (cur == nullptr)
            return;

        // 2. 情况1：0 或 1 个子节点
        if (cur->left == nullptr || cur->right == nullptr) {
            TreeNode* child = cur->left ? cur->left : cur->right;

            if (cur != root) {  // 非根节点
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {  // 删除根节点
                root = child;
            }

            delete cur;
        }
        // 3. 情况2：两个子节点
        else {
            // 找到后继节点（右子树的最小节点）
            TreeNode* tmp = cur->right;
            while (tmp->left != nullptr)
                tmp = tmp->left;

            int tmpVal = tmp->val;
            remove(tmpVal);       // 删除后继节点
            cur->val = tmpVal;     // 替换值
        }
    }
};

/* Driver Code */
int main() {
    // 栈上创建对象，自动释放内存，更安全
    BinarySearchTree bst;

    std::vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst.insert(num);
    }

    std::cout << "\n初始化的二叉树为\n";
    printTree(bst.getRoot());

    /* 查找节点 */
    if (TreeNode* node = bst.search(7)) {
        std::cout << "\n查找到节点，值 = " << node->val << '\n';
    }

    /* 插入节点 */
    bst.insert(16);
    std::cout << "\n插入节点 16 后，二叉树为\n";
    printTree(bst.getRoot());

    /* 删除节点 */
    bst.remove(1);
    std::cout << "\n删除节点 1 后，二叉树为\n";
    printTree(bst.getRoot());

    bst.remove(2);
    std::cout << "\n删除节点 2 后，二叉树为\n";
    printTree(bst.getRoot());

    bst.remove(4);
    std::cout << "\n删除节点 4 后，二叉树为\n";
    printTree(bst.getRoot());

    return 0;  // 自动调用析构函数，无需手动 delete
}
