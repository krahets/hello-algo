/**
 * File: radix_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원소 num의 k번째 자릿값 구하기. 여기서 exp = 10^(k-1) */
func digit(num: Int, exp: Int) -> Int {
    // k 대신 exp를 전달하여 비용이 큰 거듭제곱 연산의 반복 방지
    (num / exp) % 10
}

/* 계수 정렬(nums의 k번째 자릿값 기준) */
func countingSortDigit(nums: inout [Int], exp: Int) {
    // 십진수 한 자리의 값은 0~9이므로 길이 10인 버킷 배열이 필요함
    var counter = Array(repeating: 0, count: 10)
    // 0~9의 각 숫자가 나타난 횟수 세기
    for i in nums.indices {
        let d = digit(num: nums[i], exp: exp) // nums[i]의 k번째 자릿값을 구해 d에 저장
        counter[d] += 1 // 숫자 d의 출현 횟수 세기
    }
    // 누적합을 구해 ‘출현 횟수’를 ‘배열 인덱스’로 변환
    for i in 1 ..< 10 {
        counter[i] += counter[i - 1]
    }
    // 역순으로 순회하며 버킷별 계수 결과에 따라 각 원소를 res에 채우기
    var res = Array(repeating: 0, count: nums.count)
    for i in nums.indices.reversed() {
        let d = digit(num: nums[i], exp: exp)
        let j = counter[d] - 1 // 배열에서 d가 들어갈 인덱스 j 구하기
        res[j] = nums[i] // 현재 원소를 인덱스 j에 배치
        counter[d] -= 1 // d의 개수를 1 줄이기
    }
    // 결과로 원래 배열 nums를 덮어쓰기
    for i in nums.indices {
        nums[i] = res[i]
    }
}

/* 기수 정렬 */
func radixSort(nums: inout [Int]) {
    // 최대 자릿수를 알아내기 위해 배열의 최댓값 구하기
    var m = Int.min
    for num in nums {
        if num > m {
            m = num
        }
    }
    // 낮은 자리부터 높은 자리까지 차례로 순회
    for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
        // 배열 원소의 k번째 자릿값을 기준으로 계수 정렬 수행
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 즉, exp = 10^(k-1)
        countingSortDigit(nums: &nums, exp: exp)
    }
}

@main
enum RadixSort {
    /* 실행 예제 */
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
