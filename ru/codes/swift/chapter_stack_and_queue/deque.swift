/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* Инициализировать двустороннюю очередь */
        // В Swift нет встроенного класса двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
        var deque: [Int] = []

        /* Поместить элемент в очередь */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("двусторонняя очередь deque = \(deque)")

        /* Получить доступ к элементу */
        let peekFirst = deque.first!
        print("элемент в голове очереди peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("элемент в хвосте очереди peekLast = \(peekLast)")

        /* Извлечь элемент из очереди */
        // При использовании Array для имитации временная сложность popFirst равна O(n)
        let popFirst = deque.removeFirst()
        print("Элемент, извлеченный из головы очереди, popFirst = \(popFirst), deque после извлечения из головы = \(deque)")
        let popLast = deque.removeLast()
        print("Элемент, извлеченный из хвоста очереди, popLast = \(popLast), deque после извлечения из хвоста = \(deque)")

        /* Получить длину двусторонней очереди */
        let size = deque.count
        print("Длина двусторонней очереди size = \(size)")

        /* Проверить, пуста ли двусторонняя очередь */
        let isEmpty = deque.isEmpty
        print("двусторонняя очередьпуст ли = \(isEmpty)")
    }
}
