/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка подсчетом */
// Простая реализация, не подходит для сортировки объектов
void countingSortNaive(vector<int> &nums) {
    // 1. Найти максимальный элемент массива m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Обойти counter и заполнить исходный массив nums элементами
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Сортировка подсчетом */
// Полная реализация, позволяет сортировать объекты и является стабильной сортировкой
void countingSort(vector<int> &nums) {
    // 1. Найти максимальный элемент массива m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Вычислить префиксные суммы counter и преобразовать «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums массивом результата res
    nums = res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "После сортировки подсчетом (объекты не поддерживаются) nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "После сортировки подсчетом nums1 = ";
    printVector(nums1);

    return 0;
}
