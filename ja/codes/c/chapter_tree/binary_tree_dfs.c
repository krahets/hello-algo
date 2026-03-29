/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// 走査順序を格納するための補助配列
int arr[MAX_SIZE];

/* 先行順走査 */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* 中順走査 */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問優先順: 左部分木 -> 根ノード -> 右部分木
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* 後順走査 */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* Driver Code */
int main() {
    /* 二分木を初期化 */
    // ここでは、配列から直接二分木を生成する関数を利用する
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("二分木を初期化\n");
    printTree(root);

    /* 先行順走査 */
    // 補助配列を初期化する
    size = 0;
    preOrder(root, &size);
    printf("前順走査のノード出力シーケンス = ");
    printArray(arr, size);

    /* 中順走査 */
    size = 0;
    inOrder(root, &size);
    printf("中順走査のノード出力シーケンス = ");
    printArray(arr, size);

    /* 後順走査 */
    size = 0;
    postOrder(root, &size);
    printf("後順走査のノード出力シーケンス = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
