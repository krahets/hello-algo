/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 层序遍历 */
int *levelOrder(TreeNode *root, int *size) {
    /* 辅助队列 */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* 辅助队列 */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // 队列指针
    front = 0, rear = 0;
    // 加入根节点
    queue[rear++] = root;
    // 初始化一个列表，用于保存遍历序列
    /* 辅助数组 */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // 数组指针
    index = 0;
    while (front < rear) {
        // 队列出队
        node = queue[front++];
        // 保存节点值
        arr[index++] = node->val;
        if (node->left != NULL) {
            // 左子节点入队
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // 右子节点入队
            queue[rear++] = node->right;
        }
    }
    // 更新数组长度的值
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // 释放辅助数组空间
    free(queue);
    return arr;
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

    /* 层序遍历 */
    // 需要传入数组的长度
    int *arr = levelOrder(root, &size);
    printf("层序遍历的节点打印序列 = ");
    printArray(arr, size);

    // 释放内存
    freeMemoryTree(root);
    free(arr);
    return 0;
}
