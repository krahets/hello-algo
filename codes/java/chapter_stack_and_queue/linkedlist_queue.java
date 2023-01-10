/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import include.*;

/* 基于链表实现的队列 */
class LinkedListQueue {
    private ListNode front, rear;  // 头结点 front ，尾结点 rear 
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 获取队列的长度 */
    public int size() {
        return queSize;
    }

    /* 判断队列是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 入队 */
    public void offer(int num) {
        // 尾结点后添加 num
        ListNode node = new ListNode(num);
        // 如果队列为空，则令头、尾结点都指向该结点
        if (front == null) {
            front = node;
            rear = node;
        // 如果队列不为空，则将该结点添加到尾结点后
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 出队 */
    public int poll() {
        int num = peek();
        // 删除头结点
        front = front.next;
        queSize--;
        return num;
    }

    /* 访问队首元素 */
    public int peek() {
        if (size() == 0)
            throw new EmptyStackException();
        return front.val;
    }

    /* 将链表转化为 Array 并返回 */
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
        /* 初始化队列 */
        LinkedListQueue queue = new LinkedListQueue();

        /* 元素入队 */
        queue.offer(1);
        queue.offer(3);
        queue.offer(2);
        queue.offer(5);
        queue.offer(4);
        System.out.println("队列 queue = " + Arrays.toString(queue.toArray()));

        /* 访问队首元素 */
        int peek = queue.peek();
        System.out.println("队首元素 peek = " + peek);

        /* 元素出队 */
        int poll = queue.poll();
        System.out.println("出队元素 poll = " + poll + "，出队后 queue = " + Arrays.toString(queue.toArray()));

        /* 获取队列的长度 */
        int size = queue.size();
        System.out.println("队列长度 size = " + size);

        /* 判断队列是否为空 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("队列是否为空 = " + isEmpty);
    }
}
