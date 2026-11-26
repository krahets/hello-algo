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

        /* Добавить элементы в очередь */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("Очередь queue = " + queue);

        /* Посмотреть первый элемент очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент очереди peek = " + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.poll();
        System.out.println("Извлечённый элемент pop = " + pop + ", после извлечения queue = " + queue);

        /* Получить длину очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверить, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Очередь пуста = " + isEmpty);
    }
}
