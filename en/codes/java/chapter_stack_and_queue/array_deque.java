/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Double-ended queue class based on circular array */
class ArrayDeque {
    private int[] nums; // Array used to store elements of the double-ended queue
    private int front; // Front pointer, pointing to the front element
    private int queSize; // Length of the double-ended queue

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

    /* Determine if the double-ended queue is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Calculate circular array index */
    private int index(int i) {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return (i + capacity()) % capacity();
    }

    /* Front enqueue */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Double-ended queue is full");
            return;
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        front = index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Rear enqueue */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Double-ended queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        int rear = index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Front dequeue */
    public int popFirst() {
        int num = peekFirst();
        // Move front pointer one position backward
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Rear dequeue */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Access front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Access rear element */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Calculate rear element index
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return array for printing */
    public int[] toArray() {
        // Only convert elements within valid length range
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Initialize double-ended queue */
        ArrayDeque deque = new ArrayDeque(10);
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
