/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* 範例程式 */
    static func main() {
        /* 初始化佇列 */
        // Swift 沒有內建佇列類別，可以用 Array 當作佇列
        var queue: [Int] = []

        /* 將元素加入佇列 */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("佇列 queue = \(queue)")

        /* 讀取隊首元素 */
        let peek = queue.first!
        print("隊首元素 peek = \(peek)")

        /* 從佇列取出元素 */
        // 用 Array 模擬時，removeFirst 的時間複雜度為 O(n)
        let pop = queue.removeFirst()
        print("出隊元素 pop = \(pop)，出隊後 queue = \(queue)")

        /* 取得佇列長度 */
        let size = queue.count
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty
        print("佇列是否為空 = \(isEmpty)")
    }
}
