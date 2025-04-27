/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Queue class based on circular array */
class ArrayQueue {
    private int[] nums; // Array for storing queue elements
    private int front; // Front pointer, pointing to the front element
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

    /* Determine if the queue is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Enqueue */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("Queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        int rear = (front + queSize) % capacity();
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue */
    public int pop() {
        int num = peek();
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* Access front element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Return array */
    public int[] toArray() {
        // Only convert elements within valid length range
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* Initialize queue */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* Element enqueue */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Queue queue = " + Arrays.toString(queue.toArray()));

        /* Access front element */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.pop();
        System.out.println("Dequeued element = " + pop + ", after dequeuing" + Arrays.toString(queue.toArray()));

        /* Get the length of the queue */
        int size = queue.size();
        System.out.println("Length of the queue size = " + size);

        /* Determine if the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Is the queue empty = " + isEmpty);

        /* Test circular array */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("After the " + i + "th round of enqueueing + dequeuing, queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
