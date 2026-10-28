/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    private ListNode front, rear; // 머리 노드 front, 꼬리 노드 rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 큐의 길이 반환 */
    public int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 판단 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 큐에 삽입 */
    public void push(int num) {
        // 꼬리 노드 뒤에 num을 추가한다
        ListNode node = new ListNode(num);
        // 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
        if (front == null) {
            front = node;
            rear = node;
        // 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int pop() {
        int num = peek();
        // 머리 노드를 삭제한다
        front = front.next;
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 연결 리스트를 Array로 변환하여 반환 */
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
        /* 큐 초기화 */
        LinkedListQueue queue = new LinkedListQueue();

        /* 큐에 원소 삽입 */
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        System.out.println("큐 queue = " + Arrays.toString(queue.toArray()));

        /* 맨 앞 원소 접근 */
        int peek = queue.peek();
        System.out.println("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.pop();
        System.out.println("큐에서 꺼낸 원소 pop = " + pop + ", 큐에서 꺼낸 후 queue = " + Arrays.toString(queue.toArray()));

        /* 큐의 길이 반환 */
        int size = queue.size();
        System.out.println("큐 길이 size = " + size);

        /* 큐가 비어 있는지 판단 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("큐가 비어 있는가 = " + isEmpty);
    }
}
