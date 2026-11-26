/**
 * File: vertex.h
 * Created Time: 2023-10-28
 * Author: krahets (krahets@163.com)
 */

#ifndef VERTEX_H
#define VERTEX_H

#ifdef __cplusplus
extern "C" {
#endif

/* 頂點的結構體 */
typedef struct {
    int val;
} Vertex;

/* 建構函式，用來初始化新頂點 */
Vertex *newVertex(int val) {
    Vertex *vet;
    vet = (Vertex *)malloc(sizeof(Vertex));
    vet->val = val;
    return vet;
}

/* 將存放數值的陣列轉為頂點陣列 */
Vertex **valsToVets(int *vals, int size) {
    Vertex **vertices = (Vertex **)malloc(size * sizeof(Vertex *));
    for (int i = 0; i < size; ++i) {
        vertices[i] = newVertex(vals[i]);
    }
    return vertices;
}

/* 將頂點陣列轉為存放數值的陣列 */
int *vetsToVals(Vertex **vertices, int size) {
    int *vals = (int *)malloc(size * sizeof(int));
    for (int i = 0; i < size; ++i) {
        vals[i] = vertices[i]->val;
    }
    return vals;
}

#ifdef __cplusplus
}
#endif

#endif // VERTEX_H
