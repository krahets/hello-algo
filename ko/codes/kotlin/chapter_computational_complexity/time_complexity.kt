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

/* 제곱 차수 */
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

/* 제곱 차수(버블 정렬) */
fun bubbleSort(nums: IntArray): Int {
    var count = 0 // 카운터
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for (i in nums.size - 1 downTo 1) {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for (j in 0..<i) {
            if (nums[j] > nums[j + 1]) {
                // nums[j]와 nums[j + 1]을 교환한다
                val temp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = temp
                count += 3 // 원소 교환에는 단위 연산 3회가 포함된다
            }
        }
    }
    return count
}

/* 지수 차수(반복문 구현) */
fun exponential(n: Int): Int {
    var count = 0
    var base = 1
    // 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
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

/* 로그 차수(반복문 구현) */
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
    // 하나에서 n개로 분열한다
    for (i in 0..<n) {
        count += factorialRecur(n - 1)
    }
    return count
}

/* 실행 코드 */
fun main() {
    // n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
    val n = 8
    println("입력 데이터 크기 n = $n")

    var count = constant(n)
    println("상수 차수의 연산 횟수 = $count")

    count = linear(n)
    println("선형 차수의 연산 횟수 = $count")
    count = arrayTraversal(IntArray(n))
    println("선형 차수(배열 순회)의 연산 횟수 = $count")

    count = quadratic(n)
    println("제곱 차수의 연산 횟수 = $count")
    val nums = IntArray(n)
    for (i in 0..<n)
        nums[i] = n - i // [n,n-1,...,2,1]
    count = bubbleSort(nums)
    println("제곱 차수(버블 정렬)의 연산 횟수 = $count")

    count = exponential(n)
    println("지수 차수(반복문 구현)의 연산 횟수 = $count")
    count = expRecur(n)
    println("지수 차수(재귀 구현)의 연산 횟수 = $count")

    count = logarithmic(n)
    println("로그 차수(반복문 구현)의 연산 횟수 = $count")
    count = logRecur(n)
    println("로그 차수(재귀 구현)의 연산 횟수 = $count")

    count = linearLogRecur(n)
    println("선형 로그 차수(재귀 구현)의 연산 횟수 = $count")

    count = factorialRecur(n)
    println("팩토리얼 차수(재귀 구현)의 연산 횟수 = $count")
}