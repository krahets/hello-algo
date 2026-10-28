/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 버블 정렬 */
func bubbleSort(nums: inout [Int]) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in nums.indices.dropFirst().reversed() {
        // 안쪽 반복문: 정렬되지 않은 구간 [0, i]의 최댓값을 교환하여 이 구간의 맨 오른쪽으로 옮긴다
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]을 교환한다
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* 버블 정렬(플래그 최적화)*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 바깥쪽 반복문: 정렬되지 않은 구간은 [0, i]이다
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // 플래그를 초기화한다
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1]을 교환한다
                nums.swapAt(j, j + 1)
                flag = true // 원소가 교환되었음을 기록한다
            }
        }
        if !flag { // 이번 버블 과정에서 원소 교환이 없었으므로 바로 종료한다
            break
        }
    }
}

@main
enum BubbleSort {
    /* 실행 코드 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("버블 정렬 후 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("버블 정렬 후 nums1 = \(nums1)")
    }
}
