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

/* 頂点構造体 */
typedef struct {
    int val;
} Vertex;

/* コンストラクタ。新しいノードを初期化する */
Vertex *newVertex(int val) {
    Vertex *vet;
    vet = (Vertex *)malloc(sizeof(Vertex));
    vet->val = val;
    return vet;
}

/* 値の配列を頂点配列に変換 */
Vertex **valsToVets(int *vals, int size) {
    Vertex **vertices = (Vertex **)malloc(size * sizeof(Vertex *));
    for (int i = 0; i < size; ++i) {
        vertices[i] = newVertex(vals[i]);
    }
    return vertices;
}

/* 頂点配列を値配列に変換 */
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
