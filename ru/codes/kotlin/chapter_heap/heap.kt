/**
 * File: heap.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

fun testPush(heap: Queue<Int>, _val: Int) {
    heap.offer(_val) // Добавление элемента в кучу
    print("\nПосле добавления элемента $_val в кучу\n")
    printHeap(heap)
}

fun testPop(heap: Queue<Int>) {
    val _val = heap.poll() // Извлечение элемента с вершины кучи
    print("\nПосле извлечения элемента вершины кучи $_val\n")
    printHeap(heap)
}

/* Driver Code */
fun main() {
    /* Инициализация кучи */
    // Инициализация минимальной кучи
    var minHeap = PriorityQueue<Int>()

    // Инициализация максимальной кучи (достаточно изменить Comparator с помощью lambda-выражения)
    val maxHeap = PriorityQueue { a: Int, b: Int -> b - a }

    println("\nНиже приведен тестовый пример для max-heap")

    /* Добавление элемента в кучу */
    testPush(maxHeap, 1)
    testPush(maxHeap, 3)
    testPush(maxHeap, 2)
    testPush(maxHeap, 5)
    testPush(maxHeap, 4)

    /* Получение элемента с вершины кучи */
    val peek = maxHeap.peek()
    print("\nЭлемент на вершине кучи = $peek\n")

    /* Извлечение элемента с вершины кучи */
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)
    testPop(maxHeap)

    /* Получение размера кучи */
    val size = maxHeap.size
    print("\nКоличество элементов в куче = $size\n")

    /* Проверка, пуста ли куча */
    val isEmpty = maxHeap.isEmpty()
    print("\nПуста ли куча: $isEmpty\n")

    /* Построить кучу по входному списку */
    // Временная сложность равна O(n), а не O(nlogn)
    minHeap = PriorityQueue(mutableListOf<Int?>(1, 3, 2, 5, 4))
    println("\nПосле построения min-heap из входного списка")
    printHeap(minHeap)
}