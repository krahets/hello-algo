/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Размер кучи равен n. Выполнить просеивание вниз от узла i */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // Найти среди i, l, r узел с наибольшим значением и обозначить его ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // Если максимум уже в i или индексы l и r вне кучи, завершить просеивание
        if ma == i {
            break
        }
        // Поменять два узла местами
        nums.swapAt(i, ma)
        // Продолжить просеивание вниз
        i = ma
    }
}

/* Пирамидальная сортировка */
func heapSort(nums: inout [Int]) {
    // Построить кучу: выполнить просеивание для всех узлов, кроме листьев
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // Извлечь максимум из кучи n-1 раз
    for i in nums.indices.dropFirst().reversed() {
        // Обменять корень с крайним правым листом (первый элемент с последним)
        nums.swapAt(0, i)
        // Выполнить просеивание вниз от корня
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Тестовый пример */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("После пирамидальной сортировки nums = \(nums)")
    }
}
