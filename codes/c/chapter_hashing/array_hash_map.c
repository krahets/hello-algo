/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 哈希表默认数组大小 */
#define HASH_MAP_DEFAULT_SIZE 100

/* 键值对 int->string */
struct pair {
    int key;
    char *val;
};

typedef struct pair pair;

/* 用于表示键值对、键、值的集合 */
struct mapSet {
    void *set;
    int len;
};

typedef struct mapSet mapSet;

/* 基于数组简易实现的哈希表 */
struct ArrayHashMap {
    pair *buckets[HASH_MAP_DEFAULT_SIZE];
};

typedef struct ArrayHashMap ArrayHashMap;

/* 用以索引键获取数据 */
struct index{
    int key[HASH_MAP_DEFAULT_SIZE];
    int last;
};

typedef struct index IndexMembers;

/* 初始化存储键 */
void InitIndex(IndexMembers *index){
    index->last = -1;
}

/* 将哈希键存入数组 */
void putKey(IndexMembers *index, int key){
    index->key[index->last++] = key;
}

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
    const pair *pair = d->buckets[index];
    if (pair == NULL)
        return NULL;
    return pair->val;
}

/* 添加操作 */
void put(ArrayHashMap *d,IndexMembers *indexMembers, const int key, const char *val) {
    pair *pair = malloc(sizeof(pair));
    pair->key = key;
    pair->val = malloc(strlen(val) + 1);
    strcpy(pair->val, val);

    int index = hashFunc(key);
    indexMembers->key[++indexMembers->last] = index;

    d->buckets[index] = pair;
}

/* 删除操作 */
void removeItem(ArrayHashMap *d, const int key) {
    int index = hashFunc(key);
//    free(d->buckets[index]->val);
    free(d->buckets[index]);
    d->buckets[index] = NULL;
}

/* 获取所有键值对 */
void pairSet(ArrayHashMap *d, IndexMembers indexMembers, mapSet *set) {
    pair *entries;
    int i = 0, index = 0;
    int total = indexMembers.last;


    printf("有效键值对数量:%d\n", total + 1);

    entries = malloc(sizeof(pair) * total);
    for (i = 0; i <= total; i++) {
        entries[index].key = d->buckets[indexMembers.key[i]]->key;
        entries[index].val = malloc(strlen(d->buckets[indexMembers.key[i]]->val + 1));
        strcpy(entries[index].val, d->buckets[indexMembers.key[i]]->val);
        index++;
    }

    set->set = entries;
    set->len = total;
}

/* 获取所有键 */
void keySet(ArrayHashMap *d, IndexMembers indexMembers, mapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = indexMembers.last;

    keys = malloc(total * sizeof(int));
    for (i = 0; i <= total; i++) {
        keys[index] = d->buckets[indexMembers.key[i]]->key;
        index++;
    }

    set->set = keys;
    set->len = index;
}

/* 获取所有值 */
void valueSet(ArrayHashMap *d, IndexMembers indexMembers, mapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = indexMembers.last;

    vals = malloc(total * sizeof(char *));
    for (i = 0; i <= total; i++) {
        vals[index] = d->buckets[indexMembers.key[i]]->val;
        index++;
    }

    set->set = vals;
    set->len = index;
}

/* 打印哈希表 */
void print(ArrayHashMap *d, IndexMembers indexMembers) {
    int i;
    mapSet set;
    pairSet(d, indexMembers, &set);
    pair *entries = (pair *)set.set;

    for (i = 0; i <= set.len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }

    /*free(set.set);*/
}

/* Driver Code */
int main() {
    /* 初始化哈希表 */
    ArrayHashMap *map = newArrayHashMap();
    IndexMembers index;
    InitIndex(&index);

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    put(map,&index, 12836, "小哈");
    put(map,&index, 15937, "小啰");
    put(map,&index, 16750, "小算");
    put(map,&index, 13276, "小法");
    put(map,&index, 10583, "小鸭");
    printf("添加完成后，哈希表为\nKey -> Value\n");
    print(map, index);

    /* 查询操作 */
    //向哈希表输入键 key ，得到值 value
    const char *name = get(map, 15937);
    printf("\n输入学号 15937 ，查询到姓名 %s\n", name);

    /* 删除操作 */
    /*在哈希表中删除键值对 (key, value)*/
    removeItem(map, 10583);
    /*printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
    print(map, index);*/

    //* 遍历哈希表 *//*
    int i;
    printf("\n遍历键值对 Key->Value\n");
    print(map,index);

    mapSet set;

    keySet(map,index, &set);
    int *keys = (int *)set.set;
    printf("\n单独遍历键 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    /*free(set.set);*/

    valueSet(map,index, &set);
    char **vals = (char **)set.set;
    printf("\n单独遍历键 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    /*free(set.set);*/

    return 0;
}
