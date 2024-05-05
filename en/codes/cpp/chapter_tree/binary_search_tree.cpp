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
        // Initialize empty tree
        root = nullptr;
    }

    /* Destructor */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* Get binary tree root node */
    TreeNode *getRoot() {
        return root;
    }

    /* Search node */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Loop find, break after passing leaf nodes
        while (cur != nullptr) {
            // Target node is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Target node is in cur's left subtree
            else if (cur->val > num)
                cur = cur->left;
            // Found target node, break loop
            else
                break;
        }
        // Return target node
        return cur;
    }

    /* Insert node */
    void insert(int num) {
        // If tree is empty, initialize root node
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Loop find, break after passing leaf nodes
        while (cur != nullptr) {
            // Found duplicate node, thus return
            if (cur->val == num)
                return;
            pre = cur;
            // Insertion position is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Insertion position is in cur's left subtree
            else
                cur = cur->left;
        }
        // Insert node
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* Remove node */
    void remove(int num) {
        // If tree is empty, return
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Loop find, break after passing leaf nodes
        while (cur != nullptr) {
            // Found node to be removed, break loop
            if (cur->val == num)
                break;
            pre = cur;
            // Node to be removed is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Node to be removed is in cur's left subtree
            else
                cur = cur->left;
        }
        // If no node to be removed, return
        if (cur == nullptr)
            return;
        // Number of child nodes = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // When the number of child nodes = 0 / 1, child = nullptr / that child node
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Remove node cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // If the removed node is the root, reassign the root
                root = child;
            }
            // Free memory
            delete cur;
        }
        // Number of child nodes = 2
        else {
            // Get the next node in in-order traversal of cur
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively remove node tmp
            remove(tmp->val);
            // Replace cur with tmp
            cur->val = tmpVal;
        }
    }
};

/* Driver Code */
int main() {
    /* Initialize binary search tree */
    BinarySearchTree *bst = new BinarySearchTree();
    // Note that different insertion orders can result in various tree structures. This particular sequence creates a perfect binary tree
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "The initialized binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Search node */
    TreeNode *node = bst->search(7);
    cout << endl << "The found node object is " << node << ", node value =" << node->val << endl;

    /* Insert node */
    bst->insert(16);
    cout << endl << "After inserting node 16, the binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Remove node */
    bst->remove(1);
    cout << endl << "After removing node 1, the binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "After removing node 2, the binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "After removing node 4, the binary tree is\n" << endl;
    printTree(bst->getRoot());

    // Free memory
    delete bst;

    return 0;
}
