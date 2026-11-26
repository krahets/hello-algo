/**
 * File: preorder_traversal_iii_compact.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Предполагаем, что длина пути и длина списка результатов не превышают 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Прямой обход: пример 3 */
void preOrder(TreeNode *root) {
    // Отсечение
    if (root == NULL || root->val == 3) {
        return;
    }
    // Пробуем вариант
    path[pathSize++] = root;
    if (root->val == 7) {
        // Сохраняем решение
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // Возврат
    pathSize--;
}

/* Основная программа */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nСоздаём двоичное дерево\n");
    printTree(root);

    // Прямой обход
    preOrder(root);

    printf("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Освобождаем память
    freeMemoryTree(root);
    return 0;
}
