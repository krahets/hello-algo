/**
 * File: time_complexity.kt
 * Created Time: 2024-01-25
 * Author: curtishd (1023632660@qq.com)
 */

package chapter_computational_complexity.time_complexity

/* 상수 차수 */
fun constant(n: Int): Int {
    var count = 0
    val size = 100000
    for (i in 0..<size)
        count++
    return count
}

/* 선형 차수 */
fun linear(n: Int): Int {
    var count = 0
    for (i in 0..<n)
        count++
    return count
}

/* 선형 차수(배열 순회) */
fun arrayTraversal(nums: IntArray): Int {
    var count = 0
    // 반복 횟수는 배열 길이에 비례한다
    for (num in nums) {
        count++
    }
    return count
}

/* 이차 차수 */
fun quadratic(n: Int): Int {
    var count = 0
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for (i in 0..<n) {
        for (j in 0..<n) {
            count++
        }
    }
    return count
}

/* 이차 차수(버블 정렬) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // 카운터
    // 바깥 반복문: 정렬되지 않은 구간은 [0, i]이다
    for (i in nums.size - 1 downTo 1) {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]에서 가장 큰 원소를 교환을 통해 맨 오른쪽으로 보낸다
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]의 값을 맞바꾼다
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 두 원소를 교환하는 데는 기본 연산 3회가 필요하다
            }
        }
    }
    return count
}

/* 지수 차수(반복 구현) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 세포가 매번 둘로 분열하여 그 수가 1, 2, 4, 8, ..., 2^(n-1)이 된다
    for (i in 0..<n) {
        for (j in 0..<base) {
            count++
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 지수 차수(재귀 구현) */
fun expRecur(n: Int): Int {
    if (n == 1) {
        return 1
    }
    return expRecur(n - 1) + expRecur(n - 1) + 1
}

/* 로그 차수(반복 구현) */
fun logarithmic(n: Int): Int {
    var n1 = n
    var count = 0
    while (n1 > 1) {
        n1 /= 2
        count++
    }
    return count
}

/* 로그 차수(재귀 구현) */
fun logRecur(n: Int): Int {
    if (n <= 1)
        return 0
    return logRecur(n / 2) + 1
}

/* 선형 로그 차수 */
fun linearLogRecur(n: Int): Int {
    if (n <= 1)
        return 1
    var count = linearLogRecur(n / 2) + linearLogRecur(n / 2)
    for (i in 0..<n) {
        count++
    }
    return count
}

/* 팩토리얼 차수(재귀 구현) */
fun factorialRecur(n: Int): Int {
    if (n == 0)
        return 1
    var count = 0
    // 하나가 n개로 나뉜다
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* 실행 예제 */
fun main() {
    // n을 바꿔 실행하며 복잡도에 따라 연산 횟수가 어떻게 변하는지 살펴보자
    val n = 8
    println("입력 크기 n = $n")

    var count = constant(n)
    println("상수 차수 연산 횟수 = $count")

    count = linear(n)
    println("선형 차수 연산 횟수 = $count")
    count = arrayTraversal(IntArray(n))
    println("선형 차수(배열 순회) 연산 횟수 = $count")

    count = quadratic(n)
    println("이차 차수 연산 횟수 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("이차 차수(버블 정렬) 연산 횟수 = $count")

    count = exponential(n)
    println("지수 차수(반복 구현) 연산 횟수 = $count")
    count = expRecur(n)
    println("지수 차수(재귀 구현) 연산 횟수 = $count")

    count = logarithmic(n)
    println("로그 차수(반복 구현) 연산 횟수 = $count")
    count = logRecur(n)
    println("로그 차수(재귀 구현) 연산 횟수 = $count")

    count = linearLogRecur(n)
    println("선형 로그 차수(재귀 구현) 연산 횟수 = $count")

    count = factorialRecur(n)
    println("팩토리얼 차수(재귀 구현) 연산 횟수 = $count")
}