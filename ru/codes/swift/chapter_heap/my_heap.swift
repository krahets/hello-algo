/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Макс-куча */
class MaxHeap {
    private var maxHeap: [Int]

    /* Конструктор кучи по входному списку */
    init(nums: [Int]) {
        // Поместить элементы списка в кучу в прежнем порядке
        maxHeap = nums
        // Выполнить просеивание для всех узлов, кроме листьев
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* Индекс левого ребёнка */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* Индекс правого ребёнка */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* Индекс родителя */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // Целочисленное деление с округлением вниз
    }

    /* Поменять элементы местами */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* Размер кучи */
    func size() -> Int {
        maxHeap.count
    }

    /* Проверить, пуста ли куча */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Посмотреть элемент в корне */
    func peek() -> Int {
        maxHeap[0]
    }

    /* Вставить элемент в кучу */
    func push(val: Int) {
        // Добавить узел
        maxHeap.append(val)
        // Просеивание вверх
        siftUp(i: size() - 1)
    }

    /* Просеивать вверх от узла i */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // Найти родителя узла i
            let p = parent(i: i)
            // Если вышли за корень или узел уже на своём месте, завершить просеивание
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // Поменять два узла местами
            swap(i: i, j: p)
            // Продолжить просеивание вверх
            i = p
        }
    }

    /* Извлечь элемент из кучи */
    func pop() -> Int {
        // Проверить, пуста ли куча
        if isEmpty() {
            fatalError("Куча пуста")
        }
        // Поменять местами корень и крайний правый лист (первый и последний элементы)
        swap(i: 0, j: size() - 1)
        // Удалить узел
        let val = maxHeap.remove(at: size() - 1)
        // Просеивание вниз
        siftDown(i: 0)
        // Вернуть элемент из корня
        return val
    }

    /* Просеивать вниз от узла i */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // Сохранить в ma индекс наибольшего из узлов i, l и r
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // Если i уже наибольший или оба индекса l и r вне диапазона, завершить просеивание
            if ma == i {
                break
            }
            // Поменять два узла местами
            swap(i: i, j: ma)
            // Продолжить просеивание вниз
            i = ma
        }
    }

    /* Вывести кучу в виде бинарного дерева */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* Пример использования */
    static func main() {
        /* Инициализировать макс-кучу */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\nКуча, построенная по входному списку:")
        maxHeap.print()

        /* Получить элемент в корне */
        var peek = maxHeap.peek()
        print("\nЭлемент в корне: \(peek)")

        /* Вставить элемент в кучу */
        let val = 7
        maxHeap.push(val: val)
        print("\nПосле вставки элемента \(val):")
        maxHeap.print()

        /* Извлечь элемент из корня */
        peek = maxHeap.pop()
        print("\nПосле извлечения элемента \(peek) из корня:")
        maxHeap.print()

        /* Размер кучи */
        let size = maxHeap.size()
        print("\nЧисло элементов в куче: \(size)")

        /* Проверить, пуста ли куча */
        let isEmpty = maxHeap.isEmpty()
        print("\nПуста ли куча: \(isEmpty)")
    }
}
