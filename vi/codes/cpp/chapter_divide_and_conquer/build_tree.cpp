/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Build binary tree: divide and conquer */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // Terminate when the subtree interval is empty
    if (r - l < 0)
        return NULL;
    // Initialize the root node
    TreeNode *root = new TreeNode(preorder[i]);
    // Query m to divide the left and right subtrees
    int m = inorderMap[preorder[i]];
    // Subproblem: build the left subtree
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Subproblem: build the right subtree
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Return the root node
    return root;
}

/* Build binary tree */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // Initialize hash map, storing the mapping from inorder elements to indices
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver Code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "Preorder traversal = ";
    printVector(preorder);
    cout << "Inorder traversal = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "The constructed binary tree is:\n";
    printTree(root);

    return 0;
}
