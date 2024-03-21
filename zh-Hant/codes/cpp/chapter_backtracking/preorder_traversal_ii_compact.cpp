/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* 前序走訪：例題二 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // 嘗試
    path.push_back(root);
    if (root->val == 7) {
        // 記錄解
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // 回退
    path.pop_back();
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n初始化二元樹" << endl;
    printTree(root);

    // 前序走訪
    preOrder(root);

    cout << "\n輸出所有根節點到節點 7 的路徑" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
