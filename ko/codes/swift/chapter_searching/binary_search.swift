/**
 * File: binary_search.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 이진 탐색(닫힌구간) */
func binarySearch(nums: [Int], target: Int) -> Int {
    // 닫힌구간 [0, n-1]을 초기화한다. i와 j는 각각 배열의 첫 원소와 마지막 원소를 가리킨다.
    var i = nums.startIndex
    var j = nums.endIndex - 1
    // 탐색 구간이 빌 때까지 반복한다(i > j이면 빈 구간).
    while i <= j {
        let m = i + (j - i) / 2 // 중점 인덱스 m을 계산한다.
        if nums[m] < target { // 이 경우 target을 찾을 구간은 [m+1, j]이다.
            i = m + 1
        } else if nums[m] > target { // 이 경우 target을 찾을 구간은 [i, m-1]이다.
            j = m - 1
        } else { // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
            return m
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1
}

/* 이진 탐색(왼쪽 끝만 포함하는 반열린구간) */
func binarySearchLCRO(nums: [Int], target: Int) -> Int {
    // 왼쪽 끝만 포함하는 반열린구간 [0, n)을 초기화한다. i는 첫 원소를, j는 마지막 원소 바로 다음 위치를 가리킨다.
    var i = nums.startIndex
    var j = nums.endIndex
    // 탐색 구간이 빌 때까지 반복한다(i = j이면 빈 구간).
    while i < j {
        let m = i + (j - i) / 2 // 중점 인덱스 m을 계산한다.
        if nums[m] < target { // 이 경우 target을 찾을 구간은 [m+1, j)이다.
            i = m + 1
        } else if nums[m] > target { // 이 경우 target을 찾을 구간은 [i, m)이다.
            j = m
        } else { // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
            return m
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1
}

@main
enum BinarySearch {
    /* 실행 예제 */
    static func main() {
        let target = 6
        let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

        /* 이진 탐색(닫힌구간) */
        var index = binarySearch(nums: nums, target: target)
        print("목표 원소 6의 인덱스 = \(index)")

        /* 이진 탐색(왼쪽 끝만 포함하는 반열린구간) */
        index = binarySearchLCRO(nums: nums, target: target)
        print("목표 원소 6의 인덱스 = \(index)")
    }
}
