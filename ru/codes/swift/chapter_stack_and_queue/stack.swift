/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* Инициализировать стек */
        // В Swift нет встроенного класса стека, поэтому Array можно использовать как стек
        var stack: [Int] = []

        /* Поместить элемент в стек */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("стек stack = \(stack)")

        /* Получить верхний элемент стека */
        let peek = stack.last!
        print("вершина стекаэлемент peek = \(peek)")

        /* Извлечь элемент из стека */
        let pop = stack.removeLast()
        print("извлечение из стекаэлемент pop = \(pop), извлечение из стекапосле stack = \(stack)")

        /* Получить длину стека */
        let size = stack.count
        print("Длина стека size = \(size)")

        /* Проверить, пуста ли структура */
        let isEmpty = stack.isEmpty
        print("Стек пуст: \(isEmpty)")
    }
}
