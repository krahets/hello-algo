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
    ListNode next; // Ссылка на узел-преемник
    ListNode prev; // Ссылка на узел-предшественник

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

    /* Получение длины двусторонней очереди */
    public int size() {
        return queSize;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Операция добавления в очередь */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
        if (isEmpty())
            front = rear = node;
        // Операция добавления в голову очереди
        else if (isFront) {
            // Добавить node в голову списка
            front.prev = node;
            node.next = front;
            front = node; // Обновить головной узел
        // Операция добавления в хвост очереди
        } else {
            // Добавить node в хвост списка
            rear.next = node;
            node.prev = rear;
            rear = node; // Обновить хвостовой узел
        }
        queSize++; // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Добавление в хвост очереди */
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

    /* Извлечение из головы очереди */
    public int popFirst() {
        return pop(true);
    }

    /* Извлечение из хвоста очереди */
    public int popLast() {
        return pop(false);
    }

    /* Доступ к элементу в начале очереди */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Доступ к элементу в конце очереди */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* Вернуть массив для вывода */
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
        /* Инициализация двусторонней очереди */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Двусторонняя очередь deque = " + Arrays.toString(deque.toArray()));

        /* Доступ к элементу */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент peekLast = " + peekLast);

        /* Добавление элемента в очередь */
        deque.pushLast(4);
        System.out.println("После добавления элемента 4 в хвост deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После добавления элемента 1 в голову deque = " + Arrays.toString(deque.toArray()));

        /* Извлечение элемента из очереди */
        int popLast = deque.popLast();
        System.out.println("Извлеченный из хвоста элемент = " + popLast + ", deque после извлечения из хвоста = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Извлеченный из головы элемент = " + popFirst + ", deque после извлечения из головы = " + Arrays.toString(deque.toArray()));

        /* Получение длины двусторонней очереди */
        int size = deque.size();
        System.out.println("Длина двусторонней очереди size = " + size);

        /* Проверка, пуста ли двусторонняя очередь */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Пуста ли двусторонняя очередь = " + isEmpty);
    }
}
