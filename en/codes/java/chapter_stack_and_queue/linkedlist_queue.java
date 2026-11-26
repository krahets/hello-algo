/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue backed by a linked list */
class LinkedListQueue {
    private ListNode front, rear; // front points to the head node and rear to the tail node
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Get the queue size */
    public int size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Enqueue an element */
    public void push(int num) {
        // Add a node containing num after the tail
        ListNode node = new ListNode(num);
        // If the queue is empty, point both the head and tail at the new node
        if (front == null) {
            front = node;
            rear = node;
        // If the queue has elements, link the new node after the tail
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Remove and return the front element */
    public int pop() {
        int num = peek();
        // Remove the head node
        front = front.next;
        queSize--;
        return num;
    }

    /* Peek at the front element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Return the linked list elements as an array */
    public int[] toArray() {
        ListNode node = front;
        int[] res = new int[size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    public static void main(String[] args) {
        /* Initialize the queue */
        LinkedListQueue queue = new LinkedListQueue();

        /* Enqueue elements */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("queue = " + Arrays.toString(queue.toArray()));

        /* Peek at the front element */
        int peek = queue.peek();
        System.out.println("Front element (peek) = " + peek);

        /* Dequeue an element */
        int pop = queue.pop();
        System.out.println("Dequeued element (pop) = " + pop + ", queue after removal = " + Arrays.toString(queue.toArray()));

        /* Get the queue size */
        int size = queue.size();
        System.out.println("Queue size = " + size);

        /* Check whether the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Queue is empty = " + isEmpty);
    }
}
