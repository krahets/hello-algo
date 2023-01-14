/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 二叉搜索树 */
class BinarySearchTree {
private:
    TreeNode* root;

public:
    BinarySearchTree(vector<int> nums) {
        sort(nums.begin(), nums.end()); // 排序数组
        root = buildTree(nums, 0, nums.size() - 1);  // 构建二叉搜索树
    }

    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 获取二叉树根结点 */
    TreeNode* getRoot() {
        return root;
    }

    /* 构建二叉搜索树 */
    TreeNode* buildTree(vector<int> nums, int i, int j) {
        if (i > j) return nullptr;
        // 将数组中间结点作为根结点
        int mid = (i + j) / 2;
        TreeNode* root = new TreeNode(nums[mid]);
        // 递归建立左子树和右子树
        root->left = buildTree(nums, i, mid - 1);
        root->right = buildTree(nums, mid + 1, j);
        return root;
    }

    /* 查找结点 */
    TreeNode* search(int num) {
        TreeNode* cur = root;
        // 循环查找，越过叶结点后跳出
        while (cur != nullptr) {
            // 目标结点在 root 的右子树中
            if (cur->val < num) cur = cur->right;
            // 目标结点在 root 的左子树中
            else if (cur->val > num) cur = cur->left;
            // 找到目标结点，跳出循环
            else break;
        }
        // 返回目标结点
        return cur;
    }

    /* 插入结点 */
    TreeNode* insert(int num) {
        // 若树为空，直接提前返回
        if (root == nullptr) return nullptr;
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶结点后跳出
        while (cur != nullptr) {
            // 找到重复结点，直接返回
            if (cur->val == num) return nullptr;
            pre = cur;
            // 插入位置在 root 的右子树中
            if (cur->val < num) cur = cur->right;
            // 插入位置在 root 的左子树中
            else cur = cur->left;
        }
        // 插入结点 val
        TreeNode* node = new TreeNode(num);
        if (pre->val < num) pre->right = node;
        else pre->left = node;
        return node;
    }

    /* 删除结点 */
    TreeNode* remove(int num) {
        // 若树为空，直接提前返回
        if (root == nullptr) return nullptr;
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶结点后跳出
        while (cur != nullptr) {
            // 找到待删除结点，跳出循环
            if (cur->val == num) break;
            pre = cur;
            // 待删除结点在 root 的右子树中
            if (cur->val < num) cur = cur->right;
            // 待删除结点在 root 的左子树中
            else cur = cur->left;
        }
        // 若无待删除结点，则直接返回
        if (cur == nullptr) return nullptr;
        // 子结点数量 = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 当子结点数量 = 0 / 1 时， child = nullptr / 该子结点
            TreeNode* child = cur->left != nullptr ? cur->left : cur->right;
            // 删除结点 cur
            if (pre->left == cur) pre->left = child;
            else pre->right = child;
            // 释放内存
            delete cur;
        }
        // 子结点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个结点
            TreeNode* nex = getInOrderNext(cur->right);
            int tmp = nex->val;
            // 递归删除结点 nex
            remove(nex->val);
            // 将 nex 的值复制给 cur
            cur->val = tmp;
        }
        return cur;
    }

    /* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
    TreeNode* getInOrderNext(TreeNode* root) {
        if (root == nullptr) return root;
        // 循环访问左子结点，直到叶结点时为最小结点，跳出
        while (root->left != nullptr) {
            root = root->left;
        }
        return root;
    }
};


/* Driver Code */
int main() {
    /* 初始化二叉搜索树 */
    vector<int> nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
    BinarySearchTree* bst = new BinarySearchTree(nums);
    cout << endl << "初始化的二叉树为\n" << endl;
    PrintUtil::printTree(bst->getRoot());

    /* 查找结点 */
    TreeNode* node = bst->search(7);
    cout << endl << "查找到的结点对象为 " << node << "，结点值 = " << node->val << endl;

    /* 插入结点 */
    node = bst->insert(16);
    cout << endl << "插入结点 16 后，二叉树为\n" << endl;
    PrintUtil::printTree(bst->getRoot());

    /* 删除结点 */
    bst->remove(1);
    cout << endl << "删除结点 1 后，二叉树为\n" << endl;
    PrintUtil::printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "删除结点 2 后，二叉树为\n" << endl;
    PrintUtil::printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "删除结点 4 后，二叉树为\n" << endl;
    PrintUtil::printTree(bst->getRoot());

    // 释放内存
    delete bst;

    return 0;
}
