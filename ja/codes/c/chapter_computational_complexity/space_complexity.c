/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 関数 */
int func() {
    // 何らかの処理を実行する
    return 0;
}

/* 定数オーダー */
void constant(int n) {
    // 定数、変数、オブジェクトは O(1) の領域を使用する
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // ループ内の変数は O(1) の領域を使用する
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // ループ内の関数は O(1) の領域を使用する
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* ハッシュテーブル */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // uthash.h を用いて実装する
} HashTable;

/* 線形オーダー */
void linear(int n) {
    // 長さ n の配列は O(n) の領域を使用する
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // 長さ n のリストは O(n) の領域を使用する
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // メモリの解放
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // 長さ n のハッシュテーブルは O(n) の領域を使用する
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // メモリの解放
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* 線形オーダー（再帰による実装） */
void linearRecur(int n) {
    printf("再帰 n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 二次オーダー */
void quadratic(int n) {
    // 二次元リストは O(n^2) の領域を使用する
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // メモリの解放
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* 二次オーダー（再帰による実装） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("再帰 n = %d における nums の長さ = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* 指数オーダー（パーフェクト二分木の構築） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return NULL;
    TreeNode *root = newTreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* 実行用コード */
int main() {
    int n = 5;
    // 定数オーダー
    constant(n);
    // 線形オーダー
    linear(n);
    linearRecur(n);
    // 二次オーダー
    quadratic(n);
    quadraticRecur(n);
    // 指数オーダー
    TreeNode *root = buildTree(n);
    printTree(root);

    // メモリを解放する
    freeMemoryTree(root);

    return 0;
}
