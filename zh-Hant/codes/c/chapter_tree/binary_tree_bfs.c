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
    // 初始化一個串列，用於儲存走訪序列
    /* 輔助陣列 */
    arr = (int *)malloc(sizeof(int) * MAX_SIZE);
    // 陣列指標
    index = 0;
    while (front < rear) {
        // 隊列出隊
        node = queue[front++];
        // 儲存節點值
        arr[index++] = node->val;
        if (node->left != NULL) {
            // 左子節點入列
            queue[rear++] = node->left;
        }
        if (node->right != NULL) {
            // 右子節點入列
            queue[rear++] = node->right;
        }
    }
    // 更新陣列長度的值
    *size = index;
    arr = realloc(arr, sizeof(int) * (*size));

    // 釋放輔助陣列空間
    free(queue);
    return arr;
}

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("初始化二元樹\n");
    printTree(root);

    /* 層序走訪 */
    // 需要傳入陣列的長度
    int *arr = levelOrder(root, &size);
    printf("層序走訪的節點列印序列 = ");
    printArray(arr, size);

    // 釋放記憶體
    freeMemoryTree(root);
    free(arr);
    return 0;
}
