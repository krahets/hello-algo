/**
 * File: two_sum.c
 * Created Time: 2023-01-19
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 方法一：暴力枚举 */
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

/* 哈希表 */
struct hashTable {
    int key;
    int val;
    UT_hash_handle hh; // 基于 uthash.h 实现
};

typedef struct hashTable hashTable;

/* 哈希表查询 */
hashTable *find(hashTable *h, int key) {
    hashTable *tmp;
    HASH_FIND_INT(h, &key, tmp);
    return tmp;
}

/* 哈希表元素插入 */
void insert(hashTable *h, int key, int val) {
    hashTable *t = find(h, key);
    if (t == NULL) {
        hashTable *tmp = malloc(sizeof(hashTable));
        tmp->key = key, tmp->val = val;
        HASH_ADD_INT(h, key, tmp);
    } else {
        t->val = val;
    }
}

/* 方法二：辅助哈希表 */
int *twoSumHashTable(int *nums, int numsSize, int target, int *returnSize) {
    hashTable *hashtable = NULL;
    for (int i = 0; i < numsSize; i++) {
        hashTable *t = find(hashtable, target - nums[i]);
        if (t != NULL) {
            int *res = malloc(sizeof(int) * 2);
            res[0] = t->val, res[1] = i;
            *returnSize = 2;
            return res;
        }
        insert(hashtable, nums[i], i);
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
    // 方法一
    printf("方法一 res = ");
    printArray(res, returnSize);

    // 方法二
    res = twoSumHashTable(nums, sizeof(nums) / sizeof(int), target, &returnSize);
    printf("方法二 res = ");
    printArray(res, returnSize);

    return 0;
}
