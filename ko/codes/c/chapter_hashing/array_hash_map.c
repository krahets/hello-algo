/**
 * File: array_hash_map.c
 * Created Time: 2023-03-18
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 해시 테이블의 기본 크기 */
#define MAX_SIZE 100

/* int->string 키-값 쌍 */
typedef struct {
    int key;
    char *val;
} Pair;

/* 키-값 쌍의 집합 */
typedef struct {
    void *set;
    int len;
} MapSet;

/* 배열로 구현한 해시 테이블 */
typedef struct {
    Pair *buckets[MAX_SIZE];
} ArrayHashMap;

/* 생성자 */
ArrayHashMap *newArrayHashMap() {
    ArrayHashMap *hmap = malloc(sizeof(ArrayHashMap));
    for (int i=0; i < MAX_SIZE; i++) {
        hmap->buckets[i] = NULL;
    }
    return hmap;
}

/* 소멸자 */
void delArrayHashMap(ArrayHashMap *hmap) {
    for (int i = 0; i < MAX_SIZE; i++) {
        if (hmap->buckets[i] != NULL) {
            free(hmap->buckets[i]->val);
            free(hmap->buckets[i]);
        }
    }
    free(hmap);
}

/* 해시 함수 */
int hashFunc(int key) {
    int index = key % MAX_SIZE;
    return index;
}

/* 조회 */
const char *get(const ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    const Pair *Pair = hmap->buckets[index];
    if (Pair == NULL)
        return NULL;
    return Pair->val;
}

/* 추가 */
void put(ArrayHashMap *hmap, const int key, const char *val) {
    Pair *pair = malloc(sizeof(Pair));
    pair->key = key;
    pair->val = malloc(strlen(val) + 1);
    strcpy(pair->val, val);

    int index = hashFunc(key);
    hmap->buckets[index] = pair;
}

/* 삭제 */
void removeItem(ArrayHashMap *hmap, const int key) {
    int index = hashFunc(key);
    free(hmap->buckets[index]->val);
    free(hmap->buckets[index]);
    hmap->buckets[index] = NULL;
}

/* 모든 키-값 쌍 가져오기 */
void pairSet(ArrayHashMap *hmap, MapSet *set) {
    Pair *entries;
    int i = 0, index = 0;
    int total = 0;
    /* 유효한 키-값 쌍의 개수 세기 */
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

/* 모든 키 가져오기 */
void keySet(ArrayHashMap *hmap, MapSet *set) {
    int *keys;
    int i = 0, index = 0;
    int total = 0;
    /* 유효한 키-값 쌍의 개수 세기 */
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

/* 모든 값 가져오기 */
void valueSet(ArrayHashMap *hmap, MapSet *set) {
    char **vals;
    int i = 0, index = 0;
    int total = 0;
    /* 유효한 키-값 쌍의 개수 세기 */
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

/* 해시 테이블 출력 */
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

/* 실행 예제 */
int main() {
    /* 해시 테이블 초기화 */
    ArrayHashMap *hmap = newArrayHashMap();

    /* 추가 */
    // 해시 테이블에 키-값 쌍 (key, value) 추가
    put(hmap, 12836, "샤오하");
    put(hmap, 15937, "샤오뤄");
    put(hmap, 16750, "샤오쑤안");
    put(hmap, 13276, "샤오파");
    put(hmap, 10583, "샤오야");
    printf("\n추가 후 해시 테이블\nKey -> Value\n");
    print(hmap);

    /* 조회 */
    // 해시 테이블에 키 key를 입력하여 값 value 조회
    const char *name = get(hmap, 15937);
    printf("\n학번 15937로 조회한 이름: %s\n", name);

    /* 삭제 */
    // 해시 테이블에서 키-값 쌍 (key, value) 삭제
    removeItem(hmap, 10583);
    printf("\n키 10583 삭제 후 해시 테이블\nKey -> Value\n");
    print(hmap);

    /* 해시 테이블 순회 */
    int i;

    printf("\n키-값 쌍 순회 Key->Value\n");
    print(hmap);

    MapSet set;

    keySet(hmap, &set);
    int *keys = (int *)set.set;
    printf("\n키만 순회 Key\n");
    for (i = 0; i < set.len; i++) {
        printf("%d\n", keys[i]);
    }
    free(set.set);

    valueSet(hmap, &set);
    char **vals = (char **)set.set;
    printf("\n값만 순회 Value\n");
    for (i = 0; i < set.len; i++) {
        printf("%s\n", vals[i]);
    }
    free(set.set);

    delArrayHashMap(hmap);
    return 0;
}
