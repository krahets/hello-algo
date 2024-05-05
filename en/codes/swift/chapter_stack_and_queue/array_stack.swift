/**
 * File: array_stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Stack class based on array */
class ArrayStack {
    private var stack: [Int]

    init() {
        // Initialize the list (dynamic array)
        stack = []
    }

    /* Get the length of the stack */
    func size() -> Int {
        stack.count
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Stack is empty")
        }
        return stack.last!
    }

    /* Convert the List to Array and return */
    func toArray() -> [Int] {
        stack
    }
}

@main
enum _ArrayStack {
    /* Driver Code */
    static func main() {
        /* Initialize stack */
        let stack = ArrayStack()

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
