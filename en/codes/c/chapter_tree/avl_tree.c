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

/* Get the node height */
int height(TreeNode *node) {
    // A null node has height -1; a leaf has height 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* Update the node height */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // The node height equals the height of its taller subtree + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* Get the balance factor */
int balanceFactor(TreeNode *node) {
    // A null node has balance factor 0
    if (node == NULL) {
        return 0;
    }
    // Node balance factor = left subtree height - right subtree height
    return height(node->left) - height(node->right);
}

/* Right rotation */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // Rotate node to the right around child
    child->right = node;
    node->left = grandChild;
    // Update the node height
    updateHeight(node);
    updateHeight(child);
    // Return the root of the rotated subtree
    return child;
}

/* Left rotation */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // Rotate node to the left around child
    child->left = node;
    node->right = grandChild;
    // Update the node height
    updateHeight(node);
    updateHeight(child);
    // Return the root of the rotated subtree
    return child;
}

/* Perform rotations to restore balance in this subtree */
TreeNode *rotate(TreeNode *node) {
    // Get the balance factor of node
    int bf = balanceFactor(node);
    // Left-heavy tree
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // Rotate right
            return rightRotate(node);
        } else {
            // Rotate left, then right
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // Right-heavy tree
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // Rotate left
            return leftRotate(node);
        } else {
            // Rotate right, then left
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // The tree is balanced; return without rotating
    return node;
}

/* Recursively insert a node (helper function) */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. Find the insertion position and insert the node */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // Return without inserting a duplicate node
        return node;
    }
    // Update the node height
    updateHeight(node);
    /* 2. Perform rotations to restore balance in this subtree */
    node = rotate(node);
    // Return the root of the subtree
    return node;
}

/* Insert a node */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* Recursively remove a node (helper function) */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. Find and remove the node */
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
            // Number of children = 0: remove node and return
            if (child == NULL) {
                return NULL;
            } else {
                // Number of children = 1: remove node directly
                node = child;
            }
        } else {
            // Number of children = 2: remove the inorder successor and use its value to replace the current node value
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // Update the node height
    updateHeight(node);
    /* 2. Perform rotations to restore balance in this subtree */
    node = rotate(node);
    // Return the root of the subtree
    return node;
}

/* Remove a node */
// The name remove conflicts with the function declared in stdio.h
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* Find a node */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // Search in a loop until reaching a null reference beyond a leaf
    while (cur != NULL) {
        if (cur->val < val) {
            // The target node lies in the right subtree of cur
            cur = cur->right;
        } else if (cur->val > val) {
            // The target node lies in the left subtree of cur
            cur = cur->left;
        } else {
            // The target node was found; exit the loop
            break;
        }
    }
    // Return the matching node, or NULL if no match was found
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nAVL tree after inserting node %d: \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nAVL tree after removing node %d: \n", val);
    printTree(tree->root);
}

/* Driver code */
int main() {
    /* Initialize an empty AVL tree */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* Insert a node */
    // Observe how the AVL tree maintains balance after a node is inserted
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

    /* Insert a duplicate node */
    testInsert(tree, 7);

    /* Remove a node */
    // Observe how the AVL tree maintains balance after a node is removed
    testRemove(tree, 8); // Remove a node with 0 children
    testRemove(tree, 5); // Remove a node with 1 child
    testRemove(tree, 4); // Remove a node with 2 children

    /* Look up a node */
    TreeNode *node = search(tree, 7);
    printf("\nValue of the node found = %d \n", node->val);

    // Free memory
    delAVLTree(tree);
    return 0;
}
