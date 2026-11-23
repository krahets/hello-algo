/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원소 num의 k번째 자릿값 반환. 이때 exp = 10^(k-1)이다 */
func digit(num: Int, exp: Int) -> Int {
    // k 대신 exp를 전달하면 여기서 비용이 큰 거듭제곱 계산을 반복하지 않아도 된다
    (num / exp) % 10
}

/* 계수 정렬(nums의 k번째 자릿값을 기준으로 정렬) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 십진수의 각 자리는 0~9 범위이므로 길이가 10인 버킷 배열이 필요하다
    var counter = Array(repeating: 0, count: 10)
    // 0~9 각 숫자의 등장 횟수를 센다
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // nums[i]의 k번째 자릿값을 구하여 d로 표시한다
        counter[d] += 1 // 숫자 d의 등장 횟수를 센다
    }
    // 접두 합을 구하여 등장 개수를 배열 인덱스로 변환한다
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 역순으로 순회하며 버킷에 집계된 결과에 따라 각 원소를 res에 채운다
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 배열에서 d의 인덱스 j를 구한다
        res[j] = nums[i] // 현재 원소를 인덱스 j에 채운다
        counter[d] -= 1 // d의 개수를 1 줄인다
    }
    // 결과로 원래 배열 nums를 덮어쓴다
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 기수 정렬 */
func radixSort(nums: inout [Int]) {
    // 배열의 최댓값을 구하여 최대 자릿수를 판단한다
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 낮은 자리에서 높은 자리 순서로 순회한다
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 배열 원소의 k번째 자릿값에 대해 계수 정렬을 수행한다
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 즉, exp = 10^(k-1)이다
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* 실행 코드 */
    static func main() {
        // 기수 정렬
        var nums = [
            10_546_151,
            35_663_510,
            42_865_989,
            34_862_445,
            81_883_077,
            88_906_420,
            72_429_244,
            30_524_779,
            82_060_337,
            63_832_996,
        ]
        radixSort(nums: &nums)
        print("기수 정렬 후 nums = \(nums)")
    }
}
