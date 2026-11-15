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
        /* Инициализация двусторонней очереди */
        Deque<Integer> deque = new LinkedList<>();
        // [endregion]{init_deque}

        // [region]{push}
        /* Добавление элемента в очередь */
        deque.offerLast(2); // Добавить в хвост
        deque.offerLast(5);
        deque.offerLast(4);
        deque.offerFirst(3); // Добавить в голову
        deque.offerFirst(1);
        // [endregion]{push}
        System.out.println("Двусторонняя очередь deque = " + deque);

        // [region]{peek_first}
        /* Доступ к элементу */
        int peekFirst = deque.peekFirst(); // Элемент в голове
        // [endregion]{peek_first}
        System.out.println("Первый элемент peekFirst = " + peekFirst);
        // [region]{peek_last}
        int peekLast = deque.peekLast(); // Элемент в хвосте
        // [endregion]{peek_last}
        System.out.println("Последний элемент peekLast = " + peekLast);

        // [region]{pop_first}
        /* Извлечение элемента из очереди */
        int popFirst = deque.pollFirst(); // Извлечь элемент из головы
        // [endregion]{pop_first}
        System.out.println("Извлеченный из головы элемент = " + popFirst + ", deque после извлечения из головы = " + deque);
        // [region]{pop_last}
        int popLast = deque.pollLast(); // Извлечь элемент из хвоста
        // [endregion]{pop_last}
        System.out.println("Извлеченный из хвоста элемент = " + popLast + ", deque после извлечения из хвоста = " + deque);

        // [region]{size}
        /* Получение длины двусторонней очереди */
        int size = deque.size();
        // [endregion]{size}
        System.out.println("Длина двусторонней очереди size = " + size);

        // [region]{is_empty}
        /* Проверка, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
