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

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
    private var front: ListNode? // Первый узел front
    private var rear: ListNode? // Последний узел rear
    private var _size: Int // Длина дека

    init() {
        _size = 0
    }

    /* Получить длину дека */
    func size() -> Int {
        _size
    }

    /* Проверить, пуст ли дек */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Добавить элемент в дек */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if isEmpty() {
            front = node
            rear = node
        }
        // Добавить элемент в начало дека
        else if isFront {
            // Добавить node в начало связного списка
            front?.prev = node
            node.next = front
            front = node // Обновить ссылку на первый узел
        }
        // Добавить элемент в конец дека
        else {
            // Добавить node в конец связного списка
            rear?.next = node
            node.prev = rear
            rear = node // Обновить ссылку на последний узел
        }
        _size += 1 // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Добавить элемент в конец дека */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Извлечь элемент из дека */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Дек пуст")
        }
        let val: Int
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // Извлечь элемент из начала дека
        else if isFront {
            val = front!.val // Временно сохранить значение первого узла
            // Удалить первый узел
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // Обновить ссылку на первый узел
        }
        // Извлечь элемент из конца дека
        else {
            val = rear!.val // Временно сохранить значение последнего узла
            // Удалить последний узел
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // Обновить ссылку на последний узел
        }
        _size -= 1 // Обновить длину дека
        return val
    }

    /* Извлечь элемент из начала дека */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Извлечь элемент из конца дека */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Посмотреть первый элемент дека */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Дек пуст")
        }
        return front!.val
    }

    /* Посмотреть последний элемент дека */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Дек пуст")
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
    /* Пример использования */
    static func main() {
        /* Инициализировать дек */
        let deque = LinkedListDeque()
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
