/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 雙向鏈結串列節點 */
class ListNode {
    int val; // 節點值
    ListNode next; // 後繼節點引用
    ListNode prev; // 前驅節點引用

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 基於雙向鏈結串列實現的雙向佇列 */
class LinkedListDeque {
    private ListNode front, rear; // 頭節點 front ，尾節點 rear
    private int queSize = 0; // 雙向佇列的長度

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 獲取雙向佇列的長度 */
    public int size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入列操作 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 佇列首入列操作
        else if (isFront) {
            // 將 node 新增至鏈結串列頭部
            front.prev = node;
            node.next = front;
            front = node; // 更新頭節點
        // 佇列尾入列操作
        } else {
            // 將 node 新增至鏈結串列尾部
            rear.next = node;
            node.prev = rear;
            rear = node; // 更新尾節點
        }
        queSize++; // 更新佇列長度
    }

    /* 佇列首入列 */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 佇列尾入列 */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 出列操作 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 佇列首出列操作
        if (isFront) {
            val = front.val; // 暫存頭節點值
            // 刪除頭節點
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext; // 更新頭節點
        // 佇列尾出列操作
        } else {
            val = rear.val; // 暫存尾節點值
            // 刪除尾節點
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev; // 更新尾節點
        }
        queSize--; // 更新佇列長度
        return val;
    }

    /* 佇列首出列 */
    public int popFirst() {
        return pop(true);
    }

    /* 佇列尾出列 */
    public int popLast() {
        return pop(false);
    }

    /* 訪問佇列首元素 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 訪問佇列尾元素 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 返回陣列用於列印 */
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
        /* 初始化雙向佇列 */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("雙向佇列 deque = " + Arrays.toString(deque.toArray()));

        /* 訪問元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("佇列首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("佇列尾元素 peekLast = " + peekLast);

        /* 元素入列 */
        deque.pushLast(4);
        System.out.println("元素 4 佇列尾入列後 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("元素 1 佇列首入列後 deque = " + Arrays.toString(deque.toArray()));

        /* 元素出列 */
        int popLast = deque.popLast();
        System.out.println("佇列尾出列元素 = " + popLast + "，佇列尾出列後 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("佇列首出列元素 = " + popFirst + "，佇列首出列後 deque = " + Arrays.toString(deque.toArray()));

        /* 獲取雙向佇列的長度 */
        int size = deque.size();
        System.out.println("雙向佇列長度 size = " + size);

        /* 判斷雙向佇列是否為空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("雙向佇列是否為空 = " + isEmpty);
    }
}
