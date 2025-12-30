/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// Assume at most 1000 permutations
#define MAX_SIZE 1000

/* Move a disk */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // Take out a disk from the top of src
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // Place the disk on top of tar
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* Solve the Tower of Hanoi problem f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // If there is only one disk left in src, move it directly to tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // Subproblem f(i-1): move the top i-1 disks from src to buf using tar
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // Subproblem f(1): move the remaining disk from src to tar
    move(src, srcSize, tar, tarSize);
    // Subproblem f(i-1): move the top i-1 disks from buf to tar using src
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* Solve the Tower of Hanoi problem */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // Move the top n disks from A to C using B
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Driver Code */
int main() {
    // The tail of the list is the top of the rod
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\nInitial state:");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\nAfter disk movement:");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
