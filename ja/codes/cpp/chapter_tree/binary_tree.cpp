/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init_binary_tree}
    /* 二分木を初期化する */
    // ノードを初期化する
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // ノード間の参照（ポインタ）を設定する
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    // [endregion]{init_binary_tree}
    cout << endl << "二分木を初期化する\n" << endl;
    printTree(n1);

    // [region]{insert_node}
    /* ノードの挿入と削除 */
    TreeNode *P = new TreeNode(0);
    // n1 -> n2 の間にノード P を挿入する
    n1->left = P;
    P->left = n2;
    // [endregion]{insert_node}
    cout << endl << "ノード P の挿入後\n" << endl;
    printTree(n1);
    // [region]{remove_node}
    // ノード P を削除する
    n1->left = n2;
    delete P; // メモリを解放する
    // [endregion]{remove_node}
    cout << endl << "ノード P の削除後\n" << endl;
    printTree(n1);

    // メモリを解放する
    freeMemoryTree(n1);

    return 0;
}
