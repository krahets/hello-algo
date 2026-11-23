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
    // Инициализация минимальной кучи
    val heap = PriorityQueue<Int>()
    // Поместить первые k элементов массива в кучу
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // Начиная с элемента k+1, поддерживать длину кучи равной k
    for (i in k..<nums.size) {
        // Если текущий элемент больше элемента на вершине кучи, извлечь вершину кучи и добавить текущий элемент в кучу
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* Driver Code */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("Наибольшие $k элементов")
    printHeap(res)
}