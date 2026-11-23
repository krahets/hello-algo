/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// 走査順序を格納する補助配列
int arr[MAX_SIZE];

/* 行きがけ順走査 */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問順序：根ノード -> 左部分木 -> 右部分木
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* 通りがけ順走査 */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問順序：左部分木 -> 根ノード -> 右部分木
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* 帰りがけ順走査 */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問順序：左部分木 -> 右部分木 -> 根ノード
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* 実行用コード */
int main() {
    /* 二分木を初期化する */
    // ここでは配列から二分木を直接生成する関数を使う
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("二分木を初期化する\n");
    printTree(root);

    /* 行きがけ順走査 */
    // 補助配列を初期化する
    size = 0;
    preOrder(root, &size);
    printf("行きがけ順走査で表示するノードの順序 = ");
    printArray(arr, size);

    /* 通りがけ順走査 */
    size = 0;
    inOrder(root, &size);
    printf("通りがけ順走査で表示するノードの順序 = ");
    printArray(arr, size);

    /* 帰りがけ順走査 */
    size = 0;
    postOrder(root, &size);
    printf("帰りがけ順走査で表示するノードの順序 = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
