/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Double-ended queue class based on circular array */
class ArrayDeque {
    private var nums: [Int] // Array used to store elements of the double-ended queue
    private var front: Int // Front pointer, pointing to the front element
    private var _size: Int // Length of the double-ended queue

    /* Constructor */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Get the capacity of the double-ended queue */
    func capacity() -> Int {
        nums.count
    }

    /* Get the length of the double-ended queue */
    func size() -> Int {
        _size
    }

    /* Determine if the double-ended queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Calculate circular array index */
    private func index(i: Int) -> Int {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        (i + capacity()) % capacity()
    }

    /* Front enqueue */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        front = index(i: front - 1)
        // Add num to the front
        nums[front] = num
        _size += 1
    }

    /* Rear enqueue */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Calculate rear pointer, pointing to rear index + 1
        let rear = index(i: front + size())
        // Add num to the rear
        nums[rear] = num
        _size += 1
    }

    /* Front dequeue */
    func popFirst() -> Int {
        let num = peekFirst()
        // Move front pointer one position backward
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Rear dequeue */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Access front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Double-ended queue is empty")
        }
        return nums[front]
    }

    /* Access rear element */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Double-ended queue is empty")
        }
        // Calculate rear element index
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Return array for printing */
    func toArray() -> [Int] {
        // Only convert elements within valid length range
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* Initialize double-ended queue */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Double-ended queue deque = \(deque.toArray())")

        /* Access element */
        let peekFirst = deque.peekFirst()
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Back element peekLast = \(peekLast)")

        /* Element enqueue */
        deque.pushLast(num: 4)
        print("Element 4 enqueued at back, deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("Element 1 enqueued at front, deque = \(deque.toArray())")

        /* Element dequeue */
        let popLast = deque.popLast()
        print("Back dequeued element = \(popLast), deque after back dequeue = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Front dequeued element = \(popFirst), deque after front dequeue = \(deque.toArray())")

        /* Get the length of the double-ended queue */
        let size = deque.size()
        print("Double-ended queue length size = \(size)")

        /* Determine if the double-ended queue is empty */
        let isEmpty = deque.isEmpty()
        print("Is the double-ended queue empty = \(isEmpty)")
    }
}
