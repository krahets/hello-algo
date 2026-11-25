/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Получить k-ю цифру числа num, где exp = 10^(k-1) */
int digit(int num, int exp) {
    // Передаём exp вместо k, чтобы не повторять дорогое возведение в степень
    return (num / exp) % 10;
}

/* Сортировка подсчётом по k-й цифре элементов nums */
void countingSortDigit(int nums[], int size, int exp) {
    // Десятичные цифры лежат в пределах 0–9, поэтому в массиве блоков 10 ячеек
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // Инициализировать нулями для последующего освобождения памяти
    // Подсчитать вхождения каждой цифры от 0 до 9
    for (int i = 0; i < size; i++) {
        // Получить k-ю цифру nums[i] и обозначить её d
        int d = digit(nums[i], exp);
        // Подсчитать вхождения цифры d
        counter[d]++;
    }
    // Вычислить префиксные суммы, чтобы по частотам найти индексы в массиве
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Пройти массив с конца и заполнить res по данным счётчиков
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Найти индекс j в массиве для цифры d
        res[j] = nums[i];       // Записать текущий элемент по индексу j
        counter[d]--;           // Уменьшить счётчик d на 1
    }
    // Скопировать результат в исходный массив nums
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // Освободить память
    free(res);
    free(counter);
}

/* Поразрядная сортировка */
void radixSort(int nums[], int size) {
    // Найти максимум массива, чтобы определить наибольшее число разрядов
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // Перебирать разряды от младшего к старшему
    for (int exp = 1; max >= exp; exp *= 10)
        // Отсортировать элементы подсчётом по k-й цифре
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // То есть exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Тестовый пример */
int main() {
    // Поразрядная сортировка
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("После поразрядной сортировки nums = ");
    printArray(nums, size);
}
