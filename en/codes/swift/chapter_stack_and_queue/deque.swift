/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver Code */
    static func main() {
        /* Initialize double-ended queue */
        // Swift does not have a built-in double-ended queue class, Array can be used as a double-ended queue
        var deque: [Int] = []

        /* Element enqueue */
        deque.append(2)
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0)
        deque.insert(1, at: 0)
        print("Double-ended queue deque = \(deque)")

        /* Access element */
        let peekFirst = deque.first!
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.last!
        print("Back element peekLast = \(peekLast)")

        /* Element dequeue */
        // When simulating with Array, complexity of popFirst is O(n)
        let popFirst = deque.removeFirst()
        print("Front dequeued element popFirst = \(popFirst), deque after front dequeue = \(deque)")
        let popLast = deque.removeLast()
        print("Back dequeued element popLast = \(popLast), deque after back dequeue = \(deque)")

        /* Get the length of the double-ended queue */
        let size = deque.count
        print("Double-ended queue length size = \(size)")

        /* Determine if the double-ended queue is empty */
        let isEmpty = deque.isEmpty
        print("Is the double-ended queue empty = \(isEmpty)")
    }
}
