/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 假設 val 的最大長度為 100
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

/* 鏈結法雜湊表 */
typedef struct {
    int size;         // 鍵值對數量
    int capacity;     // 雜湊表容量
    double loadThres; // 觸發容量擴充的負載因子門檻
    int extendRatio;  // 容量擴充倍數
    Node **buckets;   // 桶陣列
} HashMapChaining;

/* 建構函式 */
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

/* 解構函式 */
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
    // 走訪桶中的元素，若找到 key，就回傳對應的 val
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // 若找不到 key，則回傳空字串
}

/* 新增操作 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* 擴充雜湊表容量 */
void extend(HashMapChaining *hashMap) {
    // 暫存原本的雜湊表
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // 初始化擴充後的新雜湊表
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // 將鍵值對從原本的雜湊表移到新表
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
    // 當負載因子超過門檻時，擴充容量
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 若遇到指定的 key，就更新對應的 val 並結束操作
            return;
        }
        cur = cur->next;
    }
    // 若沒有這個 key，就將鍵值對加到鏈結串列的開頭
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

/* 印出雜湊表 */
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

/* 主程式 */
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
    printf("\n新增後的雜湊表\nKey -> Value\n");
    print(hashMap);

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    char *name = get(hashMap, 13276);
    printf("\n輸入學號 13276，查得姓名 %s\n", name);

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    removeItem(hashMap, 12836);
    printf("\n刪除學號 12836 後的雜湊表\nKey -> Value\n");
    print(hashMap);

    /* 釋放雜湊表占用的空間 */
    delHashMapChaining(hashMap);

    return 0;
}
