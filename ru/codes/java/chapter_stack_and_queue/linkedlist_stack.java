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
    private ListNode stackPeek; // Первый узел списка служит вершиной стека
    private int stkSize = 0; // Размер стека

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Получить размер стека */
    public int size() {
        return stkSize;
    }

    /* Проверить, пуст ли стек */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Поместить элемент в стек */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* Снять элемент со стека */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* Посмотреть элемент на вершине стека */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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
        /* Инициализировать стек */
        LinkedListStack stack = new LinkedListStack();

        /* Поместить элементы в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Стек stack = " + Arrays.toString(stack.toArray()));

        /* Посмотреть элемент на вершине стека */
        int peek = stack.peek();
        System.out.println("Элемент на вершине стека peek = " + peek);

        /* Снять элемент со стека */
        int pop = stack.pop();
        System.out.println("Снятый элемент pop = " + pop + ", после снятия stack = " + Arrays.toString(stack.toArray()));

        /* Получить размер стека */
        int size = stack.size();
        System.out.println("Размер стека size = " + size);

        /* Проверить, пуст ли стек */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Стек пуст = " + isEmpty);
    }
}
