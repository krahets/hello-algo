/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* オープンアドレス法ハッシュテーブル */
typedef struct {
    int key;
    char *val;
} Pair;

/* オープンアドレス法ハッシュテーブル */
typedef struct {
    int size;         // キーと値のペア数
    int capacity;     // ハッシュテーブル容量
    double loadThres; // リサイズを発動する負荷率のしきい値
    int extendRatio;  // 拡張倍率
    Pair **buckets;   // バケット配列
    Pair *TOMBSTONE;  // 削除済みマーク
} HashMapOpenAddressing;

// 関数宣言
void extend(HashMapOpenAddressing *hashMap);

/* コンストラクタ */
HashMapOpenAddressing *newHashMapOpenAddressing() {
    HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
    hashMap->TOMBSTONE->key = -1;
    hashMap->TOMBSTONE->val = "-1";

    return hashMap;
}

/* デストラクタ */
void delHashMapOpenAddressing(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            free(pair->val);
            free(pair);
        }
    }
    free(hashMap->buckets);
    free(hashMap->TOMBSTONE);
    free(hashMap);
}

/* ハッシュ関数 */
int hashFunc(HashMapOpenAddressing *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 負荷率 */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* key に対応するバケットインデックスを探す */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // 線形プロービングを行い、空バケットに達したら終了
    while (hashMap->buckets[index] != NULL) {
        // key が見つかったら、対応するバケットのインデックスを返す
        if (hashMap->buckets[index]->key == key) {
            // 以前に削除マークが見つかっていれば、そのインデックスへキーと値のペアを移動
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // 移動後のバケットインデックスを返す
            }
            return index; // バケットのインデックスを返す
        }
        // 最初に見つかった削除マークを記録
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // バケットのインデックスを計算し、末尾を越えたら先頭に戻る
        index = (index + 1) % hashMap->capacity;
    }
    // key が存在しない場合は追加位置のインデックスを返す
    return firstTombstone == -1 ? index : firstTombstone;
}

/* 検索操作 */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // key に対応するバケットインデックスを探す
    int index = findBucket(hashMap, key);
    // キーと値の組が見つかったら、対応する val を返す
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // キーと値の組が存在しない場合は空文字列を返す
    return "";
}

/* 追加操作 */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // 負荷率がしきい値を超えたら、リサイズを実行
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // key に対応するバケットインデックスを探す
    int index = findBucket(hashMap, key);
    // キーと値の組が見つかったら、val を上書きして返す
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // キーと値の組が存在しない場合は、その組を追加する
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(sizeof(strlen(val) + 1));
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* 削除操作 */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // key に対応するバケットインデックスを探す
    int index = findBucket(hashMap, key);
    // キーと値の組が見つかったら、削除マーカーで上書きする
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* ハッシュテーブルを拡張 */
void extend(HashMapOpenAddressing *hashMap) {
    // 元のハッシュテーブルを一時保存
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // リサイズ後の新しいハッシュテーブルを初期化
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // キーと値のペアを元のハッシュテーブルから新しいハッシュテーブルへ移す
    for (int i = 0; i < oldCapacity; i++) {
        Pair *pair = bucketsTmp[i];
        if (pair != NULL && pair != hashMap->TOMBSTONE) {
            put(hashMap, pair->key, pair->val);
            free(pair->val);
            free(pair);
        }
    }
    free(bucketsTmp);
}

/* ハッシュテーブルを出力 */
void print(HashMapOpenAddressing *hashMap) {
    for (int i = 0; i < hashMap->capacity; i++) {
        Pair *pair = hashMap->buckets[i];
        if (pair == NULL) {
            printf("NULL\n");
        } else if (pair == hashMap->TOMBSTONE) {
            printf("TOMBSTONE\n");
        } else {
            printf("%d -> %s\n", pair->key, pair->val);
        }
    }
}

/* Driver Code */
int main() {
    // ハッシュテーブルを初期化
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // 追加操作
    // ハッシュテーブルにキーと値の組 (key, val) を追加する
    put(hashmap, 12836, "シャオハー");
    put(hashmap, 15937, "シャオルオ");
    put(hashmap, 16750, "シャオスワン");
    put(hashmap, 13276, "シャオファー");
    put(hashmap, 10583, "シャオヤー");
    printf("\n追加完了後、ハッシュテーブルは\nKey -> Value\n");
    print(hashmap);

    // 検索操作
    // ハッシュテーブルにキー key を入力し、値 val を得る
    char *name = get(hashmap, 13276);
    printf("\n学籍番号 13276 を入力すると、名前 %s が見つかりました\n", name);

    // 削除操作
    // ハッシュテーブルからキーと値の組 (key, val) を削除する
    removeItem(hashmap, 16750);
    printf("\n16750 を削除した後、ハッシュテーブルは\nKey -> Value\n");
    print(hashmap);

    // ハッシュテーブルを破棄する
    delHashMapOpenAddressing(hashmap);
    return 0;
}
