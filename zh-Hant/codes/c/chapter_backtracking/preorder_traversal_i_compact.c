/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 假设结果长度不超过 100
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* 前序遍历：例题一 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 记录解
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二叉树\n");
    printTree(root);

    // 前序遍历
    preOrder(root);

    printf("\n输出所有值为 7 的节点\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // 释放内存
    freeMemoryTree(root);
    free(vals);
    return 0;
}
