/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* 採用開放定址法的雜湊表 */
typedef struct {
    int key;
    char *val;
} Pair;

/* 採用開放定址法的雜湊表 */
typedef struct {
    int size;         // 鍵值對數量
    int capacity;     // 雜湊表容量
    double loadThres; // 觸發容量擴充的負載因子門檻
    int extendRatio;  // 容量擴充倍數
    Pair **buckets;   // 桶陣列
    Pair *TOMBSTONE;  // 刪除標記
} HashMapOpenAddressing;

// 函式宣告
void extend(HashMapOpenAddressing *hashMap);

/* 建構函式 */
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

/* 解構函式 */
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

/* 雜湊函式 */
int hashFunc(HashMapOpenAddressing *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 負載因子 */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* 尋找 key 對應的桶索引 */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // 進行線性探測，遇到空桶就跳出迴圈
    while (hashMap->buckets[index] != NULL) {
        // 若遇到 key，回傳對應的桶索引
        if (hashMap->buckets[index]->key == key) {
            // 若先前遇過刪除標記，將鍵值對移到該標記所在的索引位置
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // 回傳移動後的桶索引
            }
            return index; // 回傳桶索引
        }
        // 記錄遇到的第一個刪除標記
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // 計算桶索引，超過陣列尾端就回到開頭
        index = (index + 1) % hashMap->capacity;
    }
    // 若 key 不存在，回傳可插入位置的索引
    return firstTombstone == -1 ? index : firstTombstone;
}

/* 查詢操作 */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // 尋找 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，回傳對應的 val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // 若鍵值對不存在，回傳空字串
    return "";
}

/* 新增操作 */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // 當負載因子超過門檻時，擴充容量
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // 尋找 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，覆寫 val 並結束操作
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(strlen(val) + 1);
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // 若鍵值對不存在，新增該鍵值對
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(strlen(val) + 1);
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* 刪除操作 */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // 尋找 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，以刪除標記取代它
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* 擴充雜湊表容量 */
void extend(HashMapOpenAddressing *hashMap) {
    // 暫存原本的雜湊表
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // 初始化擴充後的新雜湊表
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // 將鍵值對從原本的雜湊表移到新表
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

/* 印出雜湊表 */
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

/* 主程式 */
int main() {
    // 初始化雜湊表
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, val)
    put(hashmap, 12836, "小哈");
    put(hashmap, 15937, "小囉");
    put(hashmap, 16750, "小算");
    put(hashmap, 13276, "小法");
    put(hashmap, 10583, "小鴨");
    printf("\n新增後的雜湊表\nKey -> Value\n");
    print(hashmap);

    // 查詢操作
    // 輸入鍵 key，從雜湊表取得對應的值 val
    char *name = get(hashmap, 13276);
    printf("\n輸入學號 13276，查得姓名 %s\n", name);

    // 刪除操作
    // 從雜湊表刪除鍵值對 (key, val)
    removeItem(hashmap, 16750);
    printf("\n刪除 16750 後的雜湊表\nKey -> Value\n");
    print(hashmap);

    // 銷毀雜湊表
    delHashMapOpenAddressing(hashmap);
    return 0;
}
