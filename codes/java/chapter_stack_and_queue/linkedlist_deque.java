/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 双向链表结点 */
class ListNode {
    int val;       // 结点值
    ListNode next; // 后继结点引用（指针）
    ListNode prev; // 前驱结点引用（指针）
    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 基于双向链表实现的双向队列 */
class LinkedListDeque {
    private ListNode front, rear; // 头结点 front ，尾结点 rear
    private int size = 0;         // 双向队列的长度

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 获取双向队列的长度 */
    public int size() {
        return size;
    }

    /* 判断双向队列是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入队操作 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 若链表为空，则令 front, rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 队首入队操作
        else if (isFront) {
            // 将 node 添加至链表头部
            front.prev = node;
            node.next = front;
            front = node; // 更新头结点
        // 队尾入队操作
        } else {
            // 将 node 添加至链表尾部
            rear.next = node;
            node.prev = rear;
            rear = node;  // 更新尾结点
        }
        size++; // 更新队列长度
    }

    /* 队首入队 */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 队尾入队 */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 出队操作 */
    private Integer poll(boolean isFront) {
        // 若队列为空，直接返回 null
        if (isEmpty())
            return null;
        int val;
        // 队首出队操作
        if (isFront) {
            val = front.val; // 暂存头结点值
            // 删除头结点
            ListNode fNext = front.next;
            if (fNext != null) {
                fNext.prev = null;
                front.next = null;
            }
            front = fNext;   // 更新头结点
        // 队尾出队操作
        } else {
            val = rear.val;  // 暂存尾结点值
            // 删除尾结点
            ListNode rPrev = rear.prev;
            if (rPrev != null) {
                rPrev.next = null;
                rear.prev = null;
            }
            rear = rPrev;    // 更新尾结点
        }
        size--; // 更新队列长度
        return val;
    }

    /* 队首出队 */
    public Integer pollFirst() {
        return poll(true);
    }

    /* 队尾出队 */
    public Integer pollLast() {
        return poll(false);
    }

    /* 访问队首元素 */
    public Integer peekFirst() {
        return isEmpty() ? null : front.val;
    }

    /* 访问队尾元素 */
    public Integer peekLast() {
        return isEmpty() ? null : rear.val;
    }

    /* 返回数组用于打印 */
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
        /* 初始化双向队列 */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("双向队列 deque = " + Arrays.toString(deque.toArray()));

        /* 访问元素 */
        int peekFirst = deque.peekFirst();
        System.out.println("队首元素 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("队尾元素 peekLast = " + peekLast);

        /* 元素入队 */
        deque.pushLast(4);
        System.out.println("元素 4 队尾入队后 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("元素 1 队首入队后 deque = " + Arrays.toString(deque.toArray()));

        /* 元素出队 */
        int pollLast = deque.pollLast();
        System.out.println("队尾出队元素 = " + pollLast + "，队尾出队后 deque = " + Arrays.toString(deque.toArray()));
        int pollFirst = deque.pollFirst();
        System.out.println("队首出队元素 = " + pollFirst + "，队首出队后 deque = " + Arrays.toString(deque.toArray()));

        /* 获取双向队列的长度 */
        int size = deque.size();
        System.out.println("双向队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
