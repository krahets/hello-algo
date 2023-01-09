/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* 初始化栈 */
        // 在 Java 中，推荐将 LinkedList 当作栈来使用
        LinkedList<Integer> stack = new LinkedList<>();

        /* 元素入栈 */
        stack.addLast(1);
        stack.addLast(3);
        stack.addLast(2);
        stack.addLast(5);
        stack.addLast(4);
        System.out.println("栈 stack = " + stack);

        /* 访问栈顶元素 */
        int peek = stack.peekLast();
        System.out.println("栈顶元素 peek = " + peek);

        /* 元素出栈 */
        int pop = stack.removeLast();
        System.out.println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack);

        /* 获取栈的长度 */
        int size = stack.size();
        System.out.println("栈的长度 size = " + size);

        /* 判断是否为空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("栈是否为空 = " + isEmpty);
    }
}
