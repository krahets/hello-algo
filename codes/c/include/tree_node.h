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

#define NIL ('#')
#define MAX_NODE_SIZE 5000

struct TreeNode {
    int val;
    int height;
    struct TreeNode *left;
    struct TreeNode *right;
};

typedef struct TreeNode TreeNode;


TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *) malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

/**
 * @brief Generate a binary tree with an array
 *
 * @param arr
 * @param size
 * @return TreeNode *
 */
TreeNode *arrToTree(const int *arr, size_t size) {
    if (size <= 0) {
        return NULL;
    }

    int front, rear, index;
    TreeNode *root, *node;
    TreeNode **queue;

    /* 根结点 */
    root = newTreeNode(arr[0]);
    /* 辅助队列 */
    queue = (TreeNode **) malloc(sizeof(TreeNode) * MAX_NODE_SIZE);
    // 队列指针
    front = 0, rear = 0;
    // 将根结点放入队尾
    queue[rear++] = root;
    // 记录遍历数组的索引
    index = 0;
    while (front < rear) {
        // 取队列中的头结点，并让头结点出队
        node = queue[front++];
        index++;
        if (index < size) {
            if (arr[index] != NIL) {
                node->left = newTreeNode(arr[index]);
                queue[rear++] = node->left;
            }
        }
        index++;
        if (index < size) {
            if (arr[index] != NIL) {
                node->right = newTreeNode(arr[index]);
                queue[rear++] = node->right;
            }
        }
    }
    return root;
}


/**
 * @brief Generate a binary tree with an array
 *
 * @param arr
 * @param size
 * @return TreeNode *
 */
int *treeToArr(TreeNode *root) {
    if (root == NULL) {
        return NULL;
    }
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;
    /* 辅助队列 */
    queue = (TreeNode **) malloc(sizeof(TreeNode) * MAX_NODE_SIZE);
    // 队列指针
    front = 0, rear = 0;
    // 将根结点放入队尾
    queue[rear++] = root;
    /* 辅助数组 */
    arr = (int *) malloc(sizeof(int) * MAX_NODE_SIZE);
    // 数组指针
    index = 0;
    while (front < rear) {
        // 取队列中的头结点，并让头结点出队
        node = queue[front++];
        if (node != NULL) {
            arr[index] = node->val;
            queue[rear++] = node->left;
            queue[rear++] = node->right;
        } else {
            arr[index] = NIL;
        }
        index++;
    }
    return arr;
}

#ifdef __cplusplus
}
#endif

#endif // TREE_NODE_H
