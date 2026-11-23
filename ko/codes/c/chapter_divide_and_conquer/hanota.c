/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// 순열이 최대 1000개라고 가정
#define MAX_SIZE 1000

/* 원판 하나 이동 */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // src의 맨 위에서 원판 하나를 꺼낸다
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // 원판을 tar의 맨 위에 놓는다
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* 하노이의 탑 문제 f(i) 풀기 */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move(src, srcSize, tar, tarSize);
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* 하노이의 탑 문제 풀기 */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* 실행 코드 */
int main() {
    // 리스트의 맨 뒤가 기둥의 맨 위이다
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\n초기 상태:");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\n원판 이동을 마친 후:");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
