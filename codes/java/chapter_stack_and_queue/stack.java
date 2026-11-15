/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        // [region]{init_stack}
        /* 初始化栈 */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* 元素入栈 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("栈 stack = " + stack);

        // [region]{peek}
        /* 访问栈顶元素 */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("栈顶元素 peek = " + peek);

        // [region]{pop}
        /* 元素出栈 */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("出栈元素 pop = " + pop + "，出栈后 stack = " + stack);

        // [region]{size}
        /* 获取栈的长度 */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("栈的长度 size = " + size);

        // [region]{is_empty}
        /* 判断是否为空 */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("栈是否为空 = " + isEmpty);
    }
}
