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
        // The Swift standard library has no built-in deque class; Array can be used as a deque
        var deque: [Int] = []

        /* Enqueue elements */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Deque deque = \(deque)")

        /* Access an element */
        let peekFirst = deque.first!
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Rear element peekLast = \(peekLast)")

        /* Dequeue an element */
        // When using Array as a deque, removing the first element takes O(n) time
        let popFirst = deque.removeFirst()
        print("Element dequeued from the front, popFirst = \(popFirst); after dequeueing, deque = \(deque)")
        let popLast = deque.removeLast()
        print("Element dequeued from the rear, popLast = \(popLast); after dequeueing, deque = \(deque)")

        /* Get the deque size */
        let size = deque.count
        print("Deque size = \(size)")

        /* Check whether the deque is empty */
        let isEmpty = deque.isEmpty
        print("Is the deque empty? \(isEmpty)")
    }
}
