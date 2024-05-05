/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* Initialize stack */
        // Swift does not have a built-in stack class, Array can be used as a stack
        var stack: [Int] = []

        /* Element push */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Stack stack = \(stack)")

        /* Access stack top element */
        let peek = stack.last!
        print("Top element peek = \(peek)")

        /* Element pop */
        let pop = stack.removeLast()
        print("Popped element pop = \(pop), stack after pop = \(stack)")

        /* Get the length of the stack */
        let size = stack.count
        print("Stack length size = \(size)")

        /* Determine if it's empty */
        let isEmpty = stack.isEmpty
        print("Is the stack empty = \(isEmpty)")
    }
}
