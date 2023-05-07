/**
 * File: hashing_search.c
 * Created Time: 2023-04-15
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 哈希表 */
struct hashTable {
    int key;
    void *val;
    UT_hash_handle hh; // 基于 uthash.h 实现
};

typedef struct hashTable hashTable;

/* 打印哈希表（当 hashTable 中 val 为 int 型使用这个） */
void printHashTableVal(hashTable **ht) {
    struct hashTable *s;
    for (s = *ht; s != NULL; s = s->hh.next) {
        printf("key: %d: val: %d\n", s->key, *(int *)(s->val));
    }
}

/* 打印哈希表（当 hashTable 中 val 为 ListNode* 型使用这个） */
void printHashTableLinklist(hashTable **ht) {
    struct hashTable *s;
    for (s = *ht; s != NULL; s = s->hh.next) {
        printf("key: %d: val: %d\n", s->key, ((ListNode *)s->val)->val);
    }
}

/* 哈希表查找 */
hashTable *find(hashTable *ht, int k) {
    hashTable *s;
    HASH_FIND_INT(ht, &k, s);
    return s;
}

/* 添加 k、v 到哈希表 ht 中，v 为 int 类型 */
void addInt(hashTable **ht, int k, int v) {
    hashTable *s;
    HASH_FIND_INT(*ht, &k, s);
    if (s == NULL) {
        s = malloc(sizeof(*s));
        s->key = k;
        HASH_ADD_INT(*ht, key, s);
    }
    int *tmp = malloc(sizeof(*s->val));
    *tmp = v;
    s->val = tmp;
}

/* 添加 k、v 到哈希表 ht 中，v 为 ListNode* 类型 */
void addLinkNode(hashTable **ht, int k, ListNode *v) {
    hashTable *s;
    HASH_FIND_INT(*ht, &k, s);
    if (s == NULL) {
        s = malloc(sizeof(*s));
        s->key = k;
        HASH_ADD_INT(*ht, key, s);
    }
    s->val = (void *)v;
}

/* 删除 ht 中所有元素 */
void deleteAll(hashTable **ht) {
    hashTable *curr, *tmp;
    HASH_ITER(hh, *ht, curr, tmp) {
        HASH_DEL(*ht, curr);
        free(curr);
    }
}

/* 通过 key 访问哈希表，返回 int 类型 */
int accessInt(hashTable **h, int key) {
    hashTable *s;
    int ret = -1;
    if (s = find(*h, key)) {
        ret = *(int *)s->val;
    }
    return ret;
}

/* 通过 key 访问哈希表，返回 ListNode* 类型 */
ListNode *accessLinkNode(hashTable **h, int key) {
    hashTable *s;
    ListNode *res = NULL;
    if (s = find(*h, key)) {
        res = (ListNode *)s->val;
    }
    return res;
}

/* 哈希查找（数组） */
int hashingSearchArray(hashTable **ht, int target) {
    // 哈希表的 key: 目标元素，value: 索引
    // 若哈希表中无此 key ，返回 -1
    if (find(*ht, target) == NULL)
        return -1;
    return accessInt(ht, target);
}

/* 哈希查找（链表） */
ListNode *hashingSearchLinkedList(hashTable **ht, int target) {
    // 哈希表的 key: 目标节点值，value: 节点对象
    // 若哈希表中无此 key ，返回 nullptr
    if (find(*ht, target) == NULL)
        return NULL;
    return accessLinkNode(ht, target);
}

/* Driver Code */
int main() {
    int target = 3;

    /* 哈希查找（数组） */
    int nums[] = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // 初始化哈希表
    hashTable **ht = malloc(sizeof(*ht));
    *ht = NULL;
    for (int i = 0; i < sizeof(nums) / sizeof(nums[0]); i++) {
        addInt(ht, nums[i], i); // key: 元素，value: 索引
    }
    int index = hashingSearchArray(ht, target);
    printf("目标元素 3 的索引 = %d\r\n", index);
    deleteAll(ht);

    /* 哈希查找（链表） */
    ListNode *head = arrToLinkedList(nums, sizeof(nums) / sizeof(nums[0]));
    // 初始化哈希表
    hashTable **ht1 = malloc(sizeof(*ht));
    *ht1 = NULL;

    while (head != NULL) {
        addLinkNode(ht1, head->val, head); // key: 节点值，value: 节点
        head = head->next;
    }

    ListNode *node = hashingSearchLinkedList(ht1, target);
    if (node)
        printf("目标节点值 3 的对应节点对象为 %#p val: %d\r\n", node, node->val);
    deleteAll(ht1);

    return 0;
}
