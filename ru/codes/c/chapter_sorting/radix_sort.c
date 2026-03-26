/**
 * File: radix_sort.c
 * Created Time: 2023-01-18
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
int digit(int num, int exp) {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return (num / exp) % 10;
}

/* Подсчетная сортировка (сортировка по k-му разряду nums) */
void countingSortDigit(int nums[], int size, int exp) {
    // Диапазон десятичного разряда равен 0~9, поэтому нужен массив корзин длины 10
    int *counter = (int *)malloc((sizeof(int) * 10));
    memset(counter, 0, sizeof(int) * 10); // Инициализировать значением 0 для последующего освобождения памяти
    // Подсчитать количество появлений каждой цифры от 0 до 9
    for (int i = 0; i < size; i++) {
        // Получить k-й разряд nums[i] и обозначить его как d
        int d = digit(nums[i], exp);
        // Подсчитать количество появлений цифры d
        counter[d]++;
    }
    // Вычислить префиксную сумму и преобразовать число появлений в индексы массива
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Обойти в обратном порядке и, согласно статистике по корзинам, заполнить элементы в res
    int *res = (int *)malloc(sizeof(int) * size);
    for (int i = size - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Получить индекс j цифры d в массиве
        res[j] = nums[i];       // Записать текущий элемент в индекс j
        counter[d]--;           // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for (int i = 0; i < size; i++) {
        nums[i] = res[i];
    }
    // Освободить память
    free(res);
    free(counter);
}

/* Поразрядная сортировка */
void radixSort(int nums[], int size) {
    // Получить максимальный элемент массива, чтобы определить наибольшее число разрядов
    int max = INT32_MIN;
    for (int i = 0; i < size; i++) {
        if (nums[i] > max) {
            max = nums[i];
        }
    }
    // Перебирать от младшего разряда к старшему
    for (int exp = 1; max >= exp; exp *= 10)
        // Выполнить подсчетную сортировку по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        countingSortDigit(nums, size, exp);
}

/* Driver Code */
int main() {
    // Поразрядная сортировка
    int nums[] = {10546151, 35663510, 42865989, 34862445, 81883077,
                  88906420, 72429244, 30524779, 82060337, 63832996};
    int size = sizeof(nums) / sizeof(int);
    radixSort(nums, size);
    printf("После завершения поразрядной сортировки nums = ");
    printArray(nums, size);
}
