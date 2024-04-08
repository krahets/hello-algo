/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基於鏈結串列實現的佇列 */
class LinkedListQueue {
    private ListNode front, rear; // 頭節點 front ，尾節點 rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 獲取佇列的長度 */
    public int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入列 */
    public void push(int num) {
        // 在尾節點後新增 num
        ListNode node = new ListNode(num);
        // 如果佇列為空，則令頭、尾節點都指向該節點
        if (front == null) {
            front = node;
            rear = node;
        // 如果佇列不為空，則將該節點新增到尾節點後
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出列 */
    public int pop() {
        int num = peek();
        // 刪除頭節點
        front = front.next;
        queSize--;
        return num;
    }

    /* 訪問佇列首元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 將鏈結串列轉化為 Array 並返回 */
    public int[] toArray() {
        ListNode node = front;
        int[] res = new int[size()];
        for (int i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_queue {
    public static void main(String[] args) {
        /* 初始化佇列 */
        LinkedListQueue queue = new LinkedListQueue();

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
    }
}
