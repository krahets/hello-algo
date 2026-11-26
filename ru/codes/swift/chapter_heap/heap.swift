/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\nПосле вставки элемента \(val):\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\nПосле извлечения элемента \(val) из корня:\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* Пример использования */
    static func main() {
        /* Инициализировать кучу */
        // Тип Heap в Swift поддерживает макс-кучу и мин-кучу
        var heap = Heap<Int>()

        /* Вставить элемент в кучу */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* Получить элемент в корне */
        let peek = heap.max()
        print("\nЭлемент в корне: \(peek!)\n")

        /* Извлечь элемент из корня */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* Размер кучи */
        let size = heap.count
        print("\nЧисло элементов в куче: \(size)\n")

        /* Проверить, пуста ли куча */
        let isEmpty = heap.isEmpty
        print("\nПуста ли куча: \(isEmpty)\n")

        /* Построить кучу по входному списку */
        // Временная сложность — O(n), а не O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\nКуча, построенная по входному списку:")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
