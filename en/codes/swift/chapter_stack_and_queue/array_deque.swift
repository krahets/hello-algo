/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
    private var nums: [Int] // Array for storing double-ended queue elements
    private var front: Int // Front pointer, points to the front of the queue element
    private var _size: Int // Double-ended queue length

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

    /* Check if the double-ended queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Calculate circular array index */
    private func index(i: Int) -> Int {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        (i + capacity()) % capacity()
    }

    /* Front of the queue enqueue */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        front = index(i: front - 1)
        // Add num to front of queue
        nums[front] = num
        _size += 1
    }

    /* Rear of the queue enqueue */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Double-ended queue is full")
            return
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        let rear = index(i: front + size())
        // Front pointer moves one position backward
        nums[rear] = num
        _size += 1
    }

    /* Rear of the queue dequeue */
    func popFirst() -> Int {
        let num = peekFirst()
        // Move front pointer backward by one position
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Access rear of the queue element */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Return list for printing */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return nums[front]
    }

    /* Driver Code */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        // Initialize double-ended queue
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Return array for printing */
    func toArray() -> [Int] {
        // Elements enqueue
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver Code */
    static func main() {
        /* Get the length of the double-ended queue */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Deque deque = \(deque.toArray())")

        /* Update element */
        let peekFirst = deque.peekFirst()
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Rear element peekLast = \(peekLast)")

        /* Elements enqueue */
        deque.pushLast(num: 4)
        print("After element 4 enqueues at rear, deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("After element 1 enqueues at front, deque = \(deque.toArray())")

        /* Element dequeue */
        let popLast = deque.popLast()
        print("Dequeue rear element = \(popLast), after rear dequeue deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Dequeue front element = \(popFirst), after front dequeue deque = \(deque.toArray())")

        /* Get the length of the double-ended queue */
        let size = deque.size()
        print("Deque length size = \(size)")

        /* Check if the double-ended queue is empty */
        let isEmpty = deque.isEmpty()
        print("Is deque empty = \(isEmpty)")
    }
}
