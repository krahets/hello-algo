/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* ハッシュテーブルの既定のサイズ */
#define MAX_SIZE 100

/* キーと値のペア int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* キーと値のペアの集合 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 配列で実装したハッシュテーブル */
typedef struct {
    Pair *buckets[MAX_SIZE];
} ArrayHashMap;

/* コンストラクタ */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
    for (int i=0; i < MAX_SIZE; i++) {
        hmap->buckets[i] = NULL;
    }
    return hmap;
}

/* デストラクタ */
void delArrayHashMap(ArrayHashMap *hmap) {
    for (int i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            free(hmap->buckets[i]->val);
            free(hmap->buckets[i]);
        }
    }
    free(hmap);
}

/* ハッシュ関数 */
int hashFunc(int key) {
    int index = key % MAX_SIZE;
    return index;
}

/* 取得操作 */
const char *get(const ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = hmap->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* 追加操作 */
void put(ArrayHashMap *hmap, const int key, const char *val) {
    Pair *Pair = malloc(sizeof(Pair));
    Pair->key = key;
    Pair->val = malloc(strlen(val) + 1);
    strcpy(Pair->val, val);

    int index = hashFunc(key);
    hmap->buckets[index] = Pair;
}

/* 削除操作 */
void removeItem(ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    free(hmap->buckets[index]->val);
    free(hmap->buckets[index]);
    hmap->buckets[index] = NULL;
}

/* キーと値のペアをすべて取得する */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペアの数を数える */
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

/* すべてのキーを取得する */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペアの数を数える */
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

/* すべての値を取得する */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペアの数を数える */
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

/* ハッシュテーブルを表示する */
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

/* 実行用コード */
int main() {
    /* ハッシュテーブルを初期化する */
    ArrayHashMap *hmap = newArrayHashMap();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    put(hmap, 12836, "小哈");
    put(hmap, 15937, "小啰");
    put(hmap, 16750, "小算");
    put(hmap, 13276, "小法");
    put(hmap, 10583, "小鸭");
    printf("\n追加後のハッシュテーブル\nKey -> Value\n");
    print(hmap);

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    const char *name = get(hmap, 15937);
    printf("\n学生番号 15937 に対応する氏名は %s\n", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    removeItem(hmap, 10583);
    printf("\n10583 を削除した後のハッシュテーブル\nKey -> Value\n");
    print(hmap);

    /* ハッシュテーブルを走査する */
    int i;

    printf("\nキーと値のペア Key->Value を走査する\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\nキー Key だけを走査する\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\nキー Value だけを走査する\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
