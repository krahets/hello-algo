/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Обход в ширину */
vector<int> levelOrder(TreeNode *root) {
    // Инициализировать очередь и добавить корневой узел
    queue<TreeNode *> queue;
    queue.push(root);
    // Инициализировать список для хранения последовательности обхода
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Извлечение из очереди
        vec.push_back(node->val); // Сохранить значение узла
        if (node->left != nullptr)
            queue.push(node->left); // Поместить левый дочерний узел в очередь
        if (node->right != nullptr)
            queue.push(node->right); // Поместить правый дочерний узел в очередь
    }
    return vec;
}

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализация двоичного дерева\n" << endl;
    printTree(root);

    /* Обход в ширину */
    vector<int> vec = levelOrder(root);
    cout << endl << "Последовательность печати узлов при обходе в ширину = ";
    printVector(vec);

    return 0;
}
