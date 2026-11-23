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

/* ベクトル型を定義する */
typedef struct vector {
    int size;     // 現在のベクトルのサイズ
    int capacity; // 現在のベクトルの容量
    int depth;    // 現在のベクトルの深さ
    void **data;  // データを指すポインタの配列
} vector;

/* ベクトルを構築する */
vector *newVector() {
    vector *v = malloc(sizeof(vector));
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    return v;
}

/* サイズと要素の既定値を指定してベクトルを構築する */
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

/* ベクトルを破棄する */
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

/*  ベクトルの末尾に要素をコピーして追加する */
void vectorPushback(vector *v, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[v->size++] = tmp;
}

/* ベクトルの末尾から要素を取り出す */
void vectorPopback(vector *v) {
    if (v->size != 0) {
        free(v->data[v->size - 1]);
        v->size--;
    }
}

/* ベクトルを空にする */
void vectorClear(vector *v) {
    delVector(v);
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* ベクトルのサイズを取得する */
int vectorSize(vector *v) {
    return v->size;
}

/* ベクトルの末尾要素を取得する */
void *vectorBack(vector *v) {
    int n = v->size;
    return n > 0 ? v->data[n - 1] : NULL;
}

/* ベクトルの先頭要素を取得する */
void *vectorFront(vector *v) {
    return v->size > 0 ? v->data[0] : NULL;
}

/* ベクトルの添字 pos にある要素を取得する */
void *vectorAt(vector *v, int pos) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorAt: 範囲外です\n");
        return NULL;
    }
    return v->data[pos];
}

/* ベクトルの添字 pos にある要素を設定する */
void vectorSet(vector *v, int pos, void *elem, int elemSize) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorSet: 範囲外です\n");
        return;
    }
    free(v->data[pos]);
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[pos] = tmp;
}

/* ベクトルの容量を拡張する */
void vectorExpand(vector *v) {
    v->capacity *= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* ベクトルの容量を縮小する */
void vectorShrink(vector *v) {
    v->capacity /= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* ベクトルの添字 pos の位置に要素を挿入する */
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

/* ベクトルの添字 pos にある要素を削除する */
void vectorErase(vector *v, int pos) {
    if (v->size != 0) {
        free(v->data[pos]);
        for (int j = pos; j < v->size - 1; j++) {
            v->data[j] = v->data[j + 1];
        }
        v->size--;
    }
}

/* ベクトルの要素を交換する */
void vectorSwap(vector *v, int i, int j) {
    void *tmp = v->data[i];
    v->data[i] = v->data[j];
    v->data[j] = tmp;
}

/* ベクトルが空かどうか */
bool vectorEmpty(vector *v) {
    return v->size == 0;
}

/* ベクトルが満杯かどうか */
bool vectorFull(vector *v) {
    return v->size == v->capacity;
}

/* ベクトルが等しいかどうか */
bool vectorEqual(vector *v1, vector *v2) {
    if (v1->size != v2->size) {
        printf("サイズが一致しません\n");
        return false;
    }
    for (int i = 0; i < v1->size; i++) {
        void *a = v1->data[i];
        void *b = v2->data[i];
        if (memcmp(a, b, sizeof(a)) != 0) {
            printf("データ %d が一致しません\n", i);
            return false;
        }
    }
    return true;
}

/* ベクトルの要素をソートする */
void vectorSort(vector *v, int (*cmp)(const void *, const void *)) {
    qsort(v->data, v->size, sizeof(void *), cmp);
}

/* 表示関数。変数を表示する関数を渡す必要がある */
/* 現在は深さ 1 の vector の表示にのみ対応する */
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

/* 現在は深さ 2 の vector の表示にのみ対応する */
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
