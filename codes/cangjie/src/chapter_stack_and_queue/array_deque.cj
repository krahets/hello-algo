/**
 * File: array_deque.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_stack_and_queue

/* 基于环形数组实现的双向队列 */
class ArrayDeque {
    private var nums: Array<Int64> // 用于存储双向队列元素的数组
    private var front: Int64 // 队首指针，指向队首元素
    private var queSize: Int64 // 双向队列长度

    /* 构造方法 */
    public init(capacity: Int64) {
        this.nums = Array<Int64>(capacity, repeat: 0)
        this.front = 0
        this.queSize = 0
    }

    /* 获取双向队列的容量 */
    public prop capacity: Int64 {
        get() {
            this.nums.size
        }
    }

    /* 获取双向队列的长度 */
    public prop size: Int64 {
        get() {
            this.queSize
        }
    }

    /* 判断双向队列是否为空 */
    public func isEmpty(): Bool {
        return this.queSize == 0
    }

    /* 计算环形数组索引 */
    private func index(i: Int64): Int64 {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return (i + capacity) % capacity
    }

    /* 队首入队 */
    public func pushFirst(num: Int64): Unit {
        if (queSize == capacity) {
            println("双向队列已满")
            return
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        front = index(front - 1)
        // 将 num 添加至队首
        nums[front] = num
        queSize++
    }

    /* 队尾入队 */
    public func pushLast(num: Int64): Unit {
        if (queSize == capacity) {
            println("双向队列已满")
            return
        }
        // 计算队尾指针，指向队尾索引 + 1
        let rear = index(front + queSize)
        // 将 num 添加至队尾
        nums[rear] = num
        queSize++
    }

    /* 队首出队 */
    public func popFirst(): Int64 {
        let num = peekFirst()
        // 队首指针向后移动一位
        front = index(front + 1)
        queSize--
        return num
    }

    /* 队尾出队 */
    public func popLast(): Int64 {
        let num = peekLast()
        queSize--
        return num
    }

    /* 访问队首元素 */
    public func peekFirst(): Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return nums[front]
    }

    /* 访问队尾元素 */
    public func peekLast(): Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        // 计算尾元素索引
        let last = index(front + queSize - 1)
        return nums[last]
    }

    /* 返回数组用于打印 */
    public func toArray(): Array<Int64> {
        // 仅转换有效长度范围内的列表元素
        let res = Array<Int64>(queSize, repeat: 0)
        var j = front
        for (i in 0..queSize) {
            res[i] = nums[index(j)]
            j++
        }
        return res
    }
}
