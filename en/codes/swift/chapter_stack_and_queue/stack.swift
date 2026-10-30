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
        // The Swift standard library has no built-in stack class; Array can be used as a stack
        var stack: [Int] = []

        /* Push elements onto the stack */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Stack stack = \(stack)")

        /* Access the top element */
        let peek = stack.last!
        print("Top element peek = \(peek)")

        /* Pop an element from the stack */
        let pop = stack.removeLast()
        print("Popped element pop = \(pop); after popping, stack = \(stack)")

        /* Get the stack size */
        let size = stack.count
        print("Stack size = \(size)")

        /* Check whether it is empty */
        let isEmpty = stack.isEmpty
        print("Is the stack empty? \(isEmpty)")
    }
}
