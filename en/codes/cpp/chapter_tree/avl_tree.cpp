/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL tree */
class AVLTree {
  private:
    /* Update node height */
    void updateHeight(TreeNode *node) {
        // Node height equals the height of the tallest subtree + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* Right rotation operation */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Rotate node to the right around child
        child->right = node;
        node->left = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Left rotation operation */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Rotate node to the left around child
        child->left = node;
        node->right = grandChild;
        // Update node height
        updateHeight(node);
        updateHeight(child);
        // Return the root of the subtree after rotation
        return child;
    }

    /* Perform rotation operation to restore balance to the subtree */
    TreeNode *rotate(TreeNode *node) {
        // Get the balance factor of node
        int _balanceFactor = balanceFactor(node);
        // Left-leaning tree
        if (_balanceFactor > 1) {
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
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Left rotation
                return leftRotate(node);
            } else {
                // First right rotation then left rotation
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Balanced tree, no rotation needed, return
        return node;
    }

    /* Recursively insert node (helper method) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Find insertion position and insert node */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Do not insert duplicate nodes, return
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = rotate(node);
        // Return the root node of the subtree
        return node;
    }

    /* Recursively remove node (helper method) */
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
                // Number of child nodes = 0, remove node and return
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Number of child nodes = 1, remove node
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Number of child nodes = 2, remove the next node in in-order traversal and replace the current node with it
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Update node height
        /* 2. Perform rotation operation to restore balance to the subtree */
        node = rotate(node);
        // Return the root node of the subtree
        return node;
    }

  public:
    TreeNode *root; // Root node

    /* Get node height */
    int height(TreeNode *node) {
        // Empty node height is -1, leaf node height is 0
        return node == nullptr ? -1 : node->height;
    }

    /* Get balance factor */
    int balanceFactor(TreeNode *node) {
        // Empty node balance factor is 0
        if (node == nullptr)
            return 0;
        // Node balance factor = left subtree height - right subtree height
        return height(node->left) - height(node->right);
    }

    /* Insert node */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Remove node */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Search node */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // Loop find, break after passing leaf nodes
        while (cur != nullptr) {
            // Target node is in cur's right subtree
            if (cur->val < val)
                cur = cur->right;
            // Target node is in cur's left subtree
            else if (cur->val > val)
                cur = cur->left;
            // Found target node, break loop
            else
                break;
        }
        // Return target node
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
    cout << "\nAfter inserting node " << val << ", the AVL tree is" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nAfter removing node " << val << ", the AVL tree is" << endl;
    printTree(tree.root);
}

/* Driver Code */
int main() {
    /* Initialize empty AVL tree */
    AVLTree avlTree;

    /* Insert node */
    // Notice how the AVL tree maintains balance after inserting nodes
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

    /* Insert duplicate node */
    testInsert(avlTree, 7);

    /* Remove node */
    // Notice how the AVL tree maintains balance after removing nodes
    testRemove(avlTree, 8); // Remove node with degree 0
    testRemove(avlTree, 5); // Remove node with degree 1
    testRemove(avlTree, 4); // Remove node with degree 2

    /* Search node */
    TreeNode *node = avlTree.search(7);
    cout << "\nThe found node object is " << node << ", node value =" << node->val << endl;
}
