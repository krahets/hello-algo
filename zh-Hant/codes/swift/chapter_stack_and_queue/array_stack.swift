/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基于数组实现的栈 */
class ArrayStack {
    private var stack: [Int]

    init() {
        // 初始化列表（动态数组）
        stack = []
    }

    /* 获取栈的长度 */
    func size() -> Int {
        stack.count
    }

    /* 判断栈是否为空 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* 入栈 */
    func push(num: Int) {
        stack.append(num)
    }

    /* 出栈 */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("栈为空")
        }
        return stack.removeLast()
    }

    /* 访问栈顶元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("栈为空")
        }
        return stack.last!
    }

    /* 将 List 转化为 Array 并返回 */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* 初始化栈 */
        let stack = ArrayStack()

        /* 元素入栈 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("栈 stack = \(stack.toArray())")

        /* 访问栈顶元素 */
        let peek = stack.peek()
        print("栈顶元素 peek = \(peek)")

        /* 元素出栈 */
        let pop = stack.pop()
        print("出栈元素 pop = \(pop)，出栈后 stack = \(stack.toArray())")

        /* 获取栈的长度 */
        let size = stack.size()
        print("栈的长度 size = \(size)")

        /* 判断是否为空 */
        let isEmpty = stack.isEmpty()
        print("栈是否为空 = \(isEmpty)")
    }
}
