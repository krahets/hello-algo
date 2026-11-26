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
    private int front; // 맨 앞 원소를 가리키는 앞쪽 포인터
    private int queSize; // 큐의 길이

    public ArrayQueue(int capacity) {
        nums = new int[capacity];
        front = queSize = 0;
    }

    /* 큐의 용량 조회 */
    public int capacity() {
        return nums.length;
    }

    /* 큐의 길이 조회 */
    public int size() {
        return queSize;
    }

    /* 큐가 비어 있는지 확인 */
    public boolean isEmpty() {
        return queSize == 0;
    }

    /* 큐에 삽입 */
    public void push(int num) {
        if (queSize == capacity()) {
            System.out.println("큐가 가득 찼다");
            return;
        }
        // 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
        // 나머지 연산을 이용해 rear가 배열의 끝을 넘으면 처음으로 돌아가게 한다
        int rear = (front + queSize) % capacity();
        // 맨 뒤에 num을 추가한다
        nums[rear] = num;
        queSize++;
    }

    /* 큐에서 꺼내기 */
    public int pop() {
        int num = peek();
        // 앞쪽 포인터를 한 칸 전진시킨다. 배열의 끝을 넘으면 처음으로 돌아간다
        front = (front + 1) % capacity();
        queSize--;
        return num;
    }

    /* 맨 앞 원소 조회 */
    public int peek() {
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        return nums[front];
    }

    /* 배열 반환 */
    public int[] toArray() {
        // 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
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

        /* 원형 배열 테스트 */
        for (int i = 0; i < 10; i++) {
            queue.push(i);
            queue.pop();
            System.out.println("반복 " + i + " — 삽입 + 삭제 후 queue = " + Arrays.toString(queue.toArray()));
        }
    }
}
