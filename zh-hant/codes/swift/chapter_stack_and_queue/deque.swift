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
        /* 初始化雙向佇列 */
        // Swift 沒有內建的雙向佇列類別，可以把 Array 當作雙向佇列來使用
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* 元素入列 */
        deque.append(2) // 新增至佇列尾
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // 新增至佇列首
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("雙向佇列 deque = \(deque)")

        // [region]{peek_first}
        /* 訪問元素 */
        let peekFirst = deque.first! // 佇列首元素
        // [endregion]{peek_first}
        print("佇列首元素 peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // 佇列尾元素
        // [endregion]{peek_last}
        print("佇列尾元素 peekLast = \(peekLast)")

        // [region]{pop_first}
        /* 元素出列 */
        // 使用 Array 模擬時 popFirst 的複雜度為 O(n)
        let popFirst = deque.removeFirst() // 佇列首元素出列
        // [endregion]{pop_first}
        print("佇列首出列元素 popFirst = \(popFirst)，佇列首出列後 deque = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // 佇列尾元素出列
        // [endregion]{pop_last}
        print("佇列尾出列元素 popLast = \(popLast)，佇列尾出列後 deque = \(deque)")

        // [region]{size}
        /* 獲取雙向佇列的長度 */
        let size = deque.count
        // [endregion]{size}
        print("雙向佇列長度 size = \(size)")

        // [region]{is_empty}
        /* 判斷雙向佇列是否為空 */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("雙向佇列是否為空 = \(isEmpty)")
    }
}
