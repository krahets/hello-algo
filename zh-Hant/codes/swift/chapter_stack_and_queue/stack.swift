/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* 初始化栈 */
        // Swift 没有内置的栈类，可以把 Array 当作栈来使用
        var stack: [Int] = []

        /* 元素入栈 */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("栈 stack = \(stack)")

        /* 访问栈顶元素 */
        let peek = stack.last!
        print("栈顶元素 peek = \(peek)")

        /* 元素出栈 */
        let pop = stack.removeLast()
        print("出栈元素 pop = \(pop)，出栈后 stack = \(stack)")

        /* 获取栈的长度 */
        let size = stack.count
        print("栈的长度 size = \(size)")

        /* 判断是否为空 */
        let isEmpty = stack.isEmpty
        print("栈是否为空 = \(isEmpty)")
    }
}
