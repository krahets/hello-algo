/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue implemented with a circular array */
class ArrayQueue {
    private int[] nums; // Array that stores the queue elements
    private int front; // Front pointer, pointing to the first element
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

    /* Enqueue */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Queue is full");
            return;
        }
        // Calculate the rear pointer, which points one position past the last element
        // Use modulo to wrap rear to the beginning when it passes the end of the array
        int rear = (front + queSize) % capacity();
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int pop() {
        int num = peek();
        // Advance the front pointer by one position, wrapping to the beginning if it passes the end
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Access the front element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Return an array */
    public int[] toArray() {
        // Convert only the list elements within the occupied range
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

        /* Test the circular array */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("Round " + i + " : after enqueue + dequeue, queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
