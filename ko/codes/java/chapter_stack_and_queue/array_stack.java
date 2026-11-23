/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 배열로 구현한 스택 */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // 리스트(동적 배열)를 초기화한다
        stack = new ArrayList<>();
    }

    /* 스택의 길이 반환 */
    public int size() {
        return stack.size();
    }

    /* 스택이 비어 있는지 판단 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 스택에 삽입 */
    public void push(int num) {
        stack.add(num);
    }

    /* 스택에서 꺼내기 */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* 스택 맨 위 원소 접근 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* List를 Array로 변환하여 반환 */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* 스택 초기화 */
        ArrayStack stack = new ArrayStack();

        /* 스택에 원소 삽입 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("스택 stack = " + Arrays.toString(stack.toArray()));

        /* 스택 맨 위 원소 접근 */
        int peek = stack.peek();
        System.out.println("스택 맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.pop();
        System.out.println("스택에서 꺼낸 원소 pop = " + pop + ", 스택에서 꺼낸 후 stack = " + Arrays.toString(stack.toArray()));

        /* 스택의 길이 반환 */
        int size = stack.size();
        System.out.println("스택의 길이 size = " + size);

        /* 비어 있는지 판단 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("스택이 비어 있는가 = " + isEmpty);
    }
}
