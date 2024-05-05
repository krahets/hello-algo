/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* Stack class based on linked list */
class LinkedListStack {
    private ListNode stackPeek; // Use the head node as the top of the stack
    private int stkSize = 0; // Length of the stack

    public LinkedListStack() {
        stackPeek = null;
    }

    /* Get the length of the stack */
    public int size() {
        return stkSize;
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* Convert the List to Array and return */
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
        /* Initialize stack */
        LinkedListStack stack = new LinkedListStack();

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
