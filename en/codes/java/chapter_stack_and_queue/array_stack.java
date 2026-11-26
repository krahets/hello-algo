/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Array-backed stack */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // Initialize the list (a dynamic array)
        stack = new ArrayList<>();
    }

    /* Get the stack size */
    public int size() {
        return stack.size();
    }

    /* Check whether the stack is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Push an element onto the stack */
    public void push(int num) {
        stack.add(num);
    }

    /* Remove and return the top element */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* Peek at the top element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Return the list elements as an array */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Initialize the stack */
        ArrayStack stack = new ArrayStack();

        /* Push elements onto the stack */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("stack = " + Arrays.toString(stack.toArray()));

        /* Peek at the top element */
        int peek = stack.peek();
        System.out.println("Top element (peek) = " + peek);

        /* Pop the top element */
        int pop = stack.pop();
        System.out.println("Popped element (pop) = " + pop + ", stack after the pop = " + Arrays.toString(stack.toArray()));

        /* Get the stack size */
        int size = stack.size();
        System.out.println("Stack size = " + size);

        /* Check whether the stack is empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Stack is empty = " + isEmpty);
    }
}
