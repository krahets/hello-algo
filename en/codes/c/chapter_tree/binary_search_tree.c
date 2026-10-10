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
    // Loop search, exit after passing leaf node
    while (cur != NULL) {
        if (cur->val < num) {
            // Target node is in cur's right subtree
            cur = cur->right;
        } else if (cur->val > num) {
            // Target node is in cur's left subtree
            cur = cur->left;
        } else {
            // Found target node, exit loop
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
    // Loop search, exit after passing leaf node
    while (cur != NULL) {
        // Found duplicate node, return directly
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
// Cannot use remove keyword here due to stdio.h inclusion
void removeItem(BinarySearchTree *bst, int num) {
    // If tree is empty, return directly
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Loop search, exit after passing leaf node
    while (cur != NULL) {
        // Found node to delete, exit loop
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // Node to delete is in right subtree of root
            cur = cur->right;
        } else {
            // Node to delete is in left subtree of root
            cur = cur->left;
        }
    }
    // If no node to delete, return directly
    if (cur == NULL)
        return;
    // Check if node to delete has children
    if (cur->left == NULL || cur->right == NULL) {
        /* Number of child nodes = 0 or 1 */
        // When number of child nodes = 0 / 1, child = nullptr / that child node
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // Delete node cur
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // Free memory
        free(cur);
    } else {
        /* Number of child nodes = 2 */
        // Get next node of cur in inorder traversal
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // Recursively delete node tmp
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
    printf("Initialized binary tree is\n");
    printTree(getRoot(bst));

    /* Search node */
    TreeNode *node = search(bst, 7);
    printf("Found node object value = %d\n", node->val);

    /* Insert node */
    insert(bst, 16);
    printf("After inserting node 16, binary tree is\n");
    printTree(getRoot(bst));

    /* Remove node */
    removeItem(bst, 1);
    printf("After removing node 1, binary tree is\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("After removing node 2, binary tree is\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("After removing node 4, binary tree is\n");
    printTree(getRoot(bst));

    // Free memory
    delBinarySearchTree(bst);
    return 0;
}
