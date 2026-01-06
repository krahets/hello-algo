/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Initialize list for storing traversal sequence
vector<int> vec;

/* Preorder traversal */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit priority: root node -> left subtree -> right subtree
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Inorder traversal */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit priority: left subtree -> root node -> right subtree
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Postorder traversal */
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
    // Here we use a function to generate a binary tree directly from an array
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Preorder traversal */
    vec.clear();
    preOrder(root);
    cout << endl << "Pre-order traversal node print sequence = ";
    printVector(vec);

    /* Inorder traversal */
    vec.clear();
    inOrder(root);
    cout << endl << "In-order traversal node print sequence = ";
    printVector(vec);

    /* Postorder traversal */
    vec.clear();
    postOrder(root);
    cout << endl << "Post-order traversal node print sequence = ";
    printVector(vec);

    return 0;
}
