/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Stack based on linked list implementation */
class LinkedListStack {
    private var _peek: ListNode? // Use head node as stack top
    private var _size: Int // Stack length

    init() {
        _size = 0
    }

    /* Get the length of the stack */
    func size() -> Int {
        _size
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return _peek!.val
    }

    /* Convert List to Array and return */
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
        /* Access top of the stack element */
        let stack = LinkedListStack()

        /* Elements push onto stack */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Stack stack = \(stack.toArray())")

        /* Return list for printing */
        let peek = stack.peek()
        print("Top element peek = \(peek)")

        /* Element pop from stack */
        let pop = stack.pop()
        print("Pop element pop = \(pop), after pop stack = \(stack.toArray())")

        /* Get the length of the stack */
        let size = stack.size()
        print("Stack length size = \(size)")

        /* Check if empty */
        let isEmpty = stack.isEmpty()
        print("Is stack empty = \(isEmpty)")
    }
}
