/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 버킷 정렬 */
fun bucketSort(nums: FloatArray) {
    // 버킷 k = n/2개를 초기화하며, 각 버킷에 원소 2개가 배정될 것으로 예상한다
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. 배열 원소를 각 버킷에 배정한다
    for (num in nums) {
        // 입력 데이터의 범위는 [0, 1)이며, num * k를 사용하여 인덱스 범위 [0, k-1]에 대응시킨다
        val i = (num * k).toInt()
        // num을 버킷 i에 추가한다
        buckets[i].add(num)
    }
    // 2. 각 버킷을 정렬한다
    for (bucket in buckets) {
        // 내장 정렬 함수를 사용하며, 다른 정렬 알고리즘으로 대체할 수도 있다
        bucket.sort()
    }
    // 3. 버킷을 순회하여 결과를 합친다
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* 실행 코드 */
fun main() {
    // 입력 데이터는 범위가 [0, 1)인 부동 소수점 수라고 가정한다
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("버킷 정렬 후 nums = ${nums.contentToString()}")
}