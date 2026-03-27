/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* Обход в ширину */
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
    // Добавить корневой узел
    queue[rear++] = root;
    // Инициализировать список для хранения последовательности обхода
    /* Вспомогательный массив */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // Указатель на массив
    index = 0;
    while (front < rear) {
        // Извлечение из очереди
        node = queue[front++];
        // Сохранить значение узла
        arr[index++] = node->val;
        if (node->left != NULL) {
            // Поместить левый дочерний узел в очередь
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // Поместить правый дочерний узел в очередь
            queue[rear++] = node->right;
        }
    }
    // Обновить значение длины массива
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // Освободить память вспомогательного массива
    free(queue);
    return arr;
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

    /* Обход в ширину */
    // Нужно передать длину массива
    int *arr = levelOrder(root, &size);
    printf("Последовательность узлов при обходе по уровням = ");
    printArray(arr, size);

    // Освободить память
    freeMemoryTree(root);
    free(arr);
    return 0;
}
