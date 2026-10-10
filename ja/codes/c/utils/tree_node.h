/**
 * File: tree_node.h
 * Created Time: 2023-01-09
 * Author: Reanon (793584285@qq.com)
 */

#ifndef TREE_NODE_H
#define TREE_NODE_H

#ifdef __cplusplus
extern "C" {
#endif

#include <limits.h>

#define MAX_NODE_SIZE 5000

/* 二分木ノード構造体 */
typedef struct TreeNode {
    int val;                // ノード値
    int height;             // ノードの高さ
    struct TreeNode *left;  // 左の子ノードへのポインタ
    struct TreeNode *right; // 右の子ノードへのポインタ
} TreeNode;

/* コンストラクタ */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// シリアライズの符号化規則は以下を参照:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// 二分木の配列表現:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// 二分木の連結リスト表現:
// /——— 15
// /——— 7
// /——— 3
// |    \——— 6
// |        \——— 12
// ——— 1
// \——— 2
// |    /——— 9
// \——— 4
// \——— 8

/* リストを二分木にデシリアライズする: 再帰 */
TreeNode *arrayToTreeDFS(int *arr, int size, int i) {
    if (i < 0 || i >= size || arr[i] == INT_MAX) {
        return NULL;
    }
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = arr[i];
    root->left = arrayToTreeDFS(arr, size, 2 * i + 1);
    root->right = arrayToTreeDFS(arr, size, 2 * i + 2);
    return root;
}

/* リストを二分木にデシリアライズする */
TreeNode *arrayToTree(int *arr, int size) {
    return arrayToTreeDFS(arr, size, 0);
}

/* 二分木をリストにシリアライズする: 再帰 */
void treeToArrayDFS(TreeNode *root, int i, int *res, int *size) {
    if (root == NULL) {
        return;
    }
    while (i >= *size) {
        res = realloc(res, (*size + 1) * sizeof(int));
        res[*size] = INT_MAX;
        (*size)++;
    }
    res[i] = root->val;
    treeToArrayDFS(root->left, 2 * i + 1, res, size);
    treeToArrayDFS(root->right, 2 * i + 2, res, size);
}

/* 二分木をリストにシリアライズする */
int *treeToArray(TreeNode *root, int *size) {
    *size = 0;
    int *res = NULL;
    treeToArrayDFS(root, 0, res, size);
    return res;
}

/* 二分木のメモリを解放する */
void freeMemoryTree(TreeNode *root) {
    if (root == NULL)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    free(root);
}

#ifdef __cplusplus
}
#endif

#endif // TREE_NODE_H
