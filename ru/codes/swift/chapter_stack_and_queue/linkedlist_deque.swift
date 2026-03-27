/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на узел-преемник
    weak var prev: ListNode? // Ссылка на узел-предшественник

    init(val: Int) {
        self.val = val
    }
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    private var front: ListNode? // Головной узел front
    private var rear: ListNode? // Хвостовой узел rear
    private var _size: Int // Длина двусторонней очереди

    init() {
        _size = 0
    }

    /* Получение длины двусторонней очереди */
    func size() -> Int {
        _size
    }

    /* Проверка, пуста ли двусторонняя очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Операция добавления в очередь */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if isEmpty() {
            front = node
            rear = node
        }
        // Операция добавления в голову очереди
        else if isFront {
            // Добавить node в голову списка
            front?.prev = node
            node.next = front
            front = node // Обновить головной узел
        }
        // Операция добавления в хвост очереди
        else {
            // Добавить node в хвост списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить хвостовой узел
        }
        _size += 1 // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Добавление в хвост очереди */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Операция извлечения из очереди */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("двусторонняя очередь пуста")
        }
        let val: Int
        // Операция извлечения из головы очереди
        if isFront {
            val = front!.val // Временно сохранить значение головного узла
            // Удалить головной узел
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // Обновить головной узел
        }
        // Операция извлечения из хвоста очереди
        else {
            val = rear!.val // Временно сохранить значение хвостового узла
            // Удалить хвостовой узел
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // Обновить хвостовой узел
        }
        _size -= 1 // Обновить длину очереди
        return val
    }

    /* Извлечение из головы очереди */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Извлечение из хвоста очереди */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Доступ к элементу в начале очереди */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("двусторонняя очередь пуста")
        }
        return front!.val
    }

    /* Доступ к элементу в конце очереди */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("двусторонняя очередь пуста")
        }
        return rear!.val
    }

    /* Вернуть массив для вывода */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListDeque {
    /* Driver Code */
    static func main() {
        /* Инициализация двусторонней очереди */
        let deque = LinkedListDeque()
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
