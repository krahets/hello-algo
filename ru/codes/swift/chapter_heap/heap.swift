/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

// [region]{import}
import HeapModule
// [endregion]{import}
import utils

@main
enum _Heap {
    /* Driver Code */
    static func main() {
        // [region]{init}
        /* Инициализация кучи */
        // Тип Heap в Swift одновременно поддерживает максимальную и минимальную кучу
        var heap = Heap<Int>()
        // [endregion]{init}

        // [region]{push}
        /* Добавление элемента в кучу */
        heap.insert(1)
        heap.insert(3)
        heap.insert(2)
        heap.insert(5)
        heap.insert(4)
        // [endregion]{push}
        PrintUtil.printHeap(queue: heap.unordered)

        // [region]{peek}
        /* Получение элемента с вершины кучи */
        var peek = heap.max()
        // [endregion]{peek}
        print("\nЭлемент на вершине кучи = \(peek!)\n")

        // [region]{pop_1}
        /* Извлечение элемента с вершины кучи */
        peek = heap.removeMax() // 5
        // [endregion]{pop_1}
        print(peek!)
        // [region]{pop_2}
        peek = heap.removeMax() // 4
        // [endregion]{pop_2}
        print(peek!)
        // [region]{pop_3}
        peek = heap.removeMax() // 3
        // [endregion]{pop_3}
        print(peek!)
        // [region]{pop_4}
        peek = heap.removeMax() // 2
        // [endregion]{pop_4}
        print(peek!)
        // [region]{pop_5}
        peek = heap.removeMax() // 1
        // [endregion]{pop_5}
        print(peek!)

        // [region]{size}
        /* Получение размера кучи */
        let size = heap.count
        // [endregion]{size}
        print("\nКоличество элементов в куче = \(size)\n")

        // [region]{is_empty}
        /* Проверка, пуста ли куча */
        let isEmpty = heap.isEmpty
        // [endregion]{is_empty}
        print("\nПуста ли куча: \(isEmpty)\n")

        // [region]{heapify}
        /* Построить кучу по входному списку */
        // Временная сложность равна O(n), а не O(nlogn)
        let heap2 = Heap([1, 3, 2, 5, 4])
        // [endregion]{heapify}
        print("\nПосле построения кучи из входного списка")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
