/**
 * File: queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class queue {
    public static void main(String[] args) {
        /* Инициализация очереди */
        Queue<Integer> queue = new LinkedList<>();

        /* Добавление элемента в очередь */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("Очередь queue = " + queue);

        /* Доступ к элементу в начале очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент peek = " + peek);

        /* Извлечение элемента из очереди */
        int pop = queue.poll();
        System.out.println("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + queue);

        /* Получение длины очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверка, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Пуста ли очередь = " + isEmpty);
    }
}
