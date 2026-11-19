/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        // [region]{init_queue}
        /* Инициализация очереди */
        // В Swift нет встроенного класса очереди, поэтому Array можно использовать как очередь
        var queue: [Int] = []
        // [endregion]{init_queue}

        // [region]{push}
        /* Добавление элемента в очередь */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        // [endregion]{push}
        print("Очередь queue = \(queue)")

        // [region]{peek}
        /* Доступ к элементу в начале очереди */
        let peek = queue.first!
        // [endregion]{peek}
        print("Первый элемент peek = \(peek)")

        // [region]{pop}
        /* Извлечение элемента из очереди */
        // При использовании Array для имитации removeFirst имеет сложность O(n)
        let pop = queue.removeFirst()
        // [endregion]{pop}
        print("Извлеченный элемент pop = \(pop), queue после извлечения = \(queue)")

        // [region]{size}
        /* Получение длины очереди */
        let size = queue.count
        // [endregion]{size}
        print("Длина очереди size = \(size)")

        // [region]{is_empty}
        /* Проверка, пуста ли очередь */
        let isEmpty = queue.isEmpty
        // [endregion]{is_empty}
        print("Пуста ли очередь = \(isEmpty)")
    }
}
