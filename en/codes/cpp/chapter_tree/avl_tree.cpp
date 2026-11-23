/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL tree */
class AVLTree {
  private:
    /* Update the node height */
    void updateHeight(TreeNode *node) {
        // The node height equals the height of its taller subtree + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* Right rotation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
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
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
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
        int _balanceFactor = balanceFactor(node);
        // Left-heavy tree
        if (_balanceFactor > 1) {
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
        if (_balanceFactor < -1) {
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

    /* Insert a node recursively (helper method) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Find the insertion position and insert the node */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Return without inserting a duplicate node
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }

    /* Remove a node recursively (helper method) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Find and remove the node */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Number of children = 0: remove node and return
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Number of children = 1: remove node directly
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Number of children = 2: remove the inorder successor and use its value to replace the current node value
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Update the node height
        /* 2. Perform rotations to restore balance in this subtree */
        node = rotate(node);
        // Return the root of the subtree
        return node;
    }

  public:
    TreeNode *root; // Root node

    /* Get the node height */
    int height(TreeNode *node) {
        // A null node has height -1; a leaf has height 0
        return node == nullptr ? -1 : node->height;
    }

    /* Get the balance factor */
    int balanceFactor(TreeNode *node) {
        // A null node has balance factor 0
        if (node == nullptr)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }

    /* Insert a node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Remove a node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Find a node */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // The target node lies in the right subtree of cur
            if (cur->val < val)
                cur = cur->right;
            // The target node lies in the left subtree of cur
            else if (cur->val > val)
                cur = cur->left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node, or nullptr if it was not found
        return cur;
    }

    /*Constructor*/
    AVLTree() : root(nullptr) {
    }

    /*Destructor*/
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree &tree, int val) {
    tree.insert(val);
    cout << "\nAfter inserting node " << val << " , the AVL tree is" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nAfter removing node " << val << " , the AVL tree is" << endl;
    printTree(tree.root);
}

/* Driver code */
int main() {
    /* Initialize an empty AVL tree */
    AVLTree avlTree;

    /* Insert a node */
    // Observe how the AVL tree maintains balance after a node is inserted
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* Insert a duplicate node */
    testInsert(avlTree, 7);

    /* Remove a node */
    // Observe how the AVL tree maintains balance after a node is removed
    testRemove(avlTree, 8); // Remove a node with 0 children
    testRemove(avlTree, 5); // Remove a node with 1 child
    testRemove(avlTree, 4); // Remove a node with 2 children

    /* Look up a node */
    TreeNode *node = avlTree.search(7);
    cout << "\nFound node address: " << node << ", node value = " << node->val << endl;
}
