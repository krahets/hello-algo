/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка корзинами */
func bucketSort(nums: inout [Double]) {
    // Инициализировать k = n/2 корзин, предполагая распределение 2 элементов в каждую корзину
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Распределить элементы массива по корзинам
    for num in nums {
        // Входные данные лежат в диапазоне [0, 1); использовать num * k для отображения в диапазон индексов [0, k-1]
        let i = Int(num * Double(k))
        // Добавить num в корзину i
        buckets[i].append(num)
    }
    // 2. Выполнить сортировку внутри каждой корзины
    for i in buckets.indices {
        // Использовать встроенную функцию сортировки; ее также можно заменить другим алгоритмом сортировки
        buckets[i].sort()
    }
    // 3. Обойти корзины и объединить результаты
    var i = nums.startIndex
    for bucket in buckets {
        for num in bucket {
            nums[i] = num
            i += 1
        }
    }
}

@main
enum BucketSort {
    /* Driver Code */
    static func main() {
        // Пусть входные данные — числа с плавающей точкой из диапазона [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("После сортировки корзинами nums = \(nums)")
    }
}
