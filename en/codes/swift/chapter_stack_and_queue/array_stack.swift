/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Array-backed stack */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Initialize the dynamic array
        stack = []
    }

    /* Get the stack size */
    func size() -> Int {
        stack.count
    }

    /* Check whether the stack is empty */
    func isEmpty() -> Bool {
        stack.isEmpty
    }

    /* Push an element onto the stack */
    func push(num: Int) {
        stack.append(num)
    }

    /* Remove and return the top element */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.removeLast()
    }

    /* Peek at the top element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.last!
    }

    /* Return the array that backs the stack */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver code */
    static func main() {
        /* Initialize the stack */
        let stack = ArrayStack()

        /* Push elements onto the stack */
        stack.push(num: 1)
        stack.push(num: 3)
        stack.push(num: 2)
        stack.push(num: 5)
        stack.push(num: 4)
        print("stack = \(stack.toArray())")

        /* Peek at the top element */
        let peek = stack.peek()
        print("Top element (peek) = \(peek)")

        /* Pop the top element */
        let pop = stack.pop()
        print("Popped element (pop) = \(pop), stack after the pop = \(stack.toArray())")

        /* Get the stack size */
        let size = stack.size()
        print("Stack size = \(size)")

        /* Check whether the stack is empty */
        let isEmpty = stack.isEmpty()
        print("Stack is empty = \(isEmpty)")
    }
}
