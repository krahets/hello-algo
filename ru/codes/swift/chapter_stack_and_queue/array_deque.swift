/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двусторонняя очередь на основе циклического массива */
class ArrayDeque {
    private var nums: [Int] // Массив для хранения элементов двусторонней очереди
    private var front: Int // Указатель front, указывающий на первый элемент очереди
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

    /* Получить длину двусторонней очереди */
    func size() -> Int {
        _size
    }

    /* Проверить, пуста ли двусторонняя очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Вычислить индекс циклического массива */
    private func index(i: Int) -> Int {
        // Сделать начало и конец массива циклически связанными с помощью операции взятия по модулю
        // Когда i выходит за конец массива, он возвращается к началу
        // Когда i выходит за начало массива, он возвращается к концу
        (i + capacity()) % capacity()
    }

    /* Поместить в голову очереди */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Двусторонняя очередь заполнена")
            return
        }
        // Указатель головы очереди сдвигается на одну позицию влево
        // Операция взятия по модулю позволяет front после выхода за начало массива вернуться к его концу
        front = index(i: front - 1)
        // Добавить num в голову очереди
        nums[front] = num
        _size += 1
    }

    /* Поместить в хвост очереди */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Двусторонняя очередь заполнена")
            return
        }
        // Вычислить указатель хвоста, указывающий на индекс за последним элементом
        let rear = index(i: front + size())
        // Добавить num в конец очереди
        nums[rear] = num
        _size += 1
    }

    /* Извлечь из головы очереди */
    func popFirst() -> Int {
        let num = peekFirst()
        // Указатель головы очереди сдвигается на одну позицию вперед
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Извлечь из хвоста очереди */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Получить элемент в начале очереди */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Двусторонняя очередь пуста")
        }
        return nums[front]
    }

    /* Обратиться к элементу в хвосте очереди */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Двусторонняя очередь пуста")
        }
        // Вычислить индекс хвостового элемента
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Вернуть массив для печати */
    func toArray() -> [Int] {
        // Преобразовать только элементы списка в пределах действительной длины
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* Инициализировать двустороннюю очередь */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("двусторонняя очередь deque = \(deque.toArray())")

        /* Получить доступ к элементу */
        let peekFirst = deque.peekFirst()
        print("голова очередиэлемент peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("хвост очередиэлемент peekLast = \(peekLast)")

        /* Поместить элемент в очередь */
        deque.pushLast(num: 4)
        print("После помещения элемента 4 в хвост очереди deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("После помещения элемента 1 в голову очереди deque = \(deque.toArray())")

        /* Извлечь элемент из очереди */
        let popLast = deque.popLast()
        print("Элемент, извлеченный из хвоста очереди = \(popLast), deque после извлечения из хвоста = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Элемент, извлеченный из головы очереди = \(popFirst), deque после извлечения из головы = \(deque.toArray())")

        /* Получить длину двусторонней очереди */
        let size = deque.size()
        print("Длина двусторонней очереди size = \(size)")

        /* Проверить, пуста ли двусторонняя очередь */
        let isEmpty = deque.isEmpty()
        print("Двусторонняя очередь пуста: \(isEmpty)")
    }
}
