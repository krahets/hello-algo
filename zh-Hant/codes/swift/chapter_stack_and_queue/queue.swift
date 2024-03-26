/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* 初始化佇列 */
        // Swift 沒有內建的佇列類別，可以把 Array 當作佇列來使用
        var queue: [Int] = []

        /* 元素入列 */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("佇列 queue = \(queue)")

        /* 訪問佇列首元素 */
        let peek = queue.first!
        print("佇列首元素 peek = \(peek)")

        /* 元素出列 */
        // 使用 Array 模擬時 pop 的複雜度為 O(n)
        let pool = queue.removeFirst()
        print("出列元素 pop = \(pool)，出列後 queue = \(queue)")

        /* 獲取佇列的長度 */
        let size = queue.count
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty
        print("佇列是否為空 = \(isEmpty)")
    }
}
