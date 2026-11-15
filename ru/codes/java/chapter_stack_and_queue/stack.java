/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* Инициализация стека */
        Stack<Integer> stack = new Stack<>();

        /* Помещение элемента в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Стек stack = " + stack);

        /* Доступ к верхнему элементу стека */
        int peek = stack.peek();
        System.out.println("Верхний элемент peek = " + peek);

        /* Извлечение элемента из стека */
        int pop = stack.pop();
        System.out.println("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + stack);

        /* Получение длины стека */
        int size = stack.size();
        System.out.println("Длина стека size = " + size);

        /* Проверка на пустоту */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Пуст ли стек = " + isEmpty);
    }
}
