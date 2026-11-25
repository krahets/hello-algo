/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n원소 \(val) 삽입 후\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\n루트 원소 \(val)을 꺼낸 뒤의 힙\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* 실행 예제 */
    static func main() {
        /* 힙 초기화 */
        // Swift의 Heap 타입은 최대 힙과 최소 힙을 모두 지원
        var heap = Heap<Int>()

        /* 힙에 원소 삽입 */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* 힙의 루트 원소 구하기 */
        let peek = heap.max()
        print("\n힙의 루트 원소: \(peek!)\n")

        /* 힙의 루트 원소 꺼내기 */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* 힙 크기 구하기 */
        let size = heap.count
        print("\n힙의 원소 수: \(size)\n")

        /* 힙이 비었는지 확인 */
        let isEmpty = heap.isEmpty
        print("\n빈 힙 여부: \(isEmpty)\n")

        /* 입력 리스트로 힙 구성 */
        // 시간 복잡도는 O(nlogn)이 아니라 O(n)
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\n입력 리스트로 만든 힙:")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
