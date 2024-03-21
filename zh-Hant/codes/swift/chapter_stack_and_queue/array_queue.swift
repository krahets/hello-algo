/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
    private var nums: [Int] // 用於儲存佇列元素的陣列
    private var front: Int // 佇列首指標，指向佇列首元素
    private var _size: Int // 佇列長度

    init(capacity: Int) {
        // 初始化陣列
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 獲取佇列的容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 獲取佇列的長度 */
    func size() -> Int {
        _size
    }

    /* 判斷佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入列 */
    func push(num: Int) {
        if size() == capacity() {
            print("佇列已滿")
            return
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        let rear = (front + size()) % capacity()
        // 將 num 新增至佇列尾
        nums[rear] = num
        _size += 1
    }

    /* 出列 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* 訪問佇列首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("佇列為空")
        }
        return nums[front]
    }

    /* 返回陣列 */
    func toArray() -> [Int] {
        // 僅轉換有效長度範圍內的串列元素
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* 初始化佇列 */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* 元素入列 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("佇列 queue = \(queue.toArray())")

        /* 訪問佇列首元素 */
        let peek = queue.peek()
        print("佇列首元素 peek = \(peek)")

        /* 元素出列 */
        let pop = queue.pop()
        print("出列元素 pop = \(pop)，出列後 queue = \(queue.toArray())")

        /* 獲取佇列的長度 */
        let size = queue.size()
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty()
        print("佇列是否為空 = \(isEmpty)")

        /* 測試環形陣列 */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 輪入列 + 出列後 queue = \(queue.toArray())")
        }
    }
}
