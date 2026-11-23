/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* Стек на основе связного списка */
class LinkedListStack {
    private ListNode stackPeek; // Использовать головной узел как вершину стека
    private int stkSize = 0; // Длина стека

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Получение длины стека */
    public int size() {
        return stkSize;
    }

    /* Проверка, пуст ли стек */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Поместить в стек */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* Извлечь из стека */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* Доступ к верхнему элементу стека */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* Преобразовать List в Array и вернуть */
    public int[] toArray() {
        ListNode node = stackPeek;
        int[] res = new int[size()];
        for (int i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    public static void main(String[] args) {
        /* Инициализация стека */
        LinkedListStack stack = new LinkedListStack();

        /* Помещение элемента в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Стек stack = " + Arrays.toString(stack.toArray()));

        /* Доступ к верхнему элементу стека */
        int peek = stack.peek();
        System.out.println("Верхний элемент peek = " + peek);

        /* Извлечение элемента из стека */
        int pop = stack.pop();
        System.out.println("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + Arrays.toString(stack.toArray()));

        /* Получение длины стека */
        int size = stack.size();
        System.out.println("Длина стека size = " + size);

        /* Проверка на пустоту */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Пуст ли стек = " + isEmpty);
    }
}
