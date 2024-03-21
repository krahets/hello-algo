/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 函数 */
int func() {
    // 执行某些操作
    return 0;
}

/* 常数阶 */
void constant(int n) {
    // 常量、变量、对象占用 O(1) 空间
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // 循环中的变量占用 O(1) 空间
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 循环中的函数占用 O(1) 空间
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 哈希表 */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // 基于 uthash.h 实现
} HashTable;

/* 线性阶 */
void linear(int n) {
    // 长度为 n 的数组占用 O(n) 空间
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 长度为 n 的列表占用 O(n) 空间
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // 内存释放
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 长度为 n 的哈希表占用 O(n) 空间
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // 内存释放
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 线性阶（递归实现） */
void linearRecur(int n) {
    printf("递归 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 平方阶 */
void quadratic(int n) {
    // 二维列表占用 O(n^2) 空间
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // 内存释放
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 平方阶（递归实现） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("递归 n = %d 中的 nums 长度 = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 指数阶（建立满二叉树） */
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
    // 常数阶
    constant(n);
    // 线性阶
    linear(n);
    linearRecur(n);
    // 平方阶
    quadratic(n);
    quadraticRecur(n);
    // 指数阶
    TreeNode *root = buildTree(n);
    printTree(root);

    // 释放内存
    freeMemoryTree(root);

    return 0;
}
