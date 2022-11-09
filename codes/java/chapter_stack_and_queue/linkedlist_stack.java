package chapter_stack_and_queue;

import java.util.*;

/* 基于链表实现的栈 */
class LinkedListStack {
    LinkedList<Integer> list;
    public LinkedListStack() {
        // 初始化链表
        list = new LinkedList<>();
    }

    /* 获取栈的长度 */
    public int size() {
        return list.size();
    }

    /* 判断栈是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入栈 */
    public void push(int num) {
        list.addLast(num);
    }

    /* 出栈 */
    public int pop() {
        return list.removeLast();
    }

    /* 访问栈顶元素 */
    public int peek() {
        return list.getLast();
    }

    /* 将 List 转化为 Array 并返回 */
    public Object[] toArray() {
        return list.toArray();
    }
}

public class linkedlist_stack {
    public static void main(String[] args) {
        /* 初始化栈 */
        LinkedListStack stack = new LinkedListStack();

        /* 元素入栈 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("栈 stack = " + Arrays.toString(stack.toArray()));

        /* 访问栈顶元素 */
        int peek = stack.peek();
        System.out.println("栈顶元素 peek = " + peek);

        /* 元素出栈 */
        int pop = stack.pop();
        System.out.println("出栈元素 pop = " + pop + "，出栈后 stack = " + Arrays.toString(stack.toArray()));

        /* 获取栈的长度 */
        int size = stack.size();
        System.out.println("栈的长度 size = " + size);

        /* 判断是否为空 */
        boolean isEmpty = stack.isEmpty();
    }
}
