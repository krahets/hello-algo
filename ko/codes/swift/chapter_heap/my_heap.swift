/**
 * File: my_heap.swift
 * Created Time: 2023-01-28
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 최대 힙 */
class MaxHeap {
    private var maxHeap: [Int]

    /* 입력 리스트로 힙을 만드는 생성자 */
    init(nums: [Int]) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = nums
        // 리프를 제외한 모든 노드에서 힙 복구
        for i in (0 ... parent(i: size() - 1)).reversed() {
            siftDown(i: i)
        }
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    private func left(i: Int) -> Int {
        2 * i + 1
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    private func right(i: Int) -> Int {
        2 * i + 2
    }

    /* 부모 노드의 인덱스 구하기 */
    private func parent(i: Int) -> Int {
        (i - 1) / 2 // 나눗셈 결과를 내림
    }

    /* 원소 교환 */
    private func swap(i: Int, j: Int) {
        maxHeap.swapAt(i, j)
    }

    /* 힙 크기 구하기 */
    func size() -> Int {
        maxHeap.count
    }

    /* 힙이 비었는지 확인 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 힙의 루트 원소 조회 */
    func peek() -> Int {
        maxHeap[0]
    }

    /* 힙에 원소 삽입 */
    func push(val: Int) {
        // 노드 추가
        maxHeap.append(val)
        // 아래에서 위로 힙 복구
        siftUp(i: size() - 1)
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    private func siftUp(i: Int) {
        var i = i
        while true {
            // 노드 i의 부모 노드 구하기
            let p = parent(i: i)
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if p < 0 || maxHeap[i] <= maxHeap[p] {
                break
            }
            // 두 노드 교환
            swap(i: i, j: p)
            // 위로 올라가며 힙 복구 반복
            i = p
        }
    }

    /* 힙에서 원소 꺼내기 */
    func pop() -> Int {
        // 빈 힙 처리
        if isEmpty() {
            fatalError("힙이 비어 있음")
        }
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        swap(i: 0, j: size() - 1)
        // 노드 삭제
        let val = maxHeap.remove(at: size() - 1)
        // 위에서 아래로 힙 복구
        siftDown(i: 0)
        // 힙의 루트 원소 반환
        return val
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    private func siftDown(i: Int) {
        var i = i
        while true {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            let l = left(i: i)
            let r = right(i: i)
            var ma = i
            if l < size(), maxHeap[l] > maxHeap[ma] {
                ma = l
            }
            if r < size(), maxHeap[r] > maxHeap[ma] {
                ma = r
            }
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if ma == i {
                break
            }
            // 두 노드 교환
            swap(i: i, j: ma)
            // 아래로 내려가며 힙 복구 반복
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
    /* 실행 예제 */
    static func main() {
        /* 최대 힙 초기화 */
        let maxHeap = MaxHeap(nums: [9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
        print("\n입력 리스트로 만든 힙:")
        maxHeap.print()

        /* 힙의 루트 원소 구하기 */
        var peek = maxHeap.peek()
        print("\n힙의 루트 원소: \(peek)")

        /* 힙에 원소 삽입 */
        let val = 7
        maxHeap.push(val: val)
        print("\n원소 \(val) 삽입 후")
        maxHeap.print()

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.pop()
        print("\n루트 원소 \(peek) 제거 후")
        maxHeap.print()

        /* 힙 크기 구하기 */
        let size = maxHeap.size()
        print("\n힙의 원소 수: \(size)")

        /* 힙이 비었는지 확인 */
        let isEmpty = maxHeap.isEmpty()
        print("\n빈 힙 여부: \(isEmpty)")
    }
}
