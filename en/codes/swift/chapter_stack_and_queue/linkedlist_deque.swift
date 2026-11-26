/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    var val: Int // Node value
    var next: ListNode? // Reference to the next node
    weak var prev: ListNode? // Reference to the previous node

    init(val: Int) {
        self.val = val
    }
}

/* Deque backed by a doubly linked list */
class LinkedListDeque {
    private var front: ListNode? // Head node (front)
    private var rear: ListNode? // Tail node (rear)
    private var _size: Int // Deque size

    init() {
        _size = 0
    }

    /* Get the deque size */
    func size() -> Int {
        _size
    }

    /* Check whether the deque is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Add an element at either end */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // If the list is empty, point both front and rear at node
        if isEmpty() {
            front = node
            rear = node
        }
        // Add at the front
        else if isFront {
            // Link node at the head of the list
            front?.prev = node
            node.next = front
            front = node // Update the head
        }
        // Add at the rear
        else {
            // Link node at the tail of the list
            rear?.next = node
            node.prev = rear
            rear = node // Update the tail
        }
        _size += 1 // Update the deque size
    }

    /* Add an element at the front */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Add an element at the rear */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Remove an element from either end */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        let val: Int
        // When the deque contains one element, the head and tail point to the same node
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // Remove from the front
        else if isFront {
            val = front!.val // Save the head node's value
            // Remove the head node
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // Update the head
        }
        // Remove from the rear
        else {
            val = rear!.val // Save the tail node's value
            // Remove the tail node
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // Update the tail
        }
        _size -= 1 // Update the deque size
        return val
    }

    /* Remove and return the front element */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Remove and return the rear element */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Peek at the front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return front!.val
    }

    /* Peek at the rear element */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return rear!.val
    }

    /* Return an array for printing */
    func toArray() -> [Int] {
        var node = front
        var res = Array(repeating: 0, count: size())
        for i in res.indices {
            res[i] = node!.val
            node = node?.next
        }
        return res
    }
}

@main
enum _LinkedListDeque {
    /* Driver code */
    static func main() {
        /* Initialize the deque */
        let deque = LinkedListDeque()
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
