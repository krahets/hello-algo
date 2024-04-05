/**
 * File: vector.h
 * Created Time: 2023-07-13
 * Author: Zuoxun (845242523@qq.com)、Gonglja (glj0@outlook.com)
 */

#ifndef VECTOR_H
#define VECTOR_H

#ifdef __cplusplus
extern "C" {
#endif

/* 定義向量型別 */
typedef struct vector {
    int size;     // 當前向量的大小
    int capacity; // 當前向量的容量
    int depth;    // 當前向量的深度
    void **data;  // 指向資料的指標陣列
} vector;

/* 構造向量 */
vector *newVector() {
    vector *v = malloc(sizeof(vector));
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    return v;
}

/* 構造向量，指定大小、元素預設值 */
vector *_newVector(int size, void *elem, int elemSize) {
    vector *v = malloc(sizeof(vector));
    v->size = size;
    v->capacity = size;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    for (int i = 0; i < size; i++) {
        void *tmp = malloc(sizeof(char) * elemSize);
        memcpy(tmp, elem, elemSize);
        v->data[i] = tmp;
    }
    return v;
}

/* 析構向量 */
void delVector(vector *v) {
    if (v) {
        if (v->depth == 0) {
            return;
        } else if (v->depth == 1) {
            for (int i = 0; i < v->size; i++) {
                free(v->data[i]);
            }
            free(v);
        } else {
            for (int i = 0; i < v->size; i++) {
                delVector(v->data[i]);
            }
            v->depth--;
        }
    }
}

/*  新增元素（複製方式）到向量尾部 */
void vectorPushback(vector *v, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[v->size++] = tmp;
}

/* 從向量尾部彈出元素 */
void vectorPopback(vector *v) {
    if (v->size != 0) {
        free(v->data[v->size - 1]);
        v->size--;
    }
}

/* 清空向量 */
void vectorClear(vector *v) {
    delVector(v);
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* 獲取向量的大小 */
int vectorSize(vector *v) {
    return v->size;
}

/* 獲取向量的尾元素 */
void *vectorBack(vector *v) {
    int n = v->size;
    return n > 0 ? v->data[n - 1] : NULL;
}

/* 獲取向量的頭元素 */
void *vectorFront(vector *v) {
    return v->size > 0 ? v->data[0] : NULL;
}

/* 獲取向量下標 pos 的元素 */
void *vectorAt(vector *v, int pos) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorAt: out of range\n");
        return NULL;
    }
    return v->data[pos];
}

/* 設定向量下標 pos 的元素 */
void vectorSet(vector *v, int pos, void *elem, int elemSize) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorSet: out of range\n");
        return;
    }
    free(v->data[pos]);
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[pos] = tmp;
}

/* 向量擴容 */
void vectorExpand(vector *v) {
    v->capacity *= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* 向量縮容 */
void vectorShrink(vector *v) {
    v->capacity /= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* 在向量下標 pos 處插入元素 */
void vectorInsert(vector *v, int pos, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        vectorExpand(v);
    }
    for (int j = v->size; j > pos; j--) {
        v->data[j] = v->data[j - 1];
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[pos] = tmp;
    v->size++;
}

/* 刪除向量下標 pos 處的元素 */
void vectorErase(vector *v, int pos) {
    if (v->size != 0) {
        free(v->data[pos]);
        for (int j = pos; j < v->size - 1; j++) {
            v->data[j] = v->data[j + 1];
        }
        v->size--;
    }
}

/* 向量交換元素 */
void vectorSwap(vector *v, int i, int j) {
    void *tmp = v->data[i];
    v->data[i] = v->data[j];
    v->data[j] = tmp;
}

/* 向量是否為空 */
bool vectorEmpty(vector *v) {
    return v->size == 0;
}

/* 向量是否已滿 */
bool vectorFull(vector *v) {
    return v->size == v->capacity;
}

/* 向量是否相等 */
bool vectorEqual(vector *v1, vector *v2) {
    if (v1->size != v2->size) {
        printf("size not equal\n");
        return false;
    }
    for (int i = 0; i < v1->size; i++) {
        void *a = v1->data[i];
        void *b = v2->data[i];
        if (memcmp(a, b, sizeof(a)) != 0) {
            printf("data %d not equal\n", i);
            return false;
        }
    }
    return true;
}

/* 對向量內部進行排序 */
void vectorSort(vector *v, int (*cmp)(const void *, const void *)) {
    qsort(v->data, v->size, sizeof(void *), cmp);
}

/* 列印函式， 需傳遞一個列印變數的函式進來 */
/* 當前僅支持列印深度為 1 的 vector */
void printVector(vector *v, void (*printFunc)(vector *v, void *p)) {
    if (v) {
        if (v->depth == 0) {
            return;
        } else if (v->depth == 1) {
            if(v->size == 0) {
                printf("\n");
                return;
            }
            for (int i = 0; i < v->size; i++) {
                if (i == 0) {
                    printf("[");
                } else if (i == v->size - 1) {
                    printFunc(v, v->data[i]);
                    printf("]\r\n");
                    break;
                }
                printFunc(v, v->data[i]);
                printf(",");
            }
        } else {
            for (int i = 0; i < v->size; i++) {
                printVector(v->data[i], printFunc);
            }
            v->depth--;
        }
    }
}

/* 當前僅支持列印深度為 2 的 vector */
void printVectorMatrix(vector *vv, void (*printFunc)(vector *v, void *p)) {
    printf("[\n");
    for (int i = 0; i < vv->size; i++) {
        vector *v = (vector *)vv->data[i];
        printf("  [");
        for (int j = 0; j < v->size; j++) {
            printFunc(v, v->data[j]);
            if (j != v->size - 1)
                printf(",");
        }
        printf("],");
        printf("\n");
    }
    printf("]\n");
}

#ifdef __cplusplus
}
#endif

#endif // VECTOR_H
