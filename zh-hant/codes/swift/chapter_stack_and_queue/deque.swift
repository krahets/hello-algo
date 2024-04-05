/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* 初始化雙向佇列 */
        // Swift 沒有內建的雙向佇列類別，可以把 Array 當作雙向佇列來使用
        var deque: [Int] = []

        /* 元素入列 */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("雙向佇列 deque = \(deque)")

        /* 訪問元素 */
        let peekFirst = deque.first!
        print("佇列首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("佇列尾元素 peekLast = \(peekLast)")

        /* 元素出列 */
        // 使用 Array 模擬時 popFirst 的複雜度為 O(n)
        let popFirst = deque.removeFirst()
        print("佇列首出列元素 popFirst = \(popFirst)，佇列首出列後 deque = \(deque)")
        let popLast = deque.removeLast()
        print("佇列尾出列元素 popLast = \(popLast)，佇列尾出列後 deque = \(deque)")

        /* 獲取雙向佇列的長度 */
        let size = deque.count
        print("雙向佇列長度 size = \(size)")

        /* 判斷雙向佇列是否為空 */
        let isEmpty = deque.isEmpty
        print("雙向佇列是否為空 = \(isEmpty)")
    }
}
