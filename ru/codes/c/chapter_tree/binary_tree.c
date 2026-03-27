/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева */
    // Инициализация узла
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // Построить связи между узлами (указатели)
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("Инициализация двоичного дерева\n");
    printTree(n1);

    /* Вставка и удаление узлов */
    TreeNode *P = newTreeNode(0);
    // Вставить узел P между n1 -> n2
    n1->left = P;
    P->left = n2;
    printf("После вставки узла P\n");
    printTree(n1);

    // Удалить узел P
    n1->left = n2;
    // Освободить память
    free(P);
    printf("После удаления узла P\n");
    printTree(n1);

    freeMemoryTree(n1);
    return 0;
}
