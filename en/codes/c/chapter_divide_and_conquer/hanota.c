/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// Assume a maximum of 1000 permutations
#define MAX_SIZE 1000

/* Move a disc */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // Take out a disc from the top of src
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // Place the disc on top of tar
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* Solve the Tower of Hanoi problem f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // If only one disc remains on src, move it to tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // Subproblem f(1): move the remaining one disc from src to tar
    move(src, srcSize, tar, tarSize);
    // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* Solve the Tower of Hanoi problem */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // Move the top n discs from A with the help of B to C
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Driver Code */
int main() {
    // The tail of the list is the top of the pillar
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\nInitial state:\n");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\nAfter disk movement is completed:\n");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
