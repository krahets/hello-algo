/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* Pre-order traversal: Example two */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
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
    // Retract
    path.pop_back();
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nInitialize binary tree" << endl;
    printTree(root);

    // Pre-order traversal
    preOrder(root);

    cout << "\nOutput all root-to-node 7 paths" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
