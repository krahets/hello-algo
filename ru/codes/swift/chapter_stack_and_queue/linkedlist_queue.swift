/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Очередь на основе связного списка */
class LinkedListQueue {
    private var front: ListNode? // Головной узел
    private var rear: ListNode? // Хвостовой узел
    private var _size: Int

    init() {
        _size = 0
    }

    /* Получение длины очереди */
    func size() -> Int {
        _size
    }

    /* Проверка, пуста ли очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Поместить в очередь */
    func push(num: Int) {
        // Добавить num после хвостового узла
        let node = ListNode(x: num)
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
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

    /* Доступ к элементу в начале очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("очередь пуста")
        }
        return front!.val
    }

    /* Преобразовать связный список в Array и вернуть */
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
        /* Инициализация очереди */
        let queue = LinkedListQueue()

        /* Добавление элемента в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Очередь queue = \(queue.toArray())")

        /* Доступ к элементу в начале очереди */
        let peek = queue.peek()
        print("Первый элемент peek = \(peek)")

        /* Извлечение элемента из очереди */
        let pop = queue.pop()
        print("Извлеченный элемент pop = \(pop), queue после извлечения = \(queue.toArray())")

        /* Получение длины очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверка, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Пуста ли очередь = \(isEmpty)")
    }
}
