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
    private void offer(int num, boolean isFront) {
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
    public void offerFirst(int num) {
        offer(num, true);
    }

    /* 队尾入队 */
    public void offerLast(int num) {
        offer(num, false);
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

    /* 打印双向队列 */
    public void print() {
        if (isEmpty()) {
            System.out.println("[ ]");
            return;
        }
        List<String> list = new ArrayList<>();
        ListNode head = front;
        while (head != null) {
            list.add(String.valueOf(head.val));
            head = head.next;
        }
        System.out.println("[" + String.join(" <-> ", list) + "]");
    }
}

public class linkedlist_deque {
    public static void main(String[] args) {
        /* 初始化双向队列 */
        LinkedListDeque deque = new LinkedListDeque();
        System.out.println("初始化空队列");
        deque.print();

        int[] nums = { 1, 2, 3 }; // 测试数据

        /* 队尾入队 */
        for (int num : nums) {
            deque.offerLast(num);
            System.out.printf("元素 %d 队尾入队后，队列为\n", num);
            deque.print();
        }
        /* 获取队尾元素 */
        int last = deque.peekLast();
        System.out.printf("队尾元素为 %d\n", last);
        /* 队尾出队 */
        while (!deque.isEmpty()) {
            last = deque.pollLast();
            System.out.printf("队尾出队元素为 %d ，队列为\n", last);
            deque.print();
        }

        /* 队首入队 */
        for (int num : nums) {
            deque.offerFirst(num);
            System.out.printf("元素 %d 队首入队后，队列为\n", num);
            deque.print();
        }
        /* 获取队尾元素 */
        int first = deque.peekFirst();
        System.out.printf("队首元素为 %d\n", first);
        /* 队首出队 */
        while (!deque.isEmpty()) {
            first = deque.pollFirst();
            System.out.printf("队首出队元素为 %d ，队列为\n", first);
            deque.print();
        }

        /* 获取队列的长度 */
        int size = deque.size();
        System.out.println("队列长度 size = " + size);

        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
