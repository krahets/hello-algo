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

/* 定义向量类型 */
typedef struct vector {
    int size;     // 当前向量的大小
    int capacity; // 当前向量的容量
    int depth;    // 当前向量的深度
    void **data;  // 指向数据的指针数组
} vector;

/* 构造向量 */
vector *newVector() {
    vector *v = malloc(sizeof(vector));
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    return v;
}

/*构造向量，指定大小、元素默认值*/
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

/* 析构向量 */
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

/*  添加元素（拷贝方式）到向量尾部 */
void vectorPushback(vector *v, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[v->size++] = tmp;
}

/* 从向量尾部弹出元素 */
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

/* 获取向量的大小 */
int vectorSize(vector *v) {
    return v->size;
}

/* 获取向量的尾元素 */
void *vectorBack(vector *v) {
    int n = v->size;
    return n > 0 ? v->data[n - 1] : NULL;
}

/* 获取向量的头元素 */
void *vectorFront(vector *v) {
    return v->data[0];
}

/* 获取向量的第 i 个元素 */
void *vectorGet(vector *v, int i) {
    return v->data[i];
}

/* 设置向量的第 i 个元素 */
void vectorSet(vector *v, int i, void *elem, int elemSize) {
    free(v->data[i]);
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[i] = tmp;
}

/* 向量扩容 */
void vectorExpand(vector *v) {
    v->capacity *= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* 向量缩容 */
void vectorShrink(vector *v) {
    v->capacity /= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* 向量插入元素 */
void vectorInsert(vector *v, int i, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        vectorExpand(v);
    }
    for (int j = v->size; j > i; j--) {
        v->data[j] = v->data[j - 1];
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[i] = tmp;
    v->size++;
}

/* 向量删除元素 */
void vectorErase(vector *v, int i) {
    if (v->size != 0) {
        free(v->data[i]);
        for (int j = i; j < v->size - 1; j++) {
            v->data[j] = v->data[j + 1];
        }
        v->size--;
    }
}

/* 向量交换元素 */
void vectorSwap(vector *v, int i, int j) {
    void *tmp = v->data[i];
    v->data[i] = v->data[j];
    v->data[j] = tmp;
}

/* 向量是否为空 */
bool vectorEmpty(vector *v) {
    return v->size == 0;
}

/* 向量是否已满 */
bool vectorFull(vector *v) {
    return v->size == v->capacity;
}

/* 向量是否相等 */
bool vectorEqual(vector *v1, vector *v2) {
    if (v1->size != v2->size) {
        printf("size not equal\r\n");
        return false;
    }
    for (int i = 0; i < v1->size; i++) {
        int *a = v1->data[i];
        int *b = v2->data[i];
        if (*a != *b) {
            printf("data %d not equal\r\n", i);
            printf("v1->data[%d] = %d\r\n", i, *(int *)v1->data[i]);
            printf("v2->data[%d] = %d\r\n", i, *(int *)v2->data[i]);
            return false;
        }
    }
    return true;
}

/* 比较函数，用于排序，升序*/
int cmp(const void *a, const void *b) {
    int *pa = *(int **)a;
    int *pb = *(int **)b;
    return *pa - *pb;
}

/* 比较函数，用于排序，降序*/
int cmp2(const void *a, const void *b) {
    int *pa = *(int **)a;
    int *pb = *(int **)b;
    return *pb - *pa;
}

/* 对向量内部进行排序 */
void vectorSort(vector *v, int (*cmp)(const void *, const void *)) {
    qsort(v->data, v->size, sizeof(void *), cmp);
}

/* 对向量某段数据排序，升序*/
void vectorSubSort(void **data, int left, int right) {
    if (left >= right) {
        return;
    }
    int i = left, j = right;
    void *pivot = data[left];
    while (i < j) {
        while (i < j && *(int *)data[j] >= *(int *)pivot) {
            j--;
        }
        data[i] = data[j];
        while (i < j && *(int *)data[i] <= *(int *)pivot) {
            i++;
        }
        data[j] = data[i];
    }
    data[i] = pivot;
    vectorSubSort(data, left, i - 1);
    vectorSubSort(data, i + 1, right);
}

/* 对向量某段数据排序，降序*/
void vectorSubSort2(void **data, int left, int right) {
    if (left >= right) {
        return;
    }
    int i = left, j = right;
    void *pivot = data[left];
    while (i < j) {
        while (i < j && *(int *)data[j] <= *(int *)pivot) {
            j--;
        }
        data[i] = data[j];
        while (i < j && *(int *)data[i] >= *(int *)pivot) {
            i++;
        }
        data[j] = data[i];
    }
    data[i] = pivot;
    vectorSubSort2(data, left, i - 1);
    vectorSubSort2(data, i + 1, right);
}

/* 打印向量中的元素 */
void printFunc(vector *v, void *p) {
    int *node = p;
    printf("%d", *node);
}

/* 打印函数， 需传递一个打印变量的函数进来 */
/* 当前仅支持打印深度为 1 的 vector*/
void printVector(vector *v, void (*printFunc)(vector *v, void *p)) {
    if (v) {
        if (v->depth == 0) {
            return;
        } else if (v->depth == 1) {
            if(v->size == 0) {
                printf("\r\n");
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

/* 当前仅支持打印深度为 2 的 vector */
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
