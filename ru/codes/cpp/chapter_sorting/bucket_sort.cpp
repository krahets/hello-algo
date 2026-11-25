/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Блочная сортировка */
void bucketSort(vector<float> &nums) {
    // Создать k = n/2 блоков в расчёте на два элемента в каждом
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Распределить элементы массива по блокам
    for (float num : nums) {
        // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        int i = num * k;
        // Добавить num в блок bucket_idx
        buckets[i].push_back(num);
    }
    // 2. Отсортировать каждый блок
    for (vector<float> &bucket : buckets) {
        // Используем встроенную сортировку. Её можно заменить другим алгоритмом
        sort(bucket.begin(), bucket.end());
    }
    // 3. Обойти блоки и объединить результаты
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Тестовый пример */
int main() {
    // Входные данные — числа с плавающей точкой из интервала [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "После блочной сортировки nums = ";
    printVector(nums);

    return 0;
}
