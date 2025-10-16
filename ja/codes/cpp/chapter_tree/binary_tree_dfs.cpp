/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 走査順序を保存するリストを初期化
vector<int> vec;

/* 前順走査 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先度：ルートノード -> 左部分木 -> 右部分木
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 中順走査 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先度：左部分木 -> ルートノード -> 右部分木
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 後順走査 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先度：左部分木 -> 右部分木 -> ルートノード
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* ドライバーコード */
int main() {
    /* 二分木を初期化 */
    // 特定の関数を使用して配列を二分木に変換
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化\n" << endl;
    printTree(root);

    /* 前順走査 */
    vec.clear();
    preOrder(root);
    cout << endl << "前順走査のノード順序 = ";
    printVector(vec);

    /* 中順走査 */
    vec.clear();
    inOrder(root);
    cout << endl << "中順走査のノード順序 = ";
    printVector(vec);

    /* 後順走査 */
    vec.clear();
    postOrder(root);
    cout << endl << "後順走査のノード順序 = ";
    printVector(vec);

    return 0;
}