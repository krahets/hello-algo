/**
 * File: preorder_traversal_i_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> res;

/* 前順走査：例１ */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    if (root->val == 7) {
        // 解を記録
        res.push_back(root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* ドライバーコード */
int main() {
    vector<int> arr = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = vecToTree(arr);
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // 前順走査
    res.clear();
    preOrder(root);

    cout << "\n値7のノードをすべて出力" << endl;
    vector<int> vals;
    for (TreeNode *node : res) {
        vals.push_back(node->val);
    }
    printVector(vals);

    return 0;
}