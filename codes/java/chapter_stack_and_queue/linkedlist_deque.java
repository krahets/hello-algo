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
        ListNode next; // 下一个结点的指针
        ListNode prev; // 前一个结点的指针

        ListNode(ListNode prev, int val, ListNode next) {
            this.prev = prev;
            this.val = val;
            this.next = next;
        }
    }

    private ListNode front, rear; // 头结点 front ，尾结点 rear
    private int size = 0; // 双向队列的长度

    public LinkedListDeque() {
        front = null;
        rear = null;
    }

    /* 获取双向队列的长度 */
    public int size() {
        return size;
    }

    /* 判断双向队列是否为空 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 从头入队 */
    public void offerFirst(int num) {
        // 记录原头结点
        ListNode first = front;
        // 创建结点作为新的头结点，并将原头结点作为新头结点的下一个结点
        ListNode newNode = new ListNode(null, num, first);
        // 头结点指向新头结点
        front = newNode;

        // 如果队列为空，需令尾结点指向该结点
        if (first == null)
            rear = newNode;
        else
            // 如果队列不为空，则需将原头结点的前指针指向该结点，以构建双向链表
            first.prev = newNode;

        size++;
    }

    /* 从尾入队 */
    public void offerLast(int num) {
        // 记录原尾结点
        ListNode last = rear;
        // 创建结点作为新的尾结点，将原尾结点作为新尾结点的前一个结点
        ListNode newNode = new ListNode(last, num, null);
        // 尾结点指向新尾结点
        rear = newNode;

        // 如果队列为空，需令头结点指向该结点
        if (last == null)
            front = newNode;
        else
            // 如果队列不为空，则需将原尾结点的后指针指向该结点，以构建双向链表
            last.next = newNode;

        size++;
    }

    /* 从头出队 */
    public Integer pollFirst() {
        if (!isEmpty()) {
            // 记录头结点的下一个结点，它将作为新头结点
            ListNode next = front.next;
            // 删除头结点(1): 即头结点的后指针指向null
            front.next = null;

            int num = peekFirst();
            // 头结点指向新的头结点
            front = next;

            size--;

            // 如果双向队列出队后队列长度为0，需令尾结点为null
            if (next == null)
                rear = null;
            else
                // 如果双向队列出队后队列长度不为0，则需要完成删除头结点操作
                // 删除头结点(2): 新头结点前指针指向null
                next.prev = null;

            return num;
        }

        return null;
    }

    /* 从尾出队 */
    public Integer pollLast() {
        if (!isEmpty()) {
            // 记录尾结点的前一个结点，它将作为新尾结点
            ListNode prev = rear.prev;
            // 删除尾结点(1): 即尾结点的前指针指向null
            rear.prev = null;

            int num = peekLast();
            // 尾结点指向新的尾结点
            rear = prev;

            size--;

            // 如果双向队列出队后队列长度为0，需令头结点为null
            if (prev == null)
                front = null;
            else
                // 如果双向队列出队后队列长度不为0，则需要完成删除尾结点操作
                // 删除尾结点(2): 新尾结点后指针指向null
                prev.next = null;

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

public class linkedlist_deque {
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
