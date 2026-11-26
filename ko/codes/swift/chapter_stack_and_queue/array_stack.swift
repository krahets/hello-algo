/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 배열로 구현한 스택 */
class ArrayStack {
    private var stack: [Int]

    init() {
        // 리스트(동적 배열) 초기화
        stack = []
    }

    /* 스택의 길이 조회 */
    func size() -> Int {
        stack.count
    }

    /* 스택이 비어 있는지 확인 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* 스택에 삽입 */
    func push(num: Int) {
        stack.append(num)
    }

    /* 스택에서 꺼내기 */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("스택이 비어 있다")
        }
        return stack.removeLast()
    }

    /* 스택 맨 위의 원소 조회 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("스택이 비어 있다")
        }
        return stack.last!
    }

    /* 리스트를 배열로 변환해 반환한다 */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* 실행 예제 */
    static func main() {
        /* 스택 초기화 */
        let stack = ArrayStack()

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
