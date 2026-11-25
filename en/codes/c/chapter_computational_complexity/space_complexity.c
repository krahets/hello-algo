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

/* Constant space */
void constant(int n) {
    // Constants, variables, and objects use O(1) space
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // Variables in the loop use O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Function calls in the loop use O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Hash table */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Implemented with uthash.h
} HashTable;

/* Linear space */
void linear(int n) {
    // An array of length n uses O(n) space
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // A list of length n uses O(n) space
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // Free the memory
    for (int i = 0; i < n; i++) {
        free(nodes[i]);
    }
    free(nodes);

    // A hash table with n entries uses O(n) space
    HashTable *h = NULL;
    for (int i = 0; i < n; i++) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = i;
        tmp->val = i;
        HASH_ADD_INT(h, key, tmp);
    }

    // Free the memory
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* Linear space (recursive) */
void linearRecur(int n) {
    printf("Recursive call: n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Quadratic space */
void quadratic(int n) {
    // A two-dimensional list uses O(n^2) space
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // Free the memory
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* Quadratic space (recursive) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("Recursive call: n = %d, length of nums = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* Exponential space (build a perfect binary tree) */
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
    // Constant space
    constant(n);
    // Linear space
    linear(n);
    linearRecur(n);
    // Quadratic space
    quadratic(n);
    quadraticRecur(n);
    // Exponential space
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free the memory
    freeMemoryTree(root);

    return 0;
}
