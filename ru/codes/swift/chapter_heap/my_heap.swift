/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Максимальная куча */
class MaxHeap {
    private var maxHeap: [Int]

    /* Конструктор, строящий кучу по входному списку */
    init(nums: [Int]) {
        // Добавить элементы списка в кучу без изменений
        maxHeap = nums
        // Выполнить heapify для всех узлов, кроме листовых
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* Получить индекс левого дочернего узла */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Получить индекс правого дочернего узла */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Получить индекс родительского узла */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // Округление вниз при делении
    }

    /* Поменять элементы местами */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* Получение размера кучи */
    func size() -> Int {
        maxHeap.count
    }

    /* Проверка, пуста ли куча */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Доступ к элементу на вершине кучи */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Добавление элемента в кучу */
    func push(val: Int) {
        // Добавление узла
        maxHeap.append(val)
        // Просеивание снизу вверх
        siftUp(i: size() - 1)
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Получение родительского узла для узла i
            let p = parent(i: i)
            // Завершить heapify, когда «корневой узел уже пройден» или «узел не требует исправления»
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Поменять два узла местами
            swap(i: i, j: p)
            // Циклическое просеивание вверх
            i = p
        }
    }

    /* Извлечение элемента из кучи */
    func pop() -> Int {
        // Обработка пустого случая
        if isEmpty() {
            fatalError("куча пуста")
        }
        // Поменять корневой узел с самым правым листом местами (поменять первый и последний элементы)
        swap(i: 0, j: size() - 1)
        // Удаление узла
        let val = maxHeap.remove(at: size() - 1)
        // Просеивание сверху вниз
        siftDown(i: 0)
        // Вернуть элемент с вершины кучи
        return val
    }

    /* Начиная с узла i, выполнить просеивание сверху вниз */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // Определить узел с максимальным значением среди i, l и r и обозначить его как ma
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // Если узел i уже максимален или индексы l и r вне границ, дальнейшее просеивание не требуется, выйти
            if ma == i {
                break
            }
            // Поменять два узла местами
            swap(i: i, j: ma)
            // Циклическое просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу (двоичное дерево) */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* Инициализация максимальной кучи */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nПосле построения кучи из входного списка")
        maxHeap.print()

        /* Получение элемента с вершины кучи */
        var peek = maxHeap.peek()
        print("\nЭлемент на вершине кучи = \(peek)")

        /* Добавление элемента в кучу */
        let val = 7
        maxHeap.push(val: val)
        print("\nПосле добавления элемента \(val) в кучу")
        maxHeap.print()

        /* Извлечение элемента с вершины кучи */
        peek = maxHeap.pop()
        print("\nПосле извлечения элемента вершины кучи \(peek)")
        maxHeap.print()

        /* Получение размера кучи */
        let size = maxHeap.size()
        print("\nКоличество элементов в куче = \(size)")

        /* Проверка, пуста ли куча */
        let isEmpty = maxHeap.isEmpty()
        print("\nПуста ли куча: \(isEmpty)")
    }
}
