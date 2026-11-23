/**
 * File: two_sum.swift
 * Created Time: 2023-01-03
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 방법 1: 완전 열거 */
func twoSumBruteForce(nums: [Int], target: Int) -> [Int] {
    // 이중 반복문이며 시간 복잡도는 O(n^2)이다
    for i in nums.indices.dropLast() {
        for j in nums.indices.dropFirst(i + 1) {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return [0]
}

/* 방법 2: 보조 해시 테이블 */
func twoSumHashTable(nums: [Int], target: Int) -> [Int] {
    // 보조 해시 테이블의 공간 복잡도는 O(n)이다
    var dic: [Int: Int] = [:]
    // 단일 반복문이며 시간 복잡도는 O(n)이다
    for i in nums.indices {
        if let j = dic[target - nums[i]] {
            return [j, i]
        }
        dic[nums[i]] = i
    }
    return [0]
}

@main
enum LeetcodeTwoSum {
    /* 실행 코드 */
    static func main() {
        // ======= 테스트 사례 =======
        let nums = [2, 7, 11, 15]
        let target = 13
        // ====== 실행 코드 ======
        // 방법 1
        var res = twoSumBruteForce(nums: nums, target: target)
        print("방법 1 res = \(res)")
        // 방법 2
        res = twoSumHashTable(nums: nums, target: target)
        print("방법 2 res = \(res)")
    }
}
