/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 函式 */
int func() {
    // 執行操作
    return 0;
}

/* 常數階 */
void constant(int n) {
    // 常數、變數、物件占用 O(1) 空間
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // 迴圈內變數占用 O(1) 空間
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 迴圈呼叫函式占用 O(1) 空間
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 雜湊表 */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // 以 uthash.h 實作
} HashTable;

/* 線性階 */
void linear(int n) {
    // 長度為 n 的陣列占用 O(n) 空間
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 長度為 n 的串列占用 O(n) 空間
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // 釋放記憶體
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 長度為 n 的雜湊表占用 O(n) 空間
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // 釋放記憶體
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 線性階（遞迴實作） */
void linearRecur(int n) {
    printf("遞迴 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 平方階 */
void quadratic(int n) {
    // 二維串列占用 O(n^2) 空間
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // 釋放記憶體
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 平方階（遞迴實作） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("遞迴 n = %d 時，nums 的長度 = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 指數階（建完美二元樹） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* 主程式 */
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
