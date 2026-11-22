/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* Initialize the queue */
        Queue<Integer> queue = new LinkedList<>();

        /* Enqueue elements */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("Queue queue = " + queue);

        /* Access the front element */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Dequeue an element */
        int pop = queue.poll();
        System.out.println("Dequeued element pop = " + pop + ", after dequeuing, queue = " + queue);

        /* Get the queue size */
        int size = queue.size();
        System.out.println("Queue size = " + size);

        /* Check whether the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Is the queue empty = " + isEmpty);
    }
}
