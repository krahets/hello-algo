/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* Найти k наибольших элементов массива с помощью кучи */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // Инициализировать минимальную кучу и построить ее по первым k элементам
    var heap = Heap(nums.prefix(k))
    // Начиная с элемента k+1, поддерживать длину кучи равной k
    for i in nums.indices.dropFirst(k) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* Driver Code */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("Наибольшие \(k) элементов")
        PrintUtil.printHeap(queue: res)
    }
}
