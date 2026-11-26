/**
 * File: bucket_sort.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_sorting

/* 버킷 정렬 */
fun bucketSort(nums: FloatArray) {
    // 버킷 k = n/2개를 초기화하여 버킷당 평균 두 원소를 배분할 것으로 예상
    val k = nums.size / 2
    val buckets = mutableListOf<MutableList<Float>>()
    for (i in 0..<k) {
        buckets.add(mutableListOf())
    }
    // 1. 배열 원소를 각 버킷에 배분
    for (num in nums) {
        // 입력 범위는 [0, 1)이며 num * k로 인덱스 범위 [0, k-1]에 대응시킴
        val i = (num * k).toInt()
        // num을 버킷 i에 추가
        buckets[i].add(num)
    }
    // 2. 각 버킷을 정렬
    for (bucket in buckets) {
        // 내장 정렬 함수를 사용하며 다른 정렬 알고리즘으로 대체 가능
        bucket.sort()
    }
    // 3. 버킷을 순회하여 결과 병합
    var i = 0
    for (bucket in buckets) {
        for (num in bucket) {
            nums[i++] = num
        }
    }
}

/* 실행 예제 */
fun main() {
    // 입력은 [0, 1) 범위의 부동 소수점 수로 가정
    val nums = floatArrayOf(0.49f, 0.96f, 0.82f, 0.09f, 0.57f, 0.43f, 0.91f, 0.75f, 0.15f, 0.37f)
    bucketSort(nums)
    println("버킷 정렬 후 nums = ${nums.contentToString()}")
}