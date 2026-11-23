/**
 * File: hash_map_chaining.c
 * Created Time: 2023-10-13
 * Author: SenMing (1206575349@qq.com), krahets (krahets@163.com)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// val의 최대 길이가 100이라고 가정한다
#define MAX_SIZE 100

/* 키-값 쌍 */
typedef struct {
    int key;
    char val[MAX_SIZE];
} Pair;

/* 연결 리스트 노드 */
typedef struct Node {
    Pair *pair;
    struct Node *next;
} Node;

/* 체이닝 해시 테이블 */
typedef struct {
    int size;         // 키-값 쌍 개수
    int capacity;     // 해시 테이블 용량
    double loadThres; // 용량 확장을 수행하는 적재율 임계값
    int extendRatio;  // 용량 확장 배수
    Node **buckets;   // 버킷 배열
} HashMapChaining;

/* 생성자 */
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

/* 소멸자 */
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

/* 해시 함수 */
int hashFunc(HashMapChaining *hashMap, int key) {
    return key % hashMap->capacity;
}

/* 적재율 */
double loadFactor(HashMapChaining *hashMap) {
    return (double)hashMap->size / (double)hashMap->capacity;
}

/* 조회 연산 */
char *get(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            return cur->pair->val;
        }
        cur = cur->next;
    }
    return ""; // key를 찾지 못하면 빈 문자열을 반환한다
}

/* 추가 연산 */
void put(HashMapChaining *hashMap, int key, const char *val);

/* 해시 테이블 용량 확장 */
void extend(HashMapChaining *hashMap) {
    // 원래 해시 테이블을 임시로 저장한다
    int oldCapacity = hashMap->capacity;
    Node **oldBuckets = hashMap->buckets;
    // 용량을 확장한 새 해시 테이블을 초기화한다
    hashMap->capacity *= hashMap->extendRatio;
    hashMap->buckets = (Node **)malloc(hashMap->capacity * sizeof(Node *));
    for (int i = 0; i < hashMap->capacity; i++) {
        hashMap->buckets[i] = NULL;
    }
    hashMap->size = 0;
    // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
    for (int i = 0; i < oldCapacity; i++) {
        Node *cur = oldBuckets[i];
        while (cur) {
            put(hashMap, cur->pair->key, cur->pair->val);
            Node *temp = cur;
            cur = cur->next;
            // 메모리 해제
            free(temp->pair);
            free(temp);
        }
    }

    free(oldBuckets);
}

/* 추가 연산 */
void put(HashMapChaining *hashMap, int key, const char *val) {
    // 적재율이 임계값을 초과하면 용량을 확장한다
    if (loadFactor(hashMap) > hashMap->loadThres) {
        extend(hashMap);
    }
    int index = hashFunc(hashMap, key);
    // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
    Node *cur = hashMap->buckets[index];
    while (cur) {
        if (cur->pair->key == key) {
            strcpy(cur->pair->val, val); // 지정한 key를 만나면 해당 val을 갱신하고 반환한다
            return;
        }
        cur = cur->next;
    }
    // 해당 key가 없으면 키-값 쌍을 연결 리스트의 맨 앞에 추가한다
    Pair *newPair = (Pair *)malloc(sizeof(Pair));
    newPair->key = key;
    strcpy(newPair->val, val);
    Node *newNode = (Node *)malloc(sizeof(Node));
    newNode->pair = newPair;
    newNode->next = hashMap->buckets[index];
    hashMap->buckets[index] = newNode;
    hashMap->size++;
}

/* 삭제 연산 */
void removeItem(HashMapChaining *hashMap, int key) {
    int index = hashFunc(hashMap, key);
    Node *cur = hashMap->buckets[index];
    Node *pre = NULL;
    while (cur) {
        if (cur->pair->key == key) {
            // 해당 키-값 쌍을 삭제한다
            if (pre) {
                pre->next = cur->next;
            } else {
                hashMap->buckets[index] = cur->next;
            }
            // 메모리 해제
            free(cur->pair);
            free(cur);
            hashMap->size--;
            return;
        }
        pre = cur;
        cur = cur->next;
    }
}

/* 해시 테이블 출력 */
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

/* 실행 코드 */
int main() {
    /* 해시 테이블 초기화 */
    HashMapChaining *hashMap = newHashMapChaining();

    /* 추가 연산 */
    // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    put(hashMap, 12836, "小哈");
    put(hashMap, 15937, "小啰");
    put(hashMap, 16750, "小算");
    put(hashMap, 13276, "小法");
    put(hashMap, 10583, "小鸭");
    printf("\n추가한 후의 해시 테이블:\n키 -> 값\n");
    print(hashMap);

    /* 조회 연산 */
    // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    char *name = get(hashMap, 13276);
    printf("\n학번 13276을 입력하여 조회한 이름: %s\n", name);

    /* 삭제 연산 */
    // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    removeItem(hashMap, 12836);
    printf("\n학번 12836을 삭제한 후의 해시 테이블\n키 -> 값\n");
    print(hashMap);

    /* 해시 테이블의 메모리 해제 */
    delHashMapChaining(hashMap);

    return 0;
}
