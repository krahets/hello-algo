/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Построение двоичного дерева методом «разделяй и властвуй» */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // Если интервал поддерева пуст, завершаем рекурсию
    if (r - l < 0)
        return NULL;
    // Создаём корень
    TreeNode *root = new TreeNode(preorder[i]);
    // Находим m и разделяем левое и правое поддеревья
    int m = inorderMap[preorder[i]];
    // Подзадача: строим левое поддерево
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Подзадача: строим правое поддерево
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Возвращаем корень
    return root;
}

/* Построение двоичного дерева */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // Создаём хеш-таблицу индексов элементов inorder
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Основная программа */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "Прямой обход = ";
    printVector(preorder);
    cout << "Симметричный обход = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "Построенное двоичное дерево:\n";
    printTree(root);

    return 0;
}
