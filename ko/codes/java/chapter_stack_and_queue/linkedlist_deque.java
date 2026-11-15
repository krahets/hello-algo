/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 이중 연결 리스트 노드 */
class ListNode {
    int val; // 노드 값
    ListNode next; // 다음 노드 참조
    ListNode prev; // 이전 노드 참조

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private ListNode front, rear; // 머리 노드 front, 꼬리 노드 rear
    private int queSize = 0; // 덱의 길이

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 덱의 길이 반환 */
    public int size() {
        return queSize;
    }

    /* 덱이 비어 있는지 판단 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 큐 삽입 연산 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (isEmpty())
            front = rear = node;
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // node를 연결 리스트의 맨 앞에 추가한다
            front.prev = node;
            node.next = front;
            front = node; // 머리 노드를 갱신한다
        // 맨 뒤에 삽입하는 연산
        } else {
            // node를 연결 리스트의 맨 뒤에 추가한다
            rear.next = node;
            node.prev = rear;
            rear = node; // 꼬리 노드를 갱신한다
        }
        queSize++; // 큐 길이를 갱신한다
    }

    /* 맨 앞에 삽입 */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 맨 뒤에 삽입 */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 큐에서 꺼내는 연산 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = front.val; // 머리 노드의 값을 임시로 저장한다
            // 머리 노드를 삭제한다
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // 머리 노드를 갱신한다
        // 맨 뒤에서 꺼내는 연산
        } else {
            val = rear.val; // 꼬리 노드의 값을 임시로 저장한다
            // 꼬리 노드를 삭제한다
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // 꼬리 노드를 갱신한다
        }
        queSize--; // 큐 길이를 갱신한다
        return val;
    }

    /* 맨 앞에서 꺼내기 */
    public int popFirst() {
        return pop(true);
    }

    /* 맨 뒤에서 꺼내기 */
    public int popLast() {
        return pop(false);
    }

    /* 맨 앞 원소 접근 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 맨 뒤 원소 접근 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 출력에 사용할 배열 반환 */
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
        /* 덱 초기화 */
        LinkedListDeque deque = new LinkedListDeque();
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        System.out.println("덱 deque = " + Arrays.toString(deque.toArray()));

        /* 원소 접근 */
        int peekFirst = deque.peekFirst();
        System.out.println("맨 앞 원소 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("맨 뒤 원소 peekLast = " + peekLast);

        /* 큐에 원소 삽입 */
        deque.pushLast(4);
        System.out.println("원소 4를 맨 뒤에 삽입한 후 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("원소 1을 맨 앞에 삽입한 후 deque = " + Arrays.toString(deque.toArray()));

        /* 큐에서 원소 꺼내기 */
        int popLast = deque.popLast();
        System.out.println("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + Arrays.toString(deque.toArray()));

        /* 덱의 길이 반환 */
        int size = deque.size();
        System.out.println("덱 길이 size = " + size);

        /* 덱이 비어 있는지 판단 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("덱이 비어 있는가 = " + isEmpty);
    }
}
