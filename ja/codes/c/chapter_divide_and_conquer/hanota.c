/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// 順列は最大 1000 個と仮定
#define MAX_SIZE 1000

/* 円盤を 1 枚移動 */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // src の上から円盤を1枚取り出す
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // 円盤を tar の上に置く
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* ハノイの塔の問題 f(i) を解く */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
    move(src, srcSize, tar, tarSize);
    // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* ハノイの塔を解く */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // A の上から n 枚の円盤を B を介して C へ移す
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Driver Code */
int main() {
    // リスト末尾が柱の頂上
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\n初期状態：");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\n円盤の移動完了後：");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
