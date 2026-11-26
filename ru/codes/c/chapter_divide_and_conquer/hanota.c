/**
 * File: hanota.c
 * Created Time: 2023-10-01
 * Author: Zuoxun (845242523@qq.com), lucas(superrat6@gmail.com)
 */

#include "../utils/common.h"

// Предполагаем, что число перестановок не превышает 1000
#define MAX_SIZE 1000

/* Перенос одного диска */
void move(int *src, int *srcSize, int *tar, int *tarSize) {
    // Снимаем верхний диск с src
    int pan = src[*srcSize - 1];
    src[*srcSize - 1] = 0;
    (*srcSize)--;
    // Кладём диск на вершину tar
    tar[*tarSize] = pan;
    (*tarSize)++;
}

/* Решение задачи о ханойских башнях f(i) */
void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
    // Если с src осталось перенести один диск, кладём его сразу на tar
    if (i == 1) {
        move(src, srcSize, tar, tarSize);
        return;
    }
    // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
    // Подзадача f(1): переносим оставшийся диск с src на tar
    move(src, srcSize, tar, tarSize);
    // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
}

/* Решение задачи о ханойских башнях */
void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
    // Переносим n верхних дисков с A на C с помощью B
    dfs(*ASize, A, ASize, B, BSize, C, CSize);
}

/* Основная программа */
int main() {
    // Последний элемент списка соответствует вершине стержня
    int a[] = {5, 4, 3, 2, 1};
    int b[MAX_SIZE] = {0};
    int c[MAX_SIZE] = {0};

    int ASize = sizeof(a) / sizeof(a[0]);
    int BSize = 0;
    int CSize = 0;

    printf("\nИсходное состояние:");
    printf("\nA = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    solveHanota(a, &ASize, b, &BSize, c, &CSize);

    printf("\nПосле переноса дисков:");
    printf("A = ");
    printArray(a, ASize);
    printf("B = ");
    printArray(b, BSize);
    printf("C = ");
    printArray(c, CSize);

    return 0;
}
