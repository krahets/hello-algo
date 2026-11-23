/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 최소 힙 초기화
    val heap = PriorityQueue<Int>()
    // 배열의 앞쪽 k개 원소를 힙에 삽입한다
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for (i in k..<nums.size) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* 실행 코드 */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("가장 큰 원소 k개(k = $k)")
    printHeap(res)
}