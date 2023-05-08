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

/* 二叉树节点结构体 */
struct TreeNode {
    int val;                // 节点值
    int height;             // 节点高度
    struct TreeNode *left;  // 左子节点指针
    struct TreeNode *right; // 右子节点指针
};

typedef struct TreeNode TreeNode;

TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

/* Generate a binary tree with an array */
TreeNode *arrToTree(const int *arr, size_t size) {
    if (size <= 0) {
        return NULL;
    }

    int front, rear, index;
    TreeNode *root, *node;
    TreeNode **queue;

    /* 根节点 */
    root = newTreeNode(arr[0]);
    /* 辅助队列 */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_NODE_SIZE);
    // 队列指针
    front = 0, rear = 0;
    // 将根节点放入队尾
    queue[rear++] = root;
    // 记录遍历数组的索引
    index = 0;
    while (front < rear) {
        // 取队列中的头节点，并让头节点出队
        node = queue[front++];
        index++;
        if (index < size) {
            // represent null with INT_MAX
            if (arr[index] != INT_MAX) {
                node->left = newTreeNode(arr[index]);
                queue[rear++] = node->left;
            }
        }
        index++;
        if (index < size) {
            if (arr[index] != INT_MAX) {
                node->right = newTreeNode(arr[index]);
                queue[rear++] = node->right;
            }
        }
    }
    // 释放辅助队列空间
    free(queue);
    return root;
}

/* Generate a binary tree with an array */
int *treeToArr(TreeNode *root) {
    if (root == NULL) {
        return NULL;
    }
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;
    /* 辅助队列 */
    queue = (TreeNode **)malloc(sizeof(TreeNode) * MAX_NODE_SIZE);
    // 队列指针
    front = 0, rear = 0;
    // 将根节点放入队尾
    queue[rear++] = root;
    /* 辅助数组 */
    arr = (int *)malloc(sizeof(int) * MAX_NODE_SIZE);
    // 数组指针
    index = 0;
    while (front < rear) {
        // 取队列中的头节点，并让头节点出队
        node = queue[front++];
        if (node != NULL) {
            arr[index] = node->val;
            queue[rear++] = node->left;
            queue[rear++] = node->right;
        } else {
            arr[index] = INT_MAX;
        }
        index++;
    }
    return arr;
}

/* Free the memory allocated to a tree */
void freeMemoryTree(TreeNode *root) {
    if (root == NULL)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    // 释放内存
    free(root);
}
#ifdef __cplusplus
}
#endif

#endif // TREE_NODE_H
