/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Стек на основе массива */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Инициализация списка (динамического массива)
        stack = []
    }

    /* Получение длины стека */
    func size() -> Int {
        stack.count
    }

    /* Проверка, пуст ли стек */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* Поместить в стек */
    func push(num: Int) {
        stack.append(num)
    }

    /* Извлечь из стека */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("стек пуст")
        }
        return stack.removeLast()
    }

    /* Доступ к верхнему элементу стека */
    func peek() -> Int {
        if isEmpty() {
            fatalError("стек пуст")
        }
        return stack.last!
    }

    /* Преобразовать List в Array и вернуть */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* Инициализация стека */
        let stack = ArrayStack()

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
