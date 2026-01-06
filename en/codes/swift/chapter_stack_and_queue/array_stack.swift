/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Stack based on array implementation */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Initialize list (dynamic array)
        stack = []
    }

    /* Get the length of the stack */
    func size() -> Int {
        stack.count
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.last!
    }

    /* Convert List to Array and return */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* Access top of the stack element */
        let stack = ArrayStack()

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
