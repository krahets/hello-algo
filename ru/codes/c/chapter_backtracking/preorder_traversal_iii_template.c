/**
 * File: preorder_traversal_iii_template.c
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

/* Проверяем, является ли текущее состояние решением */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* Сохраняем решение */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* Проверяем, допустим ли выбор в текущем состоянии */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* Обновляем состояние */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* Восстанавливаем состояние */
void undoChoice(void) {
    pathSize--;
}

/* Поиск с возвратом: пример 3 */
void backtrack(TreeNode *choices[2]) {
    // Проверяем, найдено ли решение
    if (isSolution()) {
        // Сохраняем решение
        recordSolution();
    }
    // Перебираем все варианты
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // Отсечение: проверяем допустимость выбора
        if (isValid(choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(choice);
            // Переходим к следующему выбору
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice();
        }
    }
}

/* Основная программа */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nСоздаём двоичное дерево\n");
    printTree(root);

    // Поиск с возвратом
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

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
