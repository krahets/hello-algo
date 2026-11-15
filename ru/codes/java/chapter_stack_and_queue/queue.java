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
        /* Инициализация очереди */
        Queue<Integer> queue = new LinkedList<>();
        // [endregion]{init_queue}

        // [region]{push}
        /* Добавление элемента в очередь */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        // [endregion]{push}
        System.out.println("Очередь queue = " + queue);

        // [region]{peek}
        /* Доступ к элементу в начале очереди */
        int peek = queue.peek();
        // [endregion]{peek}
        System.out.println("Первый элемент peek = " + peek);

        // [region]{pop}
        /* Извлечение элемента из очереди */
        int pop = queue.poll();
        // [endregion]{pop}
        System.out.println("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + queue);

        // [region]{size}
        /* Получение длины очереди */
        int size = queue.size();
        // [endregion]{size}
        System.out.println("Длина очереди size = " + size);

        // [region]{is_empty}
        /* Проверка, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Пуста ли очередь = " + isEmpty);
    }
}
