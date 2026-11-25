/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Пример использования */
    static func main() {
        /* Инициализировать дек */
        // В Swift нет встроенного класса дека, поэтому в качестве дека можно использовать Array
        var deque: [Int] = []

        /* Добавить элементы в дек */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Дек deque = \(deque)")

        /* Посмотреть первый и последний элементы */
        let peekFirst = deque.first!
        print("Первый элемент дека peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Последний элемент дека peekLast = \(peekLast)")

        /* Извлечь элементы из дека */
        // При реализации на основе Array сложность removeFirst составляет O(n)
        let popFirst = deque.removeFirst()
        print("Извлечённый первый элемент popFirst = \(popFirst), после извлечения deque = \(deque)")
        let popLast = deque.removeLast()
        print("Извлечённый последний элемент popLast = \(popLast), после извлечения deque = \(deque)")

        /* Получить длину дека */
        let size = deque.count
        print("Длина дека size = \(size)")

        /* Проверить, пуст ли дек */
        let isEmpty = deque.isEmpty
        print("Дек пуст = \(isEmpty)")
    }
}
