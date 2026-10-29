/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* 連結リストで実装したスタック */
class LinkedListStack {
    private ListNode stackPeek; // 先頭ノードをスタックの先頭とする
    private int stkSize = 0; // スタックの長さ

    public LinkedListStack() {
        stackPeek = null;
    }

    /* スタックの長さを取得する */
    public int size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* プッシュ */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* ポップ */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* スタックの先頭要素にアクセスする */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* List を Array に変換して返す */
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
        /* スタックを初期化する */
        LinkedListStack stack = new LinkedListStack();

        /* 要素をプッシュする */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("スタック stack = " + Arrays.toString(stack.toArray()));

        /* スタックの先頭要素にアクセスする */
        int peek = stack.peek();
        System.out.println("スタックの先頭要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.pop();
        System.out.println("ポップした要素 pop = " + pop + "、ポップ後 stack = " + Arrays.toString(stack.toArray()));

        /* スタックの長さを取得する */
        int size = stack.size();
        System.out.println("スタックの長さ size = " + size);

        /* 空かどうかを判定する */
        boolean isEmpty = stack.isEmpty();
        System.out.println("スタックは空か = " + isEmpty);
    }
}
