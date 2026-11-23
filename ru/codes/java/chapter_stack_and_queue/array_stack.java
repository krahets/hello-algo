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
        // Инициализация списка (динамического массива)
        stack = new ArrayList<>();
    }

    /* Получение длины стека */
    public int size() {
        return stack.size();
    }

    /* Проверка, пуст ли стек */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Поместить в стек */
    public void push(int num) {
        stack.add(num);
    }

    /* Извлечь из стека */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* Доступ к верхнему элементу стека */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Преобразовать List в Array и вернуть */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Инициализация стека */
        ArrayStack stack = new ArrayStack();

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
