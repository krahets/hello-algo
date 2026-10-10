/**
 * File: bucket_sort.cpp
 * Created Time: 2023-03-30
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Сортировка корзинами */
void bucketSort(vector<float> &nums) {
    // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
    int k = nums.size() / 2;
    vector<vector<float>> buckets(k);
    // 1. Распределить элементы массива по корзинам
    for (float num : nums) {
        // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
        int i = num * k;
        // Добавить num в корзину bucket_idx
        buckets[i].push_back(num);
    }
    // 2. Выполнить сортировку внутри каждой корзины
    for (vector<float> &bucket : buckets) {
        // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
        sort(bucket.begin(), bucket.end());
    }
    // 3. Обойти корзины и объединить результаты
    int i = 0;
    for (vector<float> &bucket : buckets) {
        for (float num : bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
int main() {
    // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
    vector<float> nums = {0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f};
    bucketSort(nums);
    cout << "После сортировки корзинами nums = ";
    printVector(nums);

    return 0;
}
