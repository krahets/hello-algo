/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Initialize nodes
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // Build references (pointers) between nodes
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("Initialize binary tree\n");
    printTree(n1);

    /* Insert node P between n1 -> n2 */
    TreeNode *P = newTreeNode(0);
    // Delete node
    n1->left = P;
    P->left = n2;
    printf("After inserting node P\n");
    printTree(n1);

    // Remove node P
    n1->left = n2;
    // Free memory
    free(P);
    printf("After removing node P\n");
    printTree(n1);

    freeMemoryTree(n1);
    return 0;
}
