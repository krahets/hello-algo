/**
 * File: bucket_sort.ts
 * Created Time: 2023-04-08
 * Author: Justin (xiefahit@gmail.com)
 */

/* Сортировка по бакетам */
function bucketSort(nums: number[]): void {
    // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
    const k = nums.length / 2;
    const buckets: number[][] = [];
    for (let i = 0; i < k; i++) {
        buckets.push([]);
    }
    // 1. Распределить элементы массива по бакетам
    for (const num of nums) {
        // Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
        const i = Math.floor(num * k);
        // Добавить num в бакет i
        buckets[i].push(num);
    }
    // 2. Выполнить сортировку внутри каждого бакета
    for (const bucket of buckets) {
        // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
        bucket.sort((a, b) => a - b);
    }
    // 3. Обойти бакеты и объединить результат
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
console.log('Сортировка по бакетампосле завершения nums =', nums);

export {};
