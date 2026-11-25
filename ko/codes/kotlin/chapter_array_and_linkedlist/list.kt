/**
 * File: list.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

/* 실행 예제 */
fun main() {
    /* 리스트 초기화 */
    // 가변 컬렉션
    val nums = mutableListOf(1, 3, 2, 5, 4)
    println("리스트 nums = $nums")

    /* 원소 접근 */
    val num = nums[1]
    println("인덱스 1의 원소를 읽은 결과 num = $num")

    /* 원소 갱신 */
    nums[1] = 0
    println("인덱스 1의 원소를 0으로 바꾼 후 nums = $nums")

    /* 리스트 비우기 */
    nums.clear()
    println("리스트를 비운 후 nums = $nums")

    /* 맨 뒤에 원소 추가 */
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    println("원소 추가 후 nums = $nums")

    /* 중간에 원소 삽입 */
    nums.add(3, 6)
    println("인덱스 3에 숫자 6을 삽입한 후 nums = $nums")

    /* 원소 삭제 */
    nums.removeAt(3)
    println("인덱스 3의 원소를 삭제한 후 nums = $nums")

    /* 인덱스로 리스트 순회 */
    var count = 0
    for (i in nums.indices) {
        count += nums[i]
    }

    /* 리스트 원소를 직접 순회 */
    for (j in nums) {
        count += j
    }

    /* 두 리스트 이어 붙이기*/
    val nums1 = mutableListOf(6, 8, 7, 10, 9)
    nums.addAll(nums1)
    println("nums 뒤에 리스트 nums1을 이어 붙인 후 nums = $nums")

    /* 리스트 정렬 */
    nums.sort()
    println("리스트 정렬 후 nums = $nums")
}