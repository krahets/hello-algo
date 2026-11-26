/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Пример использования */
    static func main() {
        /* Инициализировать стек */
        // В Swift нет встроенного класса стека, поэтому в качестве стека можно использовать Array
        var stack: [Int] = []

        /* Поместить элементы в стек */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Стек stack = \(stack)")

        /* Посмотреть элемент на вершине стека */
        let peek = stack.last!
        print("Элемент на вершине стека peek = \(peek)")

        /* Снять элемент со стека */
        let pop = stack.removeLast()
        print("Снятый элемент pop = \(pop), после снятия stack = \(stack)")

        /* Получить размер стека */
        let size = stack.count
        print("Размер стека size = \(size)")

        /* Проверить, пуст ли стек */
        let isEmpty = stack.isEmpty
        print("Стек пуст = \(isEmpty)")
    }
}
