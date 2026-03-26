/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка по бакетам */
func bucketSort(nums: inout [Double]) {
    // Инициализировать k = n/2 бакетов, предполагая, что в каждый бакет попадут 2 элемента
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Распределить элементы массива по бакетам
    for num in nums {
        // Входданныедиапазонравно [0, 1), Использовать num * k отобразить виндексдиапазон [0, k-1]
        let i = Int(num * Double(k))
        // Добавить num в бакет i
        buckets[i].append(num)
    }
    // 2. Выполнить сортировку внутри каждого бакета
    for i in buckets.indices {
        // Использовать встроенную функцию сортировки; при необходимости ее можно заменить другим алгоритмом сортировки
        buckets[i].sort()
    }
    // 3. Обойти бакеты и объединить результат
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
        // ПустьВходданныеравночисла с плавающей точкой, диапазонравно [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("Сортировка по бакетампосле завершения nums = \(nums)")
    }
}
