/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Queue implemented with a linked list */
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

    /* Enqueue */
    func push(num: Int) {
        // Add num after the tail node
        let node = ListNode(x: num)
        // If the queue is empty, make both the head and tail point to this node
        if front == nil {
            front = node
            rear = node
        }
        // If the queue is not empty, add this node after the tail node
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
        // Remove the head node
        front = front?.next
        _size -= 1
        return num
    }

    /* Access the front element */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return front!.val
    }

    /* Convert the linked list to an array and return it */
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
        print("Queue queue = \(queue.toArray())")

        /* Access the front element */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Dequeue an element */
        let pop = queue.pop()
        print("Dequeued element pop = \(pop); after dequeueing, queue = \(queue.toArray())")

        /* Get the queue size */
        let size = queue.size()
        print("Queue size = \(size)")

        /* Check whether the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Is the queue empty? \(isEmpty)")
    }
}
