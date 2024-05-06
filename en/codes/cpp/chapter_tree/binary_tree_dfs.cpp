/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Initialize the list for storing traversal sequences
vector<int> vec;

/* Pre-order traversal */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit priority: root node -> left subtree -> right subtree
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* In-order traversal */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Post-order traversal */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit priority: left subtree -> right subtree -> root node
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Use a specific function to convert an array into a binary tree
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Pre-order traversal */
    vec.clear();
    preOrder(root);
    cout << endl << "Sequence of nodes in pre-order traversal = ";
    printVector(vec);

    /* In-order traversal */
    vec.clear();
    inOrder(root);
    cout << endl << "Sequence of nodes in in-order traversal = ";
    printVector(vec);

    /* Post-order traversal */
    vec.clear();
    postOrder(root);
    cout << endl << "Sequence of nodes in post-order traversal = ";
    printVector(vec);

    return 0;
}
