/**
 * File: top_k.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_heap

import utils.printHeap
import java.util.*

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
fun topKHeap(nums: IntArray, k: Int): Queue<Int> {
    // 최소 힙 초기화
    val heap = PriorityQueue<Int>()
    // 배열의 처음 k개 원소를 힙에 삽입
    for (i in 0..<k) {
        heap.offer(nums[i])
    }
    // k+1번째 원소부터 힙의 크기를 k로 유지
    for (i in k..<nums.size) {
        // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
        if (nums[i] > heap.peek()) {
            heap.poll()
            heap.offer(nums[i])
        }
    }
    return heap
}

/* 실행 예제 */
fun main() {
    val nums = intArrayOf(1, 7, 6, 3, 2)
    val k = 3
    val res = topKHeap(nums, k)
    println("가장 큰 원소들(개수: $k):")
    printHeap(res)
}