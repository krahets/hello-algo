/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Длина кучи равна n; начиная с узла i, выполнить просеивание сверху вниз */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
        if ma == i {
            break
        }
        // Поменять два узла местами
        nums.swapAt(i, ma)
        // Циклическое просеивание вниз
        i = ma
    }
}

/* Сортировка кучей */
func heapSort(nums: inout [Int]) {
    // Построение кучи: выполнить heapify для всех узлов, кроме листовых
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // Извлекать максимальный элемент из кучи в течение n-1 итераций
    for i in nums.indices.dropFirst().reversed() {
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        nums.swapAt(0, i)
        // Начиная с корневого узла, выполнить просеивание сверху вниз
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* Driver Code */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("После сортировки кучей nums = \(nums)")
    }
}
