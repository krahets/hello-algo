/**
 * File: array_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 以陣列實作堆疊 */
class ArrayStack {
    private ArrayList<Integer> stack;

    public ArrayStack() {
        // 初始化串列（動態陣列）
        stack = new ArrayList<>();
    }

    /* 取得堆疊長度 */
    public int size() {
        return stack.size();
    }

    /* 判斷堆疊是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 推入堆疊 */
    public void push(int num) {
        stack.add(num);
    }

    /* 彈出堆疊頂端的元素 */
    public int pop() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.remove(size() - 1);
    }

    /* 讀取堆疊頂端的元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stack.get(size() - 1);
    }

    /* 將串列轉成陣列並回傳 */
    public Object[] toArray() {
        return stack.toArray();
    }
}

public class array_stack {
    public static void main(String[] args) {
        /* 初始化堆疊 */
        ArrayStack stack = new ArrayStack();

        /* 將元素推入堆疊 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("堆疊 stack = " + Arrays.toString(stack.toArray()));

        /* 讀取堆疊頂端的元素 */
        int peek = stack.peek();
        System.out.println("堆疊頂端元素 peek = " + peek);

        /* 從堆疊彈出元素 */
        int pop = stack.pop();
        System.out.println("彈出的元素 pop = " + pop + "，彈出後 stack = " + Arrays.toString(stack.toArray()));

        /* 取得堆疊長度 */
        int size = stack.size();
        System.out.println("堆疊長度 size = " + size);

        /* 判斷堆疊是否為空 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("堆疊是否為空 = " + isEmpty);
    }
}
