/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Пример использования */
    static func main() {
        /* Инициализировать очередь */
        // В Swift нет встроенного класса очереди, поэтому в качестве очереди можно использовать Array
        var queue: [Int] = []

        /* Добавить элементы в очередь */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Очередь queue = \(queue)")

        /* Посмотреть первый элемент очереди */
        let peek = queue.first!
        print("Первый элемент очереди peek = \(peek)")

        /* Извлечь элемент из очереди */
        // При реализации на основе Array сложность removeFirst составляет O(n)
        let pop = queue.removeFirst()
        print("Извлечённый элемент pop = \(pop), после извлечения queue = \(queue)")

        /* Получить длину очереди */
        let size = queue.count
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty
        print("Очередь пуста = \(isEmpty)")
    }
}
