/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Stack implemented with an array */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Initialize the list (dynamic array)
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

    /* Push */
    func push(num: Int) {
        stack.append(num)
    }

    /* Pop */
    @discardableResult
    func pop() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.removeLast()
    }

    /* Access the top element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.last!
    }

    /* Return the stack elements as an array */
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
