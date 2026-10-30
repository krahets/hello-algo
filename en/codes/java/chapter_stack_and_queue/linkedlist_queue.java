/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue implemented with a linked list */
class LinkedListQueue {
    private ListNode front, rear; // Head node front and tail node rear
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

    /* Enqueue */
    public void push(int num) {
        // Add num after the tail node
        ListNode node = new ListNode(num);
        // If the queue is empty, make both the head and tail point to this node
        if (front == null) {
            front = node;
            rear = node;
        // If the queue is not empty, add this node after the tail node
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    public int pop() {
        int num = peek();
        // Remove the head node
        front = front.next;
        queSize--;
        return num;
    }

    /* Access the front element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Convert the linked list to an array and return it */
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
        System.out.println("Queue queue = " + Arrays.toString(queue.toArray()));

        /* Access the front element */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Dequeue an element */
        int pop = queue.pop();
        System.out.println("Dequeued element pop = " + pop + ", after dequeuing, queue = " + Arrays.toString(queue.toArray()));

        /* Get the queue size */
        int size = queue.size();
        System.out.println("Queue size = " + size);

        /* Check whether the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Is the queue empty = " + isEmpty);
    }
}
