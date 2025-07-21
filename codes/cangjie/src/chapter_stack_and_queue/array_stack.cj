/**
 * File: array_stack.cj
 * Created Time: 2025-06-24
 * Author: jan_huber (jan_huber@163.com)
 */

package cangjie.chapter_stack_and_queue

import std.collection.ArrayList

class ArrayStack {
    private let stack: ArrayList<Int64>

    // 初始化列表（动态数组）
    public ArrayStack() {
        this.stack = ArrayList<Int64>()
    }

    /* 获取栈的长度 */
    public prop size: Int64 {
        get() {
            this.stack.size
        }
    }

    /* 判断栈是否为空 */
    public func isEmpty(): Bool {
        this.stack.size == 0
    }

    /* 入栈 */
    public func push(item: Int64): Unit {
        stack.add(item)
    }

    /* 出栈 */
    public func pop(): Int64 {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return stack.remove(at: size - 1)
    }

    /* 访问栈顶元素 */
    public func peek(): ?Int64 {
        stack.get(size - 1)
    }

    /* 将 List 转化为 Array 并返回 */
    public func toArray(): Array<Int64> {
        return stack.toArray()
    }
}
