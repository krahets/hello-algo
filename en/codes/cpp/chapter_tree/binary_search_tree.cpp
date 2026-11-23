/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search tree */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* Constructor */
    BinarySearchTree() {
        // Initialize an empty tree
        root = nullptr;
    }

    /* Destructor */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* Get the root of the binary tree */
    TreeNode *getRoot() {
        return root;
    }

    /* Find a node */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // The target node lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The target node lies in the left subtree of cur
            else if (cur->val > num)
                cur = cur->left;
            // The target node was found; exit the loop
            else
                break;
        }
        // Return the target node, or nullptr if it was not found
        return cur;
    }

    /* Insert a node */
    void insert(int num) {
        // If the tree is empty, initialize the root node
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // Return immediately if a duplicate node is found
            if (cur->val == num)
                return;
            pre = cur;
            // The insertion position lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The insertion position lies in the left subtree of cur
            else
                cur = cur->left;
        }
        // Insert a node
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* Remove a node */
    void remove(int num) {
        // Return immediately if the tree is empty
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Continue searching while the current node pointer is not null
        while (cur != nullptr) {
            // The node to remove was found; exit the loop
            if (cur->val == num)
                break;
            pre = cur;
            // The node to remove lies in the right subtree of cur
            if (cur->val < num)
                cur = cur->right;
            // The node to remove lies in the left subtree of cur
            else
                cur = cur->left;
        }
        // Return immediately if the node to remove does not exist
        if (cur == nullptr)
            return;
        // Number of children = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // With 0 or 1 child, child is nullptr or that child, respectively
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Remove node cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // If the removed node is the root, assign the new root
                root = child;
            }
            // Free memory
            delete cur;
        }
        // Number of children = 2
        else {
            // Get the inorder successor of cur
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively remove node tmp
            remove(tmp->val);
            // Replace the value of cur with the value of tmp
            cur->val = tmpVal;
        }
    }
};

/* Driver code */
int main() {
    /* Initialize the binary search tree */
    BinarySearchTree *bst = new BinarySearchTree();
    // Different insertion orders produce different binary trees; this sequence produces a perfect binary tree
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "Binary tree after initialization:\n" << endl;
    printTree(bst->getRoot());

    /* Find a node */
    TreeNode *node = bst->search(7);
    cout << endl << "Found node address: " << node << ", node value = " << node->val << endl;

    /* Insert a node */
    bst->insert(16);
    cout << endl << "Binary tree after inserting node 16:\n" << endl;
    printTree(bst->getRoot());

    /* Remove a node */
    bst->remove(1);
    cout << endl << "Binary tree after removing node 1:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "Binary tree after removing node 2:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "Binary tree after removing node 4:\n" << endl;
    printTree(bst->getRoot());

    // Free memory
    delete bst;

    return 0;
}
