/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
void countingSortNaive(vector<int> &nums) {
    // 1. Найти максимальный элемент m в массиве
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
void countingSort(vector<int> &nums) {
    // 1. Найти максимальный элемент m в массиве
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Поместить num по соответствующему индексу
        counter[num]--;              // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    nums = res;
}

/* Тестовый пример */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "После сортировки подсчётом (без поддержки объектов) nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "После сортировки подсчётом nums1 = ";
    printVector(nums1);

    return 0;
}
