/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* 前順走査：例題 2 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // 試す
    path.push_back(root);
    if (root->val == 7) {
        // 解を記録
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // バックトラック
    path.pop_back();
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // 先行順走査
    preOrder(root);

    cout << "\n根ノードからノード 7 までのすべての経路を出力" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
