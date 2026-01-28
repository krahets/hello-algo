/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue based on circular array implementation */
class ArrayQueue {
    private int[] nums; // Array for storing queue elements
    private int front; // Front pointer, points to the front of the queue element
    private int queSize; // Queue length

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the capacity of the queue */
    public int capacity() {
        return nums.length;
    }

    /* Get the length of the queue */
    public int size() {
        return queSize;
    }

    /* Check if the queue is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        int rear = (front + queSize) % capacity();
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int pop() {
        int num = peek();
        // Move front pointer backward by one position, if it passes the tail, return to array head
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Return array */
    public int[] toArray() {
        // Elements enqueue
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* Access front of the queue element */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

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

        /* Test circular array */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("After round " + i + " enqueue + dequeue, queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
