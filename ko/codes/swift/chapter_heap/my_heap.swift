/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 최대 힙 */
class MaxHeap {
    private var maxHeap: [Int]

    /* 생성자: 입력 리스트를 바탕으로 힙 구성 */
    init(nums: [Int]) {
        // 리스트 원소를 그대로 힙에 추가한다
        maxHeap = nums
        // 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 왼쪽 자식 노드의 인덱스 반환 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 반환 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 반환 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 나눗셈의 결과를 내림한다
    }

    /* 원소 교환 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* 힙 크기 반환 */
    func size() -> Int {
        maxHeap.count
    }

    /* 힙이 비어 있는지 판단 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 힙의 루트 원소 접근 */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 힙에 원소 삽입 */
    func push(val: Int) {
        // 노드 추가
        maxHeap.append(val)
        // 아래에서 위로 힙을 재정렬한다
        siftUp(i: size() - 1)
    }

    /* 노드 i에서 시작하여 아래에서 위로 힙 재정렬 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // 노드 i의 부모 노드를 구한다
            let p = parent(i: i)
            // 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 두 노드를 교환한다
            swap(i: i, j: p)
            // 위쪽으로 힙 재정렬을 반복한다
            i = p
        }
    }

    /* 힙에서 원소 꺼내기 */
    func pop() -> Int {
        // 비어 있는 경우를 처리한다
        if isEmpty() {
            fatalError("힙이 비어 있다")
        }
        // 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
        swap(i: 0, j: size() - 1)
        // 노드 삭제
        let val = maxHeap.remove(at: size() - 1)
        // 위에서 아래로 힙을 재정렬한다
        siftDown(i: 0)
        // 힙의 루트 원소를 반환한다
        return val
    }

    /* 노드 i에서 시작하여 위에서 아래로 힙 재정렬 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
            if ma == i {
                break
            }
            // 두 노드를 교환한다
            swap(i: i, j: ma)
            // 아래쪽으로 힙 재정렬을 반복한다
            i = ma
        }
    }

    /* 힙 출력(이진 트리) */
    func print() {
        let queue = maxHeap
        PrintUtil.printHeap(queue: queue)
    }
}

@main
enum MyHeap {
    /* 실행 코드 */
    static func main() {
        /* 최대 힙 초기화 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n리스트를 입력하여 힙을 구성한 후")
        maxHeap.print()

        /* 힙의 루트 원소 반환 */
        var peek = maxHeap.peek()
        print("\n힙의 루트 원소 = \(peek)")

        /* 힙에 원소 삽입 */
        let val = 7
        maxHeap.push(val: val)
        print("\n힙에 원소(\(val))를 삽입한 후")
        maxHeap.print()

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.pop()
        print("\n힙의 루트 원소(\(peek))를 꺼낸 후")
        maxHeap.print()

        /* 힙 크기 반환 */
        let size = maxHeap.size()
        print("\n힙의 원소 개수 = \(size)")

        /* 힙이 비어 있는지 판단 */
        let isEmpty = maxHeap.isEmpty()
        print("\n힙이 비어 있는가: \(isEmpty)")
    }
}
