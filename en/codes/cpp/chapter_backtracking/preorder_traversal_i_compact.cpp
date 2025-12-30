/**
 * File: preorder_traversal_i_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> res;

/* Preorder traversal: Example 1 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    if (root->val == 7) {
        // Record solution
        res.push_back(root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nInitialize binary tree" << endl;
    printTree(root);

    // Preorder traversal
    preOrder(root);

    cout << "\nOutput all nodes with value 7" << endl;
    vector<int> vals;
    for (TreeNode *node : res) {
        vals.push_back(node->val);
    }
    printVector(vals);
}
