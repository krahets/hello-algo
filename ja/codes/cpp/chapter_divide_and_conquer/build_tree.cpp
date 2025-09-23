/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分木の構築：分割統治 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 部分木の区間が空の場合に終了
    if (r - l < 0)
        return NULL;
    // ルートノードを初期化
    TreeNode *root = new TreeNode(preorder[i]);
    // m を問い合わせて左右の部分木を分割
    int m = inorderMap[preorder[i]];
    // 部分問題：左の部分木を構築
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右の部分木を構築
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // ルートノードを返す
    return root;
}

/* 二分木の構築 */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // ハッシュテーブルを初期化し、中間順序の要素からインデックスへのマッピングを格納
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* ドライバーコード */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "前順走査 = ";
    printVector(preorder);
    cout << "中間順序走査 = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "構築された二分木:\n";
    printTree(root);

    return 0;
}