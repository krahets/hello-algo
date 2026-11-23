/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Функция */
int func() {
    // Выполнить некоторые операции
    return 0;
}

/* Постоянная сложность */
void constant(int n) {
    // Константы, переменные и объекты занимают O(1) памяти
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // Переменные в цикле занимают O(1) памяти
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Функции в цикле занимают O(1) памяти
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Хеш-таблица */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Реализовано на основе uthash.h
} HashTable;

/* Линейная сложность */
void linear(int n) {
    // Массив длины n занимает O(n) памяти
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // Список длины n занимает O(n) памяти
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // Освобождение памяти
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // Хеш-таблица длины n занимает O(n) памяти
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // Освобождение памяти
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* Линейная сложность (рекурсивная реализация) */
void linearRecur(int n) {
    printf("Рекурсия n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Квадратичная сложность */
void quadratic(int n) {
    // Двумерный список занимает O(n^2) памяти
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // Освобождение памяти
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* Квадратичная сложность (рекурсивная реализация) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("Рекурсия n = %d, длина nums = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Driver Code */
int main() {
    int n = 5;
    // Постоянная сложность
    constant(n);
    // Линейная сложность
    linear(n);
    linearRecur(n);
    // Квадратичная сложность
    quadratic(n);
    quadraticRecur(n);
    // Экспоненциальная сложность
    TreeNode *root = buildTree(n);
    printTree(root);

    // Освободить память
    freeMemoryTree(root);

    return 0;
}
