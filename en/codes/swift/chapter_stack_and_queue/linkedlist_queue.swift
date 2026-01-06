/**
 * File: linkedlist_queue.swift
 * Created Time: 2023-01-11
 * Author: nuomi1 (nuomi1@qq.com)
 */

import utils

/* Queue based on linked list implementation */
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

    /* Check if the queue is empty */
    func isEmpty() -> Bool {
        size() == 0
    }

    /* Enqueue */
    func push(num: Int) {
        // Add num after the tail node
        let node = ListNode(x: num)
        // If the queue is empty, make both front and rear point to the node
        if front == nil {
            front = node
            rear = node
        }
        // If the queue is not empty, add the node after the tail node
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
        // Delete head node
        front = front?.next
        _size -= 1
        return num
    }

    /* Return list for printing */
    func peek() -> Int {
        if isEmpty() {
            fatalError("Queue is empty")
        }
        return front!.val
    }

    /* Convert linked list to Array and return */
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
        /* Access front of the queue element */
        let queue = LinkedListQueue()

        /* Elements enqueue */
        queue.push(num: 1)
        queue.push(num: 3)
        queue.push(num: 2)
        queue.push(num: 5)
        queue.push(num: 4)
        print("Queue queue = \(queue.toArray())")

        /* Return list for printing */
        let peek = queue.peek()
        print("Front element peek = \(peek)")

        /* Element dequeue */
        let pop = queue.pop()
        print("Dequeue element pop = \(pop), after dequeue queue = \(queue.toArray())")

        /* Get the length of the queue */
        let size = queue.size()
        print("Queue length size = \(size)")

        /* Check if the queue is empty */
        let isEmpty = queue.isEmpty()
        print("Is queue empty = \(isEmpty)")
    }
}
