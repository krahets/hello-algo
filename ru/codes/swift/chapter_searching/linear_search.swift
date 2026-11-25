/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Линейный поиск в массиве */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Обходим массив
    for i in nums.indices {
        // Элемент найден, возвращаем его индекс
        if nums[i] == target {
            return i
        }
    }
    // Элемент не найден, возвращаем -1
    return -1
}

/* Линейный поиск в связном списке */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Обходим связный список
    while head != nil {
        // Нужный узел найден, возвращаем его
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // Нужный узел не найден, возвращаем null
    return nil
}

@main
enum LinearSearch {
    /* Пример использования */
    static func main() {
        let target = 3

        /* Выполняем линейный поиск в массиве */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Индекс элемента 3 = \(index)")

        /* Выполняем линейный поиск в связном списке */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("Узел со значением 3: \(node!)")
    }
}
