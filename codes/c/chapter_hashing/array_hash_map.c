/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../include/include.h"

/* 哈希表初始化函数 */
array_hash_map_t *new_array_hash_map() {
    array_hash_map_t *array_hash_map = malloc(sizeof(array_hash_map_t));
    return array_hash_map;
}

/* 哈希函数 */
int hash_func(int key) {
    int index = key % HASH_MAP_DEFAULT_SIZE;
    return index;
}

/* 查询操作 */
const char *get(const array_hash_map_t *d, const int key) {
    int index = hash_func(key);
    const entry_t *pair = d->buckets + index;
    if(pair == NULL) 
        return NULL;
    return pair->val;
}

/* 添加操作 */
void put(array_hash_map_t *d, const int key, const char *val) {
    int index = hash_func(key);
    d->buckets[index].key = key;
    d->buckets[index].val = malloc(strlen(val) + 1);
    strcpy(d->buckets[index].val, val);
}

/* 删除操作 */
void remove_item(array_hash_map_t *d, const int key) {
    int index = hash_func(key);
    free(d->buckets[index].val);
    d->buckets[index].val = NULL;
}

/* 获取所有键值对 */
void entry_set(array_hash_map_t *d, set_t *set) {
    int i = 0, total = 0;
    /* 统计有效键值对数量 */
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            total++;
        }
    }

    int index = 0;
    entry_t *entries = malloc(total * sizeof(entry_t));
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            entries[index].key = d->buckets[i].key;
            entries[index].val = malloc(strlen(d->buckets[i].val + 1));
            strcpy(entries[index].val, d->buckets[i].val);
            index++;
        }
    }
    set->set = entries;
    set->len = total;
}

/* 获取所有键 */
void key_set(array_hash_map_t *d, set_t *set) {
    int i = 0, total = 0;
    /* 统计有效键数量 */
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            total++;
        }
    }

    int index = 0;
    int *keys = malloc(total * sizeof(int));
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            keys[index] = d->buckets[i].key;
            index++;
        }
    }
    set->set = keys;
    set->len = total;
}

/* 获取所有值 */
void val_set(array_hash_map_t *d, set_t *set) {
    int i = 0, total = 0;
    /* 统计有效值的数量 */
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            total++;
        }
    }

    int index = 0;
    char **vals = malloc(total * sizeof(char *));
    for(i = 0; i < HASH_MAP_DEFAULT_SIZE; i++) {
        if(d->buckets[i].val != NULL) {
            vals[index] = d->buckets[i].val;
            index++;
        }
    }
    set->set = vals;
    set->len = total;
}

/* 打印哈希表 */
void print(array_hash_map_t *d) {
    int i;
    set_t set;
    entry_set(d, &set);
    entry_t *entries = (entry_t*) set.set;
    for (i = 0; i < set.len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }
    free(set.set);
}

int main() {
    /* 初始化哈希表 */
    array_hash_map_t * map = new_array_hash_map();

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
    remove_item(map, 10583);
    printf("\n删除 10583 后，哈希表为\nKey -> Value\n");
    print(map);

    /* 遍历哈希表 */
    int i;

    printf("\n遍历键值对 Key->Value\n");
    print(map);

    set_t set;

    key_set(map, &set);
    int *keys = (int*) set.set;
    printf("\n单独遍历键 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    val_set(map, &set);
    char **vals = (char**) set.set;
    printf("\n单独遍历键 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

}