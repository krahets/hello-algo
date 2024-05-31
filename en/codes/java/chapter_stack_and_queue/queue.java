/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* Initialize queue */
        Queue<Integer> queue = new LinkedList<>();

        /* Element enqueue */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("Queue queue = " + queue);

        /* Access front element */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.poll();
        System.out.println("Dequeued element = " + pop + ", after dequeuing" + queue);

        /* Get the length of the queue */
        int size = queue.size();
        System.out.println("Length of the queue size = " + size);

        /* Determine if the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Is the queue empty = " + isEmpty);
    }
}
