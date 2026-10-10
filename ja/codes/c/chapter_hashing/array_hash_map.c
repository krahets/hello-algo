/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* ハッシュテーブルのデフォルトサイズ */
#define MAX_SIZE 100

/* キーと値の組 int->string */
typedef struct {
    int key;
    char *val;
} Pair;

/* キーと値の組の集合 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 配列ベースのハッシュテーブル */
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

/* 検索操作 */
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

/* すべてのキーと値のペアを取得 */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペア数を集計 */
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

/* すべてのキーを取得 */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペア数を集計 */
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

/* すべての値を取得 */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* 有効なキーと値のペア数を集計 */
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

/* ハッシュテーブルを出力 */
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
    /* ハッシュテーブルを初期化 */
    ArrayHashMap *hmap = newArrayHashMap();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    put(hmap, 12836, "シャオハー");
    put(hmap, 15937, "シャオルオ");
    put(hmap, 16750, "シャオスワン");
    put(hmap, 13276, "シャオファー");
    put(hmap, 10583, "シャオヤー");
    printf("\n追加完了後、ハッシュテーブルは\nKey -> Value\n");
    print(hmap);

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    const char *name = get(hmap, 15937);
    printf("\n学籍番号 15937 を入力すると、名前 %s が見つかりました\n", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    removeItem(hmap, 10583);
    printf("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value\n");
    print(hmap);

    /* ハッシュテーブルを走査 */
    int i;

    printf("\nキーと値のペア Key->Value を走査\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\nキー Key のみを個別に走査\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\nValue のみを個別に走査\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
