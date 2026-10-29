/**
 * File: preorder_traversal_i_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> res;

/* 行きがけ順走査：例題 1 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    if (root->val == 7) {
        // 解を記録する
        res.push_back(root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* 実行用コード */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n二分木を初期化する" << endl;
    printTree(root);

    // 行きがけ順走査
    preOrder(root);

    cout << "\n値が 7 であるすべてのノードを出力する" << endl;
    vector<int> vals;
    for (TreeNode *node : res) {
        vals.push_back(node->val);
    }
    printVector(vals);
}
