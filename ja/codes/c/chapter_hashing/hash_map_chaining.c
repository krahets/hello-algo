/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// val の最大長を 100 と仮定する
#define MAX_SIZE 100

/* キーと値の組 */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* 連結リストノード */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* チェイン法ハッシュテーブル */
typedef struct {
    int size;         // キーと値のペア数
    int capacity;     // ハッシュテーブル容量
    double loadThres; // リサイズを発動する負荷率のしきい値
    int extendRatio;  // 拡張倍率
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

/* 検索操作 */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // バケットを走査し、key が見つかれば対応する val を返す
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // key が見つからない場合は空文字列を返す
}

/* 追加操作 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* ハッシュテーブルを拡張 */
void extend(HashMapChaining *hashMap) {
    // 元のハッシュテーブルを一時保存
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // リサイズ後の新しいハッシュテーブルを初期化
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
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
    // 負荷率がしきい値を超えたら、リサイズを実行
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // バケットを走査し、指定した key が見つかれば対応する val を更新して返す
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 指定した `key` に遭遇したら、対応する `val` を更新して返す
            return;
        }
        cur = cur->next;
    }
    // 該当する `key` がなければ、キーと値のペアを連結リストの先頭に追加する
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
            // そこからキーと値の組を削除する
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

/* ハッシュテーブルを出力 */
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

/* Driver Code */
int main() {
    /* ハッシュテーブルを初期化 */
    HashMapChaining *hashMap = newHashMapChaining();

    /* 追加操作 */
    // ハッシュテーブルにキーと値のペア (key, value) を追加
    put(hashMap, 12836, "シャオハー");
    put(hashMap, 15937, "シャオルオ");
    put(hashMap, 16750, "シャオスワン");
    put(hashMap, 13276, "シャオファー");
    put(hashMap, 10583, "シャオヤー");
    printf("\n追加完了後、ハッシュテーブルは\nKey -> Value\n");
    print(hashMap);

    /* 検索操作 */
    // キー key をハッシュテーブルに渡し、値 value を取得
    char *name = get(hashMap, 13276);
    printf("\n学籍番号 13276 を入力すると、名前 %s が見つかりました\n", name);

    /* 削除操作 */
    // ハッシュテーブルからキーと値のペア (key, value) を削除
    removeItem(hashMap, 12836);
    printf("\n学籍番号 12836 を削除した後、ハッシュテーブルは\nKey -> Value\n");
    print(hashMap);

    /* ハッシュテーブルの領域を解放する */
    delHashMapChaining(hashMap);

    return 0;
}
