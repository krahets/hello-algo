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

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
    private var front: ListNode? // Head node front
    private var rear: ListNode? // Tail node rear
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

    /* Enqueue operation */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // If the linked list is empty, make both front and rear point to node
        if isEmpty() {
            front = node
            rear = node
        }
        // Enqueue at the front
        else if isFront {
            // Add node to the head of the linked list
            front?.prev = node
            node.next = front
            front = node // Update the head node
        }
        // Enqueue at the rear
        else {
            // Add node to the tail of the linked list
            rear?.next = node
            node.prev = rear
            rear = node // Update the tail node
        }
        _size += 1 // Update the deque size
    }

    /* Enqueue at the front */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Enqueue at the rear */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Dequeue operation */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        let val: Int
        // When the deque size is 1, the head and tail point to the same node
        if _size == 1 {
            val = front!.val
            front = nil
            rear = nil
        }
        // Dequeue from the front
        else if isFront {
            val = front!.val // Save the head node value
            // Remove the head node
            let fNext = front?.next
            fNext?.prev = nil
            front?.next = nil
            front = fNext // Update the head node
        }
        // Dequeue from the rear
        else {
            val = rear!.val // Save the tail node value
            // Remove the tail node
            let rPrev = rear?.prev
            rPrev?.next = nil
            rear?.prev = nil
            rear = rPrev // Update the tail node
        }
        _size -= 1 // Update the deque size
        return val
    }

    /* Dequeue from the front */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Dequeue from the rear */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Access the front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return front!.val
    }

    /* Access the rear element */
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
