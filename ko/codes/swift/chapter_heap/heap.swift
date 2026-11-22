/**
 * File: heap.swift
 * Created Time: 2024-03-17
 * Author: nuomi1 (nuomi1@qq.com)
 */

import HeapModule
import utils

func testPush(heap: inout Heap<Int>, val: Int) {
    heap.insert(val)
    print("\n힙에 원소(\(val))를 삽입한 후\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

func testPop(heap: inout Heap<Int>) {
    let val = heap.removeMax()
    print("\n힙의 루트 원소(\(val))를 꺼낸 후\n")
    PrintUtil.printHeap(queue: heap.unordered)
}

@main
enum _Heap {
    /* 실행 코드 */
    static func main() {
        /* 힙 초기화 */
        // Swift의 Heap 타입은 최대 힙과 최소 힙을 모두 지원한다
        var heap = Heap<Int>()

        /* 힙에 원소 삽입 */
        testPush(heap: &heap, val: 1)
        testPush(heap: &heap, val: 3)
        testPush(heap: &heap, val: 2)
        testPush(heap: &heap, val: 5)
        testPush(heap: &heap, val: 4)

        /* 힙의 루트 원소 반환 */
        let peek = heap.max()
        print("\n힙의 루트 원소 = \(peek!)\n")

        /* 힙의 루트 원소 꺼내기 */
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)
        testPop(heap: &heap)

        /* 힙 크기 반환 */
        let size = heap.count
        print("\n힙의 원소 개수 = \(size)\n")

        /* 힙이 비어 있는지 판단 */
        let isEmpty = heap.isEmpty
        print("\n힙이 비어 있는가: \(isEmpty)\n")

        /* 리스트를 입력하여 힙 구성 */
        // 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
        let heap2 = Heap([1, 3, 2, 5, 4])
        print("\n리스트를 입력하여 힙을 구성한 후")
        PrintUtil.printHeap(queue: heap2.unordered)
    }
}
