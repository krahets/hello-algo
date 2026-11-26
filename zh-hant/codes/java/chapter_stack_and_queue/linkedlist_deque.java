/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 雙向鏈結串列的節點 */
class ListNode {
    int val; // 節點值
    ListNode next; // 指向下一個節點的參照
    ListNode prev; // 指向上一個節點的參照

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 以雙向鏈結串列實作雙端佇列 */
class LinkedListDeque {
    private ListNode front, rear; // front 指向首節點，rear 指向尾節點
    private int queSize = 0; // 雙端佇列長度

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 取得雙端佇列長度 */
    public int size() {
        return queSize;
    }

    /* 判斷雙端佇列是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 加入元素 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 若鏈結串列為空，讓 front 和 rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 從隊首加入元素
        else if (isFront) {
            // 將 node 加到鏈結串列的開頭
            front.prev = node;
            node.next = front;
            front = node; // 更新首節點
        // 從隊尾加入元素
        } else {
            // 將 node 加到鏈結串列的末端
            rear.next = node;
            node.prev = rear;
            rear = node; // 更新尾節點
        }
        queSize++; // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 從隊尾加入元素 */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 取出元素 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 佇列長度為 1 時，首尾兩端指向同一個節點
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // 從隊首取出元素
        else if (isFront) {
            val = front.val; // 暫存首節點的值
            // 移除首節點
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // 更新首節點
        // 從隊尾取出元素
        } else {
            val = rear.val; // 暫存尾節點的值
            // 移除尾節點
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // 更新尾節點
        }
        queSize--; // 將雙端佇列長度減 1
        return val;
    }

    /* 從隊首取出元素 */
    public int popFirst() {
        return pop(true);
    }

    /* 從隊尾取出元素 */
    public int popLast() {
        return pop(false);
    }

    /* 讀取隊首元素 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 讀取隊尾元素 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 回傳陣列以便輸出 */
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

public class linkedlist_deque {
    public static void main(String[] args) {
        /* 初始化雙端佇列 */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("雙端佇列 deque = " + Arrays.toString(deque.toArray()));

        /* 讀取隊首與隊尾元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("隊首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("隊尾元素 peekLast = " + peekLast);

        /* 將元素加入雙端佇列 */
        deque.pushLast(4);
        System.out.println("將元素 4 加到隊尾後 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("將元素 1 加到隊首後 deque = " + Arrays.toString(deque.toArray()));

        /* 從雙端佇列取出元素 */
        int popLast = deque.popLast();
        System.out.println("從隊尾取出的元素 = " + popLast + "，從隊尾取出後 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("從隊首取出的元素 = " + popFirst + "，從隊首取出後 deque = " + Arrays.toString(deque.toArray()));

        /* 取得雙端佇列長度 */
        int size = deque.size();
        System.out.println("雙端佇列長度 size = " + size);

        /* 判斷雙端佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙端佇列是否為空 = " + isEmpty);
    }
}
