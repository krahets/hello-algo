/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Initialize node
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // Construct node references (pointers)
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(n1);

    /* Insert and remove nodes */
    TreeNode *P = new TreeNode(0);
    // Insert node P between n1 -> n2
    n1->left = P;
    P->left = n2;
    cout << endl << "After inserting node P\n" << endl;
    printTree(n1);
    // Remove node P
    n1->left = n2;
    delete P; // Free memory
    cout << endl << "After removing node P\n" << endl;
    printTree(n1);

    // Free memory
    freeMemoryTree(n1);

    return 0;
}
