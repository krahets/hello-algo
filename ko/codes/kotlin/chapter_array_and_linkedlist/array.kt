/**
 * File: array.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_array_and_linkedlist

import java.util.concurrent.ThreadLocalRandom

/* 원소에 임의 접근 */
fun randomAccess(nums: IntArray): Int {
    // 구간 [0, nums.size)에서 숫자 하나를 무작위로 뽑는다
    val randomIndex = ThreadLocalRandom.current().nextInt(0, nums.size)
    // 무작위 원소를 가져와 반환한다
    val randomNum = nums[randomIndex]
    return randomNum
}

/* 배열 길이 확장 */
fun extend(nums: IntArray, enlarge: Int): IntArray {
    // 길이를 확장한 배열을 초기화한다
    val res = IntArray(nums.size + enlarge)
    // 원래 배열의 모든 원소를 새 배열에 복사한다
    for (i in nums.indices) {
        res[i] = nums[i]
    }
    // 확장한 새 배열을 반환한다
    return res
}

/* 배열의 인덱스 index에 원소 num 삽입 */
fun insert(nums: IntArray, num: Int, index: Int) {
    // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
    for (i in nums.size - 1 downTo index + 1) {
        nums[i] = nums[i - 1]
    }
    // index 위치의 원소에 num을 대입한다
    nums[index] = num
}

/* 인덱스 index에 있는 원소 삭제 */
fun remove(nums: IntArray, index: Int) {
    // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
    for (i in index..<nums.size - 1) {
        nums[i] = nums[i + 1]
    }
}

/* 배열 순회 */
fun traverse(nums: IntArray) {
    var count = 0
    // 인덱스를 통해 배열을 순회한다
    for (i in nums.indices) {
        count += nums[i]
    }
    // 배열의 원소를 직접 순회한다
    for (j in nums) {
        count += j
    }
}

/* 배열에서 지정한 원소 탐색 */
fun find(nums: IntArray, target: Int): Int {
    for (i in nums.indices) {
        if (nums[i] == target)
            return i
    }
    return -1
}

/* 실행 코드 */
fun main() {
    /* 배열 초기화 */
    val arr = IntArray(5)
    println("배열 arr = ${arr.contentToString()}")
    var nums = intArrayOf(1, 3, 2, 5, 4)
    println("배열 nums = ${nums.contentToString()}")

    /* 임의 접근 */
    val randomNum: Int = randomAccess(nums)
    println("nums에서 무작위로 가져온 원소 = $randomNum")

    /* 길이 확장 */
    nums = extend(nums, 3)
    println("배열 길이를 8로 확장한 후 nums = ${nums.contentToString()}")

    /* 원소 삽입 */
    insert(nums, 6, 3)
    println("인덱스 3에 숫자 6을 삽입한 후 nums = ${nums.contentToString()}")

    /* 원소 삭제 */
    remove(nums, 2)
    println("인덱스 2의 원소를 삭제한 후 nums = ${nums.contentToString()}")

    /* 배열 순회 */
    traverse(nums)

    /* 원소 탐색 */
    val index: Int = find(nums, 3)
    println("nums에서 원소 3을 찾은 인덱스 = $index")
}