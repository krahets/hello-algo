/**
 * File: stack.swift
 * Created Time: 2023-01-09
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Stack {
    /* Driver code */
    static func main() {
        // [region]{init_stack}
        /* Initialize the stack */
        // The Swift standard library has no built-in stack class; Array can be used as a stack
        var stack: [Int] = []
        // [endregion]{init_stack}

        // [region]{push}
        /* Push elements onto the stack */
        stack.append(1)
        stack.append(3)
        stack.append(2)
        stack.append(5)
        stack.append(4)
        // [endregion]{push}
        print("Stack stack = \(stack)")

        // [region]{peek}
        /* Access the top element */
        let peek = stack.last!
        // [endregion]{peek}
        print("Top element peek = \(peek)")

        // [region]{pop}
        /* Pop an element from the stack */
        let pop = stack.removeLast()
        // [endregion]{pop}
        print("Popped element pop = \(pop); after popping, stack = \(stack)")

        // [region]{size}
        /* Get the stack size */
        let size = stack.count
        // [endregion]{size}
        print("Stack size = \(size)")

        // [region]{is_empty}
        /* Check whether it is empty */
        let isEmpty = stack.isEmpty
        // [endregion]{is_empty}
        print("Is the stack empty? \(isEmpty)")
    }
}
