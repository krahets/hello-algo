/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nПосле добавления элемента \(val) в кучу\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nПосле извлечения элемента вершины кучи \(val)\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* Инициализация кучи */
        // Тип Heap в Swift одновременно поддерживает максимальную и минимальную кучу
        var heap = Heap<Int>()

        /* Добавление элемента в кучу */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Получение элемента с вершины кучи */
        let peek = heap.max()
        print("\nЭлемент на вершине кучи = \(peek!)\n")

        /* Извлечение элемента с вершины кучи */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Получение размера кучи */
        let size = heap.count
        print("\nКоличество элементов в куче = \(size)\n")

        /* Проверка, пуста ли куча */
        let isEmpty = heap.isEmpty
        print("\nПуста ли куча: \(isEmpty)\n")

        /* Построить кучу по входному списку */
        // Временная сложность равна O(n), а не O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nПосле построения кучи из входного списка")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
