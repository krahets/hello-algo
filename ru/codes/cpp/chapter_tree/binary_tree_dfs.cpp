/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Инициализировать список для хранения последовательности обхода
vector<int> vec;

/* Прямой обход */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Симметричный обход */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Обратный обход */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* Инициализировать двоичное дерево */
    // Здесь используется функция, которая напрямую строит двоичное дерево из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализировать двоичное дерево\n" << endl;
    printTree(root);

    /* Прямой обход */
    vec.clear();
    preOrder(root);
    cout << endl << "Последовательность узлов при прямом обходе =";
    printVector(vec);

    /* Симметричный обход */
    vec.clear();
    inOrder(root);
    cout << endl << "Последовательность узлов при симметричном обходе =";
    printVector(vec);

    /* Обратный обход */
    vec.clear();
    postOrder(root);
    cout << endl << "Последовательность узлов при обратном обходе =";
    printVector(vec);

    return 0;
}
