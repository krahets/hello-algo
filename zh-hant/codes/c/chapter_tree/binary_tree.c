/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // 構建節點之間的引用（指標）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("初始化二元樹\n");
    printTree(n1);

    /* 插入與刪除節點 */
    TreeNode *P = newTreeNode(0);
    // 在 n1 -> n2 中間插入節點 P
    n1->left = P;
    P->left = n2;
    printf("插入節點 P 後\n");
    printTree(n1);

    // 刪除節點 P
    n1->left = n2;
    // 釋放記憶體
    free(P);
    printf("刪除節點 P 後\n");
    printTree(n1);

    freeMemoryTree(n1);
    return 0;
}
