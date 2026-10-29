/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// val の長さは最大 100 と仮定する
#define MAX_SIZE 100

/* キーと値のペア */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* 連結リストのノード */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* チェイン法のハッシュテーブル */
typedef struct {
    int size;         // キーと値のペアの数
    int capacity;     // ハッシュテーブルの容量
    double loadThres; // 容量の拡張を開始する負荷率のしきい値
    int extendRatio;  // 容量の拡張倍率
    Node **buckets;   // バケット配列
} HashMapChaining;

/* コンストラクタ */
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

/* デストラクタ */
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

/* ハッシュ関数 */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 負荷率 */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* 取得操作 */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // バケットを走査し、key が見つかったら対応する val を返す
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // key が見つからなかった場合、空文字列を返す
}

/* 追加操作 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* ハッシュテーブルの容量を拡張する */
void extend(HashMapChaining *hashMap) {
    // 元のハッシュテーブルを一時保存する
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // 拡張後の新しいハッシュテーブルを初期化する
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルに移す
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // メモリを解放する
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* 追加操作 */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // 負荷率がしきい値を超えた場合、容量を拡張する
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // バケットを走査し、指定された key が見つかったら、対応する val を更新して戻る
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 指定された key が見つかったら、対応する val を更新して戻る
            return;
        }
        cur = cur->next;
    }
    // key が存在しない場合、キーと値のペアを連結リストの先頭に追加する
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* 削除操作 */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // キーと値のペアを削除する
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // メモリを解放する
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* ハッシュテーブルを表示する */
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

/* 実行用コード */
int main() {
    /* ハッシュテーブルを初期化する */
    HashMapChaining *hashMap = newHashMapChaining();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加する
    put(hashMap, 12836, "小哈");
    put(hashMap, 15937, "小啰");
    put(hashMap, 16750, "小算");
    put(hashMap, 13276, "小法");
    put(hashMap, 10583, "小鸭");
    printf("\n追加後のハッシュテーブル\nKey -> Value\n");
    print(hashMap);

    /* 取得操作 */
    // ハッシュテーブルにキー key を渡し、値 value を取得する
    char *name = get(hashMap, 13276);
    printf("\n学生番号 13276 に対応する氏名は %s\n", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除する
    removeItem(hashMap, 12836);
    printf("\n学生番号 12836 を削除した後のハッシュテーブル\nKey -> Value\n");
    print(hashMap);

    /* ハッシュテーブルの領域を解放する */
    delHashMapChaining(hashMap);

    return 0;
}
