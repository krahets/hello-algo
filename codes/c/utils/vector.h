/**
 * File: vector.h
 * Created Time: 2023-07-13
 * Author: Gonglja (glj0@outlook.com)
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

/*  添加元素到向量尾部 */
void vectorPushback(vector *v, void *elem) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    v->data[v->size++] = elem;
}

/* 从向量尾部弹出元素 */
void vectorPopback(vector *v) {
    if (v->size != 0) {
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
    return v->data[v->size];
}

/* 获取向量的头元素 */
void *vectorFront(vector *v) {
    return v->data[0];
}

#ifdef __cplusplus
}
#endif

#endif // VECTOR_H