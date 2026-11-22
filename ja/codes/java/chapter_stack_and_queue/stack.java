/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* スタックを初期化する */
        Stack<Integer> stack = new Stack<>();

        /* 要素をプッシュする */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("スタック stack = " + stack);

        /* スタックの先頭要素にアクセスする */
        int peek = stack.peek();
        System.out.println("スタックの先頭要素 peek = " + peek);

        /* 要素をポップする */
        int pop = stack.pop();
        System.out.println("ポップした要素 pop = " + pop + "、ポップ後 stack = " + stack);

        /* スタックの長さを取得する */
        int size = stack.size();
        System.out.println("スタックの長さ size = " + size);

        /* 空かどうかを判定する */
        boolean isEmpty = stack.isEmpty();
        System.out.println("スタックは空か = " + isEmpty);
    }
}
