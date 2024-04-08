/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 假設結果長度不超過 100
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* 前序走訪：例題一 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 記錄解
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二元樹\n");
    printTree(root);

    // 前序走訪
    preOrder(root);

    printf("\n輸出所有值為 7 的節點\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // 釋放記憶體
    freeMemoryTree(root);
    free(vals);
    return 0;
}
