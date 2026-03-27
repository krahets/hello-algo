/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* Инициализация очереди */
        // В Swift нет встроенного класса очереди, поэтому Array можно использовать как очередь
        var queue: [Int] = []

        /* Добавление элемента в очередь */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Очередь queue = \(queue)")

        /* Доступ к элементу в начале очереди */
        let peek = queue.first!
        print("Первый элемент peek = \(peek)")

        /* Извлечение элемента из очереди */
        // При использовании Array для имитации pop имеет сложность O(n)
        let pool = queue.removeFirst()
        print("Извлеченный элемент pop = \(pool), queue после извлечения = \(queue)")

        /* Получение длины очереди */
        let size = queue.count
        print("Длина очереди size = \(size)")

        /* Проверка, пуста ли очередь */
        let isEmpty = queue.isEmpty
        print("Пуста ли очередь = \(isEmpty)")
    }
}
