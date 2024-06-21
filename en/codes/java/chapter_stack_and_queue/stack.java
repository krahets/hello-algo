/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* Initialize stack */
        Stack<Integer> stack = new Stack<>();

        /* Element push */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Stack stack = " + stack);

        /* Access stack top element */
        int peek = stack.peek();
        System.out.println("Top element peek = " + peek);

        /* Element pop */
        int pop = stack.pop();
        System.out.println("Popped element = " + pop + ", after popping" + stack);

        /* Get the length of the stack */
        int size = stack.size();
        System.out.println("Length of the stack size = " + size);

        /* Determine if it's empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Is the stack empty = " + isEmpty);
    }
}
