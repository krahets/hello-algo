/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Deque implemented with a circular array */
class ArrayDeque {
    private var nums: [Int] // Array that stores the deque elements
    private var front: Int // Front index, identifying the first element
    private var _size: Int // Deque size

    /* Constructor */
    init(capacity: Int) {
        nums = Array(repeating: 0, count: capacity)
        front = 0
        _size = 0
    }

    /* Get the deque capacity */
    func capacity() -> Int {
        nums.count
    }

    /* Get the deque size */
    func size() -> Int {
        _size
    }

    /* Check whether the deque is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Calculate an index in the circular array */
    private func index(i: Int) -> Int {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        (i + capacity()) % capacity()
    }

    /* Enqueue at the front */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Deque is full")
            return
        }
        // Move the front index one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        front = index(i: front - 1)
        // Add num to the front
        nums[front] = num
        _size += 1
    }

    /* Enqueue at the rear */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Deque is full")
            return
        }
        // Calculate the rear index, one position past the last element
        let rear = index(i: front + size())
        // Add num to the rear
        nums[rear] = num
        _size += 1
    }

    /* Dequeue from the front */
    func popFirst() -> Int {
        let num = peekFirst()
        // Advance the front index by one position
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Dequeue from the rear */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Access the front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return nums[front]
    }

    /* Access the rear element */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        // Calculate the index of the last element
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Return an array for printing */
    func toArray() -> [Int] {
        // Include only the elements in the occupied range
        (front ..< front + size()).map { nums[index(i: $0)] }
    }
}

@main
enum _ArrayDeque {
    /* Driver code */
    static func main() {
        /* Initialize the deque */
        let deque = ArrayDeque(capacity: 10)
        deque.pushLast(num: 3)
        deque.pushLast(num: 2)
        deque.pushLast(num: 5)
        print("Deque deque = \(deque.toArray())")

        /* Access an element */
        let peekFirst = deque.peekFirst()
        print("Front element peekFirst = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Rear element peekLast = \(peekLast)")

        /* Enqueue elements */
        deque.pushLast(num: 4)
        print("After enqueueing 4 at the rear, deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("After enqueueing 1 at the front, deque = \(deque.toArray())")

        /* Dequeue an element */
        let popLast = deque.popLast()
        print("Element dequeued from the rear = \(popLast); after dequeueing, deque = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Element dequeued from the front = \(popFirst); after dequeueing, deque = \(deque.toArray())")

        /* Get the deque size */
        let size = deque.size()
        print("Deque size = \(size)")

        /* Check whether the deque is empty */
        let isEmpty = deque.isEmpty()
        print("Is the deque empty? \(isEmpty)")
    }
}
