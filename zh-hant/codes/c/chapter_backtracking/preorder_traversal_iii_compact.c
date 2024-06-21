/**
 * File: preorder_traversal_iii_compact.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 假設路徑和結果長度不超過 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 前序走訪：例題三 */
void preOrder(TreeNode *root) {
    // 剪枝
    if (root == NULL || root->val == 3) {
        return;
    }
    // 嘗試
    path[pathSize++] = root;
    if (root->val == 7) {
        // 記錄解
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // 回退
    pathSize--;
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二元樹\n");
    printTree(root);

    // 前序走訪
    preOrder(root);

    printf("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // 釋放記憶體
    freeMemoryTree(root);
    return 0;
}
