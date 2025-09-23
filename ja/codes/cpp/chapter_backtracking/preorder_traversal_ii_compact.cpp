/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* 前順走査：例２ */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // 試行
    path.push_back(root);
    if (root->val == 7) {
        // 解を記録
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // 回退
    path.pop_back();
}

/* ドライバーコード */
int main() {
    vector<int> arr = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = vecToTree(arr);
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // 前順走査
    path.clear();
    res.clear();
    preOrder(root);

    cout << "\nルートからノード7までのすべてのパスを出力" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }

    return 0;
}