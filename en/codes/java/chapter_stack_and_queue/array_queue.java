/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue backed by a circular array */
class ArrayQueue {
    private int[] nums; // Array that stores the queue elements
    private int front; // Index of the front element
    private int queSize; // Queue size

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the queue capacity */
    public int capacity() {
        return nums.length;
    }

    /* Get the queue size */
    public int size() {
        return queSize;
    }

    /* Check whether the queue is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Enqueue an element */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Queue is full");
            return;
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        int rear = (front + queSize) % capacity();
        // Add num at the rear
        nums[rear] = num;
        queSize++;
    }

    /* Remove and return the front element */
    public int pop() {
        int num = peek();
        // Advance the front index by one, wrapping to the start if it passes the end
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Peek at the front element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Return the queue elements as an array */
    public int[] toArray() {
        // Copy only the elements currently in the queue
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* Initialize the queue */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

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

        /* Test the circular array */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("After round " + i + " of enqueueing and dequeueing, queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
