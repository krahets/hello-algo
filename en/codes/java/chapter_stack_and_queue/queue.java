/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* Access front of the queue element */
        Queue<Integer> queue = new LinkedList<>();

        /* Elements enqueue */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("Queue queue = " + queue);

        /* Return list for printing */
        int peek = queue.peek();
        System.out.println("Front element peek = " + peek);

        /* Element dequeue */
        int pop = queue.poll();
        System.out.println("Dequeue element pop = " + pop + ", after dequeue, queue = " + queue);

        /* Get the length of the queue */
        int size = queue.size();
        System.out.println("Queue length size = " + size);

        /* Check if the queue is empty */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Queue is empty = " + isEmpty);
    }
}
