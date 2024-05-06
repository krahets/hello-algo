/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Double-linked list node */
class ListNode {
    int val; // Node value
    ListNode next; // Reference to successor node
    ListNode prev; // Reference to predecessor node

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* Double-ended queue class based on double-linked list */
class LinkedListDeque {
    private ListNode front, rear; // Front node front, back node rear
    private int queSize = 0; // Length of the double-ended queue

    public LinkedListDeque() {
        front = rear = null;
    }

    /* Get the length of the double-ended queue */
    public int size() {
        return queSize;
    }

    /* Determine if the double-ended queue is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Enqueue operation */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // If the list is empty, make front and rear both point to node
        if (isEmpty())
            front = rear = node;
        // Front enqueue operation
        else if (isFront) {
            // Add node to the head of the list
            front.prev = node;
            node.next = front;
            front = node; // Update head node
        // Rear enqueue operation
        } else {
            // Add node to the tail of the list
            rear.next = node;
            node.prev = rear;
            rear = node; // Update tail node
        }
        queSize++; // Update queue length
    }

    /* Front enqueue */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Rear enqueue */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Dequeue operation */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // Front dequeue operation
        if (isFront) {
            val = front.val; // Temporarily store the head node value
            // Remove head node
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // Update head node
        // Rear dequeue operation
        } else {
            val = rear.val; // Temporarily store the tail node value
            // Remove tail node
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

    /* Front dequeue */
    public int popFirst() {
        return pop(true);
    }

    /* Rear dequeue */
    public int popLast() {
        return pop(false);
    }

    /* Access front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Access rear element */
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
        /* Initialize double-ended queue */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Double-ended queue deque = " + Arrays.toString(deque.toArray()));

        /* Access element */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Back element peekLast = " + peekLast);

        /* Element enqueue */
        deque.pushLast(4);
        System.out.println("Element 4 enqueued at the tail, deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("Element 1 enqueued at the head, deque = " + Arrays.toString(deque.toArray()));

        /* Element dequeue */
        int popLast = deque.popLast();
        System.out.println("Deque tail element = " + popLast + ", after dequeuing from the tail" + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Deque front element = " + popFirst + ", after dequeuing from the front" + Arrays.toString(deque.toArray()));

        /* Get the length of the double-ended queue */
        int size = deque.size();
        System.out.println("Length of the double-ended queue size = " + size);

        /* Determine if the double-ended queue is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Is the double-ended queue empty = " + isEmpty);
    }
}
