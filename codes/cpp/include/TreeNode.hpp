/*
 * File: PrintUtil.hpp
 * Created Time: 2021-12-19
 * Author: Krahets (krahets@163.com)
 */

#pragma once

/**
 * @brief Definition for a binary tree node
 * 
 */
struct TreeNode {
    int val{};
    int height = 0;
    TreeNode *parent{};
    TreeNode *left{};
    TreeNode *right{};
    TreeNode() = default;
    explicit TreeNode(int x, TreeNode *parent = nullptr) : val(x), parent(parent) {}
};

/**
 * @brief Generate a binary tree with a vector
 * 
 * @param list 
 * @return TreeNode* 
 */
TreeNode *vecToTree(vector<int> list) {
    if (list.empty()) {
        return nullptr;
    }

    auto *root = new TreeNode(list[0]);
    queue<TreeNode *> que;
    size_t n = list.size(), index = 1;
    while (index < n) {
        auto node = que.front();
        que.pop();

        if (index < n) {
            node->left = new TreeNode(list[index++]);
            que.emplace(node->left);
        }
        if (index < n) {
            node->right = new TreeNode(list[index++]);
            que.emplace(node->right);
        }
    }

    return root;
}

/**
 * @brief Get a tree node with specific value in a binary tree
 * 
 * @param root 
 * @param val 
 * @return TreeNode* 
 */
TreeNode *getTreeNode(TreeNode *root, int val) {
    if (root == nullptr)
        return nullptr;
    if (root->val == val)
        return root;
    TreeNode *left = getTreeNode(root->left, val);
    TreeNode *right = getTreeNode(root->right, val);
    return left != nullptr ? left : right;
}
