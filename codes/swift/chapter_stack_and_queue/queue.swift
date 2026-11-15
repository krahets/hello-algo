/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        // [region]{init_queue}
        /* 初始化队列 */
        // Swift 没有内置的队列类，可以把 Array 当作队列来使用
        var queue: [Int] = []
        // [endregion]{init_queue}

        // [region]{push}
        /* 元素入队 */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        // [endregion]{push}
        print("队列 queue = \(queue)")

        // [region]{peek}
        /* 访问队首元素 */
        let peek = queue.first!
        // [endregion]{peek}
        print("队首元素 peek = \(peek)")

        // [region]{pop}
        /* 元素出队 */
        // 使用 Array 模拟时 pop 的复杂度为 O(n)
        let pop = queue.removeFirst()
        // [endregion]{pop}
        print("出队元素 pop = \(pop)，出队后 queue = \(queue)")

        // [region]{size}
        /* 获取队列的长度 */
        let size = queue.count
        // [endregion]{size}
        print("队列长度 size = \(size)")

        // [region]{is_empty}
        /* 判断队列是否为空 */
        let isEmpty = queue.isEmpty
        // [endregion]{is_empty}
        print("队列是否为空 = \(isEmpty)")
    }
}
