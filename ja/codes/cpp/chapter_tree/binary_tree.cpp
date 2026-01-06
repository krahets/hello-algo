/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* 二分木を初期化 */
    // ノードを初期化
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // ノードの参照（ポインタ）を構築
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "二分木を初期化\n" << endl;
    printTree(n1);

    /* ノードの挿入と削除 */
    TreeNode *P = new TreeNode(0);
    // n1 -> n2の間にノードPを挿入
    n1->left = P;
    P->left = n2;
    cout << endl << "ノード P を挿入後\n" << endl;
    printTree(n1);
    // ノードPを削除
    n1->left = n2;
    delete P; // メモリを解放
    cout << endl << "ノード P を削除後\n" << endl;
    printTree(n1);

    // メモリを解放
    freeMemoryTree(n1);

    return 0;
}