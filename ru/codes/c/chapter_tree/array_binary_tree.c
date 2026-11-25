/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Структура двоичного дерева на основе массива */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* Конструктор */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* Деструктор */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* Ёмкость списка */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* Получить значение узла с индексом i */
int val(ArrayBinaryTree *abt, int i) {
    // Если индекс выходит за границы массива, вернуть INT_MAX — признак пустой позиции
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* Получить индекс левого потомка узла с индексом i */
int left(int i) {
    return 2 * i + 1;
}

/* Получить индекс правого потомка узла с индексом i */
int right(int i) {
    return 2 * i + 2;
}

/* Получить индекс родителя узла с индексом i */
int parent(int i) {
    return (i - 1) / 2;
}

/* Обход по уровням */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // Пройти непосредственно по массиву
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* Обход в глубину */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // Если позиция пуста, завершить вызов
    if (val(abt, i) == INT_MAX)
        return;
    // Прямой обход
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // Симметричный обход
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // Обратный обход
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* Прямой обход */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* Симметричный обход */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* Обратный обход */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* Основная программа */
int main() {
    // Инициализация двоичного дерева
    // INT_MAX обозначает пустую позицию NULL
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\nИнициализация двоичного дерева\n");
    printf("Представление двоичного дерева в виде массива:\n");
    printArray(arr, arrSize);
    printf("Связное представление двоичного дерева:\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // Доступ к узлу
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\nИндекс текущего узла: %d, значение: %d\n", i, val(abt, i));
    printf("Индекс левого потомка: %d, значение: %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("Индекс правого потомка: %d, значение: %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("Индекс родителя: %d, значение: %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // Обход дерева
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\nОбход по уровням: ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("Прямой обход: ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("Симметричный обход: ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("Обратный обход: ");
    printArray(res, returnSize);
    free(res);

    // Освободить память
    delArrayBinaryTree(abt);
    return 0;
}
