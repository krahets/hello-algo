/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    var val: Int // Node value
    var next: ListNode? // Successor node reference
    weak var prev: ListNode? // Predecessor node reference

    init(val: Int) {
        self.val = val
    }
}

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
    private var front: ListNode? // Head node front
    private var rear: ListNode? // Tail node rear
    private var _size: Int // Length of the double-ended queue

    init() {
        _size = 0
    }

    /* Get the length of the double-ended queue */
    func size() -> Int {
        _size
    }

    /* Check if the double-ended queue is empty */
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
        // Front of the queue enqueue operation
        else if isFront {
            // Add node to the head of the linked list
            front?.prev = node
            node.next = front
            front = node // Update head node
        }
        // Rear of the queue enqueue operation
        else {
            // Add node to the tail of the linked list
            rear?.next = node
            node.prev = rear
            rear = node // Update tail node
        }
        _size += 1 // Update queue length
    }

    /* Front of the queue enqueue */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Rear of the queue enqueue */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Dequeue operation */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        let val: Int
        // Temporarily store head node value
        if isFront {
            val = front!.val // Delete head node
            // Delete head node
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // Update head node
        }
        // Temporarily store tail node value
        else {
            val = rear!.val // Delete tail node
            // Update tail node
            let rPrev = rear?.prev
            if rPrev != nil {
                rPrev?.next = nil
                rear?.prev = nil
            }
            rear = rPrev // Update tail node
        }
        _size -= 1 // Update queue length
        return val
    }

    /* Rear of the queue dequeue */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Access rear of the queue element */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Return list for printing */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return front!.val
    }

    /* Driver Code */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Deque is empty")
        }
        return rear!.val
    }

    /* Return array for printing */
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
    /* Driver Code */
    static func main() {
        /* Get the length of the double-ended queue */
        let deque = LinkedListDeque()
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
