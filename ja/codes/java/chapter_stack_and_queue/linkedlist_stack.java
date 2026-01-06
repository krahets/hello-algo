/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* 連結リストに基づくスタッククラス */
class LinkedListStack {
    private ListNode stackPeek; // ヘッドノードをスタックトップとして使用
    private int stkSize = 0; // スタックの長さ

    public LinkedListStack() {
        stackPeek = null;
    }

    /* スタックの長さを取得 */
    public int size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定 */
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

    /* スタックトップ要素にアクセス */
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
        /* スタックを初期化 */
        LinkedListStack stack = new LinkedListStack();

        /* 要素をプッシュ */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("スタック stack = " + Arrays.toString(stack.toArray()));

        /* スタックトップ要素にアクセス */
        int peek = stack.peek();
        System.out.println("スタックトップ要素 peek = " + peek);

        /* 要素をポップ */
        int pop = stack.pop();
        System.out.println("ポップした要素 = " + pop + "、ポップ後 " + Arrays.toString(stack.toArray()));

        /* スタックの長さを取得 */
        int size = stack.size();
        System.out.println("スタックの長さ size = " + size);

        /* 空かどうかを判定 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("スタックが空か = " + isEmpty);
    }
}