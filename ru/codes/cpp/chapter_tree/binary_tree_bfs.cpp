/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Обход по уровням */
vector<int> levelOrder(TreeNode *root) {
    // Создать очередь и добавить корень
    queue<TreeNode *> queue;
    queue.push(root);
    // Создать список для последовательности обхода
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Извлечь узел из очереди
        vec.push_back(node->val); // Сохранить значение узла
        if (node->left != nullptr)
            queue.push(node->left); // Добавить левого потомка в очередь
        if (node->right != nullptr)
            queue.push(node->right); // Добавить правого потомка в очередь
    }
    return vec;
}

/* Основная программа */
int main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализация двоичного дерева\n" << endl;
    printTree(root);

    /* Обход по уровням */
    vector<int> vec = levelOrder(root);
    cout << endl << "Узлы в порядке обхода по уровням = ";
    printVector(vec);

    return 0;
}
