/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* 以鏈結串列實作堆疊 */
class LinkedListStack {
    private ListNode stackPeek; // 以首節點作為堆疊頂端
    private int stkSize = 0; // 堆疊長度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 取得堆疊長度 */
    public int size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 推入堆疊 */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* 彈出堆疊頂端的元素 */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* 讀取堆疊頂端的元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
        /* 初始化堆疊 */
        LinkedListStack stack = new LinkedListStack();

        /* 將元素推入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + Arrays.toString(stack.toArray()));

        /* 讀取堆疊頂端的元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂端元素 peek = " + peek);

        /* 從堆疊彈出元素 */
        int pop = stack.pop();
        System.out.println("彈出的元素 pop = " + pop + "，彈出後 stack = " + Arrays.toString(stack.toArray()));

        /* 取得堆疊長度 */
        int size = stack.size();
        System.out.println("堆疊長度 size = " + size);

        /* 判斷堆疊是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
