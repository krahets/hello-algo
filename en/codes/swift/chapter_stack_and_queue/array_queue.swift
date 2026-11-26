/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Queue backed by a circular array */
class ArrayQueue {
    private var nums: [Int] // Array that stores the queue elements
    private var front: Int // Index of the front element
    private var _size: Int // Queue size

    init(capacity: Int) {
        // Initialize the array
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Get the queue capacity */
    func capacity() -> Int {
        nums.count
    }

    /* Get the queue size */
    func size() -> Int {
        _size
    }

    /* Check whether the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue an element */
    func push(num: Int) {
        if size() == capacity() {
            print("Queue is full")
            return
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        let rear = (front + size()) % capacity()
        // Add num at the rear
        nums[rear] = num
        _size += 1
    }

    /* Remove and return the front element */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Advance the front index by one, wrapping to the start if it passes the end
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Peek at the front element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return nums[front]
    }

    /* Return the queue elements as an array */
    func toArray() -> [Int] {
        // Copy only the elements currently in the queue
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver code */
    static func main() {
        /* Initialize the queue */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Enqueue elements */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("queue = \(queue.toArray())")

        /* Peek at the front element */
        let peek = queue.peek()
        print("Front element (peek) = \(peek)")

        /* Dequeue an element */
        let pop = queue.pop()
        print("Dequeued element (pop) = \(pop), queue after removal = \(queue.toArray())")

        /* Get the queue size */
        let size = queue.size()
        print("Queue size = \(size)")

        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Queue is empty = \(isEmpty)")

        /* Test the circular array */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("After enqueue/dequeue round \(i), queue = \(queue.toArray())")
        }
    }
}
