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
    // 從 src 頂部拿出一個圓盤
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // 將圓盤放入 tar 頂部
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* 求解河內塔問題 f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move(src, srcSize, tar, tarSize);
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* 求解河內塔問題 */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // 將 A 頂部 n 個圓盤藉助 B 移到 C
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Driver Code */
int main() {
    // 串列尾部是柱子頂部
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\n初始狀態下：");
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
