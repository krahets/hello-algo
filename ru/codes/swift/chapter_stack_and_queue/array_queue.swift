/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Очередь на основе циклического массива */
class ArrayQueue {
    private var nums: [Int] // Массив для хранения элементов очереди
    private var front: Int // Указатель front, указывающий на первый элемент очереди
    private var _size: Int // Длина очереди

    init(capacity: Int) {
        // Инициализировать массив
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Получить вместимость очереди */
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

    /* Поместить в очередь */
    func push(num: Int) {
        if size() == capacity() {
            print("очередьзаполнен")
            return
        }
        // Вычислить указатель хвоста очереди, указывающий на индекс хвоста + 1
        // Операция взятия по модулю позволяет rear после выхода за конец массива вернуться к его началу
        let rear = (front + size()) % capacity()
        // Добавить num в конец очереди
        nums[rear] = num
        _size += 1
    }

    /* Извлечь из очереди */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Указатель головы очереди сдвигается на одну позицию вперед; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Получить элемент в начале очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("очередьпуст")
        }
        return nums[front]
    }

    /* Вернутьмассив */
    func toArray() -> [Int] {
        // Преобразовать только элементы списка в пределах действительной длины
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* Инициализировать очередь */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Поместить элемент в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("очередь queue = \(queue.toArray())")

        /* Получить элемент в начале очереди */
        let peek = queue.peek()
        print("элемент в голове очереди peek = \(peek)")

        /* Извлечь элемент из очереди */
        let pop = queue.pop()
        print("Элемент, извлеченный из очереди, pop = \(pop), queue после извлечения = \(queue.toArray())")

        /* Получить длину очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверить, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Очередь пуста: \(isEmpty)")

        /* Проверить кольцевой массив */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("Итерация \(i): после enqueue + dequeue queue = \(queue.toArray())")
        }
    }
}
