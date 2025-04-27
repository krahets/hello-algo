/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基於陣列實現的堆疊 */
class ArrayStack {
    private var stack: [Int]

    init() {
        // 初始化串列（動態陣列）
        stack = []
    }

    /* 獲取堆疊的長度 */
    func size() -> Int {
        stack.count
    }

    /* 判斷堆疊是否為空 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* 入堆疊 */
    func push(num: Int) {
        stack.append(num)
    }

    /* 出堆疊 */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return stack.removeLast()
    }

    /* 訪問堆疊頂元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return stack.last!
    }

    /* 將 List 轉化為 Array 並返回 */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* 初始化堆疊 */
        let stack = ArrayStack()

        /* 元素入堆疊 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("堆疊 stack = \(stack.toArray())")

        /* 訪問堆疊頂元素 */
        let peek = stack.peek()
        print("堆疊頂元素 peek = \(peek)")

        /* 元素出堆疊 */
        let pop = stack.pop()
        print("出堆疊元素 pop = \(pop)，出堆疊後 stack = \(stack.toArray())")

        /* 獲取堆疊的長度 */
        let size = stack.size()
        print("堆疊的長度 size = \(size)")

        /* 判斷是否為空 */
        let isEmpty = stack.isEmpty()
        print("堆疊是否為空 = \(isEmpty)")
    }
}
