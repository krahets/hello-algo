/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Doubly linked list node */
class ListNode {
    int val; // Node value
    ListNode next; // Successor node reference
    ListNode prev; // Predecessor node reference

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
    private ListNode front, rear; // Head node front, tail node rear
    private int queSize = 0; // Length of the double-ended queue

    public LinkedListDeque() {
        front = rear = null;
    }

    /* Get the length of the double-ended queue */
    public int size() {
        return queSize;
    }

    /* Check if the double-ended queue is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // If the linked list is empty, make both front and rear point to node
        if (isEmpty())
            front = rear = node;
        // Front of the queue enqueue operation
        else if (isFront) {
            // Add node to the head of the linked list
            front.prev = node;
            node.next = front;
            front = node; // Update head node
        // Rear of the queue enqueue operation
        } else {
            // Add node to the tail of the linked list
            rear.next = node;
            node.prev = rear;
            rear = node; // Update tail node
        }
        queSize++; // Update queue length
    }

    /* Front of the queue enqueue */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Rear of the queue enqueue */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // Temporarily store head node value
        if (isFront) {
            val = front.val; // Delete head node
            // Delete head node
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // Update head node
        // Temporarily store tail node value
        } else {
            val = rear.val; // Delete tail node
            // Update tail node
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev; // Update tail node
        }
        queSize--; // Update queue length
        return val;
    }

    /* Rear of the queue dequeue */
    public int popFirst() {
        return pop(true);
    }

    /* Access rear of the queue element */
    public int popLast() {
        return pop(false);
    }

    /* Return list for printing */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Driver Code */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* Return array for printing */
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

public class linkedlist_deque {
    public static void main(String[] args) {
        /* Get the length of the double-ended queue */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Double-ended queue deque = " + Arrays.toString(deque.toArray()));

        /* Update element */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Rear element peekLast = " + peekLast);

        /* Elements enqueue */
        deque.pushLast(4);
        System.out.println("After element 4 enqueues at rear, deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("After element 1 enqueues at front, deque = " + Arrays.toString(deque.toArray()));

        /* Element dequeue */
        int popLast = deque.popLast();
        System.out.println("Rear dequeue element = " + popLast + ", after rear dequeue, deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Front dequeue element = " + popFirst + ", after front dequeue, deque = " + Arrays.toString(deque.toArray()));

        /* Get the length of the double-ended queue */
        int size = deque.size();
        System.out.println("Double-ended queue length size = " + size);

        /* Check if the double-ended queue is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Double-ended queue is empty = " + isEmpty);
    }
}
