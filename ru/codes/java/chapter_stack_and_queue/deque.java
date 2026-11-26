/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* Инициализировать дек */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("Дек deque = " + deque);

        /* Посмотреть первый и последний элементы */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент дека peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент дека peekLast = " + peekLast);

        /* Добавить элементы в дек */
        deque.offerLast(4);
        System.out.println("После добавления 4 в конец дека deque = " + deque);
        deque.offerFirst(1);
        System.out.println("После добавления 1 в начало дека deque = " + deque);

        /* Извлечь элементы из дека */
        int popLast = deque.pollLast();
        System.out.println("Извлечённый последний элемент = " + popLast + ", после извлечения из конца deque = " + deque);
        int popFirst = deque.pollFirst();
        System.out.println("Извлечённый первый элемент = " + popFirst + ", после извлечения из начала deque = " + deque);

        /* Получить длину дека */
        int size = deque.size();
        System.out.println("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Дек пуст = " + isEmpty);
    }
}
