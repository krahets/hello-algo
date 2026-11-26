/**
 * File: tree_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <limits.h>
#include <vector>

using namespace std;

/* Структура узла двоичного дерева */
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

// Правила кодирования при сериализации описаны здесь:
// https://www.hello-algo.com/ru/chapter_tree/array_representation_of_tree/
// Двоичное дерево в виде массива:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// Двоичное дерево в виде связанных узлов:
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

/* Рекурсивно восстановить двоичное дерево из списка */
TreeNode *vectorToTreeDFS(vector<int> &arr, int i) {
    if (i < 0 || i >= arr.size() || arr[i] == INT_MAX) {
        return nullptr;
    }
    TreeNode *root = new TreeNode(arr[i]);
    root->left = vectorToTreeDFS(arr, 2 * i + 1);
    root->right = vectorToTreeDFS(arr, 2 * i + 2);
    return root;
}

/* Восстановить двоичное дерево из списка */
TreeNode *vectorToTree(vector<int> arr) {
    return vectorToTreeDFS(arr, 0);
}

/* Рекурсивно сериализовать двоичное дерево в список */
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

/* Сериализовать двоичное дерево в список */
vector<int> treeToVecor(TreeNode *root) {
    vector<int> res;
    treeToVecorDFS(root, 0, res);
    return res;
}

/* Освободить память, выделенную под двоичное дерево */
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    delete root;
}
