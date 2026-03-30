/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// Предположить, что все элементы меньше 1000
#define MAX_SIZE 1000

/* Построить двоичное дерево: разделяй и властвуй */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // Завершить при пустом диапазоне поддерева
    if (r - l < 0)
        return NULL;
    // Инициализировать корневой узел
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // Найти m, чтобы разделить левое и правое поддеревья
    int m = inorderMap[preorder[i]];
    // Подзадача: построить левое поддерево
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // Подзадача: построить правое поддерево
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // Вернуть корневой узел
    return root;
}

/* Построить двоичное дерево */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* Driver Code */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("Предварительный обход = ");
    printArray(preorder, preorderSize);
    printf("Симметричный обход = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("Построенное двоичное дерево:\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
