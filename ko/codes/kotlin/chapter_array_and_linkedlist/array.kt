/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* 임의의 원소에 접근 */
fun randomAccess(nums: IntArray): Int {
    // 구간 [0, nums.size)에서 수 하나를 무작위로 선택
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // 선택한 원소를 가져와 반환
    val randomNum = nums[randomIndex]
    return randomNum
}

/* 배열 길이 늘리기 */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // 길이를 늘린 새 배열 초기화
    val res = IntArray(nums.size + enlarge)
    // 원래 배열의 모든 원소를 새 배열에 복사
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // 길이를 늘린 새 배열 반환
    return res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
fun insert(nums: IntArray, num: Int, index: Int) {
    // 인덱스 index부터 끝까지 모든 원소를 뒤로 한 칸씩 이동
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // 인덱스 index의 원소에 num 대입
    nums[index] = num
}

/* 인덱스 index의 원소 삭제 */
fun remove(nums: IntArray, index: Int) {
    // 인덱스 index 다음의 모든 원소를 앞으로 한 칸씩 이동
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* 배열 순회 */
fun traverse(nums: IntArray) {
    var count = 0
    // 인덱스로 배열 순회
    for (i in nums.indices) {
        count += nums[i]
    }
    // 배열 원소를 직접 순회
    for (j in nums) {
        count += j
    }
}

/* 배열에서 지정한 원소 찾기 */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* 실행 예제 */
fun main() {
    /* 배열 초기화 */
    val arr = IntArray(5)
    println("배열 arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("배열 nums = ${nums.contentToString()}")

    /* 임의 접근 */
    val randomNum: Int = randomAccess(nums)
    println("nums에서 무작위로 선택한 원소: $randomNum")

    /* 길이 늘리기 */
    nums = extend(nums, 3)
    println("길이를 8로 늘린 배열 nums = ${nums.contentToString()}")

    /* 원소 삽입 */
    insert(nums, 6, 3)
    println("인덱스 3에 숫자 6을 삽입한 후 nums = ${nums.contentToString()}")

    /* 원소 삭제 */
    remove(nums, 2)
    println("인덱스 2의 원소를 삭제한 후 nums = ${nums.contentToString()}")

    /* 배열 순회 */
    traverse(nums)

    /* 원소 찾기 */
    val index: Int = find(nums, 3)
    println("nums에서 원소 3을 찾은 인덱스 = $index")
}