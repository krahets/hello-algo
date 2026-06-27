/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver Code */
    static func main() {
        /* Access front of the queue element */
        // Swift has no built-in queue class, can use Array as queue
        var queue: [Int] = []

        /* Elements enqueue */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Queue queue = \(queue)")

        /* Return list for printing */
        let peek = queue.first!
        print("Front element peek = \(peek)")

        /* Element dequeue */
        // When simulating with Array, pop complexity is O(n)
        let pool = queue.removeFirst()
        print("Dequeue element pop = \(pool), after dequeue queue = \(queue)")

        /* Get the length of the queue */
        let size = queue.count
        print("Queue length size = \(size)")

        /* Check if the queue is empty */
        let isEmpty = queue.isEmpty
        print("Is queue empty = \(isEmpty)")
    }
}
