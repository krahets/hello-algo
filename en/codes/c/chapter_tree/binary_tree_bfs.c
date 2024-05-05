/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Level-order traversal */
int *levelOrder(TreeNode *root, int *size) {
    /* Auxiliary queue */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* Auxiliary queue */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // Queue pointer
    front = 0, rear = 0;
    // Add root node
    queue[rear++] = root;
    // Initialize a list to store the traversal sequence
    /* Auxiliary array */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // Array pointer
    index = 0;
    while (front < rear) {
        // Queue dequeues
        node = queue[front++];
        // Save node value
        arr[index++] = node->val;
        if (node->left != NULL) {
            // Left child node enqueues
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // Right child node enqueues
            queue[rear++] = node->right;
        }
    }
    // Update array length value
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // Free auxiliary array space
    free(queue);
    return arr;
}

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Use a specific function to convert an array into a binary tree
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("Initialize binary tree\n");
    printTree(root);

    /* Level-order traversal */
    // Required input array length
    int *arr = levelOrder(root, &size);
    printf("Sequence of nodes in level-order traversal = ");
    printArray(arr, size);

    // Free memory
    freeMemoryTree(root);
    free(arr);
    return 0;
}
