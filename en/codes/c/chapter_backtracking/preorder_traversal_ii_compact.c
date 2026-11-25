/**
 * File: preorder_traversal_ii_compact.c
 * Created Time: 2023-05-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Assume the path and the result each have length at most 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Preorder traversal: example 2 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    // Try a choice
    path[pathSize++] = root;
    if (root->val == 7) {
        // Record the solution
        for (int i = 0; i < pathSize; ++i) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // Backtrack
    pathSize--;
}

/* Driver code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nInitialize the binary tree\n");
    printTree(root);

    // Preorder traversal
    preOrder(root);

    printf("\nPrint all paths from the root to a node with value 7\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Free the memory
    freeMemoryTree(root);
    return 0;
}
