/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 雜湊表預設大小 */
#define MAX_SIZE 100

/* 鍵值對 int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* 鍵值對的集合 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 基於陣列實現的雜湊表 */
typedef struct {
    Pair *buckets[MAX_SIZE];
} ArrayHashMap;

/* 建構子 */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
    for (int i=0; i < MAX_SIZE; i++) {
        hmap->buckets[i] = NULL;
    }
    return hmap;
}

/* 析構函式 */
void delArrayHashMap(ArrayHashMap *hmap) {
    for (int i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            free(hmap->buckets[i]->val);
            free(hmap->buckets[i]);
        }
    }
    free(hmap);
}

/* 雜湊函式 */
int hashFunc(int key) {
    int index = key % MAX_SIZE;
    return index;
}

/* 查詢操作 */
const char *get(const ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = hmap->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* 新增操作 */
void put(ArrayHashMap *hmap, const int key, const char *val) {
    Pair *Pair = malloc(sizeof(Pair));
    Pair->key = key;
    Pair->val = malloc(strlen(val) + 1);
    strcpy(Pair->val, val);

    int index = hashFunc(key);
    hmap->buckets[index] = Pair;
}

/* 刪除操作 */
void removeItem(ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    free(hmap->buckets[index]->val);
    free(hmap->buckets[index]);
    hmap->buckets[index] = NULL;
}

/* 獲取所有鍵值對 */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* 統計有效鍵值對數量 */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    entries = malloc(sizeof(Pair) * total);
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            entries[index].key = hmap->buckets[i]->key;
            entries[index].val = malloc(strlen(hmap->buckets[i]->val) + 1);
            strcpy(entries[index].val, hmap->buckets[i]->val);
            index++;
        }
    }
    set->set = entries;
    set->len = total;
}

/* 獲取所有鍵 */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* 統計有效鍵值對數量 */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    keys = malloc(total * sizeof(int));
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            keys[index] = hmap->buckets[i]->key;
            index++;
        }
    }
    set->set = keys;
    set->len = total;
}

/* 獲取所有值 */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* 統計有效鍵值對數量 */
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            total++;
        }
    }
    vals = malloc(total * sizeof(char *));
    for (i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            vals[index] = hmap->buckets[i]->val;
            index++;
        }
    }
    set->set = vals;
    set->len = total;
}

/* 列印雜湊表 */
void print(ArrayHashMap *hmap) {
    int i;
    MapSet set;
    pairSet(hmap, &set);
    Pair *entries = (Pair *)set.set;
    for (i = 0; i < set.len; i++) {
        printf("%d -> %s\n", entries[i].key, entries[i].val);
    }
    free(set.set);
}

/* Driver Code */
int main() {
    /* 初始化雜湊表 */
    ArrayHashMap *hmap = newArrayHashMap();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    put(hmap, 12836, "小哈");
    put(hmap, 15937, "小囉");
    put(hmap, 16750, "小算");
    put(hmap, 13276, "小法");
    put(hmap, 10583, "小鴨");
    printf("\n新增完成後，雜湊表為\nKey -> Value\n");
    print(hmap);

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    const char *name = get(hmap, 15937);
    printf("\n輸入學號 15937 ，查詢到姓名 %s\n", name);

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    removeItem(hmap, 10583);
    printf("\n刪除 10583 後，雜湊表為\nKey -> Value\n");
    print(hmap);

    /* 走訪雜湊表 */
    int i;

    printf("\n走訪鍵值對 Key->Value\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\n單獨走訪鍵 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\n單獨走訪鍵 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
