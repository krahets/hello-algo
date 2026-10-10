/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* Инициализация стека */
        // В Swift нет встроенного класса стека, поэтому Array можно использовать как стек
        var stack: [Int] = []

        /* Помещение элемента в стек */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Стек stack = \(stack)")

        /* Доступ к верхнему элементу стека */
        let peek = stack.last!
        print("Верхний элемент peek = \(peek)")

        /* Извлечение элемента из стека */
        let pop = stack.removeLast()
        print("Извлеченный элемент pop = \(pop), stack после извлечения = \(stack)")

        /* Получение длины стека */
        let size = stack.count
        print("Длина стека size = \(size)")

        /* Проверка на пустоту */
        let isEmpty = stack.isEmpty
        print("Пуст ли стек = \(isEmpty)")
    }
}
