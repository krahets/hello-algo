/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* レベル順走査 */
int *levelOrder(TreeNode *root, int *size) {
    /* 補助キュー */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* 補助キュー */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // キューへのポインタ
    front = 0, rear = 0;
    // 根ノードを追加する
    queue[rear++] = root;
    // 走査順序を保存するためのリストを初期化する
    /* 補助配列 */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // 配列ポインタ
    index = 0;
    while (front < rear) {
        // デキュー
        node = queue[front++];
        // ノードの値を保存する
        arr[index++] = node->val;
        if (node->left != NULL) {
            // 左子ノードをキューに追加
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // 右子ノードをキューに追加
            queue[rear++] = node->right;
        }
    }
    // 配列長の値を更新
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // 補助配列の領域を解放する
    free(queue);
    return arr;
}

/* Driver Code */
int main() {
    /* 二分木を初期化 */
    // ここでは、配列から直接二分木を生成する関数を利用する
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("二分木を初期化\n");
    printTree(root);

    /* レベル順走査 */
    // 配列の長さを渡す必要がある
    int *arr = levelOrder(root, &size);
    printf("レベル順走査のノード出力シーケンス = ");
    printArray(arr, size);

    // メモリを解放する
    freeMemoryTree(root);
    free(arr);
    return 0;
}
