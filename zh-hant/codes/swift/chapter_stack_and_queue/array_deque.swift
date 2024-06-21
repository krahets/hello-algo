/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基於環形陣列實現的雙向佇列 */
class ArrayDeque {
    private var nums: [Int] // 用於儲存雙向佇列元素的陣列
    private var front: Int // 佇列首指標，指向佇列首元素
    private var _size: Int // 雙向佇列長度

    /* 建構子 */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 獲取雙向佇列的容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 獲取雙向佇列的長度 */
    func size() -> Int {
        _size
    }

    /* 判斷雙向佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 計算環形陣列索引 */
    private func index(i: Int) -> Int {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        (i + capacity()) % capacity()
    }

    /* 佇列首入列 */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("雙向佇列已滿")
            return
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        front = index(i: front - 1)
        // 將 num 新增至佇列首
        nums[front] = num
        _size += 1
    }

    /* 佇列尾入列 */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("雙向佇列已滿")
            return
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        let rear = index(i: front + size())
        // 將 num 新增至佇列尾
        nums[rear] = num
        _size += 1
    }

    /* 佇列首出列 */
    func popFirst() -> Int {
        let num = peekFirst()
        // 佇列首指標向後移動一位
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* 佇列尾出列 */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* 訪問佇列首元素 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("雙向佇列為空")
        }
        return nums[front]
    }

    /* 訪問佇列尾元素 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("雙向佇列為空")
        }
        // 計算尾元素索引
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 返回陣列用於列印 */
    func toArray() -> [Int] {
        // 僅轉換有效長度範圍內的串列元素
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* 初始化雙向佇列 */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("雙向佇列 deque = \(deque.toArray())")

        /* 訪問元素 */
        let peekFirst = deque.peekFirst()
        print("佇列首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("佇列尾元素 peekLast = \(peekLast)")

        /* 元素入列 */
        deque.pushLast(num: 4)
        print("元素 4 佇列尾入列後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("元素 1 佇列首入列後 deque = \(deque.toArray())")

        /* 元素出列 */
        let popLast = deque.popLast()
        print("佇列尾出列元素 = \(popLast)，佇列尾出列後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("佇列首出列元素 = \(popFirst)，佇列首出列後 deque = \(deque.toArray())")

        /* 獲取雙向佇列的長度 */
        let size = deque.size()
        print("雙向佇列長度 size = \(size)")

        /* 判斷雙向佇列是否為空 */
        let isEmpty = deque.isEmpty()
        print("雙向佇列是否為空 = \(isEmpty)")
    }
}
