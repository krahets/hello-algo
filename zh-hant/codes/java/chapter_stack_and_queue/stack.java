/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* 初始化堆疊 */
        Stack<Integer> stack = new Stack<>();

        /* 將元素推入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + stack);

        /* 讀取堆疊頂端的元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂端元素 peek = " + peek);

        /* 從堆疊彈出元素 */
        int pop = stack.pop();
        System.out.println("彈出的元素 pop = " + pop + "，彈出後 stack = " + stack);

        /* 取得堆疊長度 */
        int size = stack.size();
        System.out.println("堆疊長度 size = " + size);

        /* 判斷堆疊是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
