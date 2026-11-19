/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        // [region]{init_stack}
        /* 初始化栈 */
        // Swift 没有内置的栈类，可以把 Array 当作栈来使用
        var stack: [Int] = []
        // [endregion]{init_stack}

        // [region]{push}
        /* 元素入栈 */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        // [endregion]{push}
        print("栈 stack = \(stack)")

        // [region]{peek}
        /* 访问栈顶元素 */
        let peek = stack.last!
        // [endregion]{peek}
        print("栈顶元素 peek = \(peek)")

        // [region]{pop}
        /* 元素出栈 */
        let pop = stack.removeLast()
        // [endregion]{pop}
        print("出栈元素 pop = \(pop)，出栈后 stack = \(stack)")

        // [region]{size}
        /* 获取栈的长度 */
        let size = stack.count
        // [endregion]{size}
        print("栈的长度 size = \(size)")

        // [region]{is_empty}
        /* 判断是否为空 */
        let isEmpty = stack.isEmpty
        // [endregion]{is_empty}
        print("栈是否为空 = \(isEmpty)")
    }
}
