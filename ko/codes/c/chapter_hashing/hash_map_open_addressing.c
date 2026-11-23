/**
 * File: hash_map_open_addressing.c
 * Created Time: 2023-10-6
 * Author: lclc6 (w1929522410@163.com)
 */

#include "../utils/common.h"

/* 개방 주소법 해시 테이블 */
typedef struct {
    int key;
    char *val;
} Pair;

/* 개방 주소법 해시 테이블 */
typedef struct {
    int size;         // 키-값 쌍 개수
    int capacity;     // 해시 테이블 용량
    double loadThres; // 용량 확장을 수행하는 적재율 임계값
    int extendRatio;  // 용량 확장 배수
    Pair **buckets;   // 버킷 배열
    Pair *TOMBSTONE;  // 삭제 표시
} HashMapOpenAddressing;

// 함수 선언
void extend(HashMapOpenAddressing *hashMap);

/* 생성자 */
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

/* 소멸자 */
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

/* 해시 함수 */
int hashFunc(HashMapOpenAddressing *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 적재율 */
double loadFactor(HashMapOpenAddressing *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* key에 해당하는 버킷 인덱스 탐색 */
int findBucket(HashMapOpenAddressing *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    int firstTombstone = -1;
    // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
    while (hashMap->buckets[index] != NULL) {
        // key를 만나면 해당 버킷 인덱스를 반환한다
        if (hashMap->buckets[index]->key == key) {
            // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
            if (firstTombstone != -1) {
                hashMap->buckets[firstTombstone] = hashMap->buckets[index];
                hashMap->buckets[index] = hashMap->TOMBSTONE;
                return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
            }
            return index; // 버킷 인덱스를 반환한다
        }
        // 처음 만난 삭제 표시를 기록한다
        if (firstTombstone == -1 && hashMap->buckets[index] == hashMap->TOMBSTONE) {
            firstTombstone = index;
        }
        // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
        index = (index + 1) % hashMap->capacity;
    }
    // key가 없으면 추가할 위치의 인덱스를 반환한다
    return firstTombstone == -1 ? index : firstTombstone;
}

/* 조회 연산 */
char *get(HashMapOpenAddressing *hashMap, int key) {
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(hashMap, key);
    // 키-값 쌍을 찾으면 해당 val을 반환한다
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        return hashMap->buckets[index]->val;
    }
    // 키-값 쌍이 없으면 빈 문자열을 반환한다
    return "";
}

/* 추가 연산 */
void put(HashMapOpenAddressing *hashMap, int key, char *val) {
    // 적재율이 임계값을 초과하면 용량을 확장한다
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(hashMap, key);
    // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        free(hashMap->buckets[index]->val);
        hashMap->buckets[index]->val = (char *)malloc(sizeof(strlen(val) + 1));
        strcpy(hashMap->buckets[index]->val, val);
        hashMap->buckets[index]->val[strlen(val)] = '\0';
        return;
    }
    // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
    Pair *pair = (Pair *)malloc(sizeof(Pair));
    pair->key = key;
    pair->val = (char *)malloc(sizeof(strlen(val) + 1));
    strcpy(pair->val, val);
    pair->val[strlen(val)] = '\0';

    hashMap->buckets[index] = pair;
    hashMap->size++;
}

/* 삭제 연산 */
void removeItem(HashMapOpenAddressing *hashMap, int key) {
    // key에 해당하는 버킷 인덱스 탐색
    int index = findBucket(hashMap, key);
    // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
    if (hashMap->buckets[index] != NULL && hashMap->buckets[index] != hashMap->TOMBSTONE) {
        Pair *pair = hashMap->buckets[index];
        free(pair->val);
        free(pair);
        hashMap->buckets[index] = hashMap->TOMBSTONE;
        hashMap->size--;
    }
}

/* 해시 테이블 용량 확장 */
void extend(HashMapOpenAddressing *hashMap) {
    // 원래 해시 테이블을 임시로 저장한다
    Pair **bucketsTmp = hashMap->buckets;
    int oldCapacity = hashMap->capacity;
    // 용량을 확장한 새 해시 테이블을 초기화한다
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Pair **)calloc(hashMap->capacity, sizeof(Pair *));
    hashMap->size = 0;
    // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

/* 해시 테이블 출력 */
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

/* 실행 코드 */
int main() {
    // 해시 테이블 초기화
    HashMapOpenAddressing *hashmap = newHashMapOpenAddressing();

    // 추가 연산
    // 해시 테이블에 키-값 쌍 (key, val)을 추가한다
    put(hashmap, 12836, "小哈");
    put(hashmap, 15937, "小啰");
    put(hashmap, 16750, "小算");
    put(hashmap, 13276, "小法");
    put(hashmap, 10583, "小鸭");
    printf("\n추가한 후의 해시 테이블:\n키 -> 값\n");
    print(hashmap);

    // 조회 연산
    // 해시 테이블에 키 key를 입력하여 값 val을 얻는다
    char *name = get(hashmap, 13276);
    printf("\n학번 13276을 입력하여 조회한 이름: %s\n", name);

    // 삭제 연산
    // 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
    removeItem(hashmap, 16750);
    printf("\n16750을 삭제한 후의 해시 테이블\n키 -> 값\n");
    print(hashmap);

    // 해시 테이블을 해제한다
    delHashMapOpenAddressing(hashmap);
    return 0;
}
