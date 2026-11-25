/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Функция */
int func() {
    // Выполнить некоторые операции
    return 0;
}

/* Константная сложность */
void constant(int n) {
    // Константы, переменные и объекты занимают O(1) памяти
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Переменные цикла занимают O(1) памяти
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Вызовы функции в цикле требуют O(1) памяти
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Линейная сложность */
void linear(int n) {
    // Массив длины n занимает O(n) памяти
    vector<int> nums(n);
    // Список длины n занимает O(n) памяти
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // Хеш-таблица из n элементов занимает O(n) памяти
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* Линейная сложность (рекурсия) */
void linearRecur(int n) {
    cout << "Рекурсивный вызов: n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Квадратичная сложность */
void quadratic(int n) {
    // Двумерный список занимает O(n^2) памяти
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* Квадратичная сложность (рекурсия) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "При n = " << n << " длина nums = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Экспоненциальная сложность (построение совершенного двоичного дерева) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Основная программа */
int main() {
    int n = 5;
    // Константная сложность
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
