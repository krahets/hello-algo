/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Постоянная сложность */
int constant(int n) {
    int count = 0;
    int size = 100000;
    int i = 0;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* Линейная сложность */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Линейная сложность (обход массива) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // Число итераций пропорционально длине массива
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Квадратичная сложность */
int quadratic(int n) {
    int count = 0;
    // Число итераций квадратично зависит от размера данных n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Квадратичная сложность (пузырьковая сортировка) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Счетчик
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Внутренний цикл: переместить максимальный элемент неотсортированного диапазона [0, i] в его правый конец
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов включает 3 элементарные операции
            }
        }
    }
    return count;
}

/* Экспоненциальная сложность (итеративная реализация) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Экспоненциальная сложность (рекурсивная реализация) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Логарифмическая сложность (итеративная реализация) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Логарифмическая сложность (рекурсивная реализация) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Линейно-логарифмическая сложность */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Факториальная сложность (рекурсивная реализация) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
    int n = 8;
    printf("Размер входных данных n = %d\n", n);

    int count = constant(n);
    printf("Количество операций постоянной сложности = %d\n", count);

    count = linear(n);
    printf("Количество операций линейной сложности = %d\n", count);
    // Выделить память в куче (создать одномерный массив переменной длины: число элементов равно n, тип элементов — int)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Количество операций линейной сложности (обход массива) = %d\n", count);

    count = quadratic(n);
    printf("Количество операций квадратичной сложности = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Количество операций квадратичной сложности (пузырьковая сортировка) = %d\n", count);

    count = exponential(n);
    printf("Количество операций экспоненциальной сложности (итерация) = %d\n", count);
    count = expRecur(n);
    printf("Количество операций экспоненциальной сложности (рекурсия) = %d\n", count);

    count = logarithmic(n);
    printf("Количество операций логарифмической сложности (итерация) = %d\n", count);
    count = logRecur(n);
    printf("Количество операций логарифмической сложности (рекурсия) = %d\n", count);

    count = linearLogRecur(n);
    printf("Количество операций линейно-логарифмической сложности (рекурсия) = %d\n", count);

    count = factorialRecur(n);
    printf("Количество операций факториальной сложности (рекурсия) = %d\n", count);

    // Освободить память в куче
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
