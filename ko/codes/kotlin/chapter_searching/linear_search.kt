/**
 * File: linear_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 선형 탐색(배열) */
fun linearSearchArray(nums: IntArray, target: Int): Int {
    // 배열 순회
    for (i in nums.indices) {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        if (nums[i] == target)
            return i
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1
}

/* 선형 탐색(연결 리스트) */
fun linearSearchLinkedList(h: ListNode?, target: Int): ListNode? {
    // 연결 리스트 순회
    var head = h
    while (head != null) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다
        if (head._val == target)
            return head
        head = head.next
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다
    return null
}

/* 실행 코드 */
fun main() {
    val target = 3

    /* 배열에서 선형 탐색을 수행한다 */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    val index = linearSearchArray(nums, target)
    println("목표 원소 3의 인덱스 = $index")

    /* 연결 리스트에서 선형 탐색을 수행한다 */
    val head = ListNode.arrToLinkedList(nums)
    val node = linearSearchLinkedList(head, target)
    println("목표 노드 값 3에 해당하는 노드 객체 = $node")
}