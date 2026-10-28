/**
 * File: hashing_search.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_searching

import utils.ListNode

/* 해시 탐색(배열) */
fun hashingSearchArray(map: Map<Int?, Int>, target: Int): Int {
    // 해시 테이블의 key: 목표 원소, _val: 인덱스
    // 해시 테이블에 해당 key가 없으면 -1을 반환한다
    return map.getOrDefault(target, -1)
}

/* 해시 탐색(연결 리스트) */
fun hashingSearchLinkedList(map: Map<Int?, ListNode?>, target: Int): ListNode? {
    // 해시 테이블의 key: 목표 노드의 값, _val: 노드 객체
    // 해시 테이블에 해당 key가 없으면 null을 반환한다
    return map.getOrDefault(target, null)
}

/* 실행 코드 */
fun main() {
    val target = 3

    /* 해시 탐색(배열) */
    val nums = intArrayOf(1, 5, 3, 2, 4, 7, 5, 9, 10, 8)
    // 해시 테이블 초기화
    val map = HashMap<Int?, Int>()
    for (i in nums.indices) {
        map[nums[i]] = i // key: 원소, _val: 인덱스
    }
    val index = hashingSearchArray(map, target)
    println("목표 원소 3의 인덱스 = $index")

    /* 해시 탐색(연결 리스트) */
    var head = ListNode.arrToLinkedList(nums)
    // 해시 테이블 초기화
    val map1 = HashMap<Int?, ListNode?>()
    while (head != null) {
        map1[head._val] = head // key: 노드 값, _val: 노드
        head = head.next
    }
    val node = hashingSearchLinkedList(map1, target)
    println("목표 노드 값 3에 해당하는 노드 객체 = $node")
}