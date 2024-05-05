/**
 * File: linkedlist_deque.swift
 * Created Time: 2023-02-22
 * Author: nuomi1 (nuomi1@qq.com)
 */

/* Double-linked list node */
class ListNode {
    var val: Int // Node value
    var next: ListNode? // Reference to successor node
    weak var prev: ListNode? // Reference to predecessor node

    init(val: Int) {
        self.val = val
    }
}

/* Double-ended queue class based on double-linked list */
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

    /* Determine if the double-ended queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue operation */
    private func push(num: Int, isFront: Bool) {
        let node = ListNode(val: num)
        // If the list is empty, make front and rear both point to node
        if isEmpty() {
            front = node
            rear = node
        }
        // Front enqueue operation
        else if isFront {
            // Add node to the head of the list
            front?.prev = node
            node.next = front
            front = node // Update head node
        }
        // Rear enqueue operation
        else {
            // Add node to the tail of the list
            rear?.next = node
            node.prev = rear
            rear = node // Update tail node
        }
        _size += 1 // Update queue length
    }

    /* Front enqueue */
    func pushFirst(num: Int) {
        push(num: num, isFront: true)
    }

    /* Rear enqueue */
    func pushLast(num: Int) {
        push(num: num, isFront: false)
    }

    /* Dequeue operation */
    private func pop(isFront: Bool) -> Int {
        if isEmpty() {
            fatalError("Double-ended queue is empty")
        }
        let val: Int
        // Front dequeue operation
        if isFront {
            val = front!.val // Temporarily store the head node value
            // Remove head node
            let fNext = front?.next
            if fNext != nil {
                fNext?.prev = nil
                front?.next = nil
            }
            front = fNext // Update head node
        }
        // Rear dequeue operation
        else {
            val = rear!.val // Temporarily store the tail node value
            // Remove tail node
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

    /* Front dequeue */
    func popFirst() -> Int {
        pop(isFront: true)
    }

    /* Rear dequeue */
    func popLast() -> Int {
        pop(isFront: false)
    }

    /* Access front element */
    func peekFirst() -> Int {
        if isEmpty() {
            fatalError("Double-ended queue is empty")
        }
        return front!.val
    }

    /* Access rear element */
    func peekLast() -> Int {
        if isEmpty() {
            fatalError("Double-ended queue is empty")
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
        /* Initialize double-ended queue */
        let deque = LinkedListDeque()
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
