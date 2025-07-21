/**
 * File: array_queue.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_stack_and_queue

/* 基于环形数组实现的队列 */
class ArrayQueue {
    private var nums: Array<Int64> // 用于存储队列元素的数组
    private var front: Int64 // 队首指针，指向队首元素
    private var queSize: Int64 // 队列长度

    public init(capacity: Int64) {
        nums = Array<Int64>(capacity, {i => 0})
        front = 0
        queSize = 0
    }

    /* 获取队列的容量 */
    public prop capacity: Int64 {
        get() {
            nums.size
        }
    }

    /* 获取队列的长度 */
    public prop size: Int64 {
        get() {
            queSize
        }
    }

    /* 判断队列是否为空 */
    public prop isEmpty: Bool {
        get() {
            queSize == 0
        }
    }

    /* 入队 */
    public func push(num: Int64): Unit {
        if (queSize == capacity) {
            println("队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        let rear = (front + queSize) % capacity
        // 将 num 添加至队尾
        nums[rear] = num
        queSize++
    }

    /* 出队 */
    public func pop(): Int64 {
        let num = peek()
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        front = (front + 1) % capacity
        queSize--
        return num
    }

    /* 访问队首元素 */
    public func peek(): Int64 {
        if (isEmpty) {
            throw IndexOutOfBoundsException()
        }
        return nums[front]
    }

    /* 返回数组 */
    public func toArray(): Array<Int64> {
        // 仅转换有效长度范围内的列表元素
        let res = Array<Int64>(queSize, {i => 0})
        var j = front
        for (i in 0..queSize) {
            res[i] = nums[j % capacity]
            j++
        }
        return res
    }
}
