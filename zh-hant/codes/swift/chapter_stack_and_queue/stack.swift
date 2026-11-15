/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* 初始化堆疊 */
        // Swift 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
        var stack: [Int] = []

        /* 元素入堆疊 */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("堆疊 stack = \(stack)")

        /* 訪問堆疊頂元素 */
        let peek = stack.last!
        print("堆疊頂元素 peek = \(peek)")

        /* 元素出堆疊 */
        let pop = stack.removeLast()
        print("出堆疊元素 pop = \(pop)，出堆疊後 stack = \(stack)")

        /* 獲取堆疊的長度 */
        let size = stack.count
        print("堆疊的長度 size = \(size)")

        /* 判斷是否為空 */
        let isEmpty = stack.isEmpty
        print("堆疊是否為空 = \(isEmpty)")
    }
}
