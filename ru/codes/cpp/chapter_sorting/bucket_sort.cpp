/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка по бакетам */
void bucketSort(vector<float> &nums) {
    // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Распределить элементы массива по бакетам
    for (float num : nums) {
        // Диапазон входных данных равен [0, 1), использовать num * k для отображения в диапазон индексов [0, k-1]
        int i = num * k;
        // Добавить num в бакет bucket_idx
        buckets[i].push_back(num);
    }
    // 2. Выполнить сортировку внутри каждого бакета
    for (vector<float> &bucket : buckets) {
        // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
        sort(bucket.begin(), bucket.end());
    }
    // 3. Обойти бакеты и объединить результат
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
int main() {
    // Пусть входные данные являются числами с плавающей точкой, диапазон равен [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "После сортировки по бакетам nums =";
    printVector(nums);

    return 0;
}
