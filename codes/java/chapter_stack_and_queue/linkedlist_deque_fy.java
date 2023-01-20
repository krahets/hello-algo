/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-19
 * Author: FangYuan (374072213@qq.com)
 */

package chapter_stack_and_queue;

class LinkedListDeque {

    /* 双向链表结点 */
    private static class ListNode {
        int val; // 结点值
        ListNode prev; // 前驱结点引用（指针）
        ListNode next; // 后继结点引用（指针）

        public ListNode(int val) {
            this.val = val;
            prev = next = null;

        }
    }

    private ListNode front, rear; // 头结点 front ，尾结点 rear
    private int size = 0; // 双向队列的长度

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

    /* 从队首入队 */
    public void offerFirst(int num) {
        // 创建结点作为新的头结点
        ListNode newFront = new ListNode(num);

        // 如果队列长度为0，需令头、尾结点都指向该结点
        if (size() == 0) {
            front = rear = newFront;
        } else {
            // 将新头结点添加至链表头部
            front.prev = newFront;
            newFront.next = front;

            // 头结点指针指向新头结点
            front = newFront;
        }

        // 更新队列长度
        size++;
    }

    /* 从队尾入队 */
    public void offerLast(int num) {
        // 创建结点作为新的尾结点
        ListNode newRear = new ListNode(num);

        // 如果队列长度为0，需令头、尾结点都指向该结点
        if (size() == 0) {
            front = rear = newRear;
        } else {
            // 将新尾结点添加至链表尾部
            rear.next = newRear;
            newRear.prev = rear;

            // 尾结点指针指向新尾结点
            rear = newRear;
        }

        // 更新队列长度
        size++;
    }

    /* 从队首出队 */
    public Integer pollFirst() {
        if (size() != 0) {
            // 暂存头结点值
            int num = peekFirst();

            // 记录头结点的后继结点，它将作为新头结点
            ListNode next = front.next;
            // 删除原头结点
            if (next != null) {
                front.next = null;
                next.prev = null;
            }

            // 头结点指针指向新的头结点
            front = next;

            // 更新队列长度
            size--;

            return num;
        }

        return null;
    }

    /* 从队尾出队 */
    public Integer pollLast() {
        if (size() != 0) {
            // 暂存尾结点值
            int num = peekLast();

            // 记录尾结点的前驱结点，它将作为新尾结点
            ListNode prev = rear.prev;
            // 删除原尾结点
            if (prev != null) {
                rear.prev = null;
                prev.next = null;
            }

            // 尾结点指针指向新的尾结点
            rear = prev;

            // 更新队列长度
            size--;

            return num;
        }

        return null;
    }

    /* 访问队首元素 */
    public Integer peekFirst() {
        return front != null ? front.val : null;
    }

    /* 访问队尾元素 */
    public Integer peekLast() {
        return rear != null ? rear.val : null;
    }

}

public class linkedlist_deque_fy {
    public static void main(String[] args) {
        /* 初始化双向队列 */
        LinkedListDeque deque = new LinkedListDeque();

        /* 元素从头入队 */
        deque.offerFirst(1);
        deque.offerFirst(2);
        deque.offerFirst(3);

        /* 访问队首元素 */
        int first = deque.peekFirst();
        System.out.println("队首元素 first = " + first);

        /* 访问队尾元素 */
        int last = deque.peekLast();
        System.out.println("队尾元素 last = " + last);

        /* 元素从尾出队 123 */
        System.out.println(deque.pollLast());
        System.out.println(deque.pollLast());
        System.out.println(deque.pollLast());

        /* 元素从尾入队 */
        deque.offerLast(1);
        deque.offerLast(2);
        deque.offerLast(3);

        /* 元素从头出队 123 */
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());

        /* 元素从头入队 */
        deque.offerFirst(1);
        deque.offerFirst(2);

        /* 获取队列的长度 2 */
        int size = deque.size();
        System.out.println("队列长度 size = " + size);

        /* 元素从尾出队 1 */
        System.out.println(deque.pollLast());

        /* 元素从尾入队 */
        deque.offerLast(3);

        /* 元素从尾出队 3 */
        System.out.println(deque.pollLast());

        /* 元素从头入队 */
        deque.offerFirst(1);
        /* 元素从尾入队 */
        deque.offerLast(3);

        /* 元素从尾出队 3 */
        System.out.println(deque.pollLast());
        /* 元素从头出队 12 */
        System.out.println(deque.pollFirst());
        System.out.println(deque.pollFirst());

        /* 判断双向队列是否为空 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("双向队列是否为空 = " + isEmpty);
    }
}
