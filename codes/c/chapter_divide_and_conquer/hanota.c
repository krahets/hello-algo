/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// 假设最多有 1000 个排列
#define MAX_SIZE 1000

/* 移动一个圆盘 */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // 从 src 顶部拿出一个圆盘
    int pan = src[*srcSize - 1];
    (*srcSize)--;
    // 将圆盘放入 tar 顶部
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* 求解汉诺塔：问题 f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, 
            int *bufSize, int *tar, int *tarSize) {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move(src, srcSize, tar, tarSize);
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* 求解汉诺塔 */
void solveHanota(int *A, int *B, int *C, int n) {
    int ASize = n;
    int BSize = 0;
    int CSize = 0;
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, &ASize, B, &BSize, C, &CSize);

    // 在 C 语言中，传递数组参数时，实际上传递的是指向数组首元素的指针，
    // 而不是数组本身，移动元素只会修改传递的指针所指向的内存，而不会影
    // 响原始数组，所以手动清空
    memset(A, 0, n * sizeof(int));
    memset(B, 0, n * sizeof(int));
}

/* 打印向量中的元素 */
// void printFunc(int *array, int size) {
//     int *node = p;
//     printf("%d", *node);
// }

/* Driver Code */
int main() {
    // 列表尾部是柱子顶部
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};
    int n = sizeof(a) / sizeof(a[0]);
    
    printf("初始状态下：\n");
    printf("A =");
    printArray(a, n);
    printf("B =");
    printArray(b, n);
    printf("C =");
    printArray(c, n);

    solveHanota(a, b, c, n);

    printf("圆盘移动完成后：\n");
    printf("A =");
    printArray(a, n);
    printf("B =");
    printArray(b, n);
    printf("C =");
    printArray(c, n);

    return 0;
}

