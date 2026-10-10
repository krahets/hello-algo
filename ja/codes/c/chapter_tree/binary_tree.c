/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Driver Code */
int main() {
    /* 二分木を初期化 */
    // ノードを初期化
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // ノード間の参照（ポインタ）を構築する
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("二分木を初期化\n");
    printTree(n1);

    /* ノードの挿入と削除 */
    TreeNode *P = newTreeNode(0);
    // n1 -> n2 の間にノード P を挿入
    n1->left = P;
    P->left = n2;
    printf("ノード P を挿入した後\n");
    printTree(n1);

    // ノード P を削除
    n1->left = n2;
    // メモリを解放する
    free(P);
    printf("ノード P を削除した後\n");
    printTree(n1);

    freeMemoryTree(n1);
    return 0;
}
