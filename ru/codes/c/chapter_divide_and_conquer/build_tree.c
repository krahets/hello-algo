/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// Предполагаем, что все элементы меньше 1000
#define MAX_SIZE 1000

/* Построение двоичного дерева методом «разделяй и властвуй» */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // Если интервал поддерева пуст, завершаем рекурсию
    if (r - l < 0)
        return NULL;
    // Создаём корень
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // Находим m и разделяем левое и правое поддеревья
    int m = inorderMap[preorder[i]];
    // Подзадача: строим левое поддерево
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // Подзадача: строим правое поддерево
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // Возвращаем корень
    return root;
}

/* Построение двоичного дерева */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // Создаём хеш-таблицу индексов элементов inorder
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* Основная программа */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("Прямой обход = ");
    printArray(preorder, preorderSize);
    printf("Симметричный обход = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("Построенное двоичное дерево:\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
