/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Deque implemented with a circular array */
class ArrayDeque {
    private int[] nums; // Array that stores the deque elements
    private int front; // Front pointer, pointing to the first element
    private int queSize; // Deque size

    /* Constructor */
    public ArrayDeque(int capacity) {
        this.nums = new int[capacity];
        front = queSize = 0;
    }

    /* Get the deque capacity */
    public int capacity() {
        return nums.length;
    }

    /* Get the deque size */
    public int size() {
        return queSize;
    }

    /* Check whether the deque is empty */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* Calculate an index in the circular array */
    private int index(int i) {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        return (i + capacity()) % capacity();
    }

    /* Enqueue at the front */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Deque is full");
            return;
        }
        // Move the front pointer one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        front = index(front - 1);
        // Add num to the front
        nums[front] = num;
        queSize++;
    }

    /* Enqueue at the rear */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Deque is full");
            return;
        }
        // Calculate the rear pointer, which points one position past the last element
        int rear = index(front + queSize);
        // Add num to the rear
        nums[rear] = num;
        queSize++;
    }

    /* Dequeue from the front */
    public int popFirst() {
        int num = peekFirst();
        // Advance the front pointer by one position
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Dequeue from the rear */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Access the front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Access the rear element */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Calculate the index of the last element
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return an array for printing */
    public int[] toArray() {
        // Convert only the list elements within the occupied range
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[index(j)];
        }
        return res;
    }
}

public class array_deque {
    public static void main(String[] args) {
        /* Initialize the deque */
        ArrayDeque deque = new ArrayDeque(10);
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
