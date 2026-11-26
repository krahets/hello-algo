/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver code */
    static func main() {
        /* Initialize the queue */
        // Swift has no built-in queue class, so use an Array as a queue
        var queue: [Int] = []

        /* Enqueue elements */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("queue = \(queue)")

        /* Peek at the front element */
        let peek = queue.first!
        print("Front element (peek) = \(peek)")

        /* Dequeue an element */
        // With an Array, removeFirst takes O(n) time
        let pop = queue.removeFirst()
        print("Dequeued element (pop) = \(pop), queue after removal = \(queue)")

        /* Get the queue size */
        let size = queue.count
        print("Queue size = \(size)")

        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty
        print("Queue is empty = \(isEmpty)")
    }
}
