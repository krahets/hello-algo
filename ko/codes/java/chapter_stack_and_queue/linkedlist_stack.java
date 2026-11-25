/**
 * File: linkedlist_stack.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;
import utils.*;

/* 연결 리스트로 구현한 스택 */
class LinkedListStack {
    private ListNode stackPeek; // 첫 노드를 스택의 맨 위로 사용한다
    private int stkSize = 0; // 스택의 길이

    public LinkedListStack() {
        stackPeek = null;
    }

    /* 스택의 길이 조회 */
    public int size() {
        return stkSize;
    }

    /* 스택이 비어 있는지 확인 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 스택에 삽입 */
    public void push(int num) {
        ListNode node = new ListNode(num);
        node.next = stackPeek;
        stackPeek = node;
        stkSize++;
    }

    /* 스택에서 꺼내기 */
    public int pop() {
        int num = peek();
        stackPeek = stackPeek.next;
        stkSize--;
        return num;
    }

    /* 스택 맨 위의 원소 조회 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return stackPeek.val;
    }

    /* 연결 리스트를 배열로 변환해 반환한다 */
    public int[] toArray() {
        ListNode node = stackPeek;
        int[] res = new int[size()];
        for (int i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

public class linkedlist_stack {
    public static void main(String[] args) {
        /* 스택 초기화 */
        LinkedListStack stack = new LinkedListStack();

        /* 스택에 원소 삽입 */
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        System.out.println("스택 stack = " + Arrays.toString(stack.toArray()));

        /* 스택 맨 위의 원소 조회 */
        int peek = stack.peek();
        System.out.println("맨 위 원소 peek = " + peek);

        /* 스택에서 원소 꺼내기 */
        int pop = stack.pop();
        System.out.println("꺼낸 원소 pop = " + pop + ", 꺼낸 후 stack = " + Arrays.toString(stack.toArray()));

        /* 스택의 길이 조회 */
        int size = stack.size();
        System.out.println("스택의 길이 size = " + size);

        /* 비어 있는지 확인 */
        boolean isEmpty = stack.isEmpty();
        System.out.println("스택이 비어 있는가 = " + isEmpty);
    }
}
