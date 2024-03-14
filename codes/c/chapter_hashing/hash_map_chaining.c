/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 假设 val 最大长度为 100
#define MAX_SIZE 100

/* 键值对 */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* 链表节点 */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* 链式地址哈希表 */
typedef struct {
    int size;         // 键值对数量
    int capacity;     // 哈希表容量
    double loadThres; // 触发扩容的负载因子阈值
    int extendRatio;  // 扩容倍数
    Node **buckets;   // 桶数组
} HashMapChaining;

/* 构造函数 */
HashMapChaining *newHashMapChaining() {
    HashMapChaining *hashMap = (HashMapChaining *)malloc(sizeof(HashMapChaining));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    return hashMap;
}

/* 析构函数 */
void delHashMapChaining(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        while (cur) {
            Node *tmp = cur;
            cur = cur->next;
            free(tmp->pair);
            free(tmp);
        }
    }
    free(hashMap->buckets);
    free(hashMap);
}

/* 哈希函数 */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 负载因子 */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* 查询操作 */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // 遍历桶，若找到 key ，则返回对应 val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // 若未找到 key ，则返回空字符串
}

/* 添加操作 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* 扩容哈希表 */
void extend(HashMapChaining *hashMap) {
    // 暂存原哈希表
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // 初始化扩容后的新哈希表
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // 将键值对从原哈希表搬运至新哈希表
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // 释放内存
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* 添加操作 */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // 当负载因子超过阈值时，执行扩容
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 若遇到指定 key ，则更新对应 val 并返回
            return;
        }
        cur = cur->next;
    }
    // 若无该 key ，则将键值对添加至链表头部
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* 删除操作 */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // 从中删除键值对
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // 释放内存
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* 打印哈希表 */
void print(HashMapChaining *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Node *cur = hashMap->buckets[i];
        printf("[");
        while (cur) {
            printf("%d -> %s, ", cur->pair->key, cur->pair->val);
            cur = cur->next;
        }
        printf("]\n");
    }
}

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    HashMapChaining *hashMap = newHashMapChaining();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    put(hashMap, 12836, "小哈");
    put(hashMap, 15937, "小啰");
    put(hashMap, 16750, "小算");
    put(hashMap, 13276, "小法");
    put(hashMap, 10583, "小鸭");
    printf("\n添加完成后，哈希表为\nKey -> Value\n");
    print(hashMap);

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 value
    char *name = get(hashMap, 13276);
    printf("\n输入学号 13276 ，查询到姓名 %s\n", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    removeItem(hashMap, 12836);
    printf("\n删除学号 12836 后，哈希表为\nKey -> Value\n");
    print(hashMap);

    /* 释放哈希表空间 */
    delHashMapChaining(hashMap);

    return 0;
}
