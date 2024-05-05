/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Stack class based on linked list */
class LinkedListStack {
    private var _peek: ListNode? // Use the head node as the top of the stack
    private var _size: Int // Length of the stack

    init() {
        _size = 0
    }

    /* Get the length of the stack */
    func size() -> Int {
        _size
    }

    /* Determine if the stack is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Push */
    func push(num: Int) {
        let node = ListNode(x: num)
        node.next = _peek
        _peek = node
        _size += 1
    }

    /* Pop */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        _peek = _peek?.next
        _size -= 1
        return num
    }

    /* Access stack top element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return _peek!.val
    }

    /* Convert the List to Array and return */
    func toArray() -> [Int] {
        var node = _peek
        var res = Array(repeating: 0, count: size())
        for i in res.indices.reversed() {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListStack {
    /* Driver Code */
    static func main() {
        /* Initialize stack */
        let stack = LinkedListStack()

        /* Element push */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Stack stack = \(stack.toArray())")

        /* Access stack top element */
        let peek = stack.peek()
        print("Top element peek = \(peek)")

        /* Element pop */
        let pop = stack.pop()
        print("Popped element pop = \(pop), stack after pop = \(stack.toArray())")

        /* Get the length of the stack */
        let size = stack.size()
        print("Stack length size = \(size)")

        /* Determine if it's empty */
        let isEmpty = stack.isEmpty()
        print("Is the stack empty = \(isEmpty)")
    }
}
