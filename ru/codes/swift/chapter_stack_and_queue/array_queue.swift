/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Очередь на основе кольцевого массива */
class ArrayQueue {
    private var nums: [Int] // Массив для хранения элементов очереди
    private var front: Int // Указатель head, указывающий на первый элемент очереди
    private var _size: Int // Длина очереди

    init(capacity: Int) {
        // Инициализация массива
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Получить вместимость очереди */
    func capacity() -> Int {
        nums.count
    }

    /* Получение длины очереди */
    func size() -> Int {
        _size
    }

    /* Проверка, пуста ли очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Поместить в очередь */
    func push(num: Int) {
        if size() == capacity() {
            print("Очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        // С помощью операции взятия по модулю вернуть rear к началу после выхода за конец массива
        let rear = (front + size()) % capacity()
        // Добавить num в хвост очереди
        nums[rear] = num
        _size += 1
    }

    /* Извлечь из очереди */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Указатель head сдвигается на одну позицию назад; если он выходит за конец, то возвращается в начало массива
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Доступ к элементу в начале очереди */
    func peek() -> Int {
        if isEmpty() {
            fatalError("очередь пуста")
        }
        return nums[front]
    }

    /* Вернуть массив */
    func toArray() -> [Int] {
        // Преобразовывать только элементы списка в пределах фактической длины
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* Инициализация очереди */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Добавление элемента в очередь */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Очередь queue = \(queue.toArray())")

        /* Доступ к элементу в начале очереди */
        let peek = queue.peek()
        print("Первый элемент peek = \(peek)")

        /* Извлечение элемента из очереди */
        let pop = queue.pop()
        print("Извлеченный элемент pop = \(pop), queue после извлечения = \(queue.toArray())")

        /* Получение длины очереди */
        let size = queue.size()
        print("Длина очереди size = \(size)")

        /* Проверка, пуста ли очередь */
        let isEmpty = queue.isEmpty()
        print("Пуста ли очередь = \(isEmpty)")

        /* Проверка кольцевого массива */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("После \(i)-го раунда операций enqueue и dequeue queue = \(queue.toArray())")
        }
    }
}
