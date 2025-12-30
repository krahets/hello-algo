/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Assume result length not exceeding 100
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* Preorder traversal: Example 1 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // Record solution
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nInitialize binary tree\n");
    printTree(root);

    // Preorder traversal
    preOrder(root);

    printf("\nOutput all nodes with value 7\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // Free memory
    freeMemoryTree(root);
    free(vals);
    return 0;
}
