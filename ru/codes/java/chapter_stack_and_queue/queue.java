/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* Инициализировать очередь */
        Queue<Integer> queue = new LinkedList<>();

        /* Поместить элемент в очередь */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("очередь queue =" + queue);

        /* Получить элемент в начале очереди */
        int peek = queue.peek();
        System.out.println("элемент в голове очереди peek =" + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.poll();
        System.out.println("Элемент, извлеченный из очереди, pop =" + pop + ", queue после извлечения =" + queue);

        /* Получить длину очереди */
        int size = queue.size();
        System.out.println("Длина очереди size =" + size);

        /* Проверить, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("очередьпуст ли =" + isEmpty);
    }
}
