/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Константная сложность */
int constant(int n) {
    int count = 0;
    int size = 100000;
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
    // Число итераций пропорционально квадрату размера данных n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Квадратичная сложность (пузырьковая сортировка) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Счётчик
    // Внешний цикл: неотсортированный участок — [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Внутренний цикл обменами перемещает максимум участка [0, i] на его правый край
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Поменять местами nums[j] и nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Обмен элементов состоит из трёх элементарных операций
            }
        }
    }
    return count;
}

/* Экспоненциальная сложность (цикл) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // На каждом шаге клетка делится надвое. Получаем 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Экспоненциальная сложность (рекурсия) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Логарифмическая сложность (цикл) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Логарифмическая сложность (рекурсия) */
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

/* Факториальная сложность (рекурсия) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Основная программа */
int main(int argc, char *argv[]) {
    // Попробуйте менять n и следить за ростом числа операций при разной сложности
    int n = 8;
    printf("Размер входных данных n = %d\n", n);

    int count = constant(n);
    printf("Число операций при константной сложности = %d\n", count);

    count = linear(n);
    printf("Число операций при линейной сложности = %d\n", count);
    // Выделить память в куче для одномерного массива переменной длины из n элементов типа int
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Число операций при линейной сложности (обход массива) = %d\n", count);

    count = quadratic(n);
    printf("Число операций при квадратичной сложности = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Число операций при квадратичной сложности (пузырьковая сортировка) = %d\n", count);

    count = exponential(n);
    printf("Число операций при экспоненциальной сложности (цикл) = %d\n", count);
    count = expRecur(n);
    printf("Число операций при экспоненциальной сложности (рекурсия) = %d\n", count);

    count = logarithmic(n);
    printf("Число операций при логарифмической сложности (цикл) = %d\n", count);
    count = logRecur(n);
    printf("Число операций при логарифмической сложности (рекурсия) = %d\n", count);

    count = linearLogRecur(n);
    printf("Число операций при линейно-логарифмической сложности (рекурсия) = %d\n", count);

    count = factorialRecur(n);
    printf("Число операций при факториальной сложности (рекурсия) = %d\n", count);

    // Освободить память в куче
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
