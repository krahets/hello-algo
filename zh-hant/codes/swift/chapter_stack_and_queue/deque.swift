/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* 範例程式 */
    static func main() {
        /* 初始化雙端佇列 */
        // Swift 沒有內建雙端佇列類別，可以用 Array 當作雙端佇列
        var deque: [Int] = []

        /* 將元素加入雙端佇列 */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("雙端佇列 deque = \(deque)")

        /* 讀取隊首與隊尾元素 */
        let peekFirst = deque.first!
        print("隊首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("隊尾元素 peekLast = \(peekLast)")

        /* 從雙端佇列取出元素 */
        // 用 Array 模擬時，removeFirst 的時間複雜度為 O(n)
        let popFirst = deque.removeFirst()
        print("從隊首取出的元素 popFirst = \(popFirst)，取出後 deque = \(deque)")
        let popLast = deque.removeLast()
        print("從隊尾取出的元素 popLast = \(popLast)，取出後 deque = \(deque)")

        /* 取得雙端佇列長度 */
        let size = deque.count
        print("雙端佇列長度 size = \(size)")

        /* 判斷雙端佇列是否為空 */
        let isEmpty = deque.isEmpty
        print("雙端佇列是否為空 = \(isEmpty)")
    }
}
