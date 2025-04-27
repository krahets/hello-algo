/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* Stack class based on array */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // Initialize the list (dynamic array)
        stack = new ArrayList<>();
    }

    /* Get the length of the stack */
    public int size() {
        return stack.size();
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* Convert the List to Array and return */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* Initialize stack */
        ArrayStack stack = new ArrayStack();

        /* Element push */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Stack stack = " + Arrays.toString(stack.toArray()));

        /* Access stack top element */
        int peek = stack.peek();
        System.out.println("Top element peek = " + peek);

        /* Element pop */
        int pop = stack.pop();
        System.out.println("Popped element = " + pop + ", after popping" + Arrays.toString(stack.toArray()));

        /* Get the length of the stack */
        int size = stack.size();
        System.out.println("Length of the stack size = " + size);

        /* Determine if it's empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Is the stack empty = " + isEmpty);
    }
}
