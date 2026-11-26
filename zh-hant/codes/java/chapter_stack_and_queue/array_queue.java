/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 以環狀陣列實作佇列 */
class ArrayQueue {
    private int[] nums; // 存放佇列元素的陣列
    private int front; // 隊首索引，記錄隊首元素在陣列中的位置
    private int queSize; // 佇列長度

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 取得佇列容量 */
    public int capacity() {
        return nums.length;
    }

    /* 取得佇列長度 */
    public int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 入隊 */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        int rear = (front + queSize) % capacity();
        // 將 num 加到隊尾
        nums[rear] = num;
        queSize++;
    }

    /* 出隊 */
    public int pop() {
        int num = peek();
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 回傳陣列 */
    public int[] toArray() {
        // 只轉換佇列中實際存放的元素
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

        /* 將元素加入佇列 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("佇列 queue = " + Arrays.toString(queue.toArray()));

        /* 讀取隊首元素 */
        int peek = queue.peek();
        System.out.println("隊首元素 peek = " + peek);

        /* 從佇列取出元素 */
        int pop = queue.pop();
        System.out.println("出隊元素 pop = " + pop + "，出隊後 queue = " + Arrays.toString(queue.toArray()));

        /* 取得佇列長度 */
        int size = queue.size();
        System.out.println("佇列長度 size = " + size);

        /* 判斷佇列是否為空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("佇列是否為空 = " + isEmpty);

        /* 測試環狀陣列 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("第 " + i + " 輪入隊 + 出隊後 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
