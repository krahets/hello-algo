/**
 * File: queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Queue {
    /* Driver code */
    static func main() {
        // [region]{init_queue}
        /* Initialize the queue */
        // The Swift standard library has no built-in queue class; Array can be used as a queue
        var queue: [Int] = []
        // [endregion]{init_queue}

        // [region]{push}
        /* Enqueue elements */
        queue.append(1)
        queue.append(3)
        queue.append(2)
        queue.append(5)
        queue.append(4)
        // [endregion]{push}
        print("Queue queue = \(queue)")

        // [region]{peek}
        /* Access the front element */
        let peek = queue.first!
        // [endregion]{peek}
        print("Front element peek = \(peek)")

        // [region]{pop}
        /* Dequeue an element */
        // When using Array as a queue, dequeueing takes O(n) time
        let pop = queue.removeFirst()
        // [endregion]{pop}
        print("Dequeued element pop = \(pop); after dequeueing, queue = \(queue)")

        // [region]{size}
        /* Get the queue size */
        let size = queue.count
        // [endregion]{size}
        print("Queue size = \(size)")

        // [region]{is_empty}
        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty
        // [endregion]{is_empty}
        print("Is the queue empty? \(isEmpty)")
    }
}
