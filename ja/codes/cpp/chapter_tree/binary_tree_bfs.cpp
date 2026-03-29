/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* レベル順走査 */
vector<int> levelOrder(TreeNode *root) {
    // キューを初期化し、ルートノードを追加する
    queue<TreeNode *> queue;
    queue.push(root);
    // 走査順序を保存するためのリストを初期化する
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // デキュー
        vec.push_back(node->val); // ノードの値を保存する
        if (node->left != nullptr)
            queue.push(node->left); // 左子ノードをキューに追加
        if (node->right != nullptr)
            queue.push(node->right); // 右子ノードをキューに追加
    }
    return vec;
}

/* Driver Code */
int main() {
    /* 二分木を初期化 */
    // ここでは、配列から直接二分木を生成する関数を利用する
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化\n" << endl;
    printTree(root);

    /* レベル順走査 */
    vector<int> vec = levelOrder(root);
    cout << endl << "レベル順走査のノード出力列 = ";
    printVector(vec);

    return 0;
}
