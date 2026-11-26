/**
 * File: hashing_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Поиск по хеш-таблице в массиве */
func hashingSearchArray(map: [Int: Int], target: Int) -> Int {
    // Ключ хеш-таблицы — искомый элемент, значение — его индекс
    // Если ключа в хеш-таблице нет, возвращаем -1
    return map[target, default: -1]
}

/* Поиск по хеш-таблице в связном списке */
func hashingSearchLinkedList(map: [Int: ListNode], target: Int) -> ListNode? {
    // Ключ хеш-таблицы — искомое значение узла, значение таблицы — сам узел
    // Если ключа в хеш-таблице нет, возвращаем null
    return map[target]
}

@main
enum HashingSearch {
    /* Пример использования */
    static func main() {
        let target = 3

        /* Поиск по хеш-таблице в массиве */
        let nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
        // Создаём хеш-таблицу
        var map: [Int: Int] = [:]
        for i in nums.indices {
            map[nums[i]] = i // Ключ — элемент, значение — индекс
        }
        let index = hashingSearchArray(map: map, target: target)
        print("Индекс элемента 3 = \(index)")

        /* Поиск по хеш-таблице в связном списке */
        var head = ListNode.arrToLinkedList(arr: nums)
        // Создаём хеш-таблицу
        var map1: [Int: ListNode] = [:]
        while head != nil {
            map1[head!.val] = head! // Ключ — значение узла, значение — сам узел
            head = head?.next
        }
        let node = hashingSearchLinkedList(map: map1, target: target)
        print("Узел со значением 3: \(node!)")
    }
}
