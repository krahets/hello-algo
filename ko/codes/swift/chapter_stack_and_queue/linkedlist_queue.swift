/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    private var front: ListNode? // 머리 노드
    private var rear: ListNode? // 꼬리 노드
    private var _size: Int

    init() {
        _size = 0
    }

    /* 큐의 길이 반환 */
    func size() -> Int {
        _size
    }

    /* 큐가 비어 있는지 판단 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 큐에 삽입 */
    func push(num: Int) {
        // 꼬리 노드 뒤에 num을 추가한다
        let node = ListNode(x: num)
        // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
        if front == nil {
            front = node
            rear = node
        }
        // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* 큐에서 꺼내기 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 머리 노드를 삭제한다
        front = front?.next
        _size -= 1
        return num
    }

    /* 맨 앞 원소 접근 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("큐가 비어 있다")
        }
        return front!.val
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListQueue {
    /* 실행 코드 */
    static func main() {
        /* 큐 초기화 */
        let queue = LinkedListQueue()

        /* 큐에 원소 삽입 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("큐 queue = \(queue.toArray())")

        /* 맨 앞 원소 접근 */
        let peek = queue.peek()
        print("맨 앞 원소 peek = \(peek)")

        /* 큐에서 원소 꺼내기 */
        let pop = queue.pop()
        print("큐에서 꺼낸 원소 pop = \(pop), 꺼낸 후 queue = \(queue.toArray())")

        /* 큐의 길이 반환 */
        let size = queue.size()
        print("큐의 길이 size = \(size)")

        /* 큐가 비어 있는지 판단 */
        let isEmpty = queue.isEmpty()
        print("큐가 비어 있는가 = \(isEmpty)")
    }
}
