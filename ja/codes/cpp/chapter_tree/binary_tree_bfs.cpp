/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* レベル順走査 */
vector<int> levelOrder(TreeNode *root) {
    // キューを初期化、ルートノードを追加
    queue<TreeNode *> queue;
    queue.push(root);
    // 走査順序を保存するリストを初期化
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // キューからデキュー
        vec.push_back(node->val); // ノード値を保存
        if (node->left != nullptr)
            queue.push(node->left); // 左の子ノードをエンキュー
        if (node->right != nullptr)
            queue.push(node->right); // 右の子ノードをエンキュー
    }
    return vec;
}

/* ドライバーコード */
int main() {
    /* 二分木を初期化 */
    // 特定の関数を使用して配列を二分木に変換
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化\n" << endl;
    printTree(root);

    /* レベル順走査 */
    vector<int> vec = levelOrder(root);
    cout << endl << "レベル順走査のノード順序 = ";
    printVector(vec);

    return 0;
}