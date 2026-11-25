/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver code */
    static func main() {
        /* Initialize the stack */
        // Swift has no built-in stack class, so use an Array as a stack
        var stack: [Int] = []

        /* Push elements onto the stack */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("stack = \(stack)")

        /* Peek at the top element */
        let peek = stack.last!
        print("Top element (peek) = \(peek)")

        /* Pop the top element */
        let pop = stack.removeLast()
        print("Popped element (pop) = \(pop), stack after the pop = \(stack)")

        /* Get the stack size */
        let size = stack.count
        print("Stack size = \(size)")

        /* Check whether the stack is empty */
        let isEmpty = stack.isEmpty
        print("Stack is empty = \(isEmpty)")
    }
}
