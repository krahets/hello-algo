/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Queue class based on linked list */
class LinkedListQueue {
    private var front: ListNode? // Head node
    private var rear: ListNode? // Tail node
    private var _size: Int

    init() {
        _size = 0
    }

    /* Get the length of the queue */
    func size() -> Int {
        _size
    }

    /* Determine if the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue */
    func push(num: Int) {
        // Add num behind the tail node
        let node = ListNode(x: num)
        // If the queue is empty, make the head and tail nodes both point to that node
        if front == nil {
            front = node
            rear = node
        }
        // If the queue is not empty, add that node behind the tail node
        else {
            rear?.next = node
            rear = node
        }
        _size += 1
    }

    /* Dequeue */
    @discardableResult
    func pop() -> Int {
        let num = peek()
        // Remove head node
        front = front?.next
        _size -= 1
        return num
    }

    /* Access front element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return front!.val
    }

    /* Convert the linked list to Array and return */
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
    /* Driver Code */
    static func main() {
        /* Initialize queue */
        let queue = LinkedListQueue()

        /* Element enqueue */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Queue queue = \(queue.toArray())")

        /* Access front element */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Element dequeue */
        let pop = queue.pop()
        print("Dequeued element pop = \(pop), queue after dequeue = \(queue.toArray())")

        /* Get the length of the queue */
        let size = queue.size()
        print("Queue length size = \(size)")

        /* Determine if the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Is the queue empty = \(isEmpty)")
    }
}
