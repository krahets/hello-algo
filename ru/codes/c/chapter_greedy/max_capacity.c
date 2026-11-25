/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Находим минимум */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* Находим максимум */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Максимальная вместимость: жадный алгоритм */
int maxCapacity(int ht[], int htLength) {
    // Ставим i и j на противоположные концы массива
    int i = 0;
    int j = htLength - 1;
    // Изначально максимальная вместимость равна 0
    int res = 0;
    // Повторяем жадный выбор, пока перегородки не встретятся
    while (i < j) {
        // Обновляем максимальную вместимость
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // Сдвигаем указатель у более низкой перегородки к центру
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Пример запуска */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // Жадный алгоритм
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("Максимальная вместимость: %d\n", res);

    return 0;
}
