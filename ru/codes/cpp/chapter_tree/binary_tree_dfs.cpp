/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// Инициализировать список для хранения последовательности обхода
vector<int> vec;

/* Предварительный обход */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: корень -> левое поддерево -> правое поддерево
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* Симметричный обход */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: левое поддерево -> корень -> правое поддерево
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* Обратный обход */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // Порядок обхода: левое поддерево -> правое поддерево -> корень
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева */
    // Здесь используется функция, напрямую строящая двоичное дерево из массива
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Инициализация двоичного дерева\n" << endl;
    printTree(root);

    /* Предварительный обход */
    vec.clear();
    preOrder(root);
    cout << endl << "Последовательность печати узлов при предварительном обходе = ";
    printVector(vec);

    /* Симметричный обход */
    vec.clear();
    inOrder(root);
    cout << endl << "Последовательность печати узлов при симметричном обходе = ";
    printVector(vec);

    /* Обратный обход */
    vec.clear();
    postOrder(root);
    cout << endl << "Последовательность печати узлов при обратном обходе = ";
    printVector(vec);

    return 0;
}
