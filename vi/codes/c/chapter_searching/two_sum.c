/**
 * File: two_sum.c
 * Created Time: 2023-01-19
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Method 1: Brute force enumeration */
int *twoSumBruteForce(int *nums, int numsSize, int target, int *returnSize) {
    for (int i = 0; i < numsSize; ++i) {
        for (int j = i + 1; j < numsSize; ++j) {
            if (nums[i] + nums[j] == target) {
                int *res = malloc(sizeof(int) * 2);
                res[0] = i, res[1] = j;
                *returnSize = 2;
                return res;
            }
        }
    }
    *returnSize = 0;
    return NULL;
}

/* Hash table */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // Implemented using uthash.h
} HashTable;

/* Hash table lookup */
HashTable *find(HashTable *h, int key) {
    HashTable *tmp;
    HASH_FIND_INT(h, &key, tmp);
    return tmp;
}

/* Hash table element insertion */
void insert(HashTable **h, int key, int val) {
    HashTable *t = find(*h, key);
    if (t == NULL) {
        HashTable *tmp = malloc(sizeof(HashTable));
        tmp->key = key, tmp->val = val;
        HASH_ADD_INT(*h, key, tmp);
    } else {
        t->val = val;
    }
}

/* Method 2: Auxiliary hash table */
int *twoSumHashTable(int *nums, int numsSize, int target, int *returnSize) {
    HashTable *hashtable = NULL;
    for (int i = 0; i < numsSize; i++) {
        HashTable *t = find(hashtable, target - nums[i]);
        if (t != NULL) {
            int *res = malloc(sizeof(int) * 2);
            res[0] = t->val, res[1] = i;
            *returnSize = 2;
            return res;
        }
        insert(&hashtable, nums[i], i);
    }
    *returnSize = 0;
    return NULL;
}

/* Driver Code */
int main() {
    // ======= Test Case =======
    int nums[] = {2, 7, 11, 15};
    int target = 13;
    // ====== Driver Code ======
    int returnSize;
    int *res = twoSumBruteForce(nums, sizeof(nums) / sizeof(int), target, &returnSize);
    // Method 1
    printf("Method 1 res = ");
    printArray(res, returnSize);

    // Method 2
    res = twoSumHashTable(nums, sizeof(nums) / sizeof(int), target, &returnSize);
    printf("Method 2 res = ");
    printArray(res, returnSize);

    return 0;
}