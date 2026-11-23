/**
 * File: radix_sort.cpp
 * Created Time: 2023-03-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Получить k-й разряд элемента num, где exp = 10^(k-1) */
int digit(int num, int exp) {
    // Передача exp вместо k позволяет избежать повторного дорогостоящего вычисления степени
    return (num / exp) % 10;
}

/* Сортировка подсчетом (сортировка по k-му разряду nums) */
void countingSortDigit(vector<int> &nums, int exp) {
    // Разряды десятичной системы лежат в диапазоне 0~9, поэтому нужен массив корзин длины 10
    vector<int> counter(10, 0);
    int n = nums.size();
    // Подсчитать число появлений каждой цифры от 0 до 9
    for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Получить k-й разряд nums[i], обозначив его как d
        counter[d]++;                // Подсчитать число появлений цифры d
    }
    // Вычислить префиксные суммы и преобразовать «число появлений» в «индекс массива»
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Выполняя обратный проход, заполнить res элементами по статистике в корзинах
    vector<int> res(n, 0);
    for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Получить индекс j цифры d в массиве
        res[j] = nums[i];       // Поместить текущий элемент по индексу j
        counter[d]--;           // Уменьшить количество d на 1
    }
    // Перезаписать исходный массив nums результатом
    for (int i = 0; i < n; i++)
        nums[i] = res[i];
}

/* Поразрядная сортировка */
void radixSort(vector<int> &nums) {
    // Получить максимальный элемент массива, чтобы определить максимальное число разрядов
    int m = *max_element(nums.begin(), nums.end());
    // Проходить разряды от младшего к старшему
    for (int exp = 1; exp <= m; exp *= 10)
        // Выполнить сортировку подсчетом по k-му разряду элементов массива
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // то есть exp = 10^(k-1)
        countingSortDigit(nums, exp);
}

/* Driver Code */
int main() {
    // Поразрядная сортировка
    vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                        88906420, 72429244, 30524779, 82060337, 63832996};
    radixSort(nums);
    cout << "После поразрядной сортировки nums = ";
    printVector(nums);

    return 0;
}
