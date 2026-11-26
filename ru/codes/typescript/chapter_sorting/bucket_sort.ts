/**
 * File: bucket_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Блочная сортировка */
function bucketSort(nums: number[]): void {
    // Создать k = n/2 блоков в расчёте на два элемента в каждом
    const k = nums.length / 2;
    const buckets: number[][] = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. Распределить элементы массива по блокам
    for (const num of nums) {
        // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        const i = Math.floor(num * k);
        // Добавить num в блок i
        buckets[i].push(num);
    }
    // 2. Отсортировать каждый блок
    for (const bucket of buckets) {
        // Используем встроенную сортировку. Её можно заменить другим алгоритмом
        bucket.sort((a, b) => a - b);
    }
    // 3. Обойти блоки и объединить результаты
    let i = 0;
    for (const bucket of buckets) {
        for (const num of bucket) {
            nums[i++] = num;
        }
    }
}

/* Тестовый пример */
const nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
bucketSort(nums);
console.log('После блочной сортировки nums =', nums);

export {};
