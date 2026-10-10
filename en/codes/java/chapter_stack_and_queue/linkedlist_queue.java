/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue based on linked list implementation */
class LinkedListQueue {
    private ListNode front, rear; // Head node front, tail node rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Get the length of the queue */
    public int size() {
        return queSize;
    }

    /* Check if the queue is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Enqueue */
    public void push(int num) {
        // Add num after the tail node
        ListNode node = new ListNode(num);
        // If the queue is empty, make both front and rear point to the node
        if (front == null) {
            front = node;
            rear = node;
        // If the queue is not empty, add the node after the tail node
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Dequeue */
    public int pop() {
        int num = peek();
        // Delete head node
        front = front.next;
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Convert linked list to Array and return */
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
        /* Access front of the queue element */
        LinkedListQueue queue = new LinkedListQueue();

        /* Elements enqueue */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Queue queue = " + Arrays.toString(queue.toArray()));

        /* Return list for printing */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.pop();
        System.out.println("Dequeue element pop = " + pop + ", after dequeue, queue = " + Arrays.toString(queue.toArray()));

        /* Get the length of the queue */
        int size = queue.size();
        System.out.println("Queue length size = " + size);

        /* Check if the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Queue is empty = " + isEmpty);
    }
}
