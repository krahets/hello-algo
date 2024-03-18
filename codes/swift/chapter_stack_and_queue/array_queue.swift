/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基于环形数组实现的队列 */
class ArrayQueue {
    private var nums: [Int] // 用于存储队列元素的数组
    private var front: Int // 队首指针，指向队首元素
    private var _size: Int // 队列长度

    init(capacity: Int) {
        // 初始化数组
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* 获取队列的容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 获取队列的长度 */
    func size() -> Int {
        _size
    }

    /* 判断队列是否为空 */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* 入队 */
    func push(num: Int) {
        if size() == capacity() {
            print("队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        let rear = (front + size()) % capacity()
        // 将 num 添加至队尾
        nums[rear] = num
        _size += 1
    }

    /* 出队 */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* 访问队首元素 */
    func peek() -> Int {
        if isEmpty() {
            fatalError("队列为空")
        }
        return nums[front]
    }

    /* 返回数组 */
    func toArray() -> [Int] {
        // 仅转换有效长度范围内的列表元素
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* 初始化队列 */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* 元素入队 */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("队列 queue = \(queue.toArray())")

        /* 访问队首元素 */
        let peek = queue.peek()
        print("队首元素 peek = \(peek)")

        /* 元素出队 */
        let pop = queue.pop()
        print("出队元素 pop = \(pop)，出队后 queue = \(queue.toArray())")

        /* 获取队列的长度 */
        let size = queue.size()
        print("队列长度 size = \(size)")

        /* 判断队列是否为空 */
        let isEmpty = queue.isEmpty()
        print("队列是否为空 = \(isEmpty)")

        /* 测试环形数组 */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("第 \(i) 轮入队 + 出队后 queue = \(queue.toArray())")
        }
    }
}
