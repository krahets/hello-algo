/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Initialize a list to store the traversal sequence
vector<int> vec;

/* Preorder traversal */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit order: root -> left subtree -> right subtree
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Inorder traversal */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit order: left subtree -> root -> right subtree
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Postorder traversal */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Visit order: left subtree -> right subtree -> root
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver code */
int main() {
    /* Initialize the binary tree */
    // Use a helper function that builds a binary tree directly from an array
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize the binary tree\n" << endl;
    printTree(root);

    /* Preorder traversal */
    vec.clear();
    preOrder(root);
    cout << endl << "Node sequence from preorder traversal = ";
    printVector(vec);

    /* Inorder traversal */
    vec.clear();
    inOrder(root);
    cout << endl << "Node sequence from inorder traversal = ";
    printVector(vec);

    /* Postorder traversal */
    vec.clear();
    postOrder(root);
    cout << endl << "Node sequence from postorder traversal = ";
    printVector(vec);

    return 0;
}
