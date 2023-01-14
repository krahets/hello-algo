/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* 基于环形数组实现的队列 */
class ArrayQueue {
    private var nums: [Int] // 用于存储队列元素的数组
    private var front = 0 // 头指针，指向队首
    private var rear = 0 // 尾指针，指向队尾 + 1

    init(capacity: Int) {
        // 初始化数组
        nums = Array(repeating: 0, count: capacity)
    }

    /* 获取队列的容量 */
    func capacity() -> Int {
        nums.count
    }

    /* 获取队列的长度 */
    func size() -> Int {
        let capacity = capacity()
        // 由于将数组看作为环形，可能 rear < front ，因此需要取余数
        return (capacity + rear - front) % capacity
    }

    /* 判断队列是否为空 */
    func isEmpty() -> Bool {
        rear - front == 0
    }

    /* 入队 */
    func offer(num: Int) {
        if size() == capacity() {
            print("队列已满")
            return
        }
        // 尾结点后添加 num
        nums[rear] = num
        // 尾指针向后移动一位，越过尾部后返回到数组头部
        rear = (rear + 1) % capacity()
    }

    /* 出队 */
    @discardableResult
    func poll() -> Int {
        let num = peek()
        // 队头指针向后移动一位，若越过尾部则返回到数组头部
        front = (front + 1) % capacity()
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
        let size = size()
        let capacity = capacity()
        // 仅转换有效长度范围内的列表元素
        var res = Array(repeating: 0, count: size)
        for (i, j) in sequence(first: (0, front), next: { $0 < size - 1 ? ($0 + 1, $1 + 1) : nil }) {
            res[i] = nums[j % capacity]
        }
        return res
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
        queue.offer(num: 1)
        queue.offer(num: 3)
        queue.offer(num: 2)
        queue.offer(num: 5)
        queue.offer(num: 4)
        print("队列 queue = \(queue.toArray())")

        /* 访问队首元素 */
        let peek = queue.peek()
        print("队首元素 peek = \(peek)")

        /* 元素出队 */
        let poll = queue.poll()
        print("出队元素 poll = \(poll)，出队后 queue = \(queue.toArray())")

        /* 获取队列的长度 */
        let size = queue.size()
        print("队列长度 size = \(size)")

        /* 判断队列是否为空 */
        let isEmpty = queue.isEmpty()
        print("队列是否为空 = \(isEmpty)")

        /* 测试环形数组 */
        for i in 0 ..< 10 {
            queue.offer(num: i)
            queue.poll()
            print("第 \(i) 轮入队 + 出队后 queue = \(queue.toArray())")
        }
    }
}
