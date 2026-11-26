/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 以環狀陣列實作雙端佇列 */
class ArrayDeque {
    private var nums: [Int] // 存放雙端佇列元素的陣列
    private var front: Int // 隊首索引，記錄隊首元素在陣列中的位置
    private var _size: Int // 雙端佇列長度

    /* 初始化方法 */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 取得雙端佇列容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 取得雙端佇列長度 */
    func size() -> Int {
        _size
    }

    /* 判斷雙端佇列是否為空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 計算環狀陣列的索引 */
    private func index(i: Int) -> Int {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        (i + capacity()) % capacity()
    }

    /* 從隊首加入元素 */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("雙端佇列已滿")
            return
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        front = index(i: front - 1)
        // 將 num 加到隊首
        nums[front] = num
        _size += 1
    }

    /* 從隊尾加入元素 */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("雙端佇列已滿")
            return
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        let rear = index(i: front + size())
        // 將 num 加到隊尾
        nums[rear] = num
        _size += 1
    }

    /* 從隊首取出元素 */
    func popFirst() -> Int {
        let num = peekFirst()
        // 將隊首索引往後移一格
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* 從隊尾取出元素 */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* 讀取隊首元素 */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("雙端佇列為空")
        }
        return nums[front]
    }

    /* 讀取隊尾元素 */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("雙端佇列為空")
        }
        // 計算隊尾元素的索引
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* 回傳陣列以便輸出 */
    func toArray() -> [Int] {
        // 只轉換雙端佇列中實際存放的元素
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* 範例程式 */
    static func main() {
        /* 初始化雙端佇列 */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("雙端佇列 deque = \(deque.toArray())")

        /* 讀取隊首與隊尾元素 */
        let peekFirst = deque.peekFirst()
        print("隊首元素 peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("隊尾元素 peekLast = \(peekLast)")

        /* 將元素加入雙端佇列 */
        deque.pushLast(num: 4)
        print("將元素 4 加到隊尾後 deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("將元素 1 加到隊首後 deque = \(deque.toArray())")

        /* 從雙端佇列取出元素 */
        let popLast = deque.popLast()
        print("從隊尾取出的元素 = \(popLast)，取出後 deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("從隊首取出的元素 = \(popFirst)，取出後 deque = \(deque.toArray())")

        /* 取得雙端佇列長度 */
        let size = deque.size()
        print("雙端佇列長度 size = \(size)")

        /* 判斷雙端佇列是否為空 */
        let isEmpty = deque.isEmpty()
        print("雙端佇列是否為空 = \(isEmpty)")
    }
}
