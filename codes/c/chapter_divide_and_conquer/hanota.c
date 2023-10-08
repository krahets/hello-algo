/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com)
 */

#include "../utils/common.h"

/* 移动一个圆盘 */
void move(vector *src, vector *tar) {
    // 从 src 顶部拿出一个圆盘
    int *panTemp = vectorBack(src);
    int *pan = malloc(sizeof(int));
    *pan = *panTemp;
    vectorPopback(src);
    // 将圆盘放入 tar 顶部
    vectorPushback(tar, pan, sizeof(int));
}

/* 求解汉诺塔：问题 f(i) */
void dfs(int i, vector *src, vector *buf, vector *tar) {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if (i == 1) {
        move(src, tar);
        return;
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, tar);
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解汉诺塔 */
void solveHanota(vector *A, vector *B, vector *C) {
    int n = A->size;
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C);
}

/* 打印向量中的元素 */
void printFunc(vector *v, void *p) {
    int *node = p;
    printf("%d", *node);
}

/* Driver Code */
int main() {
    // 列表尾部是柱子顶部
    int a[] = {5, 4, 3, 2, 1};
    vector *A = newVector(); // int
    vector *B = newVector(); // int
    vector *C = newVector(); // int
    for (int i = 0; i < sizeof(a) / sizeof(a[0]); i++) {
        vectorPushback(A, &a[i], sizeof(int));
    }

    printf("初始状态下：\n");
    printf("A =");
    printVector(A, printFunc);
    printf("B =");
    printVector(B, printFunc);
    printf("C =");
    printVector(C, printFunc);

    solveHanota(A, B, C);

    printf("圆盘移动完成后：\n");
    printf("A =");
    printVector(A, printFunc);
    printf("B =");
    printVector(B, printFunc);
    printf("C =");
    printVector(C, printFunc);

    // 释放内存
    delVector(A);
    delVector(B);
    delVector(C);
    return 0;
}
