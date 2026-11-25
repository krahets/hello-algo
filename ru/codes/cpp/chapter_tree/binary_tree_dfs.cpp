/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Создать список для последовательности обхода
vector<int> vec;

/* Прямой обход */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок посещения: корень -> левое поддерево -> правое поддерево
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Симметричный обход */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок посещения: левое поддерево -> корень -> правое поддерево
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Обратный обход */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок посещения: левое поддерево -> правое поддерево -> корень
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Основная программа */
int main() {
    /* Инициализация двоичного дерева */
    // Используем функцию, которая строит двоичное дерево непосредственно из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализация двоичного дерева\n" << endl;
    printTree(root);

    /* Прямой обход */
    vec.clear();
    preOrder(root);
    cout << endl << "Узлы в порядке прямого обхода = ";
    printVector(vec);

    /* Симметричный обход */
    vec.clear();
    inOrder(root);
    cout << endl << "Узлы в порядке симметричного обхода = ";
    printVector(vec);

    /* Обратный обход */
    vec.clear();
    postOrder(root);
    cout << endl << "Узлы в порядке обратного обхода = ";
    printVector(vec);

    return 0;
}
