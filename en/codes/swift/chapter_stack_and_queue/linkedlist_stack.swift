/**
 * File: linkedlist_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Stack implemented with a linked list */
class LinkedListStack {
    private var _peek: ListNode? // Use the head node as the stack top
    private var _size: Int // Stack size

    init() {
        _size = 0
    }

    /* Get the stack size */
    func size() -> Int {
        _size
    }

    /* Check whether the stack is empty */
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

    /* Access the top element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return _peek!.val
    }

    /* Convert the linked list to an array and return it */
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
    /* Driver code */
    static func main() {
        /* Initialize the stack */
        let stack = LinkedListStack()

        /* Push elements onto the stack */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("Stack stack = \(stack.toArray())")

        /* Access the top element */
        let peek = stack.peek()
        print("Top element peek = \(peek)")

        /* Pop an element from the stack */
        let pop = stack.pop()
        print("Popped element pop = \(pop); after popping, stack = \(stack.toArray())")

        /* Get the stack size */
        let size = stack.size()
        print("Stack size = \(size)")

        /* Check whether it is empty */
        let isEmpty = stack.isEmpty()
        print("Is the stack empty? \(isEmpty)")
    }
}
