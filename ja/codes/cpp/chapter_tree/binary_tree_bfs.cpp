/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* レベル順走査 */
vector<int> levelOrder(TreeNode *root) {
    // キューを初期化して根を入れる
    queue<TreeNode *> queue;
    queue.push(root);
    // 走査順を記録するリストを初期化する
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // キューの先頭から取り出す
        vec.push_back(node->val); // ノードの値を記録する
        if (node->left != nullptr)
            queue.push(node->left); // 左の子をキューに入れる
        if (node->right != nullptr)
            queue.push(node->right); // 右の子をキューに入れる
    }
    return vec;
}

/* 実行例 */
int main() {
    /* 二分木を初期化する */
    // ここでは配列から直接二分木を作る関数を使う
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "二分木を初期化\n" << endl;
    printTree(root);

    /* レベル順走査 */
    vector<int> vec = levelOrder(root);
    cout << endl << "レベル順に出力したノードの列 = ";
    printVector(vec);

    return 0;
}
