/**
 * File: binary_tree_bfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

/* 層序走訪 */
int *levelOrder(TreeNode *root, int *size) {
    /* 輔助佇列 */
    int front, rear;
    int index, *arr;
    TreeNode *node;
    TreeNode **queue;

    /* 輔助佇列 */
    queue = (TreeNode **)malloc(sizeof(TreeNode *) * MAX_SIZE);
    // 佇列指標
    front = 0, rear = 0;
    // 加入根節點
    queue[rear++] = root;
    // 初始化一個串列，用來儲存走訪序列
    /* 輔助陣列 */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // 陣列指標
    index = 0;
    while (front < rear) {
        // 從佇列前端取出節點
        node = queue[front++];
        // 儲存節點值
        arr[index++] = node->val;
        if (node->left != NULL) {
            // 將左子節點加入佇列
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // 將右子節點加入佇列
            queue[rear++] = node->right;
        }
    }
    // 更新陣列長度
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // 釋放輔助陣列的空間
    free(queue);
    return arr;
}

/* 主程式 */
int main() {
    /* 初始化二元樹 */
    // 這裡使用能從陣列直接建立二元樹的函式
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("初始化二元樹\n");
    printTree(root);

    /* 層序走訪 */
    // 需要傳入陣列長度
    int *arr = levelOrder(root, &size);
    printf("依層序走訪印出的節點序列 = ");
    printArray(arr, size);

    // 釋放記憶體
    freeMemoryTree(root);
    free(arr);
    return 0;
}
