/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 走査順を記録するリストを初期化する
vector<int> vec;

/* 行きがけ順走査 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問順：根 -> 左部分木 -> 右部分木
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 通りがけ順走査 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問順：左部分木 -> 根 -> 右部分木
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 帰りがけ順走査 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問順：左部分木 -> 右部分木 -> 根
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* 実行例 */
int main() {
    /* 二分木を初期化する */
    // ここでは配列から直接二分木を作る関数を使う
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化\n" << endl;
    printTree(root);

    /* 行きがけ順走査 */
    vec.clear();
    preOrder(root);
    cout << endl << "行きがけ順に出力したノードの列 = ";
    printVector(vec);

    /* 通りがけ順走査 */
    vec.clear();
    inOrder(root);
    cout << endl << "通りがけ順に出力したノードの列 = ";
    printVector(vec);

    /* 帰りがけ順走査 */
    vec.clear();
    postOrder(root);
    cout << endl << "帰りがけ順に出力したノードの列 = ";
    printVector(vec);

    return 0;
}
