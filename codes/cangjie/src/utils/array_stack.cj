/**
 * File: array_stack.cj
 * Created Time: 2025-06-23
 * Author: jan_huber (jan_huber@163.com)
 */
package cangjie.utils

import std.collection.ArrayList

public class ArrayStack<T> {

    // 初始化列表（动态数组）
    public ArrayStack(private let stack: ArrayList<T>) {}

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
    public func push(item: T): Unit {
        stack.append(item)
    }

    /* 出栈 */
    public func pop(): T {
        if (isEmpty()) {
            throw IndexOutOfBoundsException()
        }
        return stack.remove(size - 1)
    }

    /* 访问栈顶元素 */
    public func peek(): ?T {
        stack.get(size - 1)
    }
}
