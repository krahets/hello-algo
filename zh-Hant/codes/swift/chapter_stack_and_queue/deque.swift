/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* 初始化双向队列 */
        // Swift 没有内置的双向队列类，可以把 Array 当作双向队列来使用
        var deque: [Int] = []

        /* 元素入队 */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("双向队列 deque = \(deque)")

        /* 访问元素 */
        let peekFirst = deque.first!
        print("队首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("队尾元素 peekLast = \(peekLast)")

        /* 元素出队 */
        // 使用 Array 模拟时 popFirst 的复杂度为 O(n)
        let popFirst = deque.removeFirst()
        print("队首出队元素 popFirst = \(popFirst)，队首出队后 deque = \(deque)")
        let popLast = deque.removeLast()
        print("队尾出队元素 popLast = \(popLast)，队尾出队后 deque = \(deque)")

        /* 获取双向队列的长度 */
        let size = deque.count
        print("双向队列长度 size = \(size)")

        /* 判断双向队列是否为空 */
        let isEmpty = deque.isEmpty
        print("双向队列是否为空 = \(isEmpty)")
    }
}
