/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* Get the length of the double-ended queue */
        // Swift has no built-in deque class, can use Array as deque
        var deque: [Int] = []

        /* Elements enqueue */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Deque deque = \(deque)")

        /* Update element */
        let peekFirst = deque.first!
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Rear element peekLast = \(peekLast)")

        /* Element dequeue */
        // When simulating with Array, popFirst complexity is O(n)
        let popFirst = deque.removeFirst()
        print("Dequeue front element popFirst = \(popFirst), after front dequeue deque = \(deque)")
        let popLast = deque.removeLast()
        print("Dequeue rear element popLast = \(popLast), after rear dequeue deque = \(deque)")

        /* Get the length of the double-ended queue */
        let size = deque.count
        print("Deque length size = \(size)")

        /* Check if the double-ended queue is empty */
        let isEmpty = deque.isEmpty
        print("Is deque empty = \(isEmpty)")
    }
}
