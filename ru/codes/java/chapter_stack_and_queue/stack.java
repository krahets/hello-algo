/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        // [region]{init_stack}
        /* Инициализация стека */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* Помещение элемента в стек */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("Стек stack = " + stack);

        // [region]{peek}
        /* Доступ к верхнему элементу стека */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("Верхний элемент peek = " + peek);

        // [region]{pop}
        /* Извлечение элемента из стека */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("Извлеченный элемент pop = " + pop + ", stack после извлечения = " + stack);

        // [region]{size}
        /* Получение длины стека */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("Длина стека size = " + size);

        // [region]{is_empty}
        /* Проверка на пустоту */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Пуст ли стек = " + isEmpty);
    }
}
