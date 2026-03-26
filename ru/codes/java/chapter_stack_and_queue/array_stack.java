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

    /* Получить длину стека */
    public int size() {
        return stack.size();
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Преобразовать List в Array и вернуть его */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Инициализировать стек */
        ArrayStack stack = new ArrayStack();

        /* Поместить элемент в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("стек stack =" + Arrays.toString(stack.toArray()));

        /* Получить верхний элемент стека */
        int peek = stack.peek();
        System.out.println("вершина стекаэлемент peek =" + peek);

        /* Извлечь элемент из стека */
        int pop = stack.pop();
        System.out.println("извлечение из стекаэлемент pop =" + pop + ", извлечение из стекапосле stack =" + Arrays.toString(stack.toArray()));

        /* Получить длину стека */
        int size = stack.size();
        System.out.println("Длина стека size =" + size);

        /* Проверить, пуста ли структура */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Стек пуст:" + isEmpty);
    }
}
