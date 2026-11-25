/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* Найти k наибольших элементов массива с помощью кучи */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // Инициализировать мин-кучу, построив её из первых k элементов
    var heap = Heap(nums.prefix(k))
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for i in nums.indices.dropFirst(k) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* Пример использования */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("Наибольшие элементы (всего \(k)):")
        PrintUtil.printHeap(queue: res)
    }
}
