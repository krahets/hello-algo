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
    // Queue indices
    front = 0, rear = 0;
    // Enqueue the root node
    queue[rear++] = root;
    // Initialize a list to store the traversal sequence
    /* Auxiliary array */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // Array index
    index = 0;
    while (front < rear) {
        // Dequeue from the queue
        node = queue[front++];
        // Store the node value
        arr[index++] = node->val;
        if (node->left != NULL) {
            // Enqueue the left child
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // Enqueue the right child
            queue[rear++] = node->right;
        }
    }
    // Update the array length
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // Free the auxiliary queue array
    free(queue);
    return arr;
}

/* Driver code */
int main() {
    /* Initialize the binary tree */
    // Use a helper function that builds a binary tree directly from an array
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("Initialize the binary tree\n");
    printTree(root);

    /* Level-order traversal */
    // Pass a pointer to receive the array length
    int *arr = levelOrder(root, &size);
    printf("Node sequence from level-order traversal = ");
    printArray(arr, size);

    // Free memory
    freeMemoryTree(root);
    free(arr);
    return 0;
}
