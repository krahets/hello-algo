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
    // Queue pointers
    front = 0, rear = 0;
    // Enqueue the root
    queue[rear++] = root;
    // Initialize a list to store the traversal sequence
    /* Auxiliary array */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // Array pointer
    index = 0;
    while (front < rear) {
        // Dequeue a node
        node = queue[front++];
        // Save the node value
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

    // Free the auxiliary array
    free(queue);
    return arr;
}

/* Driver code */
int main() {
    /* Initialize the binary tree */
    // Use a function that builds a binary tree directly from an array
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("Initialize the binary tree\n");
    printTree(root);

    /* Level-order traversal */
    // Pass in the array length
    int *arr = levelOrder(root, &size);
    printf("Nodes in level order = ");
    printArray(arr, size);

    // Free memory
    freeMemoryTree(root);
    free(arr);
    return 0;
}
