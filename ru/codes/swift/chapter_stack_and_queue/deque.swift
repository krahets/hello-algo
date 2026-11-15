/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        // [region]{init_deque}
        /* Инициализация двусторонней очереди */
        // В Swift нет встроенного класса двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* Добавление элемента в очередь */
        deque.append(2) // Добавить в хвост
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // Добавить в голову
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("Двусторонняя очередь deque = \(deque)")

        // [region]{peek_first}
        /* Доступ к элементу */
        let peekFirst = deque.first! // Элемент в голове
        // [endregion]{peek_first}
        print("Первый элемент peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // Элемент в хвосте
        // [endregion]{peek_last}
        print("Последний элемент peekLast = \(peekLast)")

        // [region]{pop_first}
        /* Извлечение элемента из очереди */
        // При использовании Array для имитации popFirst имеет сложность O(n)
        let popFirst = deque.removeFirst() // Извлечь элемент из головы
        // [endregion]{pop_first}
        print("Извлеченный из головы элемент popFirst = \(popFirst), deque после извлечения из головы = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // Извлечь элемент из хвоста
        // [endregion]{pop_last}
        print("Извлеченный из хвоста элемент popLast = \(popLast), deque после извлечения из хвоста = \(deque)")

        // [region]{size}
        /* Получение длины двусторонней очереди */
        let size = deque.count
        // [endregion]{size}
        print("Длина двусторонней очереди size = \(size)")

        // [region]{is_empty}
        /* Проверка, пуста ли двусторонняя очередь */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("Пуста ли двусторонняя очередь = \(isEmpty)")
    }
}
