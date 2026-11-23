/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Очередь на основе связного списка */
class LinkedListQueue {
    private ListNode front, rear; // Головной узел front, хвостовой узел rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Получение длины очереди */
    public int size() {
        return queSize;
    }

    /* Проверка, пуста ли очередь */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Поместить в очередь */
    public void push(int num) {
        // Добавить num после хвостового узла
        ListNode node = new ListNode(num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (front == null) {
            front = node;
            rear = node;
        // Если очередь не пуста, добавить этот узел после хвостового узла
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь из очереди */
    public int pop() {
        int num = peek();
        // Удалить головной узел
        front = front.next;
        queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Преобразовать связный список в Array и вернуть */
    public int[] toArray() {
        ListNode node = front;
        int[] res = new int[size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    public static void main(String[] args) {
        /* Инициализация очереди */
        LinkedListQueue queue = new LinkedListQueue();

        /* Добавление элемента в очередь */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Очередь queue = " + Arrays.toString(queue.toArray()));

        /* Доступ к элементу в начале очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент peek = " + peek);

        /* Извлечение элемента из очереди */
        int pop = queue.pop();
        System.out.println("Извлеченный элемент pop = " + pop + ", queue после извлечения = " + Arrays.toString(queue.toArray()));

        /* Получение длины очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверка, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Пуста ли очередь = " + isEmpty);
    }
}
