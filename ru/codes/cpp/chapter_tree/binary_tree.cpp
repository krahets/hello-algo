/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева */
    // Инициализация узла
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // Построить связи между узлами (указатели)
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "Инициализация двоичного дерева\n" << endl;
    printTree(n1);

    /* Вставка и удаление узлов */
    TreeNode *P = new TreeNode(0);
    // Вставить узел P между n1 -> n2
    n1->left = P;
    P->left = n2;
    cout << endl << "После вставки узла P\n" << endl;
    printTree(n1);
    // Удалить узел P
    n1->left = n2;
    delete P; // Освободить память
    cout << endl << "После удаления узла P\n" << endl;
    printTree(n1);

    // Освободить память
    freeMemoryTree(n1);

    return 0;
}
