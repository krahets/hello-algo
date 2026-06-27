/**
 * File: array_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Queue based on circular array implementation */
class ArrayQueue {
    private var nums: [Int] // Array for storing queue elements
    private var front: Int // Front pointer, points to the front of the queue element
    private var _size: Int // Queue length

    init(capacity: Int) {
        // Initialize array
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

    /* Check if the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue */
    func push(num: Int) {
        if size() == capacity() {
            print("Queue is full")
            return
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        let rear = (front + size()) % capacity()
        // Front pointer moves one position backward
        nums[rear] = num
        _size += 1
    }

    /* Dequeue */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Move front pointer backward by one position, if it passes the tail, return to array head
        front = (front + 1) % capacity()
        _size -= 1
        return num
    }

    /* Return list for printing */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return nums[front]
    }

    /* Return array */
    func toArray() -> [Int] {
        // Elements enqueue
        (front ..< front + size()).map { nums[$0 % capacity()] }
    }
}

@main
enum _ArrayQueue {
    /* Driver Code */
    static func main() {
        /* Access front of the queue element */
        let capacity = 10
        let queue = ArrayQueue(capacity: capacity)

        /* Elements enqueue */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Queue queue = \(queue.toArray())")

        /* Return list for printing */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Element dequeue */
        let pop = queue.pop()
        print("Dequeue element pop = \(pop), after dequeue queue = \(queue.toArray())")

        /* Get the length of the queue */
        let size = queue.size()
        print("Queue length size = \(size)")

        /* Check if the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Is queue empty = \(isEmpty)")

        /* Test circular array */
        for i in 0 ..< 10 {
            queue.push(num: i)
            queue.pop()
            print("After round \(i) enqueue + dequeue, queue = \(queue.toArray())")
        }
    }
}
