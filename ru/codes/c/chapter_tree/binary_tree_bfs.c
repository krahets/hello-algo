/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Обход по уровням */
int *levelOrder(TreeNode *root, int *size) {
    /* Вспомогательная очередь */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* Вспомогательная очередь */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // Указатель очереди
    front = 0, rear = 0;
    // Добавить корень
    queue[rear++] = root;
    // Создать список для последовательности обхода
    /* Вспомогательный массив */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // Указатель массива
    index = 0;
    while (front < rear) {
        // Извлечь узел из очереди
        node = queue[front++];
        // Сохранить значение узла
        arr[index++] = node->val;
        if (node->left != NULL) {
            // Добавить левого потомка в очередь
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // Добавить правого потомка в очередь
            queue[rear++] = node->right;
        }
    }
    // Обновить длину массива
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // Освободить память вспомогательного массива
    free(queue);
    return arr;
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

    /* Обход по уровням */
    // Необходимо передать длину массива
    int *arr = levelOrder(root, &size);
    printf("Узлы в порядке обхода по уровням = ");
    printArray(arr, size);

    // Освободить память
    freeMemoryTree(root);
    free(arr);
    return 0;
}
