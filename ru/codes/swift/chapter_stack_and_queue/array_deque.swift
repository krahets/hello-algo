/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двусторонняя очередь на основе кольцевого массива */
class ArrayDeque {
    private var nums: [Int] // Массив для хранения элементов двусторонней очереди
    private var front: Int // Указатель head, указывающий на первый элемент очереди
    private var _size: Int // Длина двусторонней очереди

    /* Конструктор */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Получить вместимость двусторонней очереди */
    func capacity() -> Int {
        nums.count
    }

    /* Получение длины двусторонней очереди */
    func size() -> Int {
        _size
    }

    /* Проверка, пуста ли двусторонняя очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    private func index(i: Int) -> Int {
        // С помощью операции взятия по модулю соединить начало и конец массива
        // Когда i выходит за конец массива, он возвращается в начало
        // Когда i выходит за начало массива, он возвращается в конец
        (i + capacity()) % capacity()
    }

    /* Добавление в голову очереди */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Двусторонняя очередь заполнена")
            return
        }
        // Указатель головы сдвигается на одну позицию влево
        // С помощью операции взятия по модулю front после выхода за начало массива возвращается в хвост
        front = index(i: front - 1)
        // Добавить num в голову очереди
        nums[front] = num
        _size += 1
    }

    /* Добавление в хвост очереди */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Двусторонняя очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс хвоста + 1
        let rear = index(i: front + size())
        // Добавить num в хвост очереди
        nums[rear] = num
        _size += 1
    }

    /* Извлечение из головы очереди */
    func popFirst() -> Int {
        let num = peekFirst()
        // Указатель головы сдвигается на одну позицию назад
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Извлечение из хвоста очереди */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Доступ к элементу в начале очереди */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("двусторонняя очередь пуста")
        }
        return nums[front]
    }

    /* Доступ к элементу в конце очереди */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("двусторонняя очередь пуста")
        }
        // Вычислить индекс хвостового элемента
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Вернуть массив для вывода */
    func toArray() -> [Int] {
        // Преобразовывать только элементы списка в пределах фактической длины
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* Инициализация двусторонней очереди */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Двусторонняя очередь deque = \(deque.toArray())")

        /* Доступ к элементу */
        let peekFirst = deque.peekFirst()
        print("Первый элемент peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Последний элемент peekLast = \(peekLast)")

        /* Добавление элемента в очередь */
        deque.pushLast(num: 4)
        print("После добавления элемента 4 в хвост deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("После добавления элемента 1 в голову deque = \(deque.toArray())")

        /* Извлечение элемента из очереди */
        let popLast = deque.popLast()
        print("Извлеченный из хвоста элемент = \(popLast), deque после извлечения из хвоста = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Извлеченный из головы элемент = \(popFirst), deque после извлечения из головы = \(deque.toArray())")

        /* Получение длины двусторонней очереди */
        let size = deque.size()
        print("Длина двусторонней очереди size = \(size)")

        /* Проверка, пуста ли двусторонняя очередь */
        let isEmpty = deque.isEmpty()
        print("Пуста ли двусторонняя очередь = \(isEmpty)")
    }
}
