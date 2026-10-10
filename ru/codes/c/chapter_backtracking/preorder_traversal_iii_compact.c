/**
 * File: preorder_traversal_iii_compact.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Предположим, что длина пути и результата не превышает 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Предварительный обход: пример 3 */
void preOrder(TreeNode *root) {
    // Отсечение
    if (root == NULL || root->val == 3) {
        return;
    }
    // Попытка
    path[pathSize++] = root;
    if (root->val == 7) {
        // Записать решение
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // Откат
    pathSize--;
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nИнициализация двоичного дерева\n");
    printTree(root);

    // Предварительный обход
    preOrder(root);

    printf("\nВывести все пути от корня к узлу 7, не содержащие узлов со значением 3\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Освободить память
    freeMemoryTree(root);
    return 0;
}
