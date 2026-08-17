/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL tree structure */
typedef struct {
    TreeNode *root;
} AVLTree;

/* Constructor */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* Destructor */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* Get node height */
int height(TreeNode *node) {
    // Empty node height is -1, leaf node height is 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* Update node height */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // Node height equals the height of the tallest subtree + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* Get balance factor */
int balanceFactor(TreeNode *node) {
    // Empty node balance factor is 0
    if (node == NULL) {
        return 0;
    }
    // Node balance factor = left subtree height - right subtree height
    return height(node->left) - height(node->right);
}

/* Right rotation operation */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // Using child as pivot, rotate node to the right
    child->right = node;
    node->left = grandChild;
    // Update node height
    updateHeight(node);
    updateHeight(child);
    // Return root node of subtree after rotation
    return child;
}

/* Left rotation operation */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // Using child as pivot, rotate node to the left
    child->left = node;
    node->right = grandChild;
    // Update node height
    updateHeight(node);
    updateHeight(child);
    // Return root node of subtree after rotation
    return child;
}

/* Perform rotation operation to restore balance to this subtree */
TreeNode *rotate(TreeNode *node) {
    // Get balance factor of node
    int bf = balanceFactor(node);
    // Left-leaning tree
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // Right rotation
            return rightRotate(node);
        } else {
            // First left rotation then right rotation
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // Right-leaning tree
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // Left rotation
            return leftRotate(node);
        } else {
            // First right rotation then left rotation
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // Balanced tree, no rotation needed, return directly
    return node;
}

/* Recursively insert node (helper function) */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. Find insertion position and insert node */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // Duplicate node not inserted, return directly
        return node;
    }
    // Update node height
    updateHeight(node);
    /* 2. Perform rotation operation to restore balance to this subtree */
    node = rotate(node);
    // Return root node of subtree
    return node;
}

/* Insert node */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* Recursively remove node (helper function) */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. Find node and delete */
    if (val < node->val) {
        node->left = removeHelper(node->left, val);
    } else if (val > node->val) {
        node->right = removeHelper(node->right, val);
    } else {
        if (node->left == NULL || node->right == NULL) {
            child = node->left;
            if (node->right != NULL) {
                child = node->right;
            }
            // Number of child nodes = 0, delete node directly and return
            if (child == NULL) {
                return NULL;
            } else {
                // Number of child nodes = 1, delete node directly
                node = child;
            }
        } else {
            // Number of child nodes = 2, delete the next node in inorder traversal and replace current node with it
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // Update node height
    updateHeight(node);
    /* 2. Perform rotation operation to restore balance to this subtree */
    node = rotate(node);
    // Return root node of subtree
    return node;
}

/* Remove node */
// Cannot use remove keyword here due to stdio.h inclusion
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* Search node */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // Loop search, exit after passing leaf node
    while (cur != NULL) {
        if (cur->val < val) {
            // Target node is in cur's right subtree
            cur = cur->right;
        } else if (cur->val > val) {
            // Target node is in cur's left subtree
            cur = cur->left;
        } else {
            // Found target node, exit loop
            break;
        }
    }
    // Found target node, exit loop
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nAfter inserting node %d, AVL tree is \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nAfter removing node %d, AVL tree is \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* Please pay attention to how the AVL tree maintains balance after inserting nodes */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* Insert node */
    // Delete nodes
    testInsert(tree, 1);
    testInsert(tree, 2);
    testInsert(tree, 3);
    testInsert(tree, 4);
    testInsert(tree, 5);
    testInsert(tree, 8);
    testInsert(tree, 7);
    testInsert(tree, 9);
    testInsert(tree, 10);
    testInsert(tree, 6);

    /* Please pay attention to how the AVL tree maintains balance after deleting nodes */
    testInsert(tree, 7);

    /* Remove node */
    // Delete node with degree 1
    testRemove(tree, 8); // Delete node with degree 2
    testRemove(tree, 5); // Remove node with degree 1
    testRemove(tree, 4); // Remove node with degree 2

    /* Search node */
    TreeNode *node = search(tree, 7);
    printf("\nFound node object value = %d \n", node->val);

    // Free memory
    delAVLTree(tree);
    return 0;
}
