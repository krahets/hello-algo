/**
 * File: time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 상수 차수 */
func constant(n: Int) -> Int {
    var count = 0
    let size = 100_000
    for _ in 0 ..< size {
        count += 1
    }
    return count
}

/* 선형 차수 */
func linear(n: Int) -> Int {
    var count = 0
    for _ in 0 ..< n {
        count += 1
    }
    return count
}

/* 선형 차수(배열 순회) */
func arrayTraversal(nums: [Int]) -> Int {
    var count = 0
    // 반복 횟수는 배열 길이에 비례한다
    for _ in nums {
        count += 1
    }
    return count
}

/* 제곱 차수 */
func quadratic(n: Int) -> Int {
    var count = 0
    // 반복 횟수는 데이터 크기 n의 제곱에 비례한다
    for _ in 0 ..< n {
        for _ in 0 ..< n {
            count += 1
        }
    }
    return count
}

/* 제곱 차수(버블 정렬) */
func bubbleSort(nums: inout [Int]) -> Int {
    var count = 0 // 카운터
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in nums.indices.dropFirst().reversed() {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]을 교환한다
                let tmp = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3 // 원소 교환에는 단위 연산 3회가 포함된다
            }
        }
    }
    return count
}

/* 지수 차수(반복문 구현) */
func exponential(n: Int) -> Int {
    var count = 0
    var base = 1
    // 세포가 매번 둘로 나뉘어 수열 1, 2, 4, 8, ..., 2^(n-1)을 이룬다
    for _ in 0 ..< n {
        for _ in 0 ..< base {
            count += 1
        }
        base *= 2
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count
}

/* 지수 차수(재귀 구현) */
func expRecur(n: Int) -> Int {
    if n == 1 {
        return 1
    }
    return expRecur(n: n - 1) + expRecur(n: n - 1) + 1
}

/* 로그 차수(반복문 구현) */
func logarithmic(n: Int) -> Int {
    var count = 0
    var n = n
    while n > 1 {
        n = n / 2
        count += 1
    }
    return count
}

/* 로그 차수(재귀 구현) */
func logRecur(n: Int) -> Int {
    if n <= 1 {
        return 0
    }
    return logRecur(n: n / 2) + 1
}

/* 선형 로그 차수 */
func linearLogRecur(n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var count = linearLogRecur(n: n / 2) + linearLogRecur(n: n / 2)
    for _ in stride(from: 0, to: n, by: 1) {
        count += 1
    }
    return count
}

/* 팩토리얼 차수(재귀 구현) */
func factorialRecur(n: Int) -> Int {
    if n == 0 {
        return 1
    }
    var count = 0
    // 하나에서 n개로 분열한다
    for _ in 0 ..< n {
        count += factorialRecur(n: n - 1)
    }
    return count
}

@main
enum TimeComplexity {
    /* 실행 코드 */
    static func main() {
        // n을 바꾸어 실행하면서 각 복잡도에서 연산 횟수가 어떻게 변하는지 살펴볼 수 있다
        let n = 8
        print("입력 데이터 크기 n = \(n)")

        var count = constant(n: n)
        print("상수 차수의 연산 횟수 = \(count)")

        count = linear(n: n)
        print("선형 차수의 연산 횟수 = \(count)")
        count = arrayTraversal(nums: Array(repeating: 0, count: n))
        print("선형 차수(배열 순회)의 연산 횟수 = \(count)")

        count = quadratic(n: n)
        print("제곱 차수의 연산 횟수 = \(count)")
        var nums = Array(stride(from: n, to: 0, by: -1)) // [n,n-1,...,2,1]
        count = bubbleSort(nums: &nums)
        print("제곱 차수(버블 정렬)의 연산 횟수 = \(count)")

        count = exponential(n: n)
        print("지수 차수(반복문 구현)의 연산 횟수 = \(count)")
        count = expRecur(n: n)
        print("지수 차수(재귀 구현)의 연산 횟수 = \(count)")

        count = logarithmic(n: n)
        print("로그 차수(반복문 구현)의 연산 횟수 = \(count)")
        count = logRecur(n: n)
        print("로그 차수(재귀 구현)의 연산 횟수 = \(count)")

        count = linearLogRecur(n: n)
        print("선형 로그 차수(재귀 구현)의 연산 횟수 = \(count)")

        count = factorialRecur(n: n)
        print("팩토리얼 차수(재귀 구현)의 연산 횟수 = \(count)")
    }
}
