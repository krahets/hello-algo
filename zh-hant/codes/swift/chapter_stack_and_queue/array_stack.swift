/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 以陣列實作堆疊 */
class ArrayStack {
    private var stack: [Int]

    init() {
        // 初始化動態陣列
        stack = []
    }

    /* 取得堆疊長度 */
    func size() -> Int {
        stack.count
    }

    /* 判斷堆疊是否為空 */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* 推入堆疊 */
    func push(num: Int) {
        stack.append(num)
    }

    /* 彈出堆疊頂端的元素 */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return stack.removeLast()
    }

    /* 讀取堆疊頂端的元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("堆疊為空")
        }
        return stack.last!
    }

    /* 以陣列形式回傳堆疊內容 */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* 範例程式 */
    static func main() {
        /* 初始化堆疊 */
        let stack = ArrayStack()

        /* 將元素推入堆疊 */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("堆疊 stack = \(stack.toArray())")

        /* 讀取堆疊頂端的元素 */
        let peek = stack.peek()
        print("堆疊頂端元素 peek = \(peek)")

        /* 從堆疊彈出元素 */
        let pop = stack.pop()
        print("彈出的元素 pop = \(pop)，彈出後 stack = \(stack.toArray())")

        /* 取得堆疊長度 */
        let size = stack.size()
        print("堆疊長度 size = \(size)")

        /* 判斷堆疊是否為空 */
        let isEmpty = stack.isEmpty()
        print("堆疊是否為空 = \(isEmpty)")
    }
}
