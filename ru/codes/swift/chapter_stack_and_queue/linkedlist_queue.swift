/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Очередь на основе связного списка */
class LinkedListQueue {
    private var front: ListNode? // Первый узел
    private var rear: ListNode? // Последний узел
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

    /* Добавить элемент в очередь */
    func push(num: Int) {
        // Добавить узел со значением num после последнего узла
        let node = ListNode(x: num)
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if front == nil {
            front = node
            rear = node
        }
        // Если очередь непуста, добавить новый узел после последнего
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* Извлечь элемент из очереди */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Удалить первый узел
        front = front?.next
        _size -= 1
        return num
    }

    /* Посмотреть первый элемент очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Очередь пуста")
        }
        return front!.val
    }

    /* Преобразовать связный список в массив и вернуть его */
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
    /* Пример использования */
    static func main() {
        /* Инициализировать очередь */
        let queue = LinkedListQueue()

        /* Добавить элементы в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Очередь queue = \(queue.toArray())")

        /* Посмотреть первый элемент очереди */
        let peek = queue.peek()
        print("Первый элемент очереди peek = \(peek)")

        /* Извлечь элемент из очереди */
        let pop = queue.pop()
        print("Извлечённый элемент pop = \(pop), после извлечения queue = \(queue.toArray())")

        /* Получить длину очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Очередь пуста = \(isEmpty)")
    }
}
