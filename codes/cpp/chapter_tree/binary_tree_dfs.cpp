/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 移除全局变量、const 安全、可重入、鲁棒性
 */

#include "../utils/common.hpp"
#include <vector>
#include <iostream>

/* 前序遍历 */
void preOrder(const TreeNode* root, std::vector<int>& res) {
    if (root == nullptr)
        return;
    // 根 -> 左 -> 右
    res.push_back(root->val);
    preOrder(root->left, res);
    preOrder(root->right, res);
}

/* 中序遍历 */
void inOrder(const TreeNode* root, std::vector<int>& res) {
    if (root == nullptr)
        return;
    // 左 -> 根 -> 右
    inOrder(root->left, res);
    res.push_back(root->val);
    inOrder(root->right, res);
}

/* 后序遍历 */
void postOrder(const TreeNode* root, std::vector<int>& res) {
    if (root == nullptr)
        return;
    // 左 -> 右 -> 根
    postOrder(root->left, res);
    postOrder(root->right, res);
    res.push_back(root->val);
}

/* Driver Code */
int main() {
    // 初始化二叉树
    const std::vector<int> arr = {1, 2, 3, 4, 5, 6, 7};
    TreeNode* root = vectorToTree(arr);

    std::cout << "\n初始化二叉树\n";
    printTree(root);

    // 前序遍历
    std::vector<int> res;
    preOrder(root, res);
    std::cout << "\n前序遍历序列 = ";
    printVector(res);

    // 中序遍历
    res.clear();
    inOrder(root, res);
    std::cout << "\n中序遍历序列 = ";
    printVector(res);

    // 后序遍历
    res.clear();
    postOrder(root, res);
    std::cout << "\n后序遍历序列 = ";
    printVector(res);

    // 释放内存
    freeMemoryTree(root);

    return 0;
}
