/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 函式 */
int func() {
    // 執行某些操作
    return 0;
}

/* 常數階 */
void constant(int n) {
    // 常數、變數、物件佔用 O(1) 空間
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // 迴圈中的變數佔用 O(1) 空間
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 迴圈中的函式佔用 O(1) 空間
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 雜湊表 */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // 基於 uthash.h 實現
} HashTable;

/* 線性階 */
void linear(int n) {
    // 長度為 n 的陣列佔用 O(n) 空間
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 長度為 n 的串列佔用 O(n) 空間
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // 記憶體釋放
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 長度為 n 的雜湊表佔用 O(n) 空間
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // 記憶體釋放
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 線性階（遞迴實現） */
void linearRecur(int n) {
    printf("遞迴 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 平方階 */
void quadratic(int n) {
    // 二維串列佔用 O(n^2) 空間
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // 記憶體釋放
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 平方階（遞迴實現） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("遞迴 n = %d 中的 nums 長度 = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 指數階（建立滿二元樹） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Driver Code */
int main() {
    int n = 5;
    // 常數階
    constant(n);
    // 線性階
    linear(n);
    linearRecur(n);
    // 平方階
    quadratic(n);
    quadraticRecur(n);
    // 指數階
    TreeNode *root = buildTree(n);
    printTree(root);

    // 釋放記憶體
    freeMemoryTree(root);

    return 0;
}
