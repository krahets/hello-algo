/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 哈希表默认数组大小 */
# define HASH_MAP_DEFAULT_SIZE 100

/* 键值对 int->string */
struct Entry {
    int key;
    char *val;
};

typedef struct Entry Entry;

/* 用于表示键值对、键、值的集合 */
struct MapSet {
    void *set;
    int len;
};

typedef struct MapSet MapSet;

/* 基于数组简易实现的哈希表 */
struct ArrayHashMap {
    Entry *buckets[HASH_MAP_DEFAULT_SIZE];
};

typedef struct ArrayHashMap ArrayHashMap;

/* 哈希表初始化函数 */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *arrayHashMap = malloc(sizeof(ArrayHashMap));
    return arrayHashMap;
}

/* 哈希函数 */
int hashFunc(int key) {
    int index = key % HASH_MAP_DEFAULT_SIZE;
    return index;
}

/* 查询操作 */
const char *get(const ArrayHashMap *d, const int key) {
    int index = hashFunc(key);
    const Entry *pair = d->buckets[index];
    if (pair == NULL)
        return NULL;
    return pair->val;
}

/* 添加操作 */
void put(ArrayHashMap *d, const int key, const char *val) {
    Entry *pair = malloc(sizeof(Entry));
    pair->key = key;
    pair->val = malloc(strlen(val) + 1);
    strcpy(pair->val, val);

    int index = hashFunc(key);
    d->buckets[index] = pair;
}

/* 删除操作 */
void removeItem(ArrayHashMap *d, const int key) {
    int index = hashFunc(key);
    free(d->buckets[index]->val);
    free(d->buckets[index]);
    d->buckets[index] = NULL;
}

/* 获取所有键值对 */
void entrySet(ArrayHashMap *d, MapSet *set) {
    Entry *entries;
    int i = 0, index = 0;
    int total = 0;

    /* 统计有效 entry 数量 */
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            total++;
        }
    }

    entries = malloc(sizeof(Entry) * total);
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            entries[index].key = d->buckets[i]->key;
            entries[index].val = malloc(strlen(d->buckets[i]->val + 1));
            strcpy(entries[index].val, d->buckets[i]->val);
            index++;
        }
    }

    set->set = entries;
    set->len = total;
}

/* 获取所有键 */
void keySet(ArrayHashMap *d, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;

    /* 统计有效 entry 数量 */
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            total++;
        }
    }

    keys = malloc(total * sizeof(int));
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            keys[index] = d->buckets[i]->key;
            index++;
        }
    }

    set->set = keys;
    set->len = total;
}

/* 获取所有值 */
void valueSet(ArrayHashMap *d, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;

    /* 统计有效 entry 数量 */
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            total++;
        }
    }

    vals = malloc(total * sizeof(char *));
    for (i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if (d->buckets[i] != NULL) {
            vals[index] = d->buckets[i]->val;
            index++;
        }
    }

    set->set = vals;
    set->len = total;
}

/* 打印哈希表 */
void print(ArrayHashMap *d) {
    int i;
    MapSet set;
    entrySet(d, &set);
    Entry *entries = (Entry*) set.set;
    for (i = 0; i < set.len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }
    free(set.set);
}

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    ArrayHashMap * map = newArrayHashMap();

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
    const char * name = get(map, 15937);
    printf("\n输入学号 15937 ，查询到姓名 %s\n", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    removeItem(map, 10583);
    printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
    print(map);

    /* 遍历哈希表 */
    int i;

    printf("\n遍历键值对 Key->Value\n");
    print(map);

    MapSet set;

    keySet(map, &set);
    int *keys = (int*) set.set;
    printf("\n单独遍历键 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(map, &set);
    char **vals = (char**) set.set;
    printf("\n单独遍历键 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);
    
    return 0;
}
