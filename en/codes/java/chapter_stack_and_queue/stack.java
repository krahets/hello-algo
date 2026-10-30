/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* Initialize the stack */
        Stack<Integer> stack = new Stack<>();

        /* Push elements onto the stack */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Stack stack = " + stack);

        /* Access the top element */
        int peek = stack.peek();
        System.out.println("Top element peek = " + peek);

        /* Pop an element from the stack */
        int pop = stack.pop();
        System.out.println("Popped element pop = " + pop + ", after popping, stack = " + stack);

        /* Get the stack size */
        int size = stack.size();
        System.out.println("Stack size = " + size);

        /* Check whether it is empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Is the stack empty = " + isEmpty);
    }
}
