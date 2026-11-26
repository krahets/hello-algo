/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* Initialize the deque */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("deque = " + deque);

        /* Peek at the front and rear elements */
        int peekFirst = deque.peekFirst();
        System.out.println("Front element (peekFirst) = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Rear element (peekLast) = " + peekLast);

        /* Add elements to the deque */
        deque.offerLast(4);
        System.out.println("After adding 4 at the rear, deque = " + deque);
        deque.offerFirst(1);
        System.out.println("After adding 1 at the front, deque = " + deque);

        /* Remove elements from both ends */
        int popLast = deque.pollLast();
        System.out.println("Removed from the rear = " + popLast + ", deque after removal = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("Removed from the front = " + popFirst + ", deque after removal = " + deque);

        /* Get the deque size */
        int size = deque.size();
        System.out.println("Deque size = " + size);

        /* Check whether the deque is empty */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Deque is empty = " + isEmpty);
    }
}
