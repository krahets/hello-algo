/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 以鏈結串列實作佇列 */
class LinkedListQueue {
    private ListNode front, rear; // front 指向首節點，rear 指向尾節點
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 取得佇列長度 */
    public int size() {
        return queSize;
    }

    /* 判斷佇列是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入隊 */
    public void push(int num) {
        // 建立存有 num 的新節點，準備接到隊尾
        ListNode node = new ListNode(num);
        // 若佇列為空，讓隊首與隊尾都指向新節點
        if (front == null) {
            front = node;
            rear = node;
        // 若佇列非空，將新節點接在尾節點之後
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出隊 */
    public int pop() {
        int num = peek();
        // 移除首節點
        front = front.next;
        queSize--;
        return num;
    }

    /* 讀取隊首元素 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 將鏈結串列轉成陣列並回傳 */
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
    }
}
