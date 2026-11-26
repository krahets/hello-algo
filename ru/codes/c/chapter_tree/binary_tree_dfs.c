/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// Вспомогательный массив для последовательности обхода
int arr[MAX_SIZE];

/* Прямой обход */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок посещения: корень -> левое поддерево -> правое поддерево
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* Симметричный обход */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок посещения: левое поддерево -> корень -> правое поддерево
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* Обратный обход */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок посещения: левое поддерево -> правое поддерево -> корень
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* Основная программа */
int main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("Инициализация двоичного дерева\n");
    printTree(root);

    /* Прямой обход */
    // Инициализация вспомогательного массива
    size = 0;
    preOrder(root, &size);
    printf("Узлы в порядке прямого обхода = ");
    printArray(arr, size);

    /* Симметричный обход */
    size = 0;
    inOrder(root, &size);
    printf("Узлы в порядке симметричного обхода = ");
    printArray(arr, size);

    /* Обратный обход */
    size = 0;
    postOrder(root, &size);
    printf("Узлы в порядке обратного обхода = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
