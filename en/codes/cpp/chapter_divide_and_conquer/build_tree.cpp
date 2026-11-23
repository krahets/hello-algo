/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Build a binary tree: divide and conquer */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // Stop when the subtree interval is empty
    if (r - l < 0)
        return NULL;
    // Initialize the root node
    TreeNode *root = new TreeNode(preorder[i]);
    // Look up m to separate the left and right subtrees
    int m = inorderMap[preorder[i]];
    // Subproblem: build the left subtree
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Subproblem: build the right subtree
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Return the root node
    return root;
}

/* Build a binary tree */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // Initialize a hash table mapping each element in inorder to its index
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "Preorder traversal = ";
    printVector(preorder);
    cout << "Inorder traversal = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "Constructed binary tree:\n";
    printTree(root);

    return 0;
}
