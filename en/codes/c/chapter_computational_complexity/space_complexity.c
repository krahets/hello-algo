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

/* Constant complexity */
void constant(int n) {
    // Constants, variables, objects occupy O(1) space
    const int a = 0;
    int b = 0;
    int nums[1000];
    ListNode *node = newListNode(0);
    free(node);
    // Variables in a loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Functions in a loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Hashtable */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Implemented using uthash.h
} HashTable;

/* Linear complexity */
void linear(int n) {
    // Array of length n occupies O(n) space
    int *nums = malloc(sizeof(int) * n);
    free(nums);

    // A list of length n occupies O(n) space
    ListNode **nodes = malloc(sizeof(ListNode *) * n);
    for (int i = 0; i < n; i++) {
        nodes[i] = newListNode(i);
    }
    // Free memory
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

    // Free memory
    HashTable *curr, *tmp;
    HASH_ITER(hh, h, curr, tmp) {
        HASH_DEL(h, curr);
        free(curr);
    }
}

/* Linear complexity (recursive implementation) */
void linearRecur(int n) {
    printf("Recursion n = %d\r\n", n);
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Quadratic complexity */
void quadratic(int n) {
    // A two-dimensional list occupies O(n^2) space
    int **numMatrix = malloc(sizeof(int *) * n);
    for (int i = 0; i < n; i++) {
        int *tmp = malloc(sizeof(int) * n);
        for (int j = 0; j < n; j++) {
            tmp[j] = 0;
        }
        numMatrix[i] = tmp;
    }

    // Free memory
    for (int i = 0; i < n; i++) {
        free(numMatrix[i]);
    }
    free(numMatrix);
}

/* Quadratic complexity (recursive implementation) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    int *nums = malloc(sizeof(int) * n);
    printf("Recursion n = %d, nums length = %d\r\n", n, n);
    int res = quadraticRecur(n - 1);
    free(nums);
    return res;
}

/* Exponential complexity (building a full binary tree) */
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
    // Constant complexity
    constant(n);
    // Linear complexity
    linear(n);
    linearRecur(n);
    // Quadratic complexity
    quadratic(n);
    quadraticRecur(n);
    // Exponential complexity
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free memory
    freeMemoryTree(root);

    return 0;
}
