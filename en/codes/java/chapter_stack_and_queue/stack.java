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
        /* Initialize the stack */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* Push elements onto the stack */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("Stack stack = " + stack);

        // [region]{peek}
        /* Access the top element */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("Top element peek = " + peek);

        // [region]{pop}
        /* Pop an element from the stack */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("Popped element pop = " + pop + ", after popping, stack = " + stack);

        // [region]{size}
        /* Get the stack size */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("Stack size = " + size);

        // [region]{is_empty}
        /* Check whether it is empty */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("Is the stack empty = " + isEmpty);
    }
}
