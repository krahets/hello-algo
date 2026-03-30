/**
 * File: bucket_sort.js
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка корзинами */
function bucketSort(nums) {
    // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
    const k = nums.length / 2;
    const buckets = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. Распределить элементы массива по корзинам
    for (const num of nums) {
        // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
        const i = Math.floor(num * k);
        // Добавить num в корзину i
        buckets[i].push(num);
    }
    // 2. Выполнить сортировку внутри каждой корзины
    for (const bucket of buckets) {
        // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
        bucket.sort((a, b) => a - b);
    }
    // 3. Обойти корзины и объединить результаты
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* Driver Code */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('После сортировки корзинами nums =', nums);
