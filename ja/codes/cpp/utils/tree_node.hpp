/**
 * File: tree_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <limits.h>
#include <vector>

using namespace std;

/* 二分木ノード構造 */
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

// シリアル化エンコーディング規則については以下を参照：
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// 二分木の配列表現：
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// 二分木の連結リスト表現：
//             /——— 15
//         /——— 7
//     /——— 3
//    |    \——— 6
//    |        \——— 12
// ——— 1
//     \——— 2
//        |    /——— 9
//         \——— 4
//             \——— 8

/* 配列を二分木に逆シリアル化する：再帰的 */
TreeNode *vectorToTreeDFS(vector<int> &arr, int i) {
    if (i < 0 || i >= arr.size() || arr[i] == INT_MAX) {
        return nullptr;
    }
    TreeNode *root = new TreeNode(arr[i]);
    root->left = vectorToTreeDFS(arr, 2 * i + 1);
    root->right = vectorToTreeDFS(arr, 2 * i + 2);
    return root;
}

/* 配列を二分木に逆シリアル化する */
TreeNode *vectorToTree(vector<int> arr) {
    return vectorToTreeDFS(arr, 0);
}

/* 二分木を配列にシリアル化する：再帰的 */
void treeToVecorDFS(TreeNode *root, int i, vector<int> &res) {
    if (root == nullptr)
        return;
    while (i >= res.size()) {
        res.push_back(INT_MAX);
    }
    res[i] = root->val;
    treeToVecorDFS(root->left, 2 * i + 1, res);
    treeToVecorDFS(root->right, 2 * i + 2, res);
}

/* 二分木を配列にシリアル化する */
vector<int> treeToVecor(TreeNode *root) {
    vector<int> res;
    treeToVecorDFS(root, 0, res);
    return res;
}

/* 二分木に割り当てられたメモリを解放する */
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    delete root;
}