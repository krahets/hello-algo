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

    /* Получить размер стека */
    func size() -> Int {
        stack.count
    }

    /* Проверить, пуст ли стек */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* Поместить элемент в стек */
    func push(num: Int) {
        stack.append(num)
    }

    /* Снять элемент со стека */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("Стек пуст")
        }
        return stack.removeLast()
    }

    /* Посмотреть элемент на вершине стека */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Стек пуст")
        }
        return stack.last!
    }

    /* Преобразовать список в массив и вернуть его */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Пример использования */
    static func main() {
        /* Инициализировать стек */
        let stack = ArrayStack()

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
