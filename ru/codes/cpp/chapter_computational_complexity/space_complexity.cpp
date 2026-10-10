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

/* Постоянная сложность */
void constant(int n) {
    // Константы, переменные и объекты занимают O(1) памяти
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Переменные в цикле занимают O(1) памяти
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Функции в цикле занимают O(1) памяти
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
    // Хеш-таблица длины n занимает O(n) памяти
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* Линейная сложность (рекурсивная реализация) */
void linearRecur(int n) {
    cout << "Рекурсия n = " << n << endl;
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

/* Квадратичная сложность (рекурсивная реализация) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "Рекурсия n = " << n << " , длина nums = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Экспоненциальная сложность (построение полного двоичного дерева) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
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
