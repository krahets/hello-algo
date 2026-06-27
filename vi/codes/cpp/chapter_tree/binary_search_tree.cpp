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
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Target node is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Target node is in cur's left subtree
            else if (cur->val > num)
                cur = cur->left;
            // Found target node, exit loop
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
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Found duplicate node, return directly
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
        // If tree is empty, return directly
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Loop search, exit after passing leaf node
        while (cur != nullptr) {
            // Found node to delete, exit loop
            if (cur->val == num)
                break;
            pre = cur;
            // Node to delete is in cur's right subtree
            if (cur->val < num)
                cur = cur->right;
            // Node to delete is in cur's left subtree
            else
                cur = cur->left;
        }
        // If no node to delete, return directly
        if (cur == nullptr)
            return;
        // Number of child nodes = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // When number of child nodes = 0 / 1, child = nullptr / that child node
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Delete node cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // If deleted node is root node, reassign root node
                root = child;
            }
            // Free memory
            delete cur;
        }
        // Number of child nodes = 2
        else {
            // Get next node of cur in inorder traversal
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Recursively delete node tmp
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
    // Please note that different insertion orders will generate different binary trees, this sequence can generate a perfect binary tree
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "Initialized binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Search node */
    TreeNode *node = bst->search(7);
    cout << endl << "Found node object is " << node << ", node value = " << node->val << endl;

    /* Insert node */
    bst->insert(16);
    cout << endl << "After inserting node 16, binary tree is\n" << endl;
    printTree(bst->getRoot());

    /* Remove node */
    bst->remove(1);
    cout << endl << "After removing node 1, binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "After removing node 2, binary tree is\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "After removing node 4, binary tree is\n" << endl;
    printTree(bst->getRoot());

    // Free memory
    delete bst;

    return 0;
}
