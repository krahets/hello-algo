/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Узел двусвязного списка */
class ListNode {
    int val; // Значение узла
    ListNode next; // Ссылка на следующий узел
    ListNode prev; // Ссылка на предыдущий узел

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* Двусторонняя очередь на основе двусвязного списка */
class LinkedListDeque {
    private ListNode front, rear; // Головной узел front, хвостовой узел rear
    private int queSize = 0; // Длина двусторонней очереди

    public LinkedListDeque() {
        front = rear = null;
    }

    /* Получить длину двусторонней очереди */
    public int size() {
        return queSize;
    }

    /* Проверить, пуста ли двусторонняя очередь */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Операция помещения в очередь */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty())
            front = rear = node;
        // Операция помещения в голову очереди
        else if (isFront) {
            // Добавить node в голову связного списка
            front.prev = node;
            node.next = front;
            front = node; // Обновить головной узел
        // Операция помещения в хвост очереди
        } else {
            // Добавить node в хвост связного списка
            rear.next = node;
            node.prev = rear;
            rear = node; // Обновить хвостовой узел
        }
        queSize++; // Обновить длину очереди
    }

    /* Поместить в голову очереди */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Поместить в хвост очереди */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Операция извлечения из очереди */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // Операция извлечения из головы очереди
        if (isFront) {
            val = front.val; // Временно сохранить значение головного узла
            // Удалить головной узел
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // Обновить головной узел
        // Операция извлечения из хвоста очереди
        } else {
            val = rear.val; // Временно сохранить значение хвостового узла
            // Удалить хвостовой узел
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev; // Обновить хвостовой узел
        }
        queSize--; // Обновить длину очереди
        return val;
    }

    /* Извлечь из головы очереди */
    public int popFirst() {
        return pop(true);
    }

    /* Извлечь из хвоста очереди */
    public int popLast() {
        return pop(false);
    }

    /* Получить элемент в начале очереди */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Обратиться к элементу в хвосте очереди */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* Вернуть массив для печати */
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

public class linkedlist_deque {
    public static void main(String[] args) {
        /* Инициализировать двустороннюю очередь */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("двусторонняя очередь deque =" + Arrays.toString(deque.toArray()));

        /* Получить доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("элемент в голове очереди peekFirst =" + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("элемент в хвосте очереди peekLast =" + peekLast);

        /* Поместить элемент в очередь */
        deque.pushLast(4);
        System.out.println("После помещения элемента 4 в хвост очереди deque =" + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После помещения элемента 1 в голову очереди deque =" + Arrays.toString(deque.toArray()));

        /* Извлечь элемент из очереди */
        int popLast = deque.popLast();
        System.out.println("Элемент, извлеченный из хвоста очереди, =" + popLast + ", deque после извлечения из хвоста =" + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Элемент, извлеченный из головы очереди, =" + popFirst + ", deque после извлечения из головы =" + Arrays.toString(deque.toArray()));

        /* Получить длину двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size =" + size);

        /* Проверить, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("двусторонняя очередьпуст ли =" + isEmpty);
    }
}
