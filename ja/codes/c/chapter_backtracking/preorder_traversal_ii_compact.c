/**
 * File: preorder_traversal_ii_compact.c
 * Created Time: 2023-05-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 経路と結果の長さは 100 以下と仮定する
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 行きがけ順走査：例題 2 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    // 試行
    path[pathSize++] = root;
    if (root->val == 7) {
        // 解を記録する
        for (int i = 0; i < pathSize; ++i) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // 復元
    pathSize--;
}

/* 実行用コード */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n二分木を初期化する\n");
    printTree(root);

    // 行きがけ順走査
    preOrder(root);

    printf("\n根ノードからノード 7 までのすべての経路を出力する\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // メモリを解放する
    freeMemoryTree(root);
    return 0;
}
