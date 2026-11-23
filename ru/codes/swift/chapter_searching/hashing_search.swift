/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Хеш-поиск (массив) */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // key хеш-таблицы: целевой элемент, value: индекс
    // Если такого key нет в хеш-таблице, вернуть -1
    return map[target, default: -1]
}

/* Хеш-поиск (связный список) */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // key хеш-таблицы: значение целевого узла, value: объект узла
    // Если такого key нет в хеш-таблице, вернуть null
    return map[target]
}

@main
enum HashingSearch {
    /* Driver Code */
    static func main() {
        let target = 3

        /* Хеш-поиск (массив) */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // Инициализация хеш-таблицы
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // key: элемент, value: индекс
        }
        let index = hashingSearchArray(map: map, target: target)
        print("Индекс целевого элемента 3 = \(index)")

        /* Хеш-поиск (связный список) */
        var head = ListNode.arrToLinkedList(arr: nums)
        // Инициализация хеш-таблицы
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // key: значение узла, value: узел
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("Объект узла со значением 3 = \(node!)")
    }
}
