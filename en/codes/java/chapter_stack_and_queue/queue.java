/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        // [region]{init_queue}
        /* Initialize the queue */
        Queue<Integer> queue = new LinkedList<>();
        // [endregion]{init_queue}

        // [region]{push}
        /* Enqueue elements */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        // [endregion]{push}
        System.out.println("Queue queue = " + queue);

        // [region]{peek}
        /* Access the front element */
        int peek = queue.peek();
        // [endregion]{peek}
        System.out.println("Front element peek = " + peek);

        // [region]{pop}
        /* Dequeue an element */
        int pop = queue.poll();
        // [endregion]{pop}
        System.out.println("Dequeued element pop = " + pop + ", after dequeuing, queue = " + queue);

        // [region]{size}
        /* Get the queue size */
        int size = queue.size();
        // [endregion]{size}
        System.out.println("Queue size = " + size);

        // [region]{is_empty}
        /* Check whether the queue is empty */
        boolean isEmpty = queue.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Is the queue empty = " + isEmpty);
    }
}
