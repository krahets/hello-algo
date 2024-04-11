/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* 開放定址雜湊表 */
typedef struct {
    int key;
    char *val;
} Pair;

/* 開放定址雜湊表 */
typedef struct {
    int size;         // 鍵值對數量
    int capacity;     // 雜湊表容量
    double loadThres; // 觸發擴容的負載因子閾值
    int extendRatio;  // 擴容倍數
    Pair **buckets;   // 桶陣列
    Pair *TOMBSTONE;  // 刪除標記
} HashMapOpenAddressing;

// 函式宣告
void extend(HashMapOpenAddressing *hashMap);

/* 建構子 */
HashMapOpenAddressing *newHashMapOpenAddressing() {
    HashMapOpenAddressing *hashMap = (HashMapOpenAddressing *)malloc(sizeof(HashMapOpenAddressing));
    hashMap->size = 0;
    hashMap->capacity = 4;
    hashMap->loadThres = 2.0 / 3.0;
    hashMap->extendRatio = 2;
    hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
    hashMap->TOMBSTONE = (Pair *)malloc(sizeof(Pair));
    hashMap->TOMBSTONE->key = -1;
    hashMap->TOMBSTONE->val = "-1";

    return hashMap;
}

/* 析構函式 */
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

/* 搜尋 key 對應的桶索引 */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // 線性探查，當遇到空桶時跳出
    while (hashMap->buckets[index] != NULL) {
        // 若遇到 key ，返回對應的桶索引
        if (hashMap->buckets[index]->key == key) {
            // 若之前遇到了刪除標記，則將鍵值對移動至該索引處
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // 返回移動後的桶索引
            }
            return index; // 返回桶索引
        }
        // 記錄遇到的首個刪除標記
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // 計算桶索引，越過尾部則返回頭部
        index = (index + 1) % hashMap->capacity;
    }
    // 若 key 不存在，則返回新增點的索引
    return firstTombstone == -1 ? index : firstTombstone;
}

/* 查詢操作 */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // 搜尋 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，則返回對應 val
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // 若鍵值對不存在，則返回空字串
    return "";
}

/* 新增操作 */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // 當負載因子超過閾值時，執行擴容
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // 搜尋 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，則覆蓋 val 並返回
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // 若鍵值對不存在，則新增該鍵值對
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(sizeof(strlen(val) + 1));
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* 刪除操作 */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // 搜尋 key 對應的桶索引
    int index = findBucket(hashMap, key);
    // 若找到鍵值對，則用刪除標記覆蓋它
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* 擴容雜湊表 */
void extend(HashMapOpenAddressing *hashMap) {
    // 暫存原雜湊表
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // 初始化擴容後的新雜湊表
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)malloc(sizeof(Pair *) * hashMap->capacity);
    hashMap->size = 0;
    // 將鍵值對從原雜湊表搬運至新雜湊表
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

/* 列印雜湊表 */
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
    // 初始化雜湊表
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // 新增操作
    // 在雜湊表中新增鍵值對 (key, val)
    put(hashmap, 12836, "小哈");
    put(hashmap, 15937, "小囉");
    put(hashmap, 16750, "小算");
    put(hashmap, 13276, "小法");
    put(hashmap, 10583, "小鴨");
    printf("\n新增完成後，雜湊表為\nKey -> Value\n");
    print(hashmap);

    // 查詢操作
    // 向雜湊表中輸入鍵 key ，得到值 val
    char *name = get(hashmap, 13276);
    printf("\n輸入學號 13276 ，查詢到姓名 %s\n", name);

    // 刪除操作
    // 在雜湊表中刪除鍵值對 (key, val)
    removeItem(hashmap, 16750);
    printf("\n刪除 16750 後，雜湊表為\nKey -> Value\n");
    print(hashmap);

    // 銷燬雜湊表
    delHashMapOpenAddressing(hashmap);
    return 0;
}
