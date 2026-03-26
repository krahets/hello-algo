/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nЭлемент \(val) после добавления в кучу\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nвершина кучиЭлемент \(val) после извлечения из кучи\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        /* Инициализировать кучу */
        // Тип Heap в Swift поддерживает и max-кучу, и min-кучу
        var heap = Heap<Int>()

        /* Добавить элемент в кучу */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Получить верхний элемент кучи */
        let peek = heap.max()
        print("\nвершина кучиэлементравно \(peek!)\n")

        /* Извлечь верхний элемент из кучи */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Получить размер кучи */
        let size = heap.count
        print("\nКоличество элементов в куче равно \(size)\n")

        /* Проверить, пуста ли куча */
        let isEmpty = heap.isEmpty
        print("\nкучапуст ли \(isEmpty)\n")

        /* Входсписокипостроение кучи */
        // Временная сложность равна O(n), а не O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nВходсписокипостроитькучапосле")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
