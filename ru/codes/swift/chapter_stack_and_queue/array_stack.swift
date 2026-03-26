/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Стек на основе массива */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Инициализировать список (динамический массив)
        stack = []
    }

    /* Получить длину стека */
    func size() -> Int {
        stack.count
    }

    /* Проверить, пуст ли стек */
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
            fatalError("стекпуст")
        }
        return stack.removeLast()
    }

    /* Получить верхний элемент стека */
    func peek() -> Int {
        if isEmpty() {
            fatalError("стекпуст")
        }
        return stack.last!
    }

    /* Преобразовать List в Array и вернуть его */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* Инициализировать стек */
        let stack = ArrayStack()

        /* Поместить элемент в стек */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("стек stack = \(stack.toArray())")

        /* Получить верхний элемент стека */
        let peek = stack.peek()
        print("вершина стекаэлемент peek = \(peek)")

        /* Извлечь элемент из стека */
        let pop = stack.pop()
        print("извлечение из стекаэлемент pop = \(pop), извлечение из стекапосле stack = \(stack.toArray())")

        /* Получить длину стека */
        let size = stack.size()
        print("Длина стека size = \(size)")

        /* Проверить, пуста ли структура */
        let isEmpty = stack.isEmpty()
        print("стекпуст ли = \(isEmpty)")
    }
}
