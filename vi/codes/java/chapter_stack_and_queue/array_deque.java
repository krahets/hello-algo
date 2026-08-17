/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
    private int[] nums; // Array for storing double-ended queue elements
    private int front; // Front pointer, points to the front of the queue element
    private int queSize; // Double-ended queue length

    /* Constructor */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the capacity of the double-ended queue */
    public int capacity() {
        return nums.length;
    }

    /* Get the length of the double-ended queue */
    public int size() {
        return queSize;
    }

    /* Check if the double-ended queue is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    private int index(int i) {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + capacity()) % capacity();
    }

    /* Front of the queue enqueue */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        front = index(front - 1);
        // Add num to front of queue
        nums[front] = num;
        queSize++;
    }

    /* Rear of the queue enqueue */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        int rear = index(front + queSize);
        // Front pointer moves one position backward
        nums[rear] = num;
        queSize++;
    }

    /* Rear of the queue dequeue */
    public int popFirst() {
        int num = peekFirst();
        // Move front pointer backward by one position
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Access rear of the queue element */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Return list for printing */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Driver Code */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Initialize double-ended queue
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    public int[] toArray() {
        // Elements enqueue
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Get the length of the double-ended queue */
        ArrayDeque deque = new ArrayDeque(10);
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
