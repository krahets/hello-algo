/**
 * File: array_deque.java
 * Created Time: 2023-02-16
 * Author: krahets (krahets@163.com), FangYuan33 (374072213@qq.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Deque backed by a circular array */
class ArrayDeque {
    private int[] nums; // Array that stores the deque elements
    private int front; // Index of the front element
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

    /* Compute the circular array index */
    private int index(int i) {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + capacity()) % capacity();
    }

    /* Add an element at the front */
    public void pushFirst(int num) {
        if (queSize == capacity()) {
            System.out.println("Deque is full");
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        front = index(front - 1);
        // Add num at the front
        nums[front] = num;
        queSize++;
    }

    /* Add an element at the rear */
    public void pushLast(int num) {
        if (queSize == capacity()) {
            System.out.println("Deque is full");
            return;
        }
        // Compute the index one slot past the rear element
        int rear = index(front + queSize);
        // Add num at the rear
        nums[rear] = num;
        queSize++;
    }

    /* Remove and return the front element */
    public int popFirst() {
        int num = peekFirst();
        // Advance the front index by one
        front = index(front + 1);
        queSize--;
        return num;
    }

    /* Remove and return the rear element */
    public int popLast() {
        int num = peekLast();
        queSize--;
        return num;
    }

    /* Peek at the front element */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* Peek at the rear element */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // Compute the index of the rear element
        int last = index(front + queSize - 1);
        return nums[last];
    }

    /* Return an array for printing */
    public int[] toArray() {
        // Copy only the elements currently in the deque
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
