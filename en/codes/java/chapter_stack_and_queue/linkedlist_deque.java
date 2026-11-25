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

/* Deque backed by a doubly linked list */
class LinkedListDeque {
    private ListNode front, rear; // front points to the head node and rear to the tail node
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

    /* Add an element at either end */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // If the list is empty, point both front and rear at node
        if (isEmpty())
            front = rear = node;
        // Add at the front
        else if (isFront) {
            // Link node at the head of the list
            front.prev = node;
            node.next = front;
            front = node; // Update the head
        // Add at the rear
        } else {
            // Link node at the tail of the list
            rear.next = node;
            node.prev = rear;
            rear = node; // Update the tail
        }
        queSize++; // Update the deque size
    }

    /* Add an element at the front */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Add an element at the rear */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Remove an element from either end */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // When the deque contains one element, the head and tail point to the same node
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // Remove from the front
        else if (isFront) {
            val = front.val; // Save the head node's value
            // Remove the head node
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // Update the head
        // Remove from the rear
        } else {
            val = rear.val; // Save the tail node's value
            // Remove the tail node
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // Update the tail
        }
        queSize--; // Update the deque size
        return val;
    }

    /* Remove and return the front element */
    public int popFirst() {
        return pop(true);
    }

    /* Remove and return the rear element */
    public int popLast() {
        return pop(false);
    }

    /* Peek at the front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Peek at the rear element */
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
        System.out.println("deque = " + Arrays.toString(deque.toArray()));

        /* Peek at the front and rear elements */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element (peekFirst) = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Rear element (peekLast) = " + peekLast);

        /* Add elements to the deque */
        deque.pushLast(4);
        System.out.println("After adding 4 at the rear, deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("After adding 1 at the front, deque = " + Arrays.toString(deque.toArray()));

        /* Remove elements from both ends */
        int popLast = deque.popLast();
        System.out.println("Removed from the rear = " + popLast + ", deque after removal = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Removed from the front = " + popFirst + ", deque after removal = " + Arrays.toString(deque.toArray()));

        /* Get the deque size */
        int size = deque.size();
        System.out.println("Deque size = " + size);

        /* Check whether the deque is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Deque is empty = " + isEmpty);
    }
}
