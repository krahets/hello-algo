/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Подсчетная сортировка */
// Простая реализация, не может использоваться дляСортировкаобъект
func countingSortNaive(nums: inout [Int]) {
    // 1. Найти максимальный элемент массива m
    let m = nums.max()!
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Обойти counter и записать элементы обратно в исходный массив nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Подсчетная сортировка */
// Полная реализация, поддерживает сортируемые объекты и является стабильной сортировкой
func countingSort(nums: inout [Int]) {
    // 1. Найти максимальный элемент массива m
    let m = nums.max()!
    // 2. Подсчитать число появлений каждой цифры
    // counter[num] обозначает число появлений num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Вычислить префиксные суммы counter, преобразовав «число появлений» в «конечный индекс»
    // То есть counter[num]-1 — это индекс последнего появления num в res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Обойти nums в обратном порядке и поместить элементы в результирующий массив res
    // Инициализировать массив res для хранения результата
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Разместить num в соответствующем индексе
        counter[num] -= 1 // Уменьшить префиксную сумму на 1, чтобы получить индекс следующего размещения num
    }
    // Перезаписать исходный массив nums результатом из массива res
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Driver Code */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("После завершения подсчетной сортировки (не подходит для сортируемых объектов) nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("После сортировки подсчетом nums1 = \(nums1)")
    }
}
