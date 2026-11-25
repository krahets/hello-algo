/**
 * File: bucket_sort.swift
 * Created Time: 2023-03-27
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Блочная сортировка */
func bucketSort(nums: inout [Double]) {
    // Создать k = n/2 блоков в расчёте на два элемента в каждом
    let k = nums.count / 2
    var buckets = (0 ..< k).map { _ in [Double]() }
    // 1. Распределить элементы массива по блокам
    for num in nums {
        // Значения лежат в [0, 1). Умножение num * k даёт индекс в [0, k-1]
        let i = Int(num * Double(k))
        // Добавить num в блок i
        buckets[i].append(num)
    }
    // 2. Отсортировать каждый блок
    for i in buckets.indices {
        // Используем встроенную сортировку. Её можно заменить другим алгоритмом
        buckets[i].sort()
    }
    // 3. Обойти блоки и объединить результаты
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
    /* Тестовый пример */
    static func main() {
        // Входные данные — числа с плавающей точкой из интервала [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
        bucketSort(nums: &nums)
        print("После блочной сортировки nums = \(nums)")
    }
}
