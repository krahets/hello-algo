/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* Initialize queue */
        // Swift does not have a built-in queue class, Array can be used as a queue
        var queue: [Int] = []

        /* Element enqueue */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Queue queue = \(queue)")

        /* Access front element */
        let peek = queue.first!
        print("Front element peek = \(peek)")

        /* Element dequeue */
        // When simulating with Array, complexity of pop is O(n)
        let pool = queue.removeFirst()
        print("Dequeued element pop = \(pool), queue after dequeue = \(queue)")

        /* Get the length of the queue */
        let size = queue.count
        print("Queue length size = \(size)")

        /* Determine if the queue is empty */
        let isEmpty = queue.isEmpty
        print("Is the queue empty = \(isEmpty)")
    }
}
