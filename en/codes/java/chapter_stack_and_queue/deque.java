/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        // [region]{init_deque}
        /* Initialize the deque */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* Enqueue elements */
        deque.offerLast(2); // Add to the rear
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // Add to the front
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("Deque deque = " + deque);

        // [region]{peek_first}
        /* Access an element */
        int peekFirst = deque.peekFirst(); // Front element
        // [endregion]{peek_first}
        System.out.println("Front element peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // Rear element
        // [endregion]{peek_last}
        System.out.println("Rear element peekLast = " + peekLast);

        // [region]{pop_first}
        /* Dequeue an element */
        int popFirst = deque.pollFirst(); // Dequeue the front element
        // [endregion]{pop_first}
        System.out.println("Element dequeued from the front = " + popFirst + ", after dequeuing from the front, deque = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // Dequeue the rear element
        // [endregion]{pop_last}
        System.out.println("Element dequeued from the rear = " + popLast + ", after dequeuing from the rear, deque = " + deque);

        // [region]{size}
        /* Get the deque size */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("Deque size = " + size);

        // [region]{is_empty}
        /* Check whether the deque is empty */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Is the deque empty = " + isEmpty);
    }
}
