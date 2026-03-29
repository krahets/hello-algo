/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 関数 */
int func() {
    // 何らかの処理を行う
    return 0;
}

/* 定数階 */
void constant(int n) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // ループ内の変数は O(1) の空間を占める
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // ループ内の関数は O(1) の空間を占める
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* ハッシュテーブル */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // uthash.h を用いて実装
} HashTable;

/* 線形階 */
void linear(int n) {
    // 長さ n の配列は O(n) の空間を使用
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 長さ n のリストは O(n) の空間を使用
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // メモリを解放する
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 長さ n のハッシュテーブルは O(n) の空間を使用
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // メモリを解放する
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 線形時間（再帰実装） */
void linearRecur(int n) {
    printf("再帰 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 二乗階 */
void quadratic(int n) {
    // 二次元リストは O(n^2) の空間を使用
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // メモリを解放する
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 二次時間（再帰実装） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("再帰 n = %d における nums の長さ = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 指数時間（完全二分木の構築） */
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
    // 定数階
    constant(n);
    // 線形階
    linear(n);
    linearRecur(n);
    // 二乗階
    quadratic(n);
    quadraticRecur(n);
    // 指数オーダー
    TreeNode *root = buildTree(n);
    printTree(root);

    // メモリを解放する
    freeMemoryTree(root);

    return 0;
}
