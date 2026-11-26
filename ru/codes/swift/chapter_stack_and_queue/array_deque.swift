/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Двусторонняя очередь (дек) на основе кольцевого массива */
class ArrayDeque {
    private var nums: [Int] // Массив для хранения элементов дека
    private var front: Int // Индекс первого элемента дека
    private var _size: Int // Длина дека

    /* Конструктор */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Получить ёмкость дека */
    func capacity() -> Int {
        nums.count
    }

    /* Получить длину дека */
    func size() -> Int {
        _size
    }

    /* Проверить, пуст ли дек */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Вычислить индекс в кольцевом массиве */
    private func index(i: Int) -> Int {
        // Операция взятия остатка связывает конец массива с его началом
        // Если индекс i выходит за конец массива, отсчёт продолжается с начала
        // Если индекс i выходит за начало массива, отсчёт продолжается с конца
        (i + capacity()) % capacity()
    }

    /* Добавить элемент в начало дека */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Дек заполнен")
            return
        }
        // Сдвинуть индекс начала дека на одну позицию влево
        // При выходе за начало массива операция взятия остатка возвращает front в конец
        front = index(i: front - 1)
        // Добавить num в начало дека
        nums[front] = num
        _size += 1
    }

    /* Добавить элемент в конец дека */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Дек заполнен")
            return
        }
        // Вычислить индекс вставки в конец дека: прибавить 1 к индексу последнего элемента с учётом перехода по кругу
        let rear = index(i: front + size())
        // Добавить num в конец дека
        nums[rear] = num
        _size += 1
    }

    /* Извлечь элемент из начала дека */
    func popFirst() -> Int {
        let num = peekFirst()
        // Сдвинуть индекс начала дека на одну позицию вперёд
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Извлечь элемент из конца дека */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Посмотреть первый элемент дека */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Дек пуст")
        }
        return nums[front]
    }

    /* Посмотреть последний элемент дека */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Дек пуст")
        }
        // Вычислить индекс последнего элемента
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Вернуть массив для вывода */
    func toArray() -> [Int] {
        // Преобразовать только те элементы, которые сейчас находятся в деке
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Пример использования */
    static func main() {
        /* Инициализировать дек */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Дек deque = \(deque.toArray())")

        /* Посмотреть первый и последний элементы */
        let peekFirst = deque.peekFirst()
        print("Первый элемент дека peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Последний элемент дека peekLast = \(peekLast)")

        /* Добавить элементы в дек */
        deque.pushLast(num: 4)
        print("После добавления 4 в конец дека deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("После добавления 1 в начало дека deque = \(deque.toArray())")

        /* Извлечь элементы из дека */
        let popLast = deque.popLast()
        print("Извлечённый последний элемент = \(popLast), после извлечения deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Извлечённый первый элемент = \(popFirst), после извлечения deque = \(deque.toArray())")

        /* Получить длину дека */
        let size = deque.size()
        print("Длина дека size = \(size)")

        /* Проверить, пуст ли дек */
        let isEmpty = deque.isEmpty()
        print("Дек пуст = \(isEmpty)")
    }
}
