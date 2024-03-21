/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// 輔助陣列，用於儲存走訪序列
int arr[MAX_SIZE];

/* 前序走訪 */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* 中序走訪 */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* 後序走訪 */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("初始化二元樹\n");
    printTree(root);

    /* 前序走訪 */
    // 初始化輔助陣列
    size = 0;
    preOrder(root, &size);
    printf("前序走訪的節點列印序列 = ");
    printArray(arr, size);

    /* 中序走訪 */
    size = 0;
    inOrder(root, &size);
    printf("中序走訪的節點列印序列 = ");
    printArray(arr, size);

    /* 後序走訪 */
    size = 0;
    postOrder(root, &size);
    printf("後序走訪的節點列印序列 = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
