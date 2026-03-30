/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 結果の長さは 100 を超えないと仮定する
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* 前順走査：例題 1 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 解を記録
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n二分木を初期化\n");
    printTree(root);

    // 先行順走査
    preOrder(root);

    printf("\n値が 7 のすべてのノードを出力\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // メモリを解放する
    freeMemoryTree(root);
    free(vals);
    return 0;
}
