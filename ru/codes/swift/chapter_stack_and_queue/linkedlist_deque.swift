/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Узел двусвязного списка */
class ListNode {
    var val: Int // Значение узла
    var next: ListNode? // Ссылка на следующий узел
    weak var prev: ListNode? // Ссылка на предыдущий узел

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

    /* Получить длину двусторонней очереди */
    func size() -> Int {
        _size
    }

    /* Проверить, пуста ли двусторонняя очередь */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Операция помещения в очередь */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if isEmpty() {
            front = node
            rear = node
        }
        // Операция помещения в голову очереди
        else if isFront {
            // Добавить node в голову связного списка
            front?.prev = node
            node.next = front
            front = node // Обновить головной узел
        }
        // Операция помещения в хвост очереди
        else {
            // Добавить node в хвост связного списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить хвостовой узел
        }
        _size += 1 // ОбновитьДлина очереди
    }

    /* Поместить в голову очереди */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Поместить в хвост очереди */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Операция извлечения из очереди */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Двусторонняя очередь пуста")
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
        _size -= 1 // ОбновитьДлина очереди
        return val
    }

    /* Извлечь из головы очереди */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Извлечь из хвоста очереди */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Получить элемент в начале очереди */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Двусторонняя очередь пуста")
        }
        return front!.val
    }

    /* Обратиться к элементу в хвосте очереди */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Двусторонняя очередь пуста")
        }
        return rear!.val
    }

    /* Вернуть массив для печати */
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
        /* Инициализировать двустороннюю очередь */
        let deque = LinkedListDeque()
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
