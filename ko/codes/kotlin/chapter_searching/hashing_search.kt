/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 배열에서의 해시 탐색 */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // 해시 테이블의 key는 목표 원소, _val은 인덱스다.
    // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
    return map.getOrDefault(target, -1)
}

/* 연결 리스트에서의 해시 탐색 */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // 해시 테이블의 key는 찾을 노드의 값, _val은 노드 객체다.
    // 해시 테이블에 해당 키가 없으면 null을 반환한다.
    return map.getOrDefault(target, null)
}

/* 실행 예제 */
fun main() {
    val target = 3

    /* 배열에서의 해시 탐색 */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 해시 테이블 초기화
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key는 원소, _val은 인덱스다.
    }
    val index = hashingSearchArray(map, target)
    println("목표 원소 3의 인덱스 = $index")

    /* 연결 리스트에서의 해시 탐색 */
    var head = ListNode.arrToLinkedList(nums)
    // 해시 테이블 초기화
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key는 노드의 값, _val은 노드다.
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("값이 3인 목표 노드의 객체 = $node")
}