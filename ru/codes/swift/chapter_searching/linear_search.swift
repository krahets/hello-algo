/**
 * File: linear_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Линейный поиск (массив) */
func linearSearchArray(nums: [Int], target: Int) -> Int {
    // Обход массива
    for i in nums.indices {
        // Целевой элемент найден, вернуть его индекс
        if nums[i] == target {
            return i
        }
    }
    // Целевой элемент не найден, вернуть -1
    return -1
}

/* Линейный поиск (связный список) */
func linearSearchLinkedList(head: ListNode?, target: Int) -> ListNode? {
    var head = head
    // Обойти связный список
    while head != nil {
        // Найти целевой узел и вернуть его
        if head?.val == target {
            return head
        }
        head = head?.next
    }
    // Целевой узел не найден, вернуть null
    return nil
}

@main
enum LinearSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* Выполнить линейный поиск в массиве */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        let index = linearSearchArray(nums: nums, target: target)
        print("Индекс целевого элемента 3 = \(index)")

        /* Выполнить линейный поиск в связном списке */
        let head = ListNode.arrToLinkedList(arr: nums)
        let node = linearSearchLinkedList(head: head, target: target)
        print("Объект узла со значением 3 = \(node!)")
    }
}
