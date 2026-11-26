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

/* Двусторонняя очередь (дек) на основе двусвязного списка */
class LinkedListDeque {
    private ListNode front, rear; // front — первый узел, rear — последний
    private int queSize = 0; // Длина дека

    public LinkedListDeque() {
        front = rear = null;
    }

    /* Получить длину дека */
    public int size() {
        return queSize;
    }

    /* Проверить, пуст ли дек */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Добавить элемент в дек */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // Если связный список пуст, установить front и rear так, чтобы они указывали на node
        if (isEmpty())
            front = rear = node;
        // Добавить элемент в начало дека
        else if (isFront) {
            // Добавить node в начало связного списка
            front.prev = node;
            node.next = front;
            front = node; // Обновить ссылку на первый узел
        // Добавить элемент в конец дека
        } else {
            // Добавить node в конец связного списка
            rear.next = node;
            node.prev = rear;
            rear = node; // Обновить ссылку на последний узел
        }
        queSize++; // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* Добавить элемент в конец дека */
    public void pushLast(int num) {
        push(num, false);
    }

    /* Извлечь элемент из дека */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // Если длина дека равна 1, ссылки на первый и последний узлы указывают на один и тот же узел
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // Извлечь элемент из начала дека
        else if (isFront) {
            val = front.val; // Временно сохранить значение первого узла
            // Удалить первый узел
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // Обновить ссылку на первый узел
        // Извлечь элемент из конца дека
        } else {
            val = rear.val; // Временно сохранить значение последнего узла
            // Удалить последний узел
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // Обновить ссылку на последний узел
        }
        queSize--; // Обновить длину дека
        return val;
    }

    /* Извлечь элемент из начала дека */
    public int popFirst() {
        return pop(true);
    }

    /* Извлечь элемент из конца дека */
    public int popLast() {
        return pop(false);
    }

    /* Посмотреть первый элемент дека */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* Посмотреть последний элемент дека */
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
        /* Инициализировать дек */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("Дек deque = " + Arrays.toString(deque.toArray()));

        /* Посмотреть первый и последний элементы */
        int peekFirst = deque.peekFirst();
        System.out.println("Первый элемент дека peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("Последний элемент дека peekLast = " + peekLast);

        /* Добавить элементы в дек */
        deque.pushLast(4);
        System.out.println("После добавления 4 в конец дека deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("После добавления 1 в начало дека deque = " + Arrays.toString(deque.toArray()));

        /* Извлечь элементы из дека */
        int popLast = deque.popLast();
        System.out.println("Извлечённый последний элемент = " + popLast + ", после извлечения из конца deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("Извлечённый первый элемент = " + popFirst + ", после извлечения из начала deque = " + Arrays.toString(deque.toArray()));

        /* Получить длину дека */
        int size = deque.size();
        System.out.println("Длина дека size = " + size);

        /* Проверить, пуст ли дек */
        boolean isEmpty = deque.isEmpty();
        System.out.println("Дек пуст = " + isEmpty);
    }
}
