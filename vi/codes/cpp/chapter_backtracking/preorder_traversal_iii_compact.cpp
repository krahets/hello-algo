/**
 * File: preorder_traversal_iii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* Preorder traversal: Example 3 */
void preOrder(TreeNode *root) {
    // Pruning
    if (root == nullptr || root->val == 3) {
        return;
    }
    // Attempt
    path.push_back(root);
    if (root->val == 7) {
        // Record solution
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // Backtrack
    path.pop_back();
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nInitialize binary tree" << endl;
    printTree(root);

    // Preorder traversal
    preOrder(root);

    cout << "\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
