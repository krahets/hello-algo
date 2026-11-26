/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver code */
    static func main() {
        /* Initialize the deque */
        // Swift has no built-in deque class, so use an Array as a deque
        var deque: [Int] = []

        /* Add elements to the deque */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("deque = \(deque)")

        /* Peek at the front and rear elements */
        let peekFirst = deque.first!
        print("Front element (peekFirst) = \(peekFirst)")
        let peekLast = deque.last!
        print("Rear element (peekLast) = \(peekLast)")

        /* Remove elements from both ends */
        // With an Array, removeFirst takes O(n) time
        let popFirst = deque.removeFirst()
        print("Removed from the front (popFirst) = \(popFirst), deque after removal = \(deque)")
        let popLast = deque.removeLast()
        print("Removed from the rear (popLast) = \(popLast), deque after removal = \(deque)")

        /* Get the deque size */
        let size = deque.count
        print("Deque size = \(size)")

        /* Check whether the deque is empty */
        let isEmpty = deque.isEmpty
        print("Deque is empty = \(isEmpty)")
    }
}
