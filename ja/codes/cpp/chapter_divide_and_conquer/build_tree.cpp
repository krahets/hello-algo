/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分木を構築：分割統治 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 部分木区間が空なら終了する
    if (r - l < 0)
        return NULL;
    // ルートノードを初期化する
    TreeNode *root = new TreeNode(preorder[i]);
    // m を求めて左右部分木を分割する
    int m = inorderMap[preorder[i]];
    // 部分問題：左部分木を構築する
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 部分問題：右部分木を構築する
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 根ノードを返す
    return root;
}

/* 二分木を構築 */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver Code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "前順走査 = ";
    printVector(preorder);
    cout << "中順走査 = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "構築した二分木：\n";
    printTree(root);

    return 0;
}
