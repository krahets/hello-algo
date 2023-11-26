/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// 辅助数组，用于存储遍历序列
int arr[MAX_SIZE];

/* 前序遍历 */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 访问优先级：根节点 -> 左子树 -> 右子树
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* 中序遍历 */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 访问优先级：左子树 -> 根节点 -> 右子树
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* 后序遍历 */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 访问优先级：左子树 -> 右子树 -> 根节点
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* Driver Code */
int main() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("初始化二叉树\n");
    printTree(root);

    /* 前序遍历 */
    // 初始化辅助数组
    size = 0;
    preOrder(root, &size);
    printf("前序遍历的节点打印序列 = ");
    printArray(arr, size);

    /* 中序遍历 */
    size = 0;
    inOrder(root, &size);
    printf("中序遍历的节点打印序列 = ");
    printArray(arr, size);

    /* 后序遍历 */
    size = 0;
    postOrder(root, &size);
    printf("后序遍历的节点打印序列 = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
