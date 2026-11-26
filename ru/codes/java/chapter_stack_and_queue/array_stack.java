/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Стек на основе массива */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // Инициализировать список (динамический массив)
        stack = new ArrayList<>();
    }

    /* Получить размер стека */
    public int size() {
        return stack.size();
    }

    /* Проверить, пуст ли стек */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Поместить элемент в стек */
    public void push(int num) {
        stack.add(num);
    }

    /* Снять элемент со стека */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* Посмотреть элемент на вершине стека */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Преобразовать список в массив и вернуть его */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Инициализировать стек */
        ArrayStack stack = new ArrayStack();

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
