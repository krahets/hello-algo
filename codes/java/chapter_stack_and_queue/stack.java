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
        // 在 Java 中，推荐将 ArrayList 当作栈来使用
        List<Integer> stack = new ArrayList<>();

        /* 元素入栈 */
        stack.add(1);
        stack.add(3);
        stack.add(2);
        stack.add(5);
        stack.add(4);
        System.out.println("栈 stack = " + stack);

        /* 访问栈顶元素 */
        int peek = stack.get(stack.size() - 1);
        System.out.println("栈顶元素 peek = " + peek);

        /* 元素出栈 */
        int pop = stack.remove(stack.size() - 1);
        System.out.println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack);

        /* 获取栈的长度 */
        int size = stack.size();
        System.out.println("栈的长度 size = " + size);

        /* 判断是否为空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("栈是否为空 = " + isEmpty);
    }
}
