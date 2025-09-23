/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* スタックを初期化 */
        Stack<Integer> stack = new Stack<>();

        /* 要素をプッシュ */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("スタック stack = " + stack);

        /* スタックトップ要素にアクセス */
        int peek = stack.peek();
        System.out.println("スタックトップ要素 peek = " + peek);

        /* 要素をポップ */
        int pop = stack.pop();
        System.out.println("ポップした要素 = " + pop + "、ポップ後 " + stack);

        /* スタックの長さを取得 */
        int size = stack.size();
        System.out.println("スタックの長さ size = " + size);

        /* 空かどうかを判定 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("スタックが空か = " + isEmpty);
    }
}