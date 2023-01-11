/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../include/include.h"

/* Driver Code */
int main() {
    /* 初始化二叉树 */
    // 初始化结点
    TreeNode* n1 = NewTreeNode(1);
    TreeNode* n2 = NewTreeNode(2);
    TreeNode* n3 = NewTreeNode(3);
    TreeNode* n4 = NewTreeNode(4);
    TreeNode* n5 = NewTreeNode(5);
    // 构建引用指向（即指针）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("初始化二叉树\n");
    PrintTree(n1);

    /* 插入与删除结点 */
    TreeNode* P = NewTreeNode(0);
    // 在 n1 -> n2 中间插入结点 P
    n1->left = P;
    P->left = n2;
    printf("插入结点 P 后\n");
    PrintTree(n1);

    // 删除结点 P
    n1->left = n2;
    // 释放内存
    free(P);
    printf("删除结点 P 后\n");
    PrintTree(n1);

    return 0;
}

