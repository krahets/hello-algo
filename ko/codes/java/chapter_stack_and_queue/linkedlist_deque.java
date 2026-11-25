/**
 * File: linkedlist_deque.java
 * Created Time: 2023-01-20
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 이중 연결 리스트의 노드 */
class ListNode {
    int val; // 노드의 값
    ListNode next; // 다음 노드에 대한 참조
    ListNode prev; // 이전 노드에 대한 참조

    ListNode(int val) {
        this.val = val;
        prev = next = null;
    }
}

/* 이중 연결 리스트로 구현한 덱 */
class LinkedListDeque {
    private ListNode front, rear; // 첫 노드 front와 마지막 노드 rear
    private int queSize = 0; // 덱의 길이

    public LinkedListDeque() {
        front = rear = null;
    }

    /* 덱의 길이 조회 */
    public int size() {
        return queSize;
    }

    /* 덱이 비어 있는지 확인 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 삽입 연산 */
    private void push(int num, boolean isFront) {
        ListNode node = new ListNode(num);
        // 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
        if (isEmpty())
            front = rear = node;
        // 맨 앞에 삽입하는 연산
        else if (isFront) {
            // 연결 리스트의 맨 앞에 node를 추가한다
            front.prev = node;
            node.next = front;
            front = node; // 첫 노드 갱신
        // 맨 뒤에 삽입하는 연산
        } else {
            // 연결 리스트의 맨 뒤에 node를 추가한다
            rear.next = node;
            node.prev = rear;
            rear = node; // 마지막 노드 갱신
        }
        queSize++; // 덱의 길이 갱신
    }

    /* 맨 앞에 삽입 */
    public void pushFirst(int num) {
        push(num, true);
    }

    /* 맨 뒤에 삽입 */
    public void pushLast(int num) {
        push(num, false);
    }

    /* 삭제 연산 */
    private int pop(boolean isFront) {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        int val;
        // 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
        if (queSize == 1) {
            val = front.val;
            front = null;
            rear = null;
        }
        // 맨 앞에서 꺼내는 연산
        else if (isFront) {
            val = front.val; // 첫 노드의 값을 임시로 저장한다
            // 첫 노드 삭제
            ListNode fNext = front.next;
            fNext.prev = null;
            front.next = null;
            front = fNext; // 첫 노드 갱신
        // 맨 뒤에서 꺼내는 연산
        } else {
            val = rear.val; // 마지막 노드의 값을 임시로 저장한다
            // 마지막 노드 삭제
            ListNode rPrev = rear.prev;
            rPrev.next = null;
            rear.prev = null;
            rear = rPrev; // 마지막 노드 갱신
        }
        queSize--; // 덱의 길이 갱신
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

    /* 맨 앞 원소 조회 */
    public int peekFirst() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return front.val;
    }

    /* 맨 뒤 원소 조회 */
    public int peekLast() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return rear.val;
    }

    /* 출력할 배열 반환 */
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

        /* 원소 조회 */
        int peekFirst = deque.peekFirst();
        System.out.println("맨 앞 원소 peekFirst = " + peekFirst);
        int peekLast = deque.peekLast();
        System.out.println("맨 뒤 원소 peekLast = " + peekLast);

        /* 덱에 원소 삽입 */
        deque.pushLast(4);
        System.out.println("맨 뒤에 원소 4를 삽입한 후 deque = " + Arrays.toString(deque.toArray()));
        deque.pushFirst(1);
        System.out.println("맨 앞에 원소 1을 삽입한 후 deque = " + Arrays.toString(deque.toArray()));

        /* 덱에서 원소 꺼내기 */
        int popLast = deque.popLast();
        System.out.println("맨 뒤에서 꺼낸 원소 = " + popLast + ", 맨 뒤에서 꺼낸 후 deque = " + Arrays.toString(deque.toArray()));
        int popFirst = deque.popFirst();
        System.out.println("맨 앞에서 꺼낸 원소 = " + popFirst + ", 맨 앞에서 꺼낸 후 deque = " + Arrays.toString(deque.toArray()));

        /* 덱의 길이 조회 */
        int size = deque.size();
        System.out.println("덱의 길이 size = " + size);

        /* 덱이 비어 있는지 확인 */
        boolean isEmpty = deque.isEmpty();
        System.out.println("덱이 비어 있는가 = " + isEmpty);
    }
}
