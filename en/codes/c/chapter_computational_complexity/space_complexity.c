/**
 * File: space_complexity.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Function */
int func() {
    // Perform some operations
    return 0;
}

/* Constant order */
void constant(int n) {
    // Constants, variables, objects occupy O(1) space
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // Variables in the loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Functions in the loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Hash table */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Implemented using uthash.h
} HashTable;

/* Linear order */
void linear(int n) {
    // Array of length n uses O(n) space
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // A list of length n occupies O(n) space
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // Memory release
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // A hash table of length n occupies O(n) space
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // Memory release
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* Linear order (recursive implementation) */
void linearRecur(int n) {
    printf("Recursion n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Exponential order */
void quadratic(int n) {
    // 2D list uses O(n^2) space
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // Memory release
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* Quadratic order (recursive implementation) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("In recursion n = %d, nums length = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* Driver Code */
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
    // Constant order
    constant(n);
    // Linear order
    linear(n);
    linearRecur(n);
    // Exponential order
    quadratic(n);
    quadraticRecur(n);
    // Exponential order
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free memory
    freeMemoryTree(root);

    return 0;
}
