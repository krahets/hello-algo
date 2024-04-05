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

        /* 元素入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + stack);

        /* 訪問堆疊頂元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂元素 peek = " + peek);

        /* 元素出堆疊 */
        int pop = stack.pop();
        System.out.println("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + stack);

        /* 獲取堆疊的長度 */
        int size = stack.size();
        System.out.println("堆疊的長度 size = " + size);

        /* 判斷是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
