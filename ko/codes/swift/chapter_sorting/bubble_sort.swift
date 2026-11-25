/**
 * File: bubble_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 버블 정렬 */
func bubbleSort(nums: inout [Int]) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        // 안쪽 루프: 미정렬 구간 [0, i]의 최댓값을 교환을 통해 구간의 오른쪽 끝으로 이동
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1] 교환
                nums.swapAt(j, j + 1)
            }
        }
    }
}

/* 플래그로 최적화한 버블 정렬*/
func bubbleSortWithFlag(nums: inout [Int]) {
    // 바깥 루프: 미정렬 구간은 [0, i]
    for i in nums.indices.dropFirst().reversed() {
        var flag = false // 플래그 초기화
        for j in 0 ..< i {
            if nums[j] > nums[j + 1] {
                // nums[j]와 nums[j + 1] 교환
                nums.swapAt(j, j + 1)
                flag = true // 원소가 교환되었음을 기록
            }
        }
        if !flag { // 이 회전에서 교환이 한 번도 없으면 바로 종료
            break
        }
    }
}

@main
enum BubbleSort {
    /* 실행 예제 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        bubbleSort(nums: &nums)
        print("버블 정렬 후 nums = \(nums)")

        var nums1 = [4, 1, 3, 1, 5, 2]
        bubbleSortWithFlag(nums: &nums1)
        print("버블 정렬 후 nums1 = \(nums1)")
    }
}
