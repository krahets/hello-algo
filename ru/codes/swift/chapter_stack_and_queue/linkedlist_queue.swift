/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Очередь на основе связного списка */
class LinkedListQueue {
    private var front: ListNode? // головной узел
    private var rear: ListNode? // хвостовой узел
    private var _size: Int

    init() {
        _size = 0
    }

    /* Получить длину очереди */
    func size() -> Int {
        _size
    }

    /* Проверить, пуста ли очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Поместить в очередь */
    func push(num: Int) {
        // Добавить num после хвостового узла
        let node = ListNode(x: num)
        // Если очередь пуста, сделать так, чтобы головной и хвостовой узлы указывали на этот узел
        if front == nil {
            front = node
            rear = node
        }
        // Если очередь не пуста, добавить этот узел после хвостового узла
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* Извлечь из очереди */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Удалить головной узел
        front = front?.next
        _size -= 1
        return num
    }

    /* Получить элемент в начале очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Очередь пуста")
        }
        return front!.val
    }

    /* Преобразовать связный список в Array и вернуть его */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListQueue {
    /* Driver Code */
    static func main() {
        /* Инициализировать очередь */
        let queue = LinkedListQueue()

        /* Поместить элемент в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("очередь queue = \(queue.toArray())")

        /* Получить элемент в начале очереди */
        let peek = queue.peek()
        print("голова очередиэлемент peek = \(peek)")

        /* Извлечь элемент из очереди */
        let pop = queue.pop()
        print("Элемент, извлеченный из очереди, pop = \(pop), queue после извлечения = \(queue.toArray())")

        /* Получить длину очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Очередь пуста: \(isEmpty)")
    }
}
