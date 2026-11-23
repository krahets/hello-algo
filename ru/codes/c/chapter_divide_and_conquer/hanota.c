/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// Предположим, что существует не более 1000 перестановок
#define MAX_SIZE 1000

/* Переместить один диск */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // Снять диск с вершины src
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // Положить диск на вершину tar
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* Решить задачу Ханойской башни f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // Если в src остался только один диск, сразу переместить его в tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // Подзадача f(1): переместить оставшийся один диск из src в tar
    move(src, srcSize, tar, tarSize);
    // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* Решить задачу Ханойской башни */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // Переместить верхние n дисков из A в C с помощью B
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Driver Code */
int main() {
    // Хвост списка соответствует вершине столбца
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\nНачальное состояние:");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\nПосле завершения перемещения дисков:");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
