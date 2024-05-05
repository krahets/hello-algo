/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// Auxiliary array for storing traversal sequence
int arr[MAX_SIZE];

/* Pre-order traversal */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit priority: root node -> left subtree -> right subtree
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* In-order traversal */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* Post-order traversal */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
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

    /* Pre-order traversal */
    // Initialize auxiliary array
    size = 0;
    preOrder(root, &size);
    printf("Sequence of nodes in pre-order traversal = ");
    printArray(arr, size);

    /* In-order traversal */
    size = 0;
    inOrder(root, &size);
    printf("Sequence of nodes in in-order traversal = ");
    printArray(arr, size);

    /* Post-order traversal */
    size = 0;
    postOrder(root, &size);
    printf("Sequence of nodes in post-order traversal = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
