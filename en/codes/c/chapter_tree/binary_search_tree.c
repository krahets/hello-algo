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
    // Initialize empty tree
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* Destructor */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* Get binary tree root node */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* Search node */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // Loop find, break after passing leaf nodes
    while (cur != NULL) {
        if (cur->val < num) {
            // Target node is in cur's right subtree
            cur = cur->right;
        } else if (cur->val > num) {
            // Target node is in cur's left subtree
            cur = cur->left;
        } else {
            // Found target node, break loop
            break;
        }
    }
    // Return target node
    return cur;
}

/* Insert node */
void insert(BinarySearchTree *bst, int num) {
    // If tree is empty, initialize root node
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // Loop find, break after passing leaf nodes
    while (cur != NULL) {
        // Found duplicate node, thus return
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // Insertion position is in cur's right subtree
            cur = cur->right;
        } else {
            // Insertion position is in cur's left subtree
            cur = cur->left;
        }
    }
    // Insert node
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* Remove node */
// Due to the inclusion of stdio.h, cannot use the keyword 'remove' here
void removeItem(BinarySearchTree *bst, int num) {
    // If tree is empty, return
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Loop find, break after passing leaf nodes
    while (cur != NULL) {
        // Found node to be removed, break loop
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // The node to be removed is in the right subtree of root
            cur = cur->right;
        } else {
            // The node to be removed is in the left subtree of root
            cur = cur->left;
        }
    }
    // If no node to be removed, return
    if (cur == NULL)
        return;
    // Determine if the node to be removed has child nodes
    if (cur->left == NULL || cur->right == NULL) {
        /* Number of child nodes = 0 or 1 */
        // When the number of child nodes = 0 / 1, child = nullptr / that child node
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
        /* Number of child nodes = 2 */
        // Get the next node in in-order traversal of cur
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // Recursively remove node tmp
        removeItem(bst, tmp->val);
        // Replace cur with tmp
        cur->val = tmpVal;
    }
}

/* Driver Code */
int main() {
    /* Initialize binary search tree */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("The initialized binary tree is\n");
    printTree(getRoot(bst));

    /* Search node */
    TreeNode *node = search(bst, 7);
    printf("Found node object's node value = %d\n", node->val);

    /* Insert node */
    insert(bst, 16);
    printf("After inserting node 16, the binary tree is\n");
    printTree(getRoot(bst));

    /* Remove node */
    removeItem(bst, 1);
    printf("After removing node 1, the binary tree is\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("After removing node 2, the binary tree is\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("After removing node 4, the binary tree is\n");
    printTree(getRoot(bst));

    // Free memory
    delBinarySearchTree(bst);
    return 0;
}
