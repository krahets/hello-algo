/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 假設 val 最大長度為 100
#define MAX_SIZE 100

/* 鍵值對 */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* 鏈結串列節點 */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* 鏈式位址雜湊表 */
typedef struct {
    int size;         // 鍵值對數量
    int capacity;     // 雜湊表容量
    double loadThres; // 觸發擴容的負載因子閾值
    int extendRatio;  // 擴容倍數
    Node **buckets;   // 桶陣列
} HashMapChaining;

/* 建構子 */
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

/* 析構函式 */
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

/* 雜湊函式 */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 負載因子 */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* 查詢操作 */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // 走訪桶，若找到 key ，則返回對應 val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // 若未找到 key ，則返回空字串
}

/* 新增操作 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* 擴容雜湊表 */
void extend(HashMapChaining *hashMap) {
    // 暫存原雜湊表
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // 初始化擴容後的新雜湊表
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // 將鍵值對從原雜湊表搬運至新雜湊表
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // 釋放記憶體
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* 新增操作 */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // 當負載因子超過閾值時，執行擴容
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 若遇到指定 key ，則更新對應 val 並返回
            return;
        }
        cur = cur->next;
    }
    // 若無該 key ，則將鍵值對新增至鏈結串列頭部
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* 刪除操作 */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // 從中刪除鍵值對
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // 釋放記憶體
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* 列印雜湊表 */
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
    /* 初始化雜湊表 */
    HashMapChaining *hashMap = newHashMapChaining();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    put(hashMap, 12836, "小哈");
    put(hashMap, 15937, "小囉");
    put(hashMap, 16750, "小算");
    put(hashMap, 13276, "小法");
    put(hashMap, 10583, "小鴨");
    printf("\n新增完成後，雜湊表為\nKey -> Value\n");
    print(hashMap);

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    char *name = get(hashMap, 13276);
    printf("\n輸入學號 13276 ，查詢到姓名 %s\n", name);

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    removeItem(hashMap, 12836);
    printf("\n刪除學號 12836 後，雜湊表為\nKey -> Value\n");
    print(hashMap);

    /* 釋放雜湊表空間 */
    delHashMapChaining(hashMap);

    return 0;
}
