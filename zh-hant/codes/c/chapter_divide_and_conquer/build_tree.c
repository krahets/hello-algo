/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// 假設所有元素都小於 1000
#define MAX_SIZE 1000

/* 建構二元樹：分治法 */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // 子樹區間為空時終止
    if (r - l < 0)
        return NULL;
    // 初始化根節點
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // 查出 m，據此劃分左右子樹
    int m = inorderMap[preorder[i]];
    // 子問題：建構左子樹
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // 子問題：建構右子樹
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // 回傳根節點
    return root;
}

/* 建構二元樹 */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // 初始化雜湊表，記錄 inorder 中各元素對應的索引
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* 主程式 */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("前序走訪 = ");
    printArray(preorder, preorderSize);
    printf("中序走訪 = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("建構出的二元樹為：\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
