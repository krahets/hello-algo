/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Queue backed by a linked list */
class LinkedListQueue {
    private var front: ListNode? // Head node
    private var rear: ListNode? // Tail node
    private var _size: Int

    init() {
        _size = 0
    }

    /* Get the queue size */
    func size() -> Int {
        _size
    }

    /* Check whether the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue an element */
    func push(num: Int) {
        // Add a node containing num after the tail
        let node = ListNode(x: num)
        // If the queue is empty, point both the head and tail at the new node
        if front == nil {
            front = node
            rear = node
        }
        // If the queue has elements, link the new node after the tail
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* Remove and return the front element */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Remove the head node
        front = front?.next
        _size -= 1
        return num
    }

    /* Peek at the front element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return front!.val
    }

    /* Return the linked list elements as an array */
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
enum _LinkedListQueue {
    /* Driver code */
    static func main() {
        /* Initialize the queue */
        let queue = LinkedListQueue()

        /* Enqueue elements */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("queue = \(queue.toArray())")

        /* Peek at the front element */
        let peek = queue.peek()
        print("Front element (peek) = \(peek)")

        /* Dequeue an element */
        let pop = queue.pop()
        print("Dequeued element (pop) = \(pop), queue after removal = \(queue.toArray())")

        /* Get the queue size */
        let size = queue.size()
        print("Queue size = \(size)")

        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Queue is empty = \(isEmpty)")
    }
}
