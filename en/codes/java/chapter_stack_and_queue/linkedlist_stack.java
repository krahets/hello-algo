/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* Stack based on linked list implementation */
class LinkedListStack {
    private ListNode stackPeek; // Use head node as stack top
    private int stkSize = 0; // Stack length

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the length of the stack */
    public int size() {
        return stkSize;
    }

    /* Check if the stack is empty */
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

    /* Return list for printing */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* Convert List to Array and return */
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
        /* Access top of the stack element */
        LinkedListStack stack = new LinkedListStack();

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
