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

/* 二元樹節點的結構體 */
typedef struct TreeNode {
    int val;                // 節點值
    int height;             // 節點高度
    struct TreeNode *left;  // 指向左子節點的指標
    struct TreeNode *right; // 指向右子節點的指標
} TreeNode;

/* 建構函式 */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// 序列化的編碼規則請參閱：
// https://www.hello-algo.com/zh-hant/chapter_tree/array_representation_of_tree/
// 二元樹的陣列表示法：
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// 二元樹的鏈結串列表示法：
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

/* 以遞迴方式將陣列反序列化為二元樹 */
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

/* 將陣列反序列化為二元樹 */
TreeNode *arrayToTree(int *arr, int size) {
    return arrayToTreeDFS(arr, size, 0);
}

/* 以遞迴方式將二元樹序列化為陣列 */
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

/* 將二元樹序列化為陣列 */
int *treeToArray(TreeNode *root, int *size) {
    *size = 0;
    int *res = NULL;
    treeToArrayDFS(root, 0, res, size);
    return res;
}

/* 釋放二元樹所占用的記憶體 */
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
