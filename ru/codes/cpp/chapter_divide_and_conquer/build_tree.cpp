/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Построение двоичного дерева: разделяй и властвуй */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // Завершить, если диапазон поддерева пуст
    if (r - l < 0)
        return NULL;
    // Инициализировать корневой узел
    TreeNode *root = new TreeNode(preorder[i]);
    // Найти m, чтобы разделить левое и правое поддеревья
    int m = inorderMap[preorder[i]];
    // Подзадача: построить левое поддерево
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // Подзадача: построить правое поддерево
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // Вернуть корневой узел
    return root;
}

/* Построить двоичное дерево */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // Инициализировать хеш-таблицу для хранения отображения элементов inorder в индексы
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver Code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "прямой обход =";
    printVector(preorder);
    cout << "симметричный обход =";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "Построенное двоичное дерево:\n";
    printTree(root);

    return 0;
}
