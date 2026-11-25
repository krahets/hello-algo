/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Предполагаем, что длина результата не превышает 100
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* Прямой обход: пример 1 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // Сохраняем решение
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Основная программа */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nСоздаём двоичное дерево\n");
    printTree(root);

    // Прямой обход
    preOrder(root);

    printf("\nВыводим все узлы со значением 7\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // Освобождаем память
    freeMemoryTree(root);
    free(vals);
    return 0;
}
