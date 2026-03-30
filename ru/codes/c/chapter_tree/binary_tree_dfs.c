/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// Вспомогательный массив для хранения последовательности обхода
int arr[MAX_SIZE];

/* Предварительный обход */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок обхода: корень -> левое поддерево -> правое поддерево
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* Симметричный обход */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок обхода: левое поддерево -> корень -> правое поддерево
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* Обратный обход */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // Порядок обхода: левое поддерево -> правое поддерево -> корень
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("Инициализация двоичного дерева\n");
    printTree(root);

    /* Предварительный обход */
    // Инициализация вспомогательного массива
    size = 0;
    preOrder(root, &size);
    printf("Последовательность узлов при предварительном обходе = ");
    printArray(arr, size);

    /* Симметричный обход */
    size = 0;
    inOrder(root, &size);
    printf("Последовательность узлов при симметричном обходе = ");
    printArray(arr, size);

    /* Обратный обход */
    size = 0;
    postOrder(root, &size);
    printf("Последовательность узлов при обратном обходе = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
