/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        // [region]{init_deque}
        /* 初始化双向队列 */
        // Swift 没有内置的双向队列类，可以把 Array 当作双向队列来使用
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* 元素入队 */
        deque.append(2) // 添加至队尾
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // 添加至队首
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("双向队列 deque = \(deque)")

        // [region]{peek_first}
        /* 访问元素 */
        let peekFirst = deque.first! // 队首元素
        // [endregion]{peek_first}
        print("队首元素 peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // 队尾元素
        // [endregion]{peek_last}
        print("队尾元素 peekLast = \(peekLast)")

        // [region]{pop_first}
        /* 元素出队 */
        // 使用 Array 模拟时 popFirst 的复杂度为 O(n)
        let popFirst = deque.removeFirst() // 队首元素出队
        // [endregion]{pop_first}
        print("队首出队元素 popFirst = \(popFirst)，队首出队后 deque = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // 队尾元素出队
        // [endregion]{pop_last}
        print("队尾出队元素 popLast = \(popLast)，队尾出队后 deque = \(deque)")

        // [region]{size}
        /* 获取双向队列的长度 */
        let size = deque.count
        // [endregion]{size}
        print("双向队列长度 size = \(size)")

        // [region]{is_empty}
        /* 判断双向队列是否为空 */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("双向队列是否为空 = \(isEmpty)")
    }
}
