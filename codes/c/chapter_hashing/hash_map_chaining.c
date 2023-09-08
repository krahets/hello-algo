/**
 * File: hash_map_chaining.c
 * Created Time: 2023-08-29
 * Author: SenMing (1206575349@qq.com)
 */

#include "../utils/common.h"

/* 键值对 int->string */
struct node {
    int key;
    char *val;
    struct node *next; // 下一个元素
};

typedef struct node Node;

struct pair {
    Node *node; // 键值对节点
};

typedef struct pair Pair;

/* 基于数组简易实现的链式地址哈希表 */
struct hashMapChaining {
    int size;         // 键值对数量
    int capacity;     // 哈希表容量
    double loadThres; // 触发扩容的负载因子阈值
    int extendRatio;  // 扩容倍数
    Pair *buckets;    // 桶数组
};

typedef struct hashMapChaining hashMapChaining;

// 函数声明
void extend(hashMapChaining *hashmap);

/* 初始化桶数组 */
hashMapChaining *newHashMapChaining() {
    // 为哈希表分配空间
    int tableSize = 4;
    hashMapChaining *hashmap = (hashMapChaining *)malloc(sizeof(hashMapChaining));

    // 初始化数组
    hashmap->buckets = (Pair *)malloc(sizeof(Pair) * tableSize);
    memset(hashmap->buckets, 0, sizeof(Pair) * tableSize);

    hashmap->capacity = tableSize;
    hashmap->size = 0;
    hashmap->extendRatio = 2;
    hashmap->loadThres = 2.0 / 3;

    return hashmap;
}

/* 销毁哈希表 */
void delHashMapChaining(hashMapChaining *hashmap) {
    for (int i = 0; i < hashmap->capacity; i++) {
        Pair *pair = &hashmap->buckets[i];
        Node *node = pair->node;
        while (node != NULL) {
            Node *temp = node;
            node = node->next;
            free(temp->val);
            free(temp);
        }
    }
    free(hashmap->buckets);
    free(hashmap);
}

/* 哈希函数 */
int hashFunc(hashMapChaining *hashmap, const int key) {
    return key % hashmap->capacity;
}

/* 负载因子 */
double loadFactor(hashMapChaining *hashmap) {
    return (double)hashmap->size / (double)hashmap->capacity;
}

/* 查询操作 */
const char *get(hashMapChaining *hashmap, const int key) {
    int index = hashFunc(hashmap, key);
    Pair *pair = &hashmap->buckets[index];
    Node *node = pair->node;
    while (node != NULL) {
        if (node->key == key) {
            return node->val;
        }
    }
    return NULL;
}

/* 添加操作 */
void put(hashMapChaining *hashmap, const int key, char *val) {
    if (loadFactor(hashmap) > hashmap->loadThres) {
        extend(hashmap);
    }
    int index = hashFunc(hashmap, key);

    // 先为新节点分配空间再赋值
    Node *newNode = (Node *)malloc(sizeof(Node));
    memset(newNode, 0, sizeof(Node));
    newNode->key = key;
    newNode->val = (char *)malloc(strlen(val) + 1);
    strcpy(newNode->val, val);
    newNode->val[strlen(val)] = '\0';

    Pair *pair = &hashmap->buckets[index];
    Node *node = pair->node;
    if (node == NULL) {
        hashmap->buckets[index].node = newNode;
        hashmap->size++;
        return;
    }
    while (node != NULL) {
        if (node->key == key) {
            // 释放先前分配的内存
            free(node->val);
            // 更新节点的值
            node->val = (char *)malloc(strlen(val) + 1);
            strcpy(node->val, val);
            node->val[strlen(val)] = '\0';
            return;
        }
        if (node->next == NULL) {
            break;
        }
        node = node->next;
    }
    node->next = newNode;
    hashmap->size++;
}

/* 删除操作 */
void removeItem(hashMapChaining *hashmap, int key) {
    int index = hashFunc(hashmap, key);
    Pair *pair = &hashmap->buckets[index];
    Node *node = pair->node;
    // 保存后继的节点
    Node *prev = NULL;
    while (node != NULL) {
        if (node->key == key) {
            // 如果要删除的节点是桶的第一个节点
            if (prev == NULL) {
                pair->node = node->next;
            } else {
                prev->next = node->next;
            }
            // 释放内存
            free(node->val);
            free(node);
            hashmap->size--;
            return;
        }
        prev = node;
        node = node->next;
    }
    return;
}

/* 扩容哈希表 */
void extend(hashMapChaining *hashmap) {
    // 暂存原哈希表
    Pair *oldBuckets = hashmap->buckets;
    int oldCapacity = hashmap->capacity;

    // 创建新的哈希表，重新分配一段空间
    hashmap->capacity *= hashmap->extendRatio;
    hashmap->buckets = (Pair *)malloc(sizeof(Pair) * hashmap->capacity);
    memset(hashmap->buckets, 0, sizeof(Pair) * hashmap->capacity);
    hashmap->size = 0;

    // 将原哈希表中的键值对重新哈希到新的哈希表中
    for (int i = 0; i < oldCapacity; i++) {
        Node *node = oldBuckets[i].node;
        while (node != NULL) {
            put(hashmap, node->key, node->val);
            node = node->next;
        }
    }

    // 释放原哈希表的内存
    for (int i = 0; i < oldCapacity; i++) {
        Node *node = oldBuckets[i].node;
        while (node != NULL) {
            Node *temp = node;
            node = node->next;
            free(temp->val);
            free(temp);
        }
    }
    free(oldBuckets);
}

/* 打印哈希表 */
void print(hashMapChaining *hashmap) {
    for (int i = 0; i < hashmap->capacity; i++) {
        printf("[");
        Pair *pair = &hashmap->buckets[i];
        Node *node = pair->node;
        while (node != NULL) {
            if (node->val != NULL) {
                printf("%d->%s, ", node->key, node->val);
            }
            node = node->next;
        }
        printf("]\n");
    }
    return;
}

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    hashMapChaining *map = newHashMapChaining();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    put(map, 12836, "小哈");
    put(map, 15937, "小啰");
    put(map, 16750, "小算");
    put(map, 13276, "小法");
    put(map, 10583, "小鸭");
    printf("\n添加完成后，哈希表为\nKey -> Value\n");
    print(map);

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    const char *name = get(map, 13276);
    printf("\n输入学号 13276 ，查询到姓名 %s\n", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    removeItem(map, 12836);
    printf("\n删除 12836 后，哈希表为\nKey -> Value\n");
    print(map);

    delHashMapChaining(map);
    return 0;
}
