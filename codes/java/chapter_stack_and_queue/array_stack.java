package chapter_stack_and_queue;

import java.util.*;

/* 基于数组实现的栈 */
class ArrayStack {
    ArrayList<Integer> list;
    public ArrayStack() {
        // 初始化列表（动态数组）
        list = new ArrayList<>();
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
        list.add(num);
    }

    /* 出栈 */
    public int pop() {
        return list.remove(size() - 1);
    }

    /* 访问栈顶元素 */
    public int peek() {
        return list.get(size() - 1);
    }

    /* 访问索引 index 处元素 */
    public int get(int index) {
        return list.get(index);
    }

    /* 将 List 转化为 Array 并返回 */
    public Object[] toArray() {
        return list.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* 初始化栈 */
        ArrayStack stack = new ArrayStack();

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
