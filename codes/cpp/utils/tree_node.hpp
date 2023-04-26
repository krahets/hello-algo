/**
 * File: tree_node.hpp
 * Created Time: 2021-12-19
 * Author: Krahets (krahets@163.com)
 */

#pragma once

#include <limits.h>

/* Definition for a binary tree node */
struct TreeNode {
    int val{};
    int height = 0;
    TreeNode *parent{};
    TreeNode *left{};
    TreeNode *right{};
    TreeNode() = default;
    explicit TreeNode(int x, TreeNode *parent = nullptr) : val(x), parent(parent) {
    }
};

/* Generate a binary tree with a vector */
TreeNode *vecToTree(vector<int> list) {
    if (list.empty())
        return nullptr;

    auto *root = new TreeNode(list[0]);
    queue<TreeNode *> que;
    que.emplace(root);
    size_t n = list.size(), i = 0;
    while (!que.empty()) {
        auto node = que.front();
        que.pop();
        if (++i >= n)
            break;
        // INT_MAX represent null
        if (list[i] != INT_MAX) {
            node->left = new TreeNode(list[i]);
            que.emplace(node->left);
        }
        if (++i >= n)
            break;
        if (list[i] != INT_MAX) {
            node->right = new TreeNode(list[i]);
            que.emplace(node->right);
        }
    }

    return root;
}

/* Get a tree node with specific value in a binary tree */
TreeNode *getTreeNode(TreeNode *root, int val) {
    if (root == nullptr)
        return nullptr;
    if (root->val == val)
        return root;
    TreeNode *left = getTreeNode(root->left, val);
    TreeNode *right = getTreeNode(root->right, val);
    return left != nullptr ? left : right;
}

/* Free the memory allocated to a tree */
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    // 释放内存
    delete root;
}
