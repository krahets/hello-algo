/**
 * File: tree_node.h
 * Created Time: 2023-01-09
 * Author: Reanon (793584285@qq.com)
 */

#ifndef TREE_NODE_H
#define TREE_NODE_H

#ifdef __cplusplus
extern "C" {
#endif

#include <limits.h>

#define MAX_NODE_SIZE 5000

/* Структура узла двоичного дерева */
typedef struct TreeNode {
    int val;                // Значение узла
    int height;             // Высота узла
    struct TreeNode *left;  // Указатель на левый дочерний узел
    struct TreeNode *right; // Указатель на правый дочерний узел
} TreeNode;

/* Конструктор */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// Правила кодирования сериализации см.:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// Массивное представление двоичного дерева:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// Связное представление двоичного дерева:
// /——— 15
// /——— 7
// /——— 3
// |    \——— 6
// |        \——— 12
// ——— 1
// \——— 2
// |    /——— 9
// \——— 4
// \——— 8

/* Десериализовать список в двоичное дерево: рекурсия */
TreeNode *arrayToTreeDFS(int *arr, int size, int i) {
    if (i < 0 || i >= size || arr[i] == INT_MAX) {
        return NULL;
    }
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = arr[i];
    root->left = arrayToTreeDFS(arr, size, 2 * i + 1);
    root->right = arrayToTreeDFS(arr, size, 2 * i + 2);
    return root;
}

/* Десериализовать список в двоичное дерево */
TreeNode *arrayToTree(int *arr, int size) {
    return arrayToTreeDFS(arr, size, 0);
}

/* Сериализовать двоичное дерево в список: рекурсия */
void treeToArrayDFS(TreeNode *root, int i, int *res, int *size) {
    if (root == NULL) {
        return;
    }
    while (i >= *size) {
        res = realloc(res, (*size + 1) * sizeof(int));
        res[*size] = INT_MAX;
        (*size)++;
    }
    res[i] = root->val;
    treeToArrayDFS(root->left, 2 * i + 1, res, size);
    treeToArrayDFS(root->right, 2 * i + 2, res, size);
}

/* Сериализовать двоичное дерево в список */
int *treeToArray(TreeNode *root, int *size) {
    *size = 0;
    int *res = NULL;
    treeToArrayDFS(root, 0, res, size);
    return res;
}

/* Освободить память двоичного дерева */
void freeMemoryTree(TreeNode *root) {
    if (root == NULL)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    free(root);
}

#ifdef __cplusplus
}
#endif

#endif // TREE_NODE_H
