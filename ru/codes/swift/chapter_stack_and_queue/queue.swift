/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* Инициализировать очередь */
        // В Swift нет встроенного класса очереди, поэтому Array можно использовать как очередь
        var queue: [Int] = []

        /* Поместить элемент в очередь */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("очередь queue = \(queue)")

        /* Получить элемент в начале очереди */
        let peek = queue.first!
        print("элемент в голове очереди peek = \(peek)")

        /* Извлечь элемент из очереди */
        // При использовании Array для имитации временная сложность pop равна O(n)
        let pool = queue.removeFirst()
        print("Элемент, извлеченный из очереди, pop = \(pool), queue после извлечения = \(queue)")

        /* Получить длину очереди */
        let size = queue.count
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty
        print("очередьпуст ли = \(isEmpty)")
    }
}
