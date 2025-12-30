/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Stack based on array implementation */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // Initialize list (dynamic array)
        stack = new ArrayList<>();
    }

    /* Get the length of the stack */
    public int size() {
        return stack.size();
    }

    /* Check if the stack is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Push */
    public void push(int num) {
        stack.add(num);
    }

    /* Pop */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* Return list for printing */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Convert List to Array and return */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Access top of the stack element */
        ArrayStack stack = new ArrayStack();

        /* Elements push onto stack */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Stack stack = " + Arrays.toString(stack.toArray()));

        /* Return list for printing */
        int peek = stack.peek();
        System.out.println("Stack top element peek = " + peek);

        /* Element pop from stack */
        int pop = stack.pop();
        System.out.println("Pop element pop = " + pop + ", after pop, stack = " + Arrays.toString(stack.toArray()));

        /* Get the length of the stack */
        int size = stack.size();
        System.out.println("Stack length size = " + size);

        /* Check if empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Stack is empty = " + isEmpty);
    }
}
