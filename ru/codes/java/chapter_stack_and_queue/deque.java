/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* Инициализация двусторонней очереди */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("Двусторонняя очередь deque = " + deque);

        /* Доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент peekLast = " + peekLast);

        /* Добавление элемента в очередь */
        deque.offerLast(4);
        System.out.println("После добавления элемента 4 в хвост deque = " + deque);
        deque.offerFirst(1);
        System.out.println("После добавления элемента 1 в голову deque = " + deque);

        /* Извлечение элемента из очереди */
        int popLast = deque.pollLast();
        System.out.println("Извлеченный из хвоста элемент = " + popLast + ", deque после извлечения из хвоста = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("Извлеченный из головы элемент = " + popFirst + ", deque после извлечения из головы = " + deque);

        /* Получение длины двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size = " + size);

        /* Проверка, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
