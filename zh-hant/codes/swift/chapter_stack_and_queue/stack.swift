/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* 範例程式 */
    static func main() {
        /* 初始化堆疊 */
        // Swift 沒有內建堆疊類別，可以用 Array 當作堆疊
        var stack: [Int] = []

        /* 將元素推入堆疊 */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("堆疊 stack = \(stack)")

        /* 讀取堆疊頂端的元素 */
        let peek = stack.last!
        print("堆疊頂端元素 peek = \(peek)")

        /* 從堆疊彈出元素 */
        let pop = stack.removeLast()
        print("彈出的元素 pop = \(pop)，彈出後 stack = \(stack)")

        /* 取得堆疊長度 */
        let size = stack.count
        print("堆疊長度 size = \(size)")

        /* 判斷堆疊是否為空 */
        let isEmpty = stack.isEmpty
        print("堆疊是否為空 = \(isEmpty)")
    }
}
