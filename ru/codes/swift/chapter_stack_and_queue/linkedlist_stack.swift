/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Стек на основе связного списка */
class LinkedListStack {
    private var _peek: ListNode? // Использовать головной узел как вершину стека
    private var _size: Int // Длина стека

    init() {
        _size = 0
    }

    /* Получение длины стека */
    func size() -> Int {
        _size
    }

    /* Проверка, пуст ли стек */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Поместить в стек */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* Извлечь из стека */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* Доступ к верхнему элементу стека */
    func peek() -> Int {
        if isEmpty() {
            fatalError("стек пуст")
        }
        return _peek!.val
    }

    /* Преобразовать List в Array и вернуть */
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
    /* Driver Code */
    static func main() {
        /* Инициализация стека */
        let stack = LinkedListStack()

        /* Помещение элемента в стек */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Стек stack = \(stack.toArray())")

        /* Доступ к верхнему элементу стека */
        let peek = stack.peek()
        print("Верхний элемент peek = \(peek)")

        /* Извлечение элемента из стека */
        let pop = stack.pop()
        print("Извлеченный элемент pop = \(pop), stack после извлечения = \(stack.toArray())")

        /* Получение длины стека */
        let size = stack.size()
        print("Длина стека size = \(size)")

        /* Проверка на пустоту */
        let isEmpty = stack.isEmpty()
        print("Пуст ли стек = \(isEmpty)")
    }
}
