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

        /* Поместить элементы в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Стек stack = " + stack);

        /* Посмотреть элемент на вершине стека */
        int peek = stack.peek();
        System.out.println("Элемент на вершине стека peek = " + peek);

        /* Снять элемент со стека */
        int pop = stack.pop();
        System.out.println("Снятый элемент pop = " + pop + ", после снятия stack = " + stack);

        /* Получить размер стека */
        int size = stack.size();
        System.out.println("Размер стека size = " + size);

        /* Проверить, пуст ли стек */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Стек пуст = " + isEmpty);
    }
}
