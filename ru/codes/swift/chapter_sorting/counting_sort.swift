/**
 * File: counting_sort.swift
 * Created Time: 2023-03-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Сортировка подсчётом */
// Простая реализация, непригодная для сортировки объектов
func countingSortNaive(nums: inout [Int]) {
    // 1. Найти максимальный элемент m в массиве
    let m = nums.max()!
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Пройти по counter и записать элементы в исходный массив nums
    var i = 0
    for num in 0 ..< m + 1 {
        for _ in 0 ..< counter[num] {
            nums[i] = num
            i += 1
        }
    }
}

/* Сортировка подсчётом */
// Полная реализация: устойчивая сортировка с поддержкой объектов
func countingSort(nums: inout [Int]) {
    // 1. Найти максимальный элемент m в массиве
    let m = nums.max()!
    // 2. Подсчитать число вхождений каждого значения
    // counter[num] — число вхождений num
    var counter = Array(repeating: 0, count: m + 1)
    for num in nums {
        counter[num] += 1
    }
    // 3. Вычислить префиксные суммы в counter, чтобы по частотам найти конечные позиции
    // То есть counter[num]-1 — индекс последнего вхождения num в res
    for i in 0 ..< m {
        counter[i + 1] += counter[i]
    }
    // 4. Пройти по nums в обратном порядке и записать элементы в массив результата res
    // Создать массив res для результата
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let num = nums[i]
        res[counter[num] - 1] = num // Поместить num по соответствующему индексу
        counter[num] -= 1 // Уменьшить префиксную сумму на 1, чтобы определить позицию следующего вхождения num
    }
    // Скопировать результат из res в исходный массив nums
    for i in nums.indices {
        nums[i] = res[i]
    }
}

@main
enum CountingSort {
    /* Тестовый пример */
    static func main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSortNaive(nums: &nums)
        print("После сортировки подсчётом (без поддержки объектов) nums = \(nums)")

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
        countingSort(nums: &nums1)
        print("После сортировки подсчётом nums1 = \(nums1)")
    }
}
