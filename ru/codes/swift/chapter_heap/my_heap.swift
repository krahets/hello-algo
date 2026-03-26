/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Max-куча */
class MaxHeap {
    private var maxHeap: [Int]

    /* Конструктор, создающий кучу по входному списку */
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

    /* Получить размер кучи */
    func size() -> Int {
        maxHeap.count
    }

    /* Проверить, пуста ли куча */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Обратиться к элементу на вершине кучи */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Добавить элемент в кучу */
    func push(val: Int) {
        // Добавить узел
        maxHeap.append(val)
        // Выполнить heapify снизу вверх
        siftUp(i: size() - 1)
    }

    /* Начиная с узла i, выполнить просеивание снизу вверх */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Получить родительский узел для узла i
            let p = parent(i: i)
            // Завершить просеивание, когда произошел выход за корень или узел не нуждается в исправлении
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Поменять местами два узла
            swap(i: i, j: p)
            // Циклически выполнять просеивание вверх
            i = p
        }
    }

    /* Извлечение элемента из кучи */
    func pop() -> Int {
        // Обработка пустого случая
        if isEmpty() {
            fatalError("кучапуст")
        }
        // Поменять местами корневой узел и крайний правый лист (первый и последний элементы)
        swap(i: 0, j: size() - 1)
        // Удалить узел
        let val = maxHeap.remove(at: size() - 1)
        // Выполнить heapify сверху вниз
        siftDown(i: 0)
        // Вернуть элемент на вершине кучи
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
            // Если узел i уже максимален или индексы l и r выходят за границы, дальнейшая heapify не требуется
            if ma == i {
                break
            }
            // Поменять местами два узла
            swap(i: i, j: ma)
            // Циклически выполнять просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу (в виде двоичного дерева) */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Driver Code */
    static func main() {
        /* Инициализировать max-кучу */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nВходсписокипостроение кучипосле")
        maxHeap.print()

        /* Получить верхний элемент кучи */
        var peek = maxHeap.peek()
        print("\nвершина кучиэлементравно \(peek)")

        /* Добавить элемент в кучу */
        let val = 7
        maxHeap.push(val: val)
        print("\nЭлемент \(val) после добавления в кучу")
        maxHeap.print()

        /* Извлечь верхний элемент из кучи */
        peek = maxHeap.pop()
        print("\nвершина кучиЭлемент \(peek) после извлечения из кучи")
        maxHeap.print()

        /* Получить размер кучи */
        let size = maxHeap.size()
        print("\nКоличество элементов в куче равно \(size)")

        /* Проверить, пуста ли куча */
        let isEmpty = maxHeap.isEmpty()
        print("\nкучапуст ли \(isEmpty)")
    }
}
