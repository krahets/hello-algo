/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 配列を使ったスタック */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // リスト（動的配列）を初期化する
        stack = new ArrayList<>();
    }

    /* スタックの要素数を取得する */
    public int size() {
        return stack.size();
    }

    /* スタックが空かどうかを判定する */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* プッシュする */
    public void push(int num) {
        stack.add(num);
    }

    /* ポップする */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* スタックのトップを参照する */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* リストを配列に変換して返す */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* スタックを初期化する */
        ArrayStack stack = new ArrayStack();

        /* 要素をプッシュする */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("スタック stack = " + Arrays.toString(stack.toArray()));

        /* スタックのトップを参照する */
        int peek = stack.peek();
        System.out.println("スタックのトップの要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.pop();
        System.out.println("ポップした要素 pop = " + pop + "、ポップ後の stack = " + Arrays.toString(stack.toArray()));

        /* スタックの要素数を取得する */
        int size = stack.size();
        System.out.println("スタックの要素数 size = " + size);

        /* 空かどうかを判定する */
        boolean isEmpty = stack.isEmpty();
        System.out.println("スタックは空か = " + isEmpty);
    }
}
