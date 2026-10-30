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
        // The Swift standard library has no built-in queue class; Array can be used as a queue
        var queue: [Int] = []

        /* Enqueue elements */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        print("Queue queue = \(queue)")

        /* Access the front element */
        let peek = queue.first!
        print("Front element peek = \(peek)")

        /* Dequeue an element */
        // When using Array as a queue, dequeueing takes O(n) time
        let pop = queue.removeFirst()
        print("Dequeued element pop = \(pop); after dequeueing, queue = \(queue)")

        /* Get the queue size */
        let size = queue.count
        print("Queue size = \(size)")

        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty
        print("Is the queue empty? \(isEmpty)")
    }
}
