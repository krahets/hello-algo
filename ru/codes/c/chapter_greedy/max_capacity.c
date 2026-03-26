/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Найти минимальное значение */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* Найти максимальное значение */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Максимальная вместимость: жадный алгоритм */
int maxCapacity(int ht[], int htLength) {
    // Инициализировать i и j так, чтобы они располагались на двух концах массива
    int i = 0;
    int j = htLength - 1;
    // Начальная максимальная вместимость равна 0
    int res = 0;
    // Повторять жадный выбор, пока две доски не встретятся
    while (i < j) {
        // Обновить максимальную вместимость
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // Сдвинуть внутрь более короткую сторону
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // Жадный алгоритм
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("максимальныйвместимостьравно %d\n", res);

    return 0;
}
