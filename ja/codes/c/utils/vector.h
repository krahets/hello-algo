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

/* ベクタ型を定義する */
typedef struct vector {
    int size;     // ベクタの現在の要素数
    int capacity; // ベクタの現在の容量
    int depth;    // ベクタの現在の入れ子の深さ
    void **data;  // データを指すポインタの配列
} vector;

/* ベクタを作成する */
vector *newVector() {
    vector *v = malloc(sizeof(vector));
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    return v;
}

/* サイズと要素の初期値を指定してベクタを作成する */
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

/* ベクタを破棄する */
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

/*  要素をコピーしてベクタの末尾に追加する */
void vectorPushback(vector *v, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[v->size++] = tmp;
}

/* ベクタの末尾の要素を取り除く */
void vectorPopback(vector *v) {
    if (v->size != 0) {
        free(v->data[v->size - 1]);
        v->size--;
    }
}

/* ベクタを空にする */
void vectorClear(vector *v) {
    delVector(v);
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* ベクタの要素数を取得する */
int vectorSize(vector *v) {
    return v->size;
}

/* ベクタの末尾の要素を取得する */
void *vectorBack(vector *v) {
    int n = v->size;
    return n > 0 ? v->data[n - 1] : NULL;
}

/* ベクタの先頭の要素を取得する */
void *vectorFront(vector *v) {
    return v->size > 0 ? v->data[0] : NULL;
}

/* ベクタのインデックス pos にある要素を取得する */
void *vectorAt(vector *v, int pos) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorAt: out of range\n");
        return NULL;
    }
    return v->data[pos];
}

/* ベクタのインデックス pos にある要素を設定する */
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

/* ベクタの容量を増やす */
void vectorExpand(vector *v) {
    v->capacity *= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* ベクタの容量を減らす */
void vectorShrink(vector *v) {
    v->capacity /= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* ベクタのインデックス pos に要素を挿入する */
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

/* ベクタのインデックス pos にある要素を削除する */
void vectorErase(vector *v, int pos) {
    if (v->size != 0) {
        free(v->data[pos]);
        for (int j = pos; j < v->size - 1; j++) {
            v->data[j] = v->data[j + 1];
        }
        v->size--;
    }
}

/* ベクタ内の要素を入れ替える */
void vectorSwap(vector *v, int i, int j) {
    void *tmp = v->data[i];
    v->data[i] = v->data[j];
    v->data[j] = tmp;
}

/* ベクタが空かどうかを判定する */
bool vectorEmpty(vector *v) {
    return v->size == 0;
}

/* ベクタが満杯かどうかを判定する */
bool vectorFull(vector *v) {
    return v->size == v->capacity;
}

/* ベクタ同士が等しいかどうかを判定する */
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

/* ベクタ内の要素をソートする */
void vectorSort(vector *v, int (*cmp)(const void *, const void *)) {
    qsort(v->data, v->size, sizeof(void *), cmp);
}

/* ベクタを表示する。引数には個々の値を表示する関数を渡す */
/* 現在、表示できるのは深さ 1 のベクタのみ */
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

/* 現在、表示できるのは深さ 2 のベクタのみ */
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
