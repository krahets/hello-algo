/**
 * File: heap_sort.swift
 * Created Time: 2023-05-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원 */
func siftDown(nums: inout [Int], n: Int, i: Int) {
    var i = i
    while true {
        // 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
        let l = 2 * i + 1
        let r = 2 * i + 2
        var ma = i
        if l < n, nums[l] > nums[ma] {
            ma = l
        }
        if r < n, nums[r] > nums[ma] {
            ma = r
        }
        // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
        if ma == i {
            break
        }
        // 두 노드 교환
        nums.swapAt(i, ma)
        // 아래로 내려가며 힙 속성 복원 반복
        i = ma
    }
}

/* 힙 정렬 */
func heapSort(nums: inout [Int]) {
    // 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
    for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
        siftDown(nums: &nums, n: nums.count, i: i)
    }
    // 힙에서 최댓값 추출을 n-1회 반복
    for i in nums.indices.dropFirst().reversed() {
        // 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
        nums.swapAt(0, i)
        // 루트 노드부터 아래로 내려가며 힙 속성 복원
        siftDown(nums: &nums, n: i, i: 0)
    }
}

@main
enum HeapSort {
    /* 실행 예제 */
    static func main() {
        var nums = [4, 1, 3, 1, 5, 2]
        heapSort(nums: &nums)
        print("힙 정렬 후 nums = \(nums)")
    }
}
