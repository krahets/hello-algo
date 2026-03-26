/**
 * File: deque.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class deque {
    public static void main(String[] args) {
        /* Инициализировать двустороннюю очередь */
        Deque<Integer> deque = new LinkedList<>();
        deque.offerLast(3);
        deque.offerLast(2);
        deque.offerLast(5);
        System.out.println("двусторонняя очередь deque =" + deque);

        /* Получить доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("элемент в голове очереди peekFirst =" + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("элемент в хвосте очереди peekLast =" + peekLast);

        /* Поместить элемент в очередь */
        deque.offerLast(4);
        System.out.println("После помещения элемента 4 в хвост очереди deque =" + deque);
        deque.offerFirst(1);
        System.out.println("После помещения элемента 1 в голову очереди deque =" + deque);

        /* Извлечь элемент из очереди */
        int popLast = deque.pollLast();
        System.out.println("Элемент, извлеченный из хвоста очереди, =" + popLast + ", deque после извлечения из хвоста =" + deque);
        int popFirst = deque.pollFirst();
        System.out.println("Элемент, извлеченный из головы очереди, =" + popFirst + ", deque после извлечения из головы =" + deque);

        /* Получить длину двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size =" + size);

        /* Проверить, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("двусторонняя очередьпуст ли =" + isEmpty);
    }
}
