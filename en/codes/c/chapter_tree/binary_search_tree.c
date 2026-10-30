/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Binary search tree structure */
typedef struct {
    TreeNode *root;
} BinarySearchTree;

/* Constructor */
BinarySearchTree *newBinarySearchTree() {
    // Initialize an empty tree
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* Destructor */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* Get the root of the binary tree */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* Find a node */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // Search in a loop until reaching a null reference beyond a leaf
    while (cur != NULL) {
        if (cur->val < num) {
            // The target node lies in the right subtree of cur
            cur = cur->right;
        } else if (cur->val > num) {
            // The target node lies in the left subtree of cur
            cur = cur->left;
        } else {
            // The target node was found; exit the loop
            break;
        }
    }
    // Return the target node
    return cur;
}

/* Insert a node */
void insert(BinarySearchTree *bst, int num) {
    // If the tree is empty, initialize the root node
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // Search in a loop until reaching a null reference beyond a leaf
    while (cur != NULL) {
        // Return immediately if a duplicate node is found
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // The insertion position lies in the right subtree of cur
            cur = cur->right;
        } else {
            // The insertion position lies in the left subtree of cur
            cur = cur->left;
        }
    }
    // Insert a node
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* Remove a node */
// The name remove conflicts with the function declared in stdio.h
void removeItem(BinarySearchTree *bst, int num) {
    // Return immediately if the tree is empty
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Search in a loop until reaching a null reference beyond a leaf
    while (cur != NULL) {
        // The node to remove was found; exit the loop
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // The node to remove is in cur's right subtree
            cur = cur->right;
        } else {
            // The node to remove is in cur's left subtree
            cur = cur->left;
        }
    }
    // Return immediately if the node to remove does not exist
    if (cur == NULL)
        return;
    // Check whether the node to remove has children
    if (cur->left == NULL || cur->right == NULL) {
        /* Number of children = 0 or 1 */
        // With 0 or 1 child, child is NULL or that child, respectively
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // Remove node cur
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // Free memory
        free(cur);
    } else {
        /* Number of children = 2 */
        // Get the inorder successor of cur
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // Recursively remove node tmp
        removeItem(bst, tmp->val);
        // Replace the value of cur with the value of tmp
        cur->val = tmpVal;
    }
}

/* Driver code */
int main() {
    /* Initialize the binary search tree */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("Binary tree after initialization:\n");
    printTree(getRoot(bst));

    /* Find a node */
    TreeNode *node = search(bst, 7);
    printf("Value of the node found = %d\n", node->val);

    /* Insert a node */
    insert(bst, 16);
    printf("Binary tree after inserting node 16:\n");
    printTree(getRoot(bst));

    /* Remove a node */
    removeItem(bst, 1);
    printf("Binary tree after removing node 1:\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("Binary tree after removing node 2:\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("Binary tree after removing node 4:\n");
    printTree(getRoot(bst));

    // Free memory
    delBinarySearchTree(bst);
    return 0;
}
