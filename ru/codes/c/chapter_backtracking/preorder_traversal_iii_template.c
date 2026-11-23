/**
 * File: preorder_traversal_iii_template.c
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

/* Проверить, является ли текущее состояние решением */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* Записать решение */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* Обновить состояние */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* Восстановить состояние */
void undoChoice(void) {
    pathSize--;
}

/* Алгоритм бэктрекинга: пример 3 */
void backtrack(TreeNode *choices[2]) {
    // Проверить, является ли текущее состояние решением
    if (isSolution()) {
        // Записать решение
        recordSolution();
    }
    // Перебор всех вариантов выбора
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // Отсечение: проверить допустимость выбора
        if (isValid(choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(choice);
            // Перейти к следующему выбору
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice();
        }
    }
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nИнициализация двоичного дерева\n");
    printTree(root);

    // Алгоритм бэктрекинга
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

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
