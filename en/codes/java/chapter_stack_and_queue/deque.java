/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* Initialize double-ended queue */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("Double-ended queue deque = " + deque);

        /* Access element */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Back element peekLast = " + peekLast);

        /* Element enqueue */
        deque.offerLast(4);
        System.out.println("Element 4 enqueued at the tail, deque = " + deque);
        deque.offerFirst(1);
        System.out.println("Element 1 enqueued at the head, deque = " + deque);

        /* Element dequeue */
        int popLast = deque.pollLast();
        System.out.println("Deque tail element = " + popLast + ", after dequeuing from the tail" + deque);
        int popFirst = deque.pollFirst();
        System.out.println("Deque front element = " + popFirst + ", after dequeuing from the front" + deque);

        /* Get the length of the double-ended queue */
        int size = deque.size();
        System.out.println("Length of the double-ended queue size = " + size);

        /* Determine if the double-ended queue is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Is the double-ended queue empty = " + isEmpty);
    }
}
