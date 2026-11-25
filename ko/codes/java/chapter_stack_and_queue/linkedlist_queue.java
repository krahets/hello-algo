/**
 * File: linkedlist_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 연결 리스트로 구현한 큐 */
class LinkedListQueue {
    private ListNode front, rear; // 첫 노드 front와 마지막 노드 rear
    private int queSize = 0;

    public LinkedListQueue() {
        front = null;
        rear = null;
    }

    /* 큐의 길이 조회 */
    public int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 확인 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 큐에 삽입 */
    public void push(int num) {
        // 마지막 노드 뒤에 num을 추가한다
        ListNode node = new ListNode(num);
        // 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
        if (front == null) {
            front = node;
            rear = node;
        // 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
        } else {
            rear.next = node;
            rear = node;
        }
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int pop() {
        int num = peek();
        // 첫 노드 삭제
        front = front.next;
        queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 연결 리스트를 배열로 변환해 반환한다 */
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

        /* 맨 앞 원소 조회 */
        int peek = queue.peek();
        System.out.println("맨 앞 원소 peek = " + peek);

        /* 큐에서 원소 꺼내기 */
        int pop = queue.pop();
        System.out.println("꺼낸 원소 pop = " + pop + ", 꺼낸 후 queue = " + Arrays.toString(queue.toArray()));

        /* 큐의 길이 조회 */
        int size = queue.size();
        System.out.println("큐의 길이 size = " + size);

        /* 큐가 비어 있는지 확인 */
        boolean isEmpty = queue.isEmpty();
        System.out.println("큐가 비어 있는가 = " + isEmpty);
    }
}
