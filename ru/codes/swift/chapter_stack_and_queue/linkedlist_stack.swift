/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Стек на основе связного списка */
class LinkedListStack {
    private var _peek: ListNode? // Первый узел списка служит вершиной стека
    private var _size: Int // Размер стека

    init() {
        _size = 0
    }

    /* Получить размер стека */
    func size() -> Int {
        _size
    }

    /* Проверить, пуст ли стек */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Поместить элемент в стек */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* Снять элемент со стека */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* Посмотреть элемент на вершине стека */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Стек пуст")
        }
        return _peek!.val
    }

    /* Преобразовать связный список в массив и вернуть его */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: size())
        for i in res.indices.reversed() {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListStack {
    /* Пример использования */
    static func main() {
        /* Инициализировать стек */
        let stack = LinkedListStack()

        /* Поместить элементы в стек */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Стек stack = \(stack.toArray())")

        /* Посмотреть элемент на вершине стека */
        let peek = stack.peek()
        print("Элемент на вершине стека peek = \(peek)")

        /* Снять элемент со стека */
        let pop = stack.pop()
        print("Снятый элемент pop = \(pop), после снятия stack = \(stack.toArray())")

        /* Получить размер стека */
        let size = stack.size()
        print("Размер стека size = \(size)")

        /* Проверить, пуст ли стек */
        let isEmpty = stack.isEmpty()
        print("Стек пуст = \(isEmpty)")
    }
}
