/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Driver Code */
fun main() {
    // [region]{init}
    /* Инициализация кучи */
    // Инициализация минимальной кучи
    var minHeap = PriorityQueue<Int>()
    // Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }
    // [endregion]{init}

    println("\nНиже приведен тестовый пример для max-heap")

    // [region]{push}
    /* Добавление элемента в кучу */
    maxHeap.offer(1)
    maxHeap.offer(3)
    maxHeap.offer(2)
    maxHeap.offer(5)
    maxHeap.offer(4)
    // [endregion]{push}
    printHeap(maxHeap)

    // [region]{peek}
    /* Получение элемента с вершины кучи */
    var peek = maxHeap.peek() // 5
    // [endregion]{peek}
    print("\nЭлемент на вершине кучи = $peek\n")

    // [region]{pop_1}
    /* Извлечение элемента с вершины кучи */
    // Извлеченные элементы образуют последовательность по убыванию
    peek = maxHeap.poll() // 5
    // [endregion]{pop_1}
    println(peek)
    // [region]{pop_2}
    peek = maxHeap.poll() // 4
    // [endregion]{pop_2}
    println(peek)
    // [region]{pop_3}
    peek = maxHeap.poll() // 3
    // [endregion]{pop_3}
    println(peek)
    // [region]{pop_4}
    peek = maxHeap.poll() // 2
    // [endregion]{pop_4}
    println(peek)
    // [region]{pop_5}
    peek = maxHeap.poll() // 1
    // [endregion]{pop_5}
    println(peek)

    // [region]{size}
    /* Получение размера кучи */
    val size = maxHeap.size
    // [endregion]{size}
    print("\nКоличество элементов в куче = $size\n")

    // [region]{is_empty}
    /* Проверка, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    // [endregion]{is_empty}
    print("\nПуста ли куча: $isEmpty\n")

    // [region]{heapify}
    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    // [endregion]{heapify}
    println("\nПосле построения min-heap из входного списка")
    printHeap(minHeap)
}