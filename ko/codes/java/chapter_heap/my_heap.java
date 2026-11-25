/**
 * File: my_heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

/* 최대 힙 */
class MaxHeap {
    // 용량 확장을 따로 고려할 필요가 없도록 배열 대신 리스트 사용
    private List<Integer> maxHeap;

    /* 입력 리스트로 힙을 만드는 생성자 */
    public MaxHeap(List<Integer> nums) {
        // 리스트의 원소를 그대로 힙에 추가
        maxHeap = new ArrayList<>(nums);
        // 리프를 제외한 모든 노드에서 힙 복구
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* 왼쪽 자식 노드의 인덱스 구하기 */
    private int left(int i) {
        return 2 * i + 1;
    }

    /* 오른쪽 자식 노드의 인덱스 구하기 */
    private int right(int i) {
        return 2 * i + 2;
    }

    /* 부모 노드의 인덱스 구하기 */
    private int parent(int i) {
        return (i - 1) / 2; // 나눗셈 결과를 내림
    }

    /* 원소 교환 */
    private void swap(int i, int j) {
        int tmp = maxHeap.get(i);
        maxHeap.set(i, maxHeap.get(j));
        maxHeap.set(j, tmp);
    }

    /* 힙 크기 구하기 */
    public int size() {
        return maxHeap.size();
    }

    /* 힙이 비었는지 확인 */
    public boolean isEmpty() {
        return size() == 0;
    }

    /* 힙의 루트 원소 조회 */
    public int peek() {
        return maxHeap.get(0);
    }

    /* 힙에 원소 삽입 */
    public void push(int val) {
        // 노드 추가
        maxHeap.add(val);
        // 아래에서 위로 힙 복구
        siftUp(size() - 1);
    }

    /* 노드 i부터 아래에서 위로 힙 복구 */
    private void siftUp(int i) {
        while (true) {
            // 노드 i의 부모 노드 구하기
            int p = parent(i);
            // 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
            if (p < 0 || maxHeap.get(i) <= maxHeap.get(p))
                break;
            // 두 노드 교환
            swap(i, p);
            // 위로 올라가며 힙 복구 반복
            i = p;
        }
    }

    /* 힙에서 원소 꺼내기 */
    public int pop() {
        // 빈 힙 처리
        if (isEmpty())
            throw new IndexOutOfBoundsException();
        // 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
        swap(0, size() - 1);
        // 노드 삭제
        int val = maxHeap.remove(size() - 1);
        // 위에서 아래로 힙 복구
        siftDown(0);
        // 힙의 루트 원소 반환
        return val;
    }

    /* 노드 i부터 위에서 아래로 힙 복구 */
    private void siftDown(int i) {
        while (true) {
            // 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap.get(l) > maxHeap.get(ma))
                ma = l;
            if (r < size() && maxHeap.get(r) > maxHeap.get(ma))
                ma = r;
            // 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
            if (ma == i)
                break;
            // 두 노드 교환
            swap(i, ma);
            // 아래로 내려가며 힙 복구 반복
            i = ma;
        }
    }

    /* 힙 출력(이진 트리) */
    public void print() {
        Queue<Integer> queue = new PriorityQueue<>((a, b) -> { return b - a; });
        queue.addAll(maxHeap);
        PrintUtil.printHeap(queue);
    }
}

public class my_heap {
    public static void main(String[] args) {
        /* 최대 힙 초기화 */
        MaxHeap maxHeap = new MaxHeap(Arrays.asList(9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2));
        System.out.println("\n입력 리스트로 만든 힙:");
        maxHeap.print();

        /* 힙의 루트 원소 구하기 */
        int peek = maxHeap.peek();
        System.out.format("\n힙의 루트 원소: %d\n", peek);

        /* 힙에 원소 삽입 */
        int val = 7;
        maxHeap.push(val);
        System.out.format("\n원소 %d 삽입 후\n", val);
        maxHeap.print();

        /* 힙의 루트 원소 꺼내기 */
        peek = maxHeap.pop();
        System.out.format("\n루트 원소 %d을 꺼낸 뒤의 힙\n", peek);
        maxHeap.print();

        /* 힙 크기 구하기 */
        int size = maxHeap.size();
        System.out.format("\n힙의 원소 수: %d\n", size);

        /* 힙이 비었는지 확인 */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\n빈 힙 여부: %b\n", isEmpty);
    }
}
