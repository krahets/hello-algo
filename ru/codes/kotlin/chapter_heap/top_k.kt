/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* Найти k наибольших элементов массива с помощью кучи */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // Инициализировать мин-кучу
    val heap = PriorityQueue<Int>()
    // Добавить в кучу первые k элементов массива
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // Начиная с (k+1)-го элемента, поддерживать размер кучи равным k
    for (i in k..<nums.size) {
        // Если текущий элемент больше корня, извлечь корень и вставить текущий элемент
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* Пример использования */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("Наибольшие элементы (всего $k):")
    printHeap(res)
}