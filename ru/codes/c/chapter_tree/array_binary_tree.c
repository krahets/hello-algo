/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Структура двоичного дерева в представлении массивом */
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

/* Вместимость списка */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* Получить значение узла с индексом i */
int val(ArrayBinaryTree *abt, int i) {
    // Если индекс выходит за границы, вернуть INT_MAX, обозначающий пустую позицию
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* Получить индекс левого дочернего узла узла с индексом i */
int left(int i) {
    return 2 * i + 1;
}

/* Получить индекс правого дочернего узла узла с индексом i */
int right(int i) {
    return 2 * i + 2;
}

/* Получить индекс родительского узла узла с индексом i */
int parent(int i) {
    return (i - 1) / 2;
}

/* Обход в ширину */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // Непосредственно обходить массив
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* Обход в глубину */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // Если это пустая позиция, вернуть
    if (val(abt, i) == INT_MAX)
        return;
    // Предварительный обход
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

/* Предварительный обход */
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

/* Driver Code */
int main() {
    // Инициализировать двоичное дерево
    // Использовать INT_MAX для обозначения пустой позиции NULL
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\nИнициализация двоичного дерева\n");
    printf("Массивное представление двоичного дерева:\n");
    printArray(arr, arrSize);
    printf("Связное представление двоичного дерева:\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // Доступ к узлу
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\nТекущий индекс узла = %d, значение = %d\n", i, val(abt, i));
    printf("Индекс левого дочернего узла = %d, значение = %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("Индекс правого дочернего узла = %d, значение = %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("Индекс родительского узла = %d, значение = %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // Обходить дерево
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\nОбход по уровням: ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("Предварительный обход: ");
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
