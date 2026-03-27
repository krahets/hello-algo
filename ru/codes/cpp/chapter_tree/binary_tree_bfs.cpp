/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Обход по уровням */
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
            queue.push(node->left); // Поместить левого потомка в очередь
        if (node->right != nullptr)
            queue.push(node->right); // Поместить правого потомка в очередь
    }
    return vec;
}

/* Driver Code */
int main() {
    /* Инициализировать двоичное дерево */
    // Здесь используется функция, которая напрямую строит двоичное дерево из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализировать двоичное дерево\n" << endl;
    printTree(root);

    /* Обход по уровням */
    vector<int> vec = levelOrder(root);
    cout << endl << "Последовательность узлов при обходе по уровням = ";
    printVector(vec);

    return 0;
}
