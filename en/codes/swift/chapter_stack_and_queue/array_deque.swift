/**
 * File: array_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Deque backed by a circular array */
class ArrayDeque {
    private var nums: [Int] // Array that stores the deque elements
    private var front: Int // Index of the front element
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

    /* Compute the circular array index */
    private func index(i: Int) -> Int {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        (i + capacity()) % capacity()
    }

    /* Add an element at the front */
    func pushFirst(num: Int) {
        if size() == capacity() {
            print("Deque is full")
            return
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        front = index(i: front - 1)
        // Add num at the front
        nums[front] = num
        _size += 1
    }

    /* Add an element at the rear */
    func pushLast(num: Int) {
        if size() == capacity() {
            print("Deque is full")
            return
        }
        // Compute the index one slot past the rear element
        let rear = index(i: front + size())
        // Add num at the rear
        nums[rear] = num
        _size += 1
    }

    /* Remove and return the front element */
    func popFirst() -> Int {
        let num = peekFirst()
        // Advance the front index by one
        front = index(i: front + 1)
        _size -= 1
        return num
    }

    /* Remove and return the rear element */
    func popLast() -> Int {
        let num = peekLast()
        _size -= 1
        return num
    }

    /* Peek at the front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return nums[front]
    }

    /* Peek at the rear element */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        // Compute the index of the rear element
        let last = index(i: front + size() - 1)
        return nums[last]
    }

    /* Return an array for printing */
    func toArray() -> [Int] {
        // Copy only the elements currently in the deque
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
        print("deque = \(deque.toArray())")

        /* Peek at the front and rear elements */
        let peekFirst = deque.peekFirst()
        print("Front element (peekFirst) = \(peekFirst)")
        let peekLast = deque.peekLast()
        print("Rear element (peekLast) = \(peekLast)")

        /* Add elements to the deque */
        deque.pushLast(num: 4)
        print("After adding 4 at the rear, deque = \(deque.toArray())")
        deque.pushFirst(num: 1)
        print("After adding 1 at the front, deque = \(deque.toArray())")

        /* Remove elements from both ends */
        let popLast = deque.popLast()
        print("Removed from the rear = \(popLast), deque after removal = \(deque.toArray())")
        let popFirst = deque.popFirst()
        print("Removed from the front = \(popFirst), deque after removal = \(deque.toArray())")

        /* Get the deque size */
        let size = deque.size()
        print("Deque size = \(size)")

        /* Check whether the deque is empty */
        let isEmpty = deque.isEmpty()
        print("Deque is empty = \(isEmpty)")
    }
}
