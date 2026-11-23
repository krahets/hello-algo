/**
 * File: two_sum.c
 * Created Time: 2023-01-19
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 방법 1: 완전 열거 */
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

/* 해시 테이블 */
typedef struct {
    int key;
    int val;
    UT_hash_handle hh; // uthash.h를 기반으로 구현한다
} HashTable;

/* 해시 테이블 조회 */
HashTable *find(HashTable *h, int key) {
    HashTable *tmp;
    HASH_FIND_INT(h, &key, tmp);
    return tmp;
}

/* 해시 테이블에 원소 삽입 */
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

/* 방법 2: 보조 해시 테이블 */
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

/* 실행 코드 */
int main() {
    // ======= 테스트 사례 =======
    int nums[] = {2, 7, 11, 15};
    int target = 13;
    // ====== 실행 코드 ======
    int returnSize;
    int *res = twoSumBruteForce(nums, sizeof(nums) / sizeof(int), target, &returnSize);
    // 방법 1
    printf("방법 1 res = ");
    printArray(res, returnSize);

    // 방법 2
    res = twoSumHashTable(nums, sizeof(nums) / sizeof(int), target, &returnSize);
    printf("방법 2 res = ");
    printArray(res, returnSize);

    return 0;
}