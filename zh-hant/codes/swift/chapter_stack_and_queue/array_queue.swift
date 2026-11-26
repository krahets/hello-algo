/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 以環狀陣列實作佇列 */
class ArrayQueue {
    private var nums: [Int] // 存放佇列元素的陣列
    private var front: Int // 隊首索引，記錄隊首元素在陣列中的位置
    private var _size: Int // 佇列長度

    init(capacity: Int) {
        // 初始化陣列
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 取得佇列容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 取得佇列長度 */
    func size() -> Int {
        _size
    }

    /* 判斷佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入隊 */
    func push(num: Int) {
        if size() == capacity() {
            print("佇列已滿")
            return
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        let rear = (front + size()) % capacity()
        // 將 num 加到隊尾
        nums[rear] = num
        _size += 1
    }

    /* 出隊 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* 讀取隊首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("佇列為空")
        }
        return nums[front]
    }

    /* 回傳陣列 */
    func toArray() -> [Int] {
        // 只轉換佇列中實際存放的元素
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* 範例程式 */
    static func main() {
        /* 初始化佇列 */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* 將元素加入佇列 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("佇列 queue = \(queue.toArray())")

        /* 讀取隊首元素 */
        let peek = queue.peek()
        print("隊首元素 peek = \(peek)")

        /* 從佇列取出元素 */
        let pop = queue.pop()
        print("出隊元素 pop = \(pop)，出隊後 queue = \(queue.toArray())")

        /* 取得佇列長度 */
        let size = queue.size()
        print("佇列長度 size = \(size)")

        /* 判斷佇列是否為空 */
        let isEmpty = queue.isEmpty()
        print("佇列是否為空 = \(isEmpty)")

        /* 測試環狀陣列 */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 輪入隊 + 出隊後 queue = \(queue.toArray())")
        }
    }
}
