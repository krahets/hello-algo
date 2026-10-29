/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* レベル順走査 */
vector<int> levelOrder(TreeNode *root) {
    // キューを初期化し、根ノードを追加する
    queue<TreeNode *> queue;
    queue.push(root);
    // 走査順序を保存するリストを初期化する
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // キューからデキューする
        vec.push_back(node->val); // ノードの値を保存する
        if (node->left != nullptr)
            queue.push(node->left); // 左の子ノードをエンキューする
        if (node->right != nullptr)
            queue.push(node->right); // 右の子ノードをエンキューする
    }
    return vec;
}

/* 実行用コード */
int main() {
    /* 二分木を初期化する */
    // ここでは配列から二分木を直接生成する関数を使う
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化する\n" << endl;
    printTree(root);

    /* レベル順走査 */
    vector<int> vec = levelOrder(root);
    cout << endl << "レベル順走査で表示するノードの順序 = ";
    printVector(vec);

    return 0;
}
