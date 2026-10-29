/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// すべての要素は 1000 未満と仮定する
#define MAX_SIZE 1000

/* 二分木の構築：分割統治法 */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // 部分木の区間が空の場合、終了する
    if (r - l < 0)
        return NULL;
    // 根ノードを初期化する
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // m を調べ、左右の部分木に分割する
    int m = inorderMap[preorder[i]];
    // 部分問題：左部分木の構築
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // 部分問題：右部分木の構築
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // 根ノードを返す
    return root;
}

/* 二分木を構築する */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* 実行用コード */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("行きがけ順走査 = ");
    printArray(preorder, preorderSize);
    printf("通りがけ順走査 = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("構築した二分木：\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
