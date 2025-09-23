/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 配列に基づくスタッククラス */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // リスト（動的配列）を初期化
        stack = new ArrayList<>();
    }

    /* スタックの長さを取得 */
    public int size() {
        return stack.size();
    }

    /* スタックが空かどうかを判定 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* プッシュ */
    public void push(int num) {
        stack.add(num);
    }

    /* ポップ */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* スタックトップ要素にアクセス */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* List を Array に変換して返す */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* スタックを初期化 */
        ArrayStack stack = new ArrayStack();

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