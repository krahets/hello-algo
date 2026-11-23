/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* Stack implemented with a linked list */
class LinkedListStack {
    private ListNode stackPeek; // Use the head node as the stack top
    private int stkSize = 0; // Stack size

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the stack size */
    public int size() {
        return stkSize;
    }

    /* Check whether the stack is empty */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* Push */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* Pop */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* Access the top element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* Convert the list to an array and return it */
    public int[] toArray() {
        ListNode node = stackPeek;
        int[] res = new int[size()];
        for (int i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    public static void main(String[] args) {
        /* Initialize the stack */
        LinkedListStack stack = new LinkedListStack();

        /* Push elements onto the stack */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("Stack stack = " + Arrays.toString(stack.toArray()));

        /* Access the top element */
        int peek = stack.peek();
        System.out.println("Top element peek = " + peek);

        /* Pop an element from the stack */
        int pop = stack.pop();
        System.out.println("Popped element pop = " + pop + ", after popping, stack = " + Arrays.toString(stack.toArray()));

        /* Get the stack size */
        int size = stack.size();
        System.out.println("Stack size = " + size);

        /* Check whether it is empty */
        boolean isEmpty = stack.isEmpty();
        System.out.println("Is the stack empty = " + isEmpty);
    }
}
