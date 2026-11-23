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
    ListNode next; // Reference to the next node
    ListNode prev; // Reference to the previous node

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
    private ListNode front, rear; // Head node front and tail node rear
    private int queSize = 0; // Deque size

    public LinkedListDeque() {
        front = rear = null;
    }

    /* Get the deque size */
    public int size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // If the linked list is empty, make both front and rear point to node
        if (isEmpty())
            front = rear = node;
        // Enqueue at the front
        else if (isFront) {
            // Add node to the head of the linked list
            front.prev = node;
            node.next = front;
            front = node; // Update the head node
        // Enqueue at the rear
        } else {
            // Add node to the tail of the linked list
            rear.next = node;
            node.prev = rear;
            rear = node; // Update the tail node
        }
        queSize++; // Update the queue size
    }

    /* Enqueue at the front */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Enqueue at the rear */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // When the queue size is 1, the head and tail point to the same node
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // Dequeue from the front
        else if (isFront) {
            val = front.val; // Save the head node value
            // Remove the head node
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // Update the head node
        // Dequeue from the rear
        } else {
            val = rear.val; // Save the tail node value
            // Remove the tail node
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // Update the tail node
        }
        queSize--; // Update the queue size
        return val;
    }

    /* Dequeue from the front */
    public int popFirst() {
        return pop(true);
    }

    /* Dequeue from the rear */
    public int popLast() {
        return pop(false);
    }

    /* Access the front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Access the rear element */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* Return an array for printing */
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
        /* Initialize the deque */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Deque deque = " + Arrays.toString(deque.toArray()));

        /* Access an element */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Rear element peekLast = " + peekLast);

        /* Enqueue elements */
        deque.pushLast(4);
        System.out.println("After enqueuing element 4 at the rear, deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("After enqueuing element 1 at the front, deque = " + Arrays.toString(deque.toArray()));

        /* Dequeue an element */
        int popLast = deque.popLast();
        System.out.println("Element dequeued from the rear = " + popLast + ", after dequeuing from the rear, deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Element dequeued from the front = " + popFirst + ", after dequeuing from the front, deque = " + Arrays.toString(deque.toArray()));

        /* Get the deque size */
        int size = deque.size();
        System.out.println("Deque size = " + size);

        /* Check whether the deque is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Is the deque empty = " + isEmpty);
    }
}
