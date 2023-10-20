/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 哈希表默认大小 */
#define HASH_MAP_DEFAULT_SIZE 100

/* 键值对 int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* 键值对的集合 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 用以索引键获取数据 */
typedef struct {
    int key[HASH_MAP_DEFAULT_SIZE];
    int len;
}IndexMembers;

/* 基于数组简易实现的哈希表 */
typedef struct {
    Pair *buckets[HASH_MAP_DEFAULT_SIZE];
} ArrayHashMap;

/* 初始化存储键 */
void InitIndex(IndexMembers *index){
    index->len = -1;
}

/* 将哈希键存入数组 */
void putKey(IndexMembers *index, int key){
    index->key[++index->len] = key;
}

/* 删除哈希键 */
void DelKey(IndexMembers *index){
    --index->len;
}

/* 哈希表初始化函数 */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *map = malloc(sizeof(ArrayHashMap));
    return map;
}

/* 哈希函数 */
int hashFunc(int key) {
    int index = key % HASH_MAP_DEFAULT_SIZE;
    return index;
}

/* 查询操作 */
const char *get(const ArrayHashMap *d, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = d->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* 添加操作 */
void put(ArrayHashMap *d,IndexMembers *indexMembers, const int key, const char *val) {
    Pair *Pair = malloc(sizeof(Pair));
    Pair->key = key;
    Pair->val = malloc(strlen(val) + 1);
    strcpy(Pair->val, val);

    int index = hashFunc(key);
    putKey(indexMembers, index);

    d->buckets[index] = Pair;
}

/* 删除操作 */
void removeItem(ArrayHashMap *d, IndexMembers *indexMembers, const int key) {
    int index = hashFunc(key);

    free(d->buckets[index]->val);
    DelKey(indexMembers);
}

/* 获取所有键值对 */
void pairSet(ArrayHashMap *d, IndexMembers indexMembers, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = indexMembers.len;

    printf("有效键值对数量:%d\n", total + 1);

    entries = malloc(sizeof(Pair) * total);
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
void keySet(ArrayHashMap *d, IndexMembers indexMembers, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = indexMembers.len;

    keys = malloc(total * sizeof(int));
    for (i = 0; i <= total; i++) {
        keys[index] = d->buckets[indexMembers.key[i]]->key;
        index++;
    }

    set->set = keys;
    set->len = index;
}

/* 获取所有值 */
void valueSet(ArrayHashMap *d, IndexMembers indexMembers, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = indexMembers.len;

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
    MapSet *set;
    set = malloc(indexMembers.len);
    pairSet(d, indexMembers, set);

    Pair *entries = (Pair *)set->set;

    for (i = 0; i <= set->len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }

    free(set);
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
    printf("\n添加完成后，哈希表为\nKey -> Value\n");
    print(map, index);

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    const char *name = get(map, 15937);
    printf("\n输入学号 15937 ，查询到姓名 %s\n", name);

    /*输出一遍key的位置*/
    for (int i = 0; i <= index.len; i++) {
        printf("%d ", hashFunc(index.key[i]));
    }

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    removeItem(map,&index, 10583);
    printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
    print(map, index);

    /* 遍历哈希表 */
    int i;
    MapSet set;

    keySet(map,index, &set);
    int *keys = (int *)set.set;
    printf("\n单独遍历键 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }

    valueSet(map,index, &set);
    char **vals = (char **)set.set;
    printf("\n单独遍历键 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }

    return 0;
}

