/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* Инициализация двусторонней очереди */
        // В Swift нет встроенного класса двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
        var deque: [Int] = []

        /* Добавление элемента в очередь */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Двусторонняя очередь deque = \(deque)")

        /* Доступ к элементу */
        let peekFirst = deque.first!
        print("Первый элемент peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Последний элемент peekLast = \(peekLast)")

        /* Извлечение элемента из очереди */
        // При использовании Array для имитации popFirst имеет сложность O(n)
        let popFirst = deque.removeFirst()
        print("Извлеченный из головы элемент popFirst = \(popFirst), deque после извлечения из головы = \(deque)")
        let popLast = deque.removeLast()
        print("Извлеченный из хвоста элемент popLast = \(popLast), deque после извлечения из хвоста = \(deque)")

        /* Получение длины двусторонней очереди */
        let size = deque.count
        print("Длина двусторонней очереди size = \(size)")

        /* Проверка, пуста ли двусторонняя очередь */
        let isEmpty = deque.isEmpty
        print("Пуста ли двусторонняя очередь = \(isEmpty)")
    }
}
