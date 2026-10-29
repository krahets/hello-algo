/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分木の構築：分割統治法 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 部分木の区間が空の場合、終了する
    if (r - l < 0)
        return NULL;
    // 根ノードを初期化する
    TreeNode *root = new TreeNode(preorder[i]);
    // m を調べ、左右の部分木に分割する
    int m = inorderMap[preorder[i]];
    // 部分問題：左部分木の構築
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右部分木の構築
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    return root;
}

/* 二分木を構築する */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* 実行用コード */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "行きがけ順走査 = ";
    printVector(preorder);
    cout << "通りがけ順走査 = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "構築した二分木：\n";
    printTree(root);

    return 0;
}
