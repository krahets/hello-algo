/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver Code */
    static func main() {
        /* Access top of the stack element */
        // Swift has no built-in stack class, can use Array as stack
        var stack: [Int] = []

        /* Elements push onto stack */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        print("Stack stack = \(stack)")

        /* Return list for printing */
        let peek = stack.last!
        print("Top element peek = \(peek)")

        /* Element pop from stack */
        let pop = stack.removeLast()
        print("Pop element pop = \(pop), after pop stack = \(stack)")

        /* Get the length of the stack */
        let size = stack.count
        print("Stack length size = \(size)")

        /* Check if empty */
        let isEmpty = stack.isEmpty
        print("Is stack empty = \(isEmpty)")
    }
}
