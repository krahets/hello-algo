/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* 연결 리스트로 구현한 스택 */
class LinkedListStack {
    private var _peek: ListNode? // 첫 노드를 스택의 맨 위로 사용한다
    private var _size: Int // 스택의 길이

    init() {
        _size = 0
    }

    /* 스택의 길이 조회 */
    func size() -> Int {
        _size
    }

    /* 스택이 비어 있는지 확인 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 스택에 삽입 */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* 스택에서 꺼내기 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* 스택 맨 위의 원소 조회 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("스택이 비어 있다")
        }
        return _peek!.val
    }

    /* 연결 리스트를 배열로 변환해 반환한다 */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: size())
        for i in res.indices.reversed() {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListStack {
    /* 실행 예제 */
    static func main() {
        /* 스택 초기화 */
        let stack = LinkedListStack()

        /* 스택에 원소 삽입 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("스택 stack = \(stack.toArray())")

        /* 스택 맨 위의 원소 조회 */
        let peek = stack.peek()
        print("맨 위 원소 peek = \(peek)")

        /* 스택에서 원소 꺼내기 */
        let pop = stack.pop()
        print("꺼낸 원소 pop = \(pop), 꺼낸 후 stack = \(stack.toArray())")

        /* 스택의 길이 조회 */
        let size = stack.size()
        print("스택의 길이 size = \(size)")

        /* 비어 있는지 확인 */
        let isEmpty = stack.isEmpty()
        print("스택이 비어 있는가 = \(isEmpty)")
    }
}
