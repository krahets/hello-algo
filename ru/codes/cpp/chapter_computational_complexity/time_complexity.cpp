/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Постоянная сложность */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* Линейная сложность */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* Линейная сложность (обход массива) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // Число итераций пропорционально длине массива
    for (int num : nums) {
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
int bubbleSort(vector<int> &nums) {
    int count = 0; // Счетчик
    // Внешний цикл: неотсортированный диапазон [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
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
    int count = 0, base = 1;
    // На каждом шаге клетка делится надвое, образуя последовательность 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
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
    // Из одного получается n
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main() {
    // Можно изменить n и запустить программу, чтобы увидеть, как меняется число операций при разных сложностях
    int n = 8;
    cout << "Размер входных данных n = " << n << endl;

    int count = constant(n);
    cout << "Количество операций постоянной сложности = " << count << endl;

    count = linear(n);
    cout << "Количество операций линейной сложности = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Количество операций линейной сложности (обход массива) = " << count << endl;

    count = quadratic(n);
    cout << "Количество операций квадратичной сложности = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Количество операций квадратичной сложности (пузырьковая сортировка) = " << count << endl;

    count = exponential(n);
    cout << "Количество операций экспоненциальной сложности (итерация) = " << count << endl;
    count = expRecur(n);
    cout << "Количество операций экспоненциальной сложности (рекурсия) = " << count << endl;

    count = logarithmic(n);
    cout << "Количество операций логарифмической сложности (итерация) = " << count << endl;
    count = logRecur(n);
    cout << "Количество операций логарифмической сложности (рекурсия) = " << count << endl;

    count = linearLogRecur(n);
    cout << "Количество операций линейно-логарифмической сложности (рекурсия) = " << count << endl;

    count = factorialRecur(n);
    cout << "Количество операций факториальной сложности (рекурсия) = " << count << endl;

    return 0;
}
