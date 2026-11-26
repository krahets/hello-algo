/**
 * File: top_k.swift
 * Created Time: 2023-07-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

/* 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 */
func topKHeap(nums: [Int], k: Int) -> [Int] {
    // 최소 힙을 초기화하고 처음 k개 원소로 힙 구성
    var heap = Heap(nums.prefix(k))
    // k+1번째 원소부터 힙의 크기를 k로 유지
    for i in nums.indices.dropFirst(k) {
        // 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
        if nums[i] > heap.min()! {
            _ = heap.removeMin()
            heap.insert(nums[i])
        }
    }
    return heap.unordered
}

@main
enum TopK {
    /* 실행 예제 */
    static func main() {
        let nums = [1, 7, 6, 3, 2]
        let k = 3

        let res = topKHeap(nums: nums, k: k)
        print("가장 큰 원소 \(k)개:")
        PrintUtil.printHeap(queue: res)
    }
}
