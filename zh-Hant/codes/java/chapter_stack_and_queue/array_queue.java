/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基於環形陣列實現的佇列 */
class ArrayQueue {
    private int[] nums; // 用於儲存佇列元素的陣列
    private int front; // 佇列首指標，指向佇列首元素
    private int queSize; // 佇列長度

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 獲取佇列的容量 */
    public int capacity() {
        return nums.length;
    }

    /* 獲取佇列的長度 */
    public int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 入列 */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        int rear = (front + queSize) % capacity();
        // 將 num 新增至佇列尾
        nums[rear] = num;
        queSize++;
    }

    /* 出列 */
    public int pop() {
        int num = peek();
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 返回陣列 */
    public int[] toArray() {
        // 僅轉換有效長度範圍內的串列元素
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* 初始化佇列 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

        /* 元素入列 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("佇列 queue = " + Arrays.toString(queue.toArray()));

        /* 訪問佇列首元素 */
        int peek = queue.peek();
        System.out.println("佇列首元素 peek = " + peek);

        /* 元素出列 */
        int pop = queue.pop();
        System.out.println("出列元素 pop = " + pop + "，出列後 queue = " + Arrays.toString(queue.toArray()));

        /* 獲取佇列的長度 */
        int size = queue.size();
        System.out.println("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("佇列是否為空 = " + isEmpty);

        /* 測試環形陣列 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " 輪入列 + 出列後 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
