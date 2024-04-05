/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基於陣列實現的堆疊 */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // 初始化串列（動態陣列）
        stack = new ArrayList<>();
    }

    /* 獲取堆疊的長度 */
    public int size() {
        return stack.size();
    }

    /* 判斷堆疊是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入堆疊 */
    public void push(int num) {
        stack.add(num);
    }

    /* 出堆疊 */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* 訪問堆疊頂元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* 將 List 轉化為 Array 並返回 */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* 初始化堆疊 */
        ArrayStack stack = new ArrayStack();

        /* 元素入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + Arrays.toString(stack.toArray()));

        /* 訪問堆疊頂元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂元素 peek = " + peek);

        /* 元素出堆疊 */
        int pop = stack.pop();
        System.out.println("出堆疊元素 pop = " + pop + "，出堆疊後 stack = " + Arrays.toString(stack.toArray()));

        /* 獲取堆疊的長度 */
        int size = stack.size();
        System.out.println("堆疊的長度 size = " + size);

        /* 判斷是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
