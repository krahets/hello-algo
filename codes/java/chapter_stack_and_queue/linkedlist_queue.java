/*
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 基于链表实现的队列 */
class LinkedListQueue {
    LinkedList<Integer> list;

    public LinkedListQueue() {
        // 初始化链表
        list = new LinkedList<>();
    }

    /* 获取队列的长度 */
    public int size() {
        return list.size();
    }

    /* 判断队列是否为空 */
    public boolean isEmpty() {
        return list.size() == 0;
    }

    /* 入队 */
    public void offer(int num) {
        // 尾结点后添加 num
        list.addLast(num);
    }

    /* 出队 */
    public int poll() {
        // 删除头结点
        return list.removeFirst();
    }

    /* 访问队首元素 */
    public int peek() {
        return list.getFirst();
    }

    /* 将 List 转化为 Array 并返回 */
    public Object[] toArray() {
        return list.toArray();
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
    }
}
