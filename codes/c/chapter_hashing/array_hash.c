/**
 * File: array_hash.c
 * 基于array的hash实现, 比较trivial, 仅用于原理演示.
 * Created Time: 2023-03-19
 * Author: MG-Guan (mindgeek.guan@gmail.com)
 */

#include "../include/include.h"

#define MAX_ARRAY_SIZE 5000

/* 用别名使得代码可读性更高 */
typedef struct HashItem {
    uint32_t key;
    int val;
} HashItem;

typedef HashItem *HashTable;


/******* 以下是HashTable主要操作 *********/

/* 创建一块HashTable的内存 */
HashTable createHashTable() {
    int mem_size = MAX_ARRAY_SIZE * sizeof(HashItem);
    HashTable table = (HashTable)malloc(mem_size);
    memset(table, -1, mem_size);
    return table;
}

/* 释放一个HashTable的内存 */
void deleteHashTable(HashTable table) {
    if (table != NULL) {
        free(table);
    }
}

/* Hash函数 */
int hash(uint32_t key) {
    return key % MAX_ARRAY_SIZE;
}

/* 添加元素到HashTable, 此处不处理冲突情况, 直接覆盖. */
void put_item(HashTable table, HashItem item) {
    int index = hash(item.key);
    table[index] = item;
}
void put(HashTable table, uint32_t key, int val) {
    HashItem item;
    item.key = key;
    item.val = val;
    put_item(table, item);
}

/* 通过Key获取HashItem */
bool get(HashTable table, uint32_t key, HashItem* item) {
    int index = hash(key);
    if (table[index].key == key) {
        *item = table[index];
        return true;
    }
    return false;
}

int main() {
    HashTable hash_table = createHashTable();
    printf("Put key 1 value 10 into hash table.");

    put(hash_table, 1, 10);
    printf("Put key 3 value 30 into hash table.");
    put(hash_table, 3, 30);

    
    for (uint32_t key = 1; key <= 3; key++) {
        HashItem item;
        printf("Get key %d from hash table:", key);
        bool result = get(hash_table, 2, &item);
        if (result == true) {
            printf("Successfully get item from hash table:%d->%d", item.key, item.val);
        } else {
            printf("Failed to get from hash table");
        }
    }

    deleteHashTable(hash_table);
}