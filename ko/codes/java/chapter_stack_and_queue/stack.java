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
        /* 스택 초기화 */
        Stack<Integer> stack = new Stack<>();
        // [endregion]{init_stack}

        // [region]{push}
        /* 스택에 원소 삽입 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        // [endregion]{push}
        System.out.println("스택 stack = " + stack);

        // [region]{peek}
        /* 스택 맨 위 원소 접근 */
        int peek = stack.peek();
        // [endregion]{peek}
        System.out.println("스택 맨 위 원소 peek = " + peek);

        // [region]{pop}
        /* 스택에서 원소 꺼내기 */
        int pop = stack.pop();
        // [endregion]{pop}
        System.out.println("스택에서 꺼낸 원소 pop = " + pop + ", 스택에서 꺼낸 후 stack = " + stack);

        // [region]{size}
        /* 스택의 길이 반환 */
        int size = stack.size();
        // [endregion]{size}
        System.out.println("스택의 길이 size = " + size);

        // [region]{is_empty}
        /* 비어 있는지 판단 */
        boolean isEmpty = stack.isEmpty();
        // [endregion]{is_empty}
        System.out.println("스택이 비어 있는가 = " + isEmpty);
    }
}
