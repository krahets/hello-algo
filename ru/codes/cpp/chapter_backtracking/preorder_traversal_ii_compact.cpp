/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* Прямой обход: пример 2 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // Пробуем вариант
    path.push_back(root);
    if (root->val == 7) {
        // Сохраняем решение
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // Возврат
    path.pop_back();
}

/* Основная программа */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nСоздаём двоичное дерево" << endl;
    printTree(root);

    // Прямой обход
    preOrder(root);

    cout << "\nВыводим все пути от корня до узлов со значением 7" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
