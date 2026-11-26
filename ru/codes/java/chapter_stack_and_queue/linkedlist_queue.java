/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Очередь на основе связного списка */
class LinkedListQueue {
    private ListNode front, rear; // front — первый узел, rear — последний
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* Получить длину очереди */
    public int size() {
        return queSize;
    }

    /* Проверить, пуста ли очередь */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Добавить элемент в очередь */
    public void push(int num) {
        // Добавить узел со значением num после последнего узла
        ListNode node = new ListNode(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (front == null) {
            front = node;
            rear = node;
        // Если очередь непуста, добавить новый узел после последнего
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* Извлечь элемент из очереди */
    public int pop() {
        int num = peek();
        // Удалить первый узел
        front = front.next;
        queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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
        /* Инициализировать очередь */
        LinkedListQueue queue = new LinkedListQueue();

        /* Добавить элементы в очередь */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("Очередь queue = " + Arrays.toString(queue.toArray()));

        /* Посмотреть первый элемент очереди */
        int peek = queue.peek();
        System.out.println("Первый элемент очереди peek = " + peek);

        /* Извлечь элемент из очереди */
        int pop = queue.pop();
        System.out.println("Извлечённый элемент pop = " + pop + ", после извлечения queue = " + Arrays.toString(queue.toArray()));

        /* Получить длину очереди */
        int size = queue.size();
        System.out.println("Длина очереди size = " + size);

        /* Проверить, пуста ли очередь */
        boolean isEmpty = queue.isEmpty();
        System.out.println("Очередь пуста = " + isEmpty);
    }
}
