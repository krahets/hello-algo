/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Queue class based on circular array */
class ArrayQueue {
    private var nums: [Int] // Array for storing queue elements
    private var front: Int // Front pointer, pointing to the front element
    private var _size: Int // Queue length

    init(capacity: Int) {
        // Initialize an array
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Get the capacity of the queue */
    func capacity() -> Int {
        nums.count
    }

    /* Get the length of the queue */
    func size() -> Int {
        _size
    }

    /* Determine if the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue */
    func push(num: Int) {
        if size() == capacity() {
            print("Queue is full")
            return
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        let rear = (front + size()) % capacity()
        // Add num to the rear
        nums[rear] = num
        _size += 1
    }

    /* Dequeue */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Access front element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return nums[front]
    }

    /* Return array */
    func toArray() -> [Int] {
        // Only convert elements within valid length range
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* Initialize queue */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Element enqueue */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Queue queue = \(queue.toArray())")

        /* Access front element */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Element dequeue */
        let pop = queue.pop()
        print("Dequeued element pop = \(pop), queue after dequeue = \(queue.toArray())")

        /* Get the length of the queue */
        let size = queue.size()
        print("Queue length size = \(size)")

        /* Determine if the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Is the queue empty = \(isEmpty)")

        /* Test circular array */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("After the \(i)th round of enqueue + dequeue, queue = \(queue.toArray())")
        }
    }
}
