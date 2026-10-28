/**
 * File: array_queue.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_stack_and_queue;

import java.util.*;

/* 원형 배열로 구현한 큐 */
class ArrayQueue {
    private int[] nums; // 큐의 원소를 저장하는 배열
    private int front; // 맨 앞 원소를 가리키는 맨 앞 포인터
    private int queSize; // 큐 길이

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 큐의 용량 반환 */
    public int capacity() {
        return nums.length;
    }

    /* 큐의 길이 반환 */
    public int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 판단 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 큐에 삽입 */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("큐가 가득 찼다");
            return;
        }
        // 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
        // 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
        int rear = (front + queSize) % capacity();
        // num을 맨 뒤에 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int pop() {
        int num = peek();
        // 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 접근 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 배열 반환 */
    public int[] toArray() {
        // 유효한 길이 범위 안의 리스트 원소만 변환한다
        int[] res = new int[queSize];
        for (int i = 0, j = front; i < queSize; i++, j++) {
            res[i] = nums[j % capacity()];
        }
        return res;
    }
}

public class array_queue {
    public static void main(String[] args) {
        /* 큐 초기화 */
        int capacity = 10;
        ArrayQueue queue = new ArrayQueue(capacity);

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

        /* 원형 배열 테스트 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("반복 " + i + " 회에서 삽입 + 꺼내기를 수행한 후 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
