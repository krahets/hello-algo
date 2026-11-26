/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    private var nums: [Int] // Массив для хранения элементов очереди
    private var front: Int // Индекс первого элемента очереди
    private var _size: Int // Длина очереди

    init(capacity: Int) {
        // Инициализировать массив
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Получить ёмкость очереди */
    func capacity() -> Int {
        nums.count
    }

    /* Получить длину очереди */
    func size() -> Int {
        _size
    }

    /* Проверить, пуста ли очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Добавить элемент в очередь */
    func push(num: Int) {
        if size() == capacity() {
            print("Очередь заполнена")
            return
        }
        // Вычислить индекс вставки в конец очереди: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        // При выходе за конец массива операция взятия остатка возвращает rear в начало
        let rear = (front + size()) % capacity()
        // Добавить num в конец очереди
        nums[rear] = num
        _size += 1
    }

    /* Извлечь элемент из очереди */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Сдвинуть индекс начала очереди на одну позицию вперёд. При выходе за конец массива перейти к его началу
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Посмотреть первый элемент очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Очередь пуста")
        }
        return nums[front]
    }

    /* Вернуть массив */
    func toArray() -> [Int] {
        // Преобразовать только те элементы, которые сейчас находятся в очереди
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Пример использования */
    static func main() {
        /* Инициализировать очередь */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Добавить элементы в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Очередь queue = \(queue.toArray())")

        /* Посмотреть первый элемент очереди */
        let peek = queue.peek()
        print("Первый элемент очереди peek = \(peek)")

        /* Извлечь элемент из очереди */
        let pop = queue.pop()
        print("Извлечённый элемент pop = \(pop), после извлечения queue = \(queue.toArray())")

        /* Получить длину очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Очередь пуста = \(isEmpty)")

        /* Проверить работу кольцевого массива */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("В цикле \(i) после добавления и извлечения элемента queue = \(queue.toArray())")
        }
    }
}
