/**
 * File: insertion_sort.swift
 * Created Time: 2023-01-29
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 삽입 정렬 */
func insertionSort(nums: inout [Int]) {
    // 바깥쪽 반복문: 정렬된 구간은 [0, i-1]이다
    for i in nums.indices.dropFirst() {
        let base = nums[i]
        var j = i - 1
        // 안쪽 반복문: base를 정렬된 구간 [0, i-1]의 올바른 위치에 삽입한다
        while j >= 0, nums[j] > base {
            nums[j + 1] = nums[j] // nums[j]를 오른쪽으로 한 칸 이동한다
            j -= 1
        }
        nums[j + 1] = base // 올바른 위치에 base를 대입한다
    }
}

@main
enum InsertionSort {
    /* 실행 코드 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        insertionSort(nums: &nums)
        print("삽입 정렬 후 nums = \(nums)")
    }
}
