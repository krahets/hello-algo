/**
 * File: stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

public class stack {
    public static void main(String[] args) {
        /* 스택 초기화 */
        Stack<Integer> stack = new Stack<>();

        /* 스택에 원소 삽입 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("스택 stack = " + stack);

        /* 스택 맨 위 원소 접근 */
        int peek = stack.peek();
        System.out.println("스택 맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.pop();
        System.out.println("스택에서 꺼낸 원소 pop = " + pop + ", 스택에서 꺼낸 후 stack = " + stack);

        /* 스택의 길이 반환 */
        int size = stack.size();
        System.out.println("스택의 길이 size = " + size);

        /* 비어 있는지 판단 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("스택이 비어 있는가 = " + isEmpty);
    }
}
