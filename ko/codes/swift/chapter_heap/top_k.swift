/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 최소 힙을 초기화하여 앞쪽 k개 원소로 힙을 구성한다
    var heap = Heap(nums.prefix(k))
    // k+1번째 원소부터 힙의 길이를 k로 유지한다
    for i in nums.indices.dropFirst(k) {
        // 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* 실행 코드 */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("가장 큰 \(k)개 원소")
        PrintUtil.printHeap(queue: res)
    }
}
