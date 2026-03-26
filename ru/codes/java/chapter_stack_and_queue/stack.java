/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* Инициализировать стек */
        Stack<Integer> stack = new Stack<>();

        /* Поместить элемент в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("стек stack =" + stack);

        /* Получить верхний элемент стека */
        int peek = stack.peek();
        System.out.println("вершина стекаэлемент peek =" + peek);

        /* Извлечь элемент из стека */
        int pop = stack.pop();
        System.out.println("извлечение из стекаэлемент pop =" + pop + ", извлечение из стекапосле stack =" + stack);

        /* Получить длину стека */
        int size = stack.size();
        System.out.println("Длина стека size =" + size);

        /* Проверить, пуста ли структура */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Стек пуст:" + isEmpty);
    }
}
