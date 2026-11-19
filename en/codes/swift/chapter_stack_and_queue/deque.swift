/**
 * File: deque.swift
 * Created Time: 2023-01-14
 * Author: nuomi1 (nuomi1@qq.com)
 */

@main
enum Deque {
    /* Driver code */
    static func main() {
        // [region]{init_deque}
        /* Initialize the deque */
        // The Swift standard library has no built-in deque class; Array can be used as a deque
        var deque: [Int] = []
        // [endregion]{init_deque}

        // [region]{push}
        /* Enqueue elements */
        deque.append(2) // Add to the rear
        deque.append(5)
        deque.append(4)
        deque.insert(3, at: 0) // Add to the front
        deque.insert(1, at: 0)
        // [endregion]{push}
        print("Deque deque = \(deque)")

        // [region]{peek_first}
        /* Access an element */
        let peekFirst = deque.first! // Front element
        // [endregion]{peek_first}
        print("Front element peekFirst = \(peekFirst)")
        // [region]{peek_last}
        let peekLast = deque.last! // Rear element
        // [endregion]{peek_last}
        print("Rear element peekLast = \(peekLast)")

        // [region]{pop_first}
        /* Dequeue an element */
        // When using Array to simulate a deque, popFirst has O(n) complexity
        let popFirst = deque.removeFirst() // Dequeue the front element
        // [endregion]{pop_first}
        print("Element dequeued from the front, popFirst = \(popFirst); after dequeueing, deque = \(deque)")
        // [region]{pop_last}
        let popLast = deque.removeLast() // Dequeue the rear element
        // [endregion]{pop_last}
        print("Element dequeued from the rear, popLast = \(popLast); after dequeueing, deque = \(deque)")

        // [region]{size}
        /* Get the deque size */
        let size = deque.count
        // [endregion]{size}
        print("Deque size = \(size)")

        // [region]{is_empty}
        /* Check whether the deque is empty */
        let isEmpty = deque.isEmpty
        // [endregion]{is_empty}
        print("Is the deque empty? \(isEmpty)")
    }
}
