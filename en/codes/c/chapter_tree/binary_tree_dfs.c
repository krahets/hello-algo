/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// Auxiliary array for storing the traversal sequence
int arr[MAX_SIZE];

/* Preorder traversal */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit order: root -> left subtree -> right subtree
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* Inorder traversal */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit order: left subtree -> root -> right subtree
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* Postorder traversal */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Visit order: left subtree -> right subtree -> root
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
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

    /* Preorder traversal */
    // Initialize the auxiliary array's element count
    size = 0;
    preOrder(root, &size);
    printf("Node sequence from preorder traversal = ");
    printArray(arr, size);

    /* Inorder traversal */
    size = 0;
    inOrder(root, &size);
    printf("Node sequence from inorder traversal = ");
    printArray(arr, size);

    /* Postorder traversal */
    size = 0;
    postOrder(root, &size);
    printf("Node sequence from postorder traversal = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
