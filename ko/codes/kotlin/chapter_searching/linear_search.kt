/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 배열에서의 선형 탐색 */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // 배열을 순회한다.
    for (i in nums.indices) {
        // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
        if (nums[i] == target)
            return i
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1
}

/* 연결 리스트에서의 선형 탐색 */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // 연결 리스트를 순회한다.
    var head = h
    while (head != null) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다.
        if (head._val == target)
            return head
        head = head.next
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다.
    return null
}

/* 실행 예제 */
fun main() {
    val target = 3

    /* 배열에서 선형 탐색 수행 */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("목표 원소 3의 인덱스 = $index")

    /* 연결 리스트에서 선형 탐색 수행 */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("값이 3인 목표 노드의 객체 = $node")
}