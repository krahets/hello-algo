/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// 假設最多有 1000 個排列
#define MAX_SIZE 1000

/* 移動一個圓盤 */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // 從 src 頂端取出一個圓盤
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // 將圓盤放到 tar 頂端
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* 求解河內塔問題 f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // 若 src 只剩一個圓盤，直接將它移到 tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // 子問題 f(i-1)：藉助 tar，將 src 頂端的 i-1 個圓盤移到 buf
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // 子問題 f(1)：將 src 剩下的一個圓盤移到 tar
    move(src, srcSize, tar, tarSize);
    // 子問題 f(i-1)：藉助 src，將 buf 頂端的 i-1 個圓盤移到 tar
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* 求解河內塔問題 */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // 藉助 B，將 A 頂端的 n 個圓盤移到 C
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* 主程式 */
int main() {
    // 串列尾端對應柱子頂端
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\n初始狀態：");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\n圓盤移動完成後：");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
