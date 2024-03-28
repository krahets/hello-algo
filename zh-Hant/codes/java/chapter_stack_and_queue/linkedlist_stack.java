/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack {
    private ListNode stackPeek; // 將頭節點作為堆疊頂
    private int stkSize = 0; // 堆疊的長度

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 獲取堆疊的長度 */
    public int size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入堆疊 */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* 出堆疊 */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* 訪問堆疊頂元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* 將 List 轉化為 Array 並返回 */
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

        /* 元素入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + Arrays.toString(stack.toArray()));

        /* 訪問堆疊頂元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂元素 peek = " + peek);

        /* 元素出堆疊 */
        int pop = stack.pop();
        System.out.println("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + Arrays.toString(stack.toArray()));

        /* 獲取堆疊的長度 */
        int size = stack.size();
        System.out.println("堆疊的長度 size = " + size);

        /* 判斷是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
