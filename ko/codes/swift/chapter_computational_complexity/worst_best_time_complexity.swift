/**
 * File: worst_best_time_complexity.swift
 * Created Time: 2022-12-26
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
func randomNumbers(n: Int) -> [Int] {
    // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
    var nums = Array(1 ... n)
    // 배열 원소를 무작위로 섞는다
    nums.shuffle()
    return nums
}

/* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
func findOne(nums: [Int]) -> Int {
    for i in nums.indices {
        // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
        // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
        if nums[i] == 1 {
            return i
        }
    }
    return -1
}

@main
enum WorstBestTimeComplexity {
    /* 실행 코드 */
    static func main() {
        for _ in 0 ..< 10 {
            let n = 100
            let nums = randomNumbers(n: n)
            let index = findOne(nums: nums)
            print("배열 [ 1, 2, ..., n ]을 섞은 후 = \(nums)")
            print("숫자 1의 인덱스 = \(index)")
        }
    }
}
